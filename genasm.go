// Copyright 2025 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//go:build ignore
// +build ignore

// Tool for generating assembler wrappers.
package main

import (
	"bytes"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"runtime"
	"sort"
	"strings"

	"modernc.org/gc/v3"
)

const (
	// https://github.com/golang/go/issues/41196
	//
	// ^// Code generated .* DO NOT EDIT.$
	generatedFilePrefix = "Code generated "
	generatedFileSuffix = ", DO NOT EDIT."
)

var (
	goos   string
	goarch string
	word   = 8
)

func fail(rc int, msg string, args ...any) {
	fmt.Fprintln(os.Stderr, strings.TrimSpace(fmt.Sprintf(msg, args...)))
	os.Exit(rc)
}

type buf struct {
	b bytes.Buffer
}

func (b *buf) w(s string, args ...any) {
	fmt.Fprintf(&b.b, s, args...)
}

func main() {
	flag.StringVar(&goos, "goos", runtime.GOOS, "")
	flag.StringVar(&goarch, "goarch", runtime.GOARCH, "")
	flag.Parse()
	switch goarch {
	case "386", "arm":
		word = 4
	}

	wd, err := os.Getwd()
	if err != nil {
		fail(1, "%v", err)
	}

	if wd, err = filepath.Abs(wd); err != nil {
		fail(1, "%v", err)
	}

	cfg, err := gc.NewConfig(
		gc.ConfigEnviron([]string{"GOOS=" + goos, "GOARCH=" + goarch}),
	)
	if err != nil {
		fail(1, "%v", err)
	}

	pkg, err := cfg.NewPackage(wd, "modernc.org/libc", "latest", nil, false, gc.TypeCheckAll)
	if err != nil {
		fail(1, "%v", err)
	}

	nodes := map[string]*gc.FunctionDeclNode{}
	var names []string
	pkg.Scope.Iterate(func(name string, n gc.Node) (stop bool) {
		if !strings.HasPrefix(name, "X") ||
			strings.HasPrefix(name, "X_") {
			return false
		}

		switch x := n.(type) {
		case *gc.FunctionDeclNode:
			names = append(names, name)
			nodes[name] = x
		default:
			//panic(fmt.Errorf("%v: %T %s", n.Position(), x, name))
		}
		return false
	})
	sort.Strings(names)
	var y, a buf // yproto_os_arch.go a_os_arch.s
	s := fmt.Sprintf("// %s for %s/%s by '%s %v'%s\n",
		generatedFilePrefix, goos, goarch, filepath.Base(os.Args[0]), os.Args[1:], generatedFileSuffix)
	// Headers
	y.w("%s\npackage libc\n\n", s)
	a.w("%s\n", s)
	a.w("include \"textflag.h\"\n\n")
	fmt.Printf("==== A\n%s", a.b.Bytes())
	// Funcs
	for _, nm := range names {
		fdn := nodes[nm]
		y.w("func Y%s%s\n", nm[1:], fdn.Signature.Source(false))
		in := paramSlots(fdn.Signature.Parameters, -1)
		var out int
		if r := fdn.Signature.Result; r != nil && r.Parameters != nil {
			out = paramSlots(r.Parameters, -1)
		}
		if in > 0 && out >= 0 {
			fsz := in + out
			a.w("TEXT ·Y%s(SB),$%v-%[2]v\n", nm[1:], fsz*word)
		}
	}
	fmt.Printf("==== Y\n%s\n==== A\n%s\n", y.b.Bytes(), a.b.Bytes())
}

func paramSlots(n *gc.ParametersNode, dflt int) (r int) {
	if n == nil {
		return dflt
	}

	for l := n.ParameterDeclList; l != nil; l = l.List {
		pd := l.ParameterDecl
		ids := 0
		for l := pd.IdentifierList; l != nil; l = l.List {
			ids++
		}
		switch x := slots(pd.TypeNode); {
		case x > 0:
			r += x
		default:
			return -1
		}
	}
	return r
}

func slots(n gc.Type) (r int) { //TODO need sizeof here, not slot count
	switch x := n.(type) {
	case *gc.PointerTypeNode:
		return 1
	case *gc.TypeNameNode:
		switch nm := strings.TrimSpace(x.Name.Source(false)); nm {
		case
			"complex64",
			"float32", 
			"float64",
			"int",
			"int16",
			"int32",
			"int64", 
			"int8",
			"uint",
			"uint16",
			"uint32",
			"uint64",
			"uint8",
			"uintptr":

			return 1
		case "complex128":
			return 2
		default:
			//TODO
			return -1
		}
	default:
		fmt.Printf("138: TODO %T\n", x)
		return -1
	}
}
