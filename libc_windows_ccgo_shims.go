// Copyright 2026 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//go:build windows

package libc // import "modernc.org/libc"

import (
	"unicode"
	"unsafe"

	"golang.org/x/sys/windows"
	"modernc.org/libc/errno"
	"modernc.org/libc/sys/types"
)

// MinGW corecrt_wctype.h classification bits (iswspace/iswalnum expand to iswctype).
const (
	_wctypeUpper   = 0x1
	_wctypeLower   = 0x2
	_wctypeDigit   = 0x4
	_wctypeSpace   = 0x8
	_wctypePunct   = 0x10
	_wctypeControl = 0x20
	_wctypeBlank   = 0x40
	_wctypeHex     = 0x80
	_wctypeAlpha   = 0x0100 | _wctypeUpper | _wctypeLower
)

func wctypeBits(r rune) uint16 {
	var bits uint16
	if unicode.IsUpper(r) {
		bits |= _wctypeUpper
	}
	if unicode.IsLower(r) {
		bits |= _wctypeLower
	}
	if unicode.IsDigit(r) {
		bits |= _wctypeDigit
	}
	if unicode.IsSpace(r) {
		bits |= _wctypeSpace
	}
	if unicode.IsPunct(r) {
		bits |= _wctypePunct
	}
	if unicode.IsControl(r) {
		bits |= _wctypeControl
	}
	if r == ' ' || r == '\t' {
		bits |= _wctypeBlank
	}
	if unicode.Is(unicode.Hex_Digit, r) {
		bits |= _wctypeHex
	}
	if unicode.IsLetter(r) {
		bits |= _wctypeAlpha
	}
	return bits
}

// Xiswctype reports whether wide character c has any property bits in mask.
func Xiswctype(t *TLS, c uint16, mask uint16) int32 {
	if wctypeBits(rune(c))&mask != 0 {
		return 1
	}
	return 0
}

func Xiswspace(t *TLS, c uint16) int32 { return Xiswctype(t, c, _wctypeSpace) }

func Xiswalnum(t *TLS, c uint16) int32 {
	return Xiswctype(t, c, _wctypeAlpha|_wctypeDigit)
}

// Xtowupper / Xtowlower implement the wide-char case transforms used by some
// external scanners (html, markdown, svelte, …).
func Xtowupper(t *TLS, c uint16) uint16 {
	return uint16(unicode.ToUpper(rune(c)))
}

func Xtowlower(t *TLS, c uint16) uint16 {
	return uint16(unicode.ToLower(rune(c)))
}

// Xstrnlen is strnlen(3).
func Xstrnlen(t *TLS, s uintptr, n types.Size_t) types.Size_t {
	var i types.Size_t
	for i = 0; i < n; i++ {
		if *(*byte)(unsafe.Pointer(s + uintptr(i))) == 0 {
			return i
		}
	}
	return n
}

// Xwcsnlen is wcsnlen(3) over UTF-16 wchar_t.
func Xwcsnlen(t *TLS, s uintptr, n types.Size_t) types.Size_t {
	var i types.Size_t
	for i = 0; i < n; i++ {
		if *(*uint16)(unsafe.Pointer(s + uintptr(i)*2)) == 0 {
			return i
		}
	}
	return n
}

func X__mingw_vswprintf(t *TLS, stream uintptr, n types.Size_t, format, ap uintptr) int32 {
	return X__mingw_vsnwprintf(t, stream, n, format, ap)
}

func X__mingw_strtof(t *TLS, s, end uintptr) float32 {
	return float32(X__mingw_strtod(t, s, end))
}

func X__mingw_wcstod(t *TLS, s, end uintptr) float64 {
	_, _ = s, end
	return 0
}

func X__mingw_wcstof(t *TLS, s, end uintptr) float32 {
	return float32(X__mingw_wcstod(t, s, end))
}

// X_fdopen is the MSVC/MinGW name for fdopen.
func X_fdopen(t *TLS, fd int32, mode uintptr) uintptr {
	return Xfdopen(t, fd, mode)
}

// Aliases without leading underscore (ccgo sometimes drops it).
func Xopen_osfhandle(t *TLS, handle types.Intptr_t, flags int32) int32 {
	return X_open_osfhandle(t, handle, flags)
}

func Xget_osfhandle(t *TLS, fd int32) types.Intptr_t {
	return X_get_osfhandle(t, fd)
}

// XMapViewOfFileNuma2 is a newer mapping API; unused by tree-sitter.
// Provide a no-op stub so MinGW winbase inline wrappers link.
func XMapViewOfFileNuma2(t *TLS, fileMapping, process uintptr, offset uint64, baseAddress uintptr, viewSize types.Size_t, allocationType, pageProtection, numaNode uint32) uintptr {
	_, _, _, _, _, _, _, _, _ = t, fileMapping, process, offset, baseAddress, viewSize, allocationType, pageProtection, numaNode
	return 0
}

func crtProc(dll, name string) *windows.LazyProc {
	return windows.NewLazySystemDLL(dll).NewProc(name)
}

// X_get_osfhandle returns the Win32 HANDLE for a CRT file descriptor.
func X_get_osfhandle(t *TLS, fd int32) types.Intptr_t {
	for _, dll := range []string{"ucrtbase.dll", "msvcrt.dll"} {
		r0, _, e := crtProc(dll, "_get_osfhandle").Call(uintptr(fd))
		if e == windows.NOERROR || e == windows.Errno(0) {
			return types.Intptr_t(r0)
		}
	}
	t.setErrno(errno.EINVAL)
	return -1
}

// X_open_osfhandle associates a C runtime fd with a Win32 HANDLE.
func X_open_osfhandle(t *TLS, handle types.Intptr_t, flags int32) int32 {
	for _, dll := range []string{"ucrtbase.dll", "msvcrt.dll"} {
		r0, _, e := crtProc(dll, "_open_osfhandle").Call(uintptr(handle), uintptr(flags))
		if e == windows.NOERROR || e == windows.Errno(0) {
			return int32(r0)
		}
	}
	t.setErrno(errno.EINVAL)
	return -1
}
