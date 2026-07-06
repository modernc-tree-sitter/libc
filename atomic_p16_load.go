// Copyright 2026 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//go:build !linux

package libc // import "modernc.org/libc"

// AtomicLoadPInt16 loads *addr. On Linux these symbols live in rtl.go /
// platform files; other GOOS need wrappers over a_load_16 for ccgo output
// (Darwin OSReadSwapInt16, etc.).
func AtomicLoadPInt16(addr uintptr) (val int16) {
	return int16(a_load_16(addr))
}

// AtomicLoadPUint16 loads *addr.
func AtomicLoadPUint16(addr uintptr) (val uint16) {
	return uint16(a_load_16(addr))
}
