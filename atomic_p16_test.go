// Copyright 2026 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package libc // import "modernc.org/libc"

import (
	"testing"
	"unsafe"
)

func TestAtomicPUint16RoundTrip(t *testing.T) {
	var v uint16 = 0xabcd
	addr := uintptr(unsafe.Pointer(&v))
	AtomicStorePUint16(addr, 0x1234)
	if g, w := AtomicLoadPUint16(addr), uint16(0x1234); g != w {
		t.Fatalf("AtomicLoadPUint16 = %#x, want %#x", g, w)
	}
	if v != 0x1234 {
		t.Fatalf("memory = %#x, want 0x1234", v)
	}
}

func TestAtomicPInt16RoundTrip(t *testing.T) {
	var v int16 = -1
	addr := uintptr(unsafe.Pointer(&v))
	AtomicStorePInt16(addr, -300)
	if g, w := AtomicLoadPInt16(addr), int16(-300); g != w {
		t.Fatalf("AtomicLoadPInt16 = %d, want %d", g, w)
	}
	if v != -300 {
		t.Fatalf("memory = %d, want -300", v)
	}
}
