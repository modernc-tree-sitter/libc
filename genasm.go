// Copyright 2025 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//go:build ignore
// +build ignore

// Tool for generating assembler libc wrappers.
package main

import (
	"bytes"
	"flag"
	"fmt"
	"go/ast"
	"go/printer"
	"go/types"
	"os"
	"path/filepath"
	"runtime"
	"sort"
	"strings"

	"golang.org/x/tools/go/packages"
)

const (
	// https://github.com/golang/go/issues/41196
	//
	// ^// Code generated .* DO NOT EDIT.$
	generatedFilePrefix = "Code generated"
	generatedFileSuffix = ", DO NOT EDIT."
)

var (
	goarch string
	goos   string
	gopath = os.Getenv("GOPATH")
	k      = "Q"             // MOVL/MOVQ
	pkg    *packages.Package // modernc.org/libc
	word   = 8
)

// origin returns caller's short position, skipping skip frames.
func origin(skip int) string {
	pc, fn, fl, _ := runtime.Caller(skip)
	f := runtime.FuncForPC(pc)
	var fns string
	if f != nil {
		fns = f.Name()
		if x := strings.LastIndex(fns, "."); x > 0 {
			fns = fns[x+1:]
		}
		if strings.HasPrefix(fns, "func") {
			num := true
			for _, c := range fns[len("func"):] {
				if c < '0' || c > '9' {
					num = false
					break
				}
			}
			if num {
				return origin(skip + 2)
			}
		}
	}
	return fmt.Sprintf("%s:%d:%s", filepath.Base(fn), fl, fns)
}

// todo prints and return caller's position and an optional message tagged with TODO. Output goes to stderr.
func todo(s string, args ...interface{}) string {
	switch {
	case s == "":
		s = fmt.Sprintf(strings.Repeat("%v ", len(args)), args...)
	default:
		s = fmt.Sprintf(s, args...)
	}
	r := fmt.Sprintf("%s\n\tTODO %s", origin(2), s)
	// fmt.Fprintf(os.Stderr, "%s\n", r)
	// os.Stdout.Sync()
	return r
}

// trc prints and return caller's position and an optional message tagged with TRC. Output goes to stderr.
func trc(s string, args ...interface{}) string {
	switch {
	case s == "":
		s = fmt.Sprintf(strings.Repeat("%v ", len(args)), args...)
	default:
		s = fmt.Sprintf(s, args...)
	}
	r := fmt.Sprintf("%s: TRC %s", origin(2), s)
	fmt.Fprintf(os.Stderr, "%s\n", r)
	os.Stderr.Sync()
	return r
}

func fail(rc int, msg string, args ...any) {
	fmt.Fprintln(os.Stderr, strings.TrimSpace(fmt.Sprintf("FAIL: "+msg, args...)))
	os.Exit(rc)
}

type buf struct {
	b bytes.Buffer
}

func (b *buf) w(s string, args ...any) {
	fmt.Fprintf(&b.b, s, args...)
}

type slot struct {
	off   int
	sz    int
	align int
}

