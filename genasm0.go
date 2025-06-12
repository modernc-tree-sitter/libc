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
	align int
	off   int
	sz    int
	typ   any
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
		y.w("func Y%s%s\n", nm[1:], signature(fdn.Type))
		in, inSz := slots(fdn.Type.Params)
		out, outSz := slots(fdn.Type.Results)
		a.w("\n// func Y%s%s", nm[1:], signature(fdn.Type))
		// a.w("\n// in=%+v inSz=%v out=%+v outSz=%v", in, inSz, out, outSz)
		if outSz != 0 {
			inSz = roundUp(inSz, 8)
		}
		fsz := inSz + outSz
		// a.w("\n// inSz=%v fsz=%v", inSz, fsz)
		a.w("\nTEXT ·Y%s(SB),$%v-%v\n", nm[1:], roundUp(fsz, 8), fsz)
		for i, v := range in {
			switch v.typ {
			case
				"int", "int8", "int16", "int32", "int64",
				"uint", "uint8", "uint16", "uint32", "uint64",
				"float32", "float64",
				"uintptr", "pointer":

				a.w("%s", cpFpSp(v.off, v.sz, i, ""))
			case "complex64":
				a.w("%s", cpFpSp(v.off, 4, i, "_real"))
				a.w("%s", cpFpSp(v.off+4, 4, i, "_imag"))
			case "complex128":
				a.w("%s", cpFpSp(v.off, 8, i, "_real"))
				a.w("%s", cpFpSp(v.off+8, 8, i, "_imag"))
			default:
				switch x := v.typ.(type) {
				case *types.Struct:
					nf := x.NumFields()
					off := 0
					for j := 0; j < nf; j++ {
						f := x.Field(j)
						nm := f.Name()
						if strings.Contains(nm, "__ccgo_pad") {
							continue
						}

						ft := f.Type()
						sz := sizeof(ft)
						if sz == 0 {
							continue
						}

						off = roundUp(off, sz) //TODO
						a.w("%s", cpFpSp(v.off+off, sz, i, fmt.Sprintf("_%s", nm)))
						off += sz
					}
				default:
					trc("%T(%v)", x, x)
				}
			}
		}
		a.w("\tCALL ·%s(SB)\n", nm)
		for _, v := range out {
			switch v.typ {
			case
				"int", "int8", "int16", "int32", "int64",
				"uint", "uint8", "uint16", "uint32", "uint64",
				"float32", "float64",
				"uintptr":

				a.w("%s", cpSpFp(inSz+v.off, v.sz, ""))
			case "complex64":
				a.w("%s", cpSpFp(inSz+v.off, 4, "_real"))
				a.w("%s", cpSpFp(inSz+v.off+4, 4, "_imag"))
			case "complex128":
				a.w("%s", cpSpFp(inSz+v.off, 8, "_real"))
				a.w("%s", cpSpFp(inSz+v.off+8, 8, "_imag"))
			default:
				switch x := v.typ.(type) {
				case *types.Struct:
					nf := x.NumFields()
					off := 0
					for i := 0; i < nf; i++ {
						f := x.Field(i)
						nm := f.Name()
						if strings.Contains(nm, "__ccgo_pad") {
							continue
						}

						ft := f.Type()
						sz := sizeof(ft)
						if sz == 0 {
							continue
						}

						off = roundUp(off, sz) //TODO
						a.w("%s", cpSpFp(inSz+v.off+off, sz, fmt.Sprintf("_%s", nm)))
						off += sz
					}
				default:
					trc("%T(%v)", x, x)
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

var movs = map[int]string{2: "W", 4: "L", 8: "Q"}

func cpFpSp(off, sz, pi int, tag string) (r string) {
	return fmt.Sprintf("\tMOV%s p%[4]v%[3]s+%[2]v(FP), AX\n\tMOV%[1]s AX, %[2]v(SP)\n", movs[sz], off, tag, pi)
}

func cpSpFp(off, sz int, tag string) (r string) {
	return fmt.Sprintf("\tMOV%s %v(SP), AX\n\tMOV%[1]s AX, ret%[3]s+%[2]v(FP)\n", movs[sz], off, tag)
}

func slots(n *ast.FieldList) (r []slot, sz int) {
	if n == nil {
		return nil, 0
	}
	var s slot
	for _, v := range n.List {
		k := max(len(v.Names), 1)
		for i := 0; i < k; i++ {
			s.typ = typ(v.Type)
			s.sz = sizeof(v.Type)
			s.align = align(v.Type)
			s.off = roundUp(s.off, s.align)
			r = append(r, s)
			s.off += s.sz
			sz = s.off
		}
	}
	return r, sz
}

func signature(n *ast.FuncType) string {
	var b strings.Builder
	b.WriteByte('(')
	p := 0
	for i, v := range n.Params.List {
		if i != 0 {
			b.WriteString(", ")
		}
		k := max(len(v.Names), 1)
		for j := 0; j < k; j++ {
			if j != 0 {
				b.WriteString(",  ")
			}
			fmt.Fprintf(&b, "p%v ", p)
			p++
		}
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
					r = 1
					for i := 0; i < z.NumFields(); i++ {
						r = max(r, sizeof(z.Field(i).Type()))
					}
					return r
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

func typ(n ast.Expr) (r any) {
	switch x := n.(type) {
	case *ast.StarExpr:
		return "pointer"
	case *ast.Ident:
		switch x.String() {
		case
			"int8", "uint8", "byte",
			"int16", "uint16",
			"int32", "uint32", "float32",
			"int64", "uint64", "float64", "complex64",
			"int", "uint", "uintptr",
			"complex128":

			return x.String()
		default:
			switch y := pkg.TypesInfo.Types[n].Type.(type) {
			case *types.Alias:
				switch z := y.Underlying().(type) {
				case *types.Basic:
					switch z.Kind() {
					case types.Int:
						return "int"
					case types.Uint:
						return "uint"
					case types.Uintptr:
						return "uintptr"
					case types.Int8:
						return "int8"
					case types.Uint8:
						return "byte"
					case types.Int16:
						return "int16"
					case types.Uint16:
						return "uint16"
					case types.Int32:
						return "int32"
					case types.Uint32:
						return "uint32"
					case types.Float32:
						return "float32"
					case types.Int64:
						return "int64"
					case types.Uint64:
						return "uint64"
					case types.Float64:
						return "float46"
					case types.Complex64:
						return "complex64"
					case types.Complex128:
						return "complex128"
					default:
						panic(todo("", z.Kind()))
					}
				case *types.Struct:
					return z
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

func sizeof(t any) (r int) {
	if x, ok := t.(ast.Expr); ok {
		u := pkg.TypesInfo.Types[x].Type
		return int(pkg.TypesSizes.Sizeof(u))
	}

	switch x := t.(type) {
	case *types.Basic:
		switch x.Kind() {
		case types.Int:
			return word
		case types.Uint:
			return word
		case types.Uintptr:
			return word
		case types.Int8:
			return 1
		case types.Uint8:
			return 1
		case types.Int16:
			return 2
		case types.Uint16:
			return 2
		case types.Int32:
			return 4
		case types.Uint32:
			return 4
		case types.Float32:
			return 4
		case types.Int64:
			return 8
		case types.Uint64:
			return 8
		case types.Float64:
			return 8
		case types.Complex64:
			return 8
		case types.Complex128:
			return 16
		default:
			panic(todo("", x.Kind()))
		}
	case *types.Alias:
		switch y := x.Underlying().(type) {
		case *types.Basic:
			return sizeof(y)
		default:
			panic(todo("%T", y))
		}
	case *types.Array:
		return sizeof(x.Elem()) * int(x.Len())
	default:
		panic(todo("%T", x))
	}
}
