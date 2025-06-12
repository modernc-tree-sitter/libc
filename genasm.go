// Copyright 2025 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//go:build ignore
// +build ignore

// Tool for generating assembler libc wrappers.
package main

import (
	"bytes"
	"fmt"
	"go/ast"
	"go/printer"
	"os"
	"path/filepath"
	"runtime"
	"sort"
	"strings"

	"golang.org/x/tools/go/packages"
	"modernc.org/goabi0"
)

const (
	// https://github.com/golang/go/issues/41196
	//
	// ^// Code generated .* DO NOT EDIT.$
	generatedFilePrefix = "Code generated"
	generatedFileSuffix = ", DO NOT EDIT."
)

var (
	_ goabi0.Param = (*param)(nil)
	_ goabi0.Type  = (*typ)(nil)

	goarch = runtime.GOARCH
	goos   = runtime.GOOS

	pkg  *packages.Package // modernc.org/libc
	word = int64(8)
)

type param struct {
	*typ
	name string
}

func (p *param) Name() string {
	return p.name
}

type typ struct {
	alignof int64
	sizeof  int64
}

func (t *typ) Alignof() int64 {
	return t.alignof
}

func (t *typ) Sizeof() int64 {
	return t.sizeof
}

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

type buf bytes.Buffer

func (b *buf) w(s string, args ...any) {
	fmt.Fprintf((*bytes.Buffer)(b), s, args...)
}

func (b *buf) Write(p []byte) (int, error) {
	return (*bytes.Buffer)(b).Write(p)
}

func main() {
	switch goarch {
	case "386", "arm":
		word = 4
	}
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
	}
	pkgs, err := packages.Load(cfg, "modernc.org/libc")
	if err != nil || len(pkgs) != 1 {
		fail(1, "Failed to load package: %v", err)
	}

	pkg = pkgs[0]
	if len(pkg.Errors) != 0 {
		fail(1, "%v", pkg.Errors)
	}

	if len(pkg.TypeErrors) != 0 {
		fail(1, "%v", pkg.Errors)
	}

	nodes := map[string]*ast.FuncDecl{}
	var names []string
	for _, w := range pkg.Syntax {
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
	sort.Strings(names)
	trc("", names)
	y := &buf{} // asm_os_arch.go
	a := &buf{} // asm_os_arch.s
	args := strings.Join(os.Args[1:], " ")
	if args != "" {
		args = " " + args
	}
	header := fmt.Sprintf("// %s for %s/%s by '%s%v'%s\n",
		generatedFilePrefix, goos, goarch, filepath.Base(os.Args[0]), args, generatedFileSuffix)
	y.w("%s\npackage libc\n\n", header)
	for _, nm := range names {
		fdn := nodes[nm]
		y.w("func Y%s", nm[1:])
		signature(y, fdn.Type)
		y.w("\n")
	}
	if err := os.WriteFile(fmt.Sprintf("asm_%s_%s.go", goos, goarch), (*bytes.Buffer)(y).Bytes(), 0660); err != nil {
		fail(1, "%v", err)
	}

	a.w("%s\n", header)
	a.w("#include \"textflag.h\"\n")
	for _, nm := range names {
		fdn := nodes[nm]
		in, out := inout(fdn.Type)
		frame, args, stackIn, stackOut := goabi0.StackLayout(word, in, out)
		a.w("\n// func Y%s", nm[1:])
		signature(a, fdn.Type)
		a.w("\nTEXT ·Y%s(SB),$%v-%v\n", nm[1:], frame, args)
		_ = stackIn
		_ = stackOut
	}
	if err := os.WriteFile(fmt.Sprintf("asm_%s_%s.s", goos, goarch), (*bytes.Buffer)(a).Bytes(), 0660); err != nil {
		fail(1, "%v", err)
	}
}

func inout(n *ast.FuncType) (in, out []goabi0.Param) {
	return params(n.Params, "arg"), params(n.Results, "ret")
}

func params(n *ast.FieldList, nm string) (r []goabi0.Param) {
	if n == nil {
		return nil
	}

	for _, v := range n.List {
		t := typeof(v.Type)
		switch {
		case len(v.Names) == 0:
			r = append(r, &param{typ: t, name: nm})
		default:
			for _, v := range v.Names {
				r = append(r, &param{typ: t, name: v.Name})
			}
		}
	}
	return r
}

func typeof(t any) *typ {

	switch x := t.(type) {
	case *ast.StarExpr:
		return &typ{alignof: word, sizeof: word}
	case *ast.Ident:
		t := pkg.TypesInfo.Types[x].Type.Underlying()
		return &typ{alignof: pkg.TypesSizes.Alignof(t), sizeof: pkg.TypesSizes.Sizeof(t)}
	default:
		panic(todo("%T", x))
	}
}

func signature(b *buf, n *ast.FuncType) {
	fieldList(b, n.Params, true)
	if n.Results != nil {
		b.w(" ")
		fieldList(b, n.Results, false)
	}
}

func fieldList(b *buf, n *ast.FieldList, parens bool) {
	if n == nil {
		return
	}

	if !parens {
		parens = mustParens(n)
	}
	if parens {
		b.w("(")
		defer b.w(")")
	}
	for i, v := range n.List {
		if i != 0 {
			b.w(", ")
		}
		for j, w := range v.Names {
			if j != 0 {
				b.w(", ")
			}
			b.w("%s", w)
		}
		if len(v.Names) != 0 {
			b.w(" ")
		}
		printer.Fprint(b, pkg.Fset, v.Type)
	}
}

func mustParens(l *ast.FieldList) bool {
	if l == nil {
		return false
	}

	switch len(l.List) {
	case 0:
		return false
	case 1:
		return len(l.List[0].Names) != 0
	default:
		return true
	}
}