func main() {
	flag.StringVar(&goos, "goos", runtime.GOOS, "")
	flag.StringVar(&goarch, "goarch", runtime.GOARCH, "")
	flag.Parse()
	switch goarch {
	case "386", "arm":
		word = 4
		k = "L"
	}

	var err error
	cfg := &packages.Config{
		Mode: packages.NeedName | // Package name
			packages.NeedFiles | // Go source files for the package
			packages.NeedCompiledGoFiles | // Augmented list of files for LoadFiles mode
			packages.NeedImports | // Direct imports of the package
			packages.NeedDeps | // Transitive dependencies
			packages.NeedTypes | // Go type data ([*types.Package])
			packages.NeedSyntax | // ASTs ([*ast.File])
			packages.NeedTypesInfo | // Type information for expressions ([*types.Info])
			packages.NeedTypesSizes, // Sizes of types (types.Sizes)
		Env: append(os.Environ(), "GOOS="+goos, "GOARCH="+goarch),
	}

	pkgs, err := packages.Load(cfg, "modernc.org/libc")
	if err != nil {
		fail(1, "Failed to load packages: %v", err)
	}

	nodes := map[string]*ast.FuncDecl{}
	var names []string
	for _, v := range pkgs {
		if v.PkgPath != "modernc.org/libc" {
			continue
		}

		pkg = v
		if len(v.Errors) != 0 {
			fail(1, "%v", v.Errors)
		}

		if len(v.TypeErrors) != 0 {
			fail(1, "%v", v.Errors)
		}

		for _, w := range v.Syntax {
			for _, x := range w.Decls {
				switch y := x.(type) {
				case *ast.FuncDecl:
					nm := y.Name.Name
					if !strings.HasPrefix(nm, "X") || strings.HasPrefix(nm, "X_") {
						break
					}

					l := y.Type.Params.List
					if len(l) == 0 {
						return
					}

					switch z := l[0].Type.(type) {
					case *ast.StarExpr:
						switch a := z.X.(type) {
						case *ast.Ident:
							if a.Name != "TLS" {
								continue
							}
						default:
							panic(todo("%T", a))
						}
					default:
						continue
					}

					names = append(names, nm)
					nodes[nm] = y
				}
			}
		}
	}
	sort.Strings(names)
	var y, a buf // yproto_os_arch.go a_os_arch.s
	args := strings.Join(os.Args[1:], " ")
	if args != "" {
		args = " " + args
	}
	s := fmt.Sprintf("// %s for %s/%s by '%s%v'%s\n",
		generatedFilePrefix, goos, goarch, filepath.Base(os.Args[0]), args, generatedFileSuffix)
	// Headers
	y.w("%s\npackage libc\n\n", s)
	a.w("%s\n", s)
	a.w("#include \"textflag.h\"\n")
	// Funcs
	for _, nm := range names {

		fdn := nodes[nm]
		in := slots(fdn.Type.Params)
		out := slots(fdn.Type.Results)
		lastIn := in[len(in)-1]
		offOut := roundUp(lastIn.off+lastIn.sz, 8)
		sizeOut := 0
		if len(out) != 0 {
			lastOut := out[len(out)-1]
			sizeOut = lastOut.off+lastOut.sz
		}
		fsz := offOut+sizeOut
		y.w("func Y%s%s\n", nm[1:], signature(fdn.Type))
		a.w("\nTEXT ·Y%s(SB),$%v-%[2]v\n", nm[1:], fsz)
		for i, v := range in {
			switch v.sz {
			case 2:
				a.w("\tMOVW p%v+%v(FP), AX\n", i, v.off)
				a.w("\tMOVW AX, %v(SP)\n", v.off)
			case 4:
				a.w("\tMOVL p%v+%v(FP), AX\n", i, v.off)
				a.w("\tMOVL AX, %v(SP)\n", v.off)
			default:
				var off, sz int
				for off, sz = v.off, v.sz; sz >= 8; sz -= 8 {
					a.w("\tMOVQ p%v+%v(FP), AX\n", i, off)
					a.w("\tMOVQ AX, %v(SP)\n", off)
					off += 8
				}
				if sz != 0 {
					panic(todo("", sz))
				}
			}
		}
		a.w("\tCALL ·%s(SB)\n", nm)
		for _, v := range out {
			switch v.sz {
			case 2:
				a.w("\tMOVW %v(SP), AX\n", offOut+v.off)
				a.w("\tMOVW AX, ret+%v(FP)\n", offOut+v.off)
			case 4:
				a.w("\tMOVL %v(SP), AX\n", offOut+v.off)
				a.w("\tMOVL AX, ret+%v(FP)\n", offOut+v.off)
			default:
				var off, sz int
				for off, sz = v.off, v.sz; sz >= 8; sz -= 8 {
					a.w("\tMOVQ %v(SP), AX\n", offOut+off)
					a.w("\tMOVQ AX, ret+%v(FP)\n", offOut+off)
					off += 8
				}
				if sz != 0 {
					panic(todo("", sz))
				}
			}
		}
		a.w("\tRET\n")
	}
	if err := os.WriteFile(fmt.Sprintf("asm_%s_%s.go", goos, goarch), y.b.Bytes(), 0660); err != nil {
		fail(1, "%v", err)
	}
	if err := os.WriteFile(fmt.Sprintf("asm_%s_%s.s", goos, goarch), a.b.Bytes(), 0660); err != nil {
		fail(1, "%v", err)
	}
}

