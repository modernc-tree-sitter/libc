// Copyright 2026 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package libc // import "modernc.org/libc"

// AtomicStorePInt16 stores val at addr. Emitted by ccgo/v4 for _Atomic int16_t
// stores (e.g. Darwin OSWriteSwapInt16).
func AtomicStorePInt16(addr uintptr, val int16) {
	a_store_16(addr, uint16(val))
}

// AtomicStorePUint16 stores val at addr. Emitted by ccgo/v4 for _Atomic uint16_t
// stores (e.g. Darwin OSWriteSwapInt16).
func AtomicStorePUint16(addr uintptr, val uint16) {
	a_store_16(addr, val)
}
