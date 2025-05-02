// Copyright 2025 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package libc // import "modernc.org/libc"

import (
	"testing"
	"unsafe"
)

func u[T any](x *T) (r uintptr) {
	return uintptr(unsafe.Pointer(x))
}

var tspec timespec

func TestClockgettime(t *testing.T) {
	tls := NewTLS()

	defer tls.Close()

	if g, e := Xclock_gettime(tls, 0, u(&tspec)), int32(0); g != e {
		t.Fatal(g, e)
	}

	s := tspec.Ftv_sec
	t.Logf("%02d:%02d:%02d.%09d", s/3600, s/60%60, s%60, tspec.Ftv_nsec)
}