func slots(n *ast.FieldList) (r []slot) {
	if n == nil {
		return nil
	}
	var s slot
	for _, v := range n.List {
		k := max(len(v.Names), 1)
		for i := 0; i < k; i++ {
			s.sz = sizeof(v.Type)
			s.align = align(v.Type)
			s.off = roundUp(s.off, s.align)
			r = append(r, s)
			s.off += s.sz
		}
	}
	return r
}

func signature(n *ast.FuncType) string {
	var b strings.Builder
	b.WriteByte('(')
	for i, v := range n.Params.List {
		if i != 0 {
			b.WriteString(", ")
		}
		fmt.Fprintf(&b, "p%v ", i)
		printer.Fprint(&b, pkg.Fset, v.Type)
	}
	b.WriteByte(')')
	if n.Results != nil {
		b.WriteString(" (ret ")
		printer.Fprint(&b, pkg.Fset, n.Results.List[0].Type)
		b.WriteByte(')')
	}
	return b.String()
}

func roundUp(n, to int) int {
	if m := n % to; m != 0 {
		n += to - m
	}
	return n
}

func align(n ast.Expr) (r int) {
	switch x := n.(type) {
	case *ast.StarExpr:
		return word
	case *ast.Ident:
		switch x.String() {
		case "int8", "uint8", "byte":
			return 1
		case "int16", "uint16":
			return 2
		case "int32", "uint32", "float32":
			return 4
		case "int64", "uint64", "float64", "complex64":
			return 8
		case "int", "uint", "uintptr":
			return word
		case "complex128":
			return 8
		default:
			switch y := pkg.TypesInfo.Types[n].Type.(type) {
			case *types.Alias:
				switch z := y.Underlying().(type) {
				case *types.Basic:
					switch z.Kind() {
					case types.Int, types.Uint, types.Uintptr:
						return word
					case types.Int8, types.Uint8:
						return 1
					case types.Int16, types.Uint16:
						return 2
					case types.Int32, types.Uint32, types.Float32:
						return 4
					case types.Int64, types.Uint64, types.Float64, types.Complex64:
						return 8
					case types.Complex128:
						return 16
					default:
						panic(todo("", z.Kind()))
					}
				case *types.Struct:
					return int(pkg.TypesSizes.Sizeof(z))
				default:
					panic(todo("%T", z))
				}
			default:
				panic(todo("%q %T", x.String(), y))
			}
		}
	default:
		panic(todo("%T", x))
	}
}

func sizeof(n ast.Expr) (r int) {
	switch x := n.(type) {
	case *ast.StarExpr:
		return word
	case *ast.Ident:
		switch x.String() {
		case "int8", "uint8", "byte":
			return 1
		case "int16", "uint16":
			return 2
		case "int32", "uint32", "float32":
			return 4
		case "int64", "uint64", "float64", "complex64":
			return 8
		case "int", "uint", "uintptr":
			return word
		case "complex128":
			return 16
		default:
			switch y := pkg.TypesInfo.Types[n].Type.(type) {
			case *types.Alias:
				switch z := y.Underlying().(type) {
				case *types.Basic:
					switch z.Kind() {
					case types.Int, types.Uint, types.Uintptr:
						return word
					case types.Int8, types.Uint8:
						return 1
					case types.Int16, types.Uint16:
						return 2
					case types.Int32, types.Uint32, types.Float32:
						return 4
					case types.Int64, types.Uint64, types.Float64, types.Complex64:
						return 8
					case types.Complex128:
						return 16
					default:
						panic(todo("", z.Kind()))
					}
				case *types.Struct:
					return int(pkg.TypesSizes.Sizeof(z))
				default:
					panic(todo("%T", z))
				}
			default:
				panic(todo("%q %T", x.String(), y))
			}
		}
	default:
		panic(todo("%T", x))
	}
}
