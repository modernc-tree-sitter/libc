// Copyright 2025 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//go:build !darwin

package libc // import "modernc.org/libc"

// int clock_gettime(clockid_t clk_id, struct timespec *tp);
func Xclock_gettime(t *TLS, clk_id int32, tp uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v clk_id=%v tp=%v, (%v:)", t, clk_id, tp, origin(2))
	}
	panic(todo(""))
}
