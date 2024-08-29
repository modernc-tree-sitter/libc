// Copyright 2020 The Libc Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package libc // import "modernc.org/libc"

import (
	"errors"
	"fmt"
	"golang.org/x/sys/windows"
	"math"
	"os"
	// 	"os/exec"
	"os/user"
	// 	"path/filepath"
	"runtime"
	"strings"
	"sync"
	"sync/atomic"
	gotime "time"
	"unicode"
	"unicode/utf16"
	"unsafe"
	//
	// 	"github.com/ncruces/go-strftime"
	"modernc.org/libc/errno"
	"modernc.org/libc/fcntl"
	"modernc.org/libc/limits"
	"modernc.org/libc/stdio"
	// 	"modernc.org/libc/sys/stat"
	"modernc.org/libc/sys/types"
	"modernc.org/libc/time"
	"modernc.org/libc/unistd"
)

import "path/filepath" //TODO-
import "runtime/debug" //TODO-

type (
	syscallErrno = windows.Errno
	long         = int32
	ulong        = uint32
)

func init() { //TODO-
	u, err := user.Current()
	if err != nil {
		panic(err)
	}

	f, err := os.OpenFile(filepath.Join(u.HomeDir, "log-dbg"), os.O_APPEND|os.O_CREATE|os.O_WRONLY|os.O_SYNC, 0644)
	if err != nil {
		panic(err)
	}

	dbgFile = f
}

var (
	dbgFile *os.File //TODO-
	pid     = os.Getpid()
)

func (tls *TLS) id() int {
	if tls == nil {
		return -1
	}

	return int(tls.ID)
}

func (tls *TLS) tid() int {
	if tls == nil {
		return -1
	}

	return int(XGetCurrentThreadId(tls))
}

func die(tls *TLS, s string, args ...any) {
	s = fmt.Sprintf(s, args...)
	s = fmt.Sprintf("\n==== [%v.%v] DIE: tls=%v %s\n%s", pid, tls.tid(), tls.id(), s, debug.Stack())
	dbgFile.Write([]byte(s))
	dbgFile.Sync()
	panic(42)
	os.Exit(1)
}

func Dbg(tls *TLS, s string, args ...any) {
	s = fmt.Sprintf(s, args...)
	s = fmt.Sprintf("\n==== [%v.%v] DBG: tls=%v %s (%v: %v: %v:)\n", pid, tls.tid(), tls.id(), s, origin(4), origin(3), origin(2))
	dbgFile.Write([]byte(s))
	// fmt.Println(s)
}

// const (
//
//	INVALID_FILE_SIZE = 0xffffffff
//
// )

// Keep these outside of the var block otherwise go generate will miss them.
var X__imp__environ = EnvironP()
var X__imp__wenviron = uintptr(unsafe.Pointer(&wenviron))
var X_imp___environ = EnvironP()
var X_imp___wenviron = uintptr(unsafe.Pointer(&wenviron))
var X_iob [stdio.X_IOB_ENTRIES]stdio.FILE

var Xin6addr_any [16]byte
var Xtimezone long // extern long timezone;

var (
	iobMap     = map[uintptr]int32{} // &_iob[fd] -> fd
	wenvValid  bool
	wenviron   uintptr // &winEnviron[0]
	winEnviron = []uintptr{0}
)

func init() {
	for i := range X_iob {
		iobMap[uintptr(unsafe.Pointer(&X_iob[i]))] = int32(i)
	}
}

// func X__p__wenviron(t *TLS) uintptr {
// 	if !wenvValid {
// 		bootWinEnviron(t)
// 	}
// 	return uintptr(unsafe.Pointer(&wenviron))
// }

var callbacks = newCallbackRegister()

type callbackKey struct {
	tls   *TLS
	gofnp uintptr
}

type callbackValue struct {
	gocb uintptr // As returned from windows.NewCallback
	cb   any     // As passed to callbackRegister.register
}

type callbackRegister struct {
	sync.Mutex
	m map[callbackKey]callbackValue
}

func newCallbackRegister() *callbackRegister {
	return &callbackRegister{m: map[callbackKey]callbackValue{}}
}

func (c *callbackRegister) register(tls *TLS, gofnp uintptr, cb any) (r uintptr) {
	c.Lock()

	defer c.Unlock()

	key := callbackKey{tls, gofnp}
	x, ok := c.m[key]
	r = x.gocb
	if !ok {
		r = windows.NewCallback(cb)
		c.m[key] = callbackValue{r, cb}
	}
	return r
}

type TWNDCLASSA = struct {
	Fstyle         TUINT
	FlpfnWndProc   TWNDPROC
	FcbClsExtra    int32
	FcbWndExtra    int32
	FhInstance     THINSTANCE
	FhIcon         THICON
	FhCursor       THCURSOR
	FhbrBackground THBRUSH
	FlpszMenuName  TLPCSTR
	FlpszClassName TLPCSTR
}

type TWNDCLASSW = struct {
	Fstyle         TUINT
	FlpfnWndProc   TWNDPROC
	FcbClsExtra    int32
	FcbWndExtra    int32
	FhInstance     THINSTANCE
	FhIcon         THICON
	FhCursor       THCURSOR
	FhbrBackground THBRUSH
	FlpszMenuName  TLPCWSTR
	FlpszClassName TLPCWSTR
}

type TWNDCLASSEXW = struct {
	FcbSize        TUINT
	Fstyle         TUINT
	FlpfnWndProc   TWNDPROC
	FcbClsExtra    int32
	FcbWndExtra    int32
	FhInstance     THINSTANCE
	FhIcon         THICON
	FhCursor       THCURSOR
	FhbrBackground THBRUSH
	FlpszMenuName  TLPCWSTR
	FlpszClassName TLPCWSTR
	FhIconSm       THICON
}

type wndProc func(tls *TLS, hwnd THWND, message TUINT, wParam TWPARAM, lParam TLPARAM) (r TLRESULT)

var procRegisterClassA = moduser32.NewProc("RegisterClassA")

func XRegisterClassA(tls *TLS, lpWndClass uintptr) int32 {
	Dbg(
		tls,
		"Fstyle=%v FlpWndProc=%#0x FcbClsExtra=%v FcbWndExtra=%v FhInstance=%#0x FhIcon=%v FhCursor=%v FhbrBackground=%v FlpszMenuName=%q FlpszClassName=%q",
		(*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).Fstyle,
		(*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FlpfnWndProc,
		(*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FcbClsExtra,
		(*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FcbWndExtra,
		(*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FhInstance,
		(*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FhIcon,
		(*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FhCursor,
		(*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FhbrBackground,
		GoString((*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FlpszMenuName),
		GoString((*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FlpszClassName),
	)
	if gofnp := (*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FlpfnWndProc; gofnp != 0 {
		f := (*struct{ f wndProc })(unsafe.Pointer(&struct{ uintptr }{gofnp})).f
		cb := func(hwnd THWND, message TUINT, wParam TWPARAM, lParam TLPARAM) uintptr {
			return uintptr(f(tls, hwnd, message, wParam, lParam))
		}
		(*TWNDCLASSA)(unsafe.Pointer(lpWndClass)).FlpfnWndProc = callbacks.register(tls, gofnp, cb)
	}
	r0, _, err := procRegisterClassA.Call(lpWndClass)
	if r0 == 0 {
		Dbg(tls, "FAIL err=%v", err)
		tls.setErrno(err)
	}
	return int32(r0)
}

var procRegisterClassW = moduser32.NewProc("RegisterClassW")

// ATOM RegisterClassW(const WNDCLASSW *lpWndClass);
func XRegisterClassW(tls *TLS, lpWndClass uintptr) int32 {
	Dbg(
		tls,
		"Fstyle=%v FlpWndProc=%#0x FcbClsExtra=%v FcbWndExtra=%v FhInstance=%#0x FhIcon=%v FhCursor=%v FhbrBackground=%v FlpszMenuName=%q FlpszClassName=%q",
		(*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).Fstyle,
		(*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FlpfnWndProc,
		(*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FcbClsExtra,
		(*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FcbWndExtra,
		(*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FhInstance,
		(*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FhIcon,
		(*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FhCursor,
		(*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FhbrBackground,
		GoWideString((*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FlpszMenuName),
		GoWideString((*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FlpszClassName),
	)
	if gofnp := (*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FlpfnWndProc; gofnp != 0 {
		f := (*struct{ f wndProc })(unsafe.Pointer(&struct{ uintptr }{gofnp})).f
		cb := func(hwnd THWND, message TUINT, wParam TWPARAM, lParam TLPARAM) uintptr {
			return uintptr(f(tls, hwnd, message, wParam, lParam))
		}
		(*TWNDCLASSW)(unsafe.Pointer(lpWndClass)).FlpfnWndProc = callbacks.register(tls, gofnp, cb)
	}
	r0, _, err := procRegisterClassW.Call(lpWndClass)
	if r0 == 0 {
		Dbg(tls, "FAIL err=%v", err)
		return 1 //TODO-
		tls.setErrno(err)
	}
	return int32(r0)
}

var procRegisterClassExW = moduser32.NewProc("RegisterClassExW")

// __attribute__((dllimport)) ATOM RegisterClassExW ( const WNDCLASSEXW *);
func XRegisterClassExW(tls *TLS, wndClassExW uintptr) (r TATOM) {
	Dbg(
		tls,
		"FcbSize=%v Fstyle=%v FlpWndProc=%#0x FcbClsExtra=%v FcbWndExtra=%v FhInstance=%#0x FhIcon=%v FhCursor=%v FhbrBackground=%v FlpszMenuName=%q FlpszClassName=%q FhIconSm=%v",
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FcbSize,
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).Fstyle,
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FlpfnWndProc,
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FcbClsExtra,
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FcbWndExtra,
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FhInstance,
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FhIcon,
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FhCursor,
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FhbrBackground,
		GoWideString((*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FlpszMenuName),
		GoWideString((*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FlpszClassName),
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FhIconSm,
	)
	if gofnp := (*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FlpfnWndProc; gofnp != 0 {
		f := (*struct{ f wndProc })(unsafe.Pointer(&struct{ uintptr }{gofnp})).f
		cb := func(hwnd THWND, message TUINT, wParam TWPARAM, lParam TLPARAM) uintptr {
			return uintptr(f(tls, hwnd, message, wParam, lParam))
		}
		(*TWNDCLASSEXW)(unsafe.Pointer(wndClassExW)).FlpfnWndProc = callbacks.register(tls, gofnp, cb)
	}
	r0, _, err := procRegisterClassExW.Call(wndClassExW)
	if r0 == 0 {
		Dbg(tls, "FAIL err=%v", err)
		tls.setErrno(err)
	}
	return TATOM(r0)
}

var procEnumFontFamiliesW = modgdi32.NewProc("EnumFontFamiliesW")

// int EnumFontFamiliesW(HDC hdc, LPCWSTR lpLogfont, FONTENUMPROCW lpProc, LPARAM lParam);
func XEnumFontFamiliesW(tls *TLS, hdc THDC, lpLogfont TLPCWSTR, lpProc TFONTENUMPROCW, lParam TLPARAM) int32 {
	if lpProc != 0 {
		gofnp := lpProc
		f := (*struct{ f fontEnumProc })(unsafe.Pointer(&struct{ uintptr }{gofnp})).f
		cb := func(lpelf, lpntm uintptr, FontType TDWORD, lParam TLPARAM) (r uintptr) {
			return uintptr(f(tls, lpelf, lpntm, FontType, lParam))
		}
		lpProc = callbacks.register(tls, gofnp, cb)
	}
	r0, _, _ := procEnumFontFamiliesW.Call(hdc, lpLogfont, lpProc, uintptr(lParam))
	return int32(r0)
}

type TFONTENUMPROCW = uintptr

type fontEnumProc func(tls *TLS, lpelf, lpntm uintptr, FontType TDWORD, lParam TLPARAM) int32

var procDdeInitializeW = moduser32.NewProc("DdeInitializeW")

// UINT DdeInitializeW(LPDWORD pidInst,PFNCALLBACK pfnCallback,DWORD afCmd,DWORD ulRes);
func XDdeInitializeW(tls *TLS, _pidInst TLPDWORD, _pfnCallback TPFNCALLBACK, _afCmd TDWORD, _ulRes TDWORD) (r TUINT) {
	if _pfnCallback != 0 {
		gofnp := _pfnCallback
		f := (*struct{ f pfnCallback })(unsafe.Pointer(&struct{ uintptr }{gofnp})).f
		cb := func(wType, wFmt TUINT, hConv THCONV, hsz1, hsz2 THSZ, hData THDDEDATA, dwData1, dwData2 TULONG_PTR) (r uintptr) {
			return uintptr(f(tls, wType, wFmt, hConv, hsz1, hsz2, hData, dwData1, dwData2))
		}
		_pfnCallback = callbacks.register(tls, gofnp, cb)
	}
	r0, _, _ := procDdeInitializeW.Call(_pidInst, _pfnCallback, uintptr(_afCmd), uintptr(_ulRes))
	return TUINT(r0)
}

type TPFNCALLBACK = uintptr

// HDDEDATA Pfncallback(
//
//	[in] UINT wType,
//	[in] UINT wFmt,
//	[in] HCONV hConv,
//	[in] HSZ hsz1,
//	[in] HSZ hsz2,
//	[in] HDDEDATA hData,
//	[in] ULONG_PTR dwData1,
//	[in] ULONG_PTR dwData2
//
// )
type pfnCallback func(tls *TLS, wType, wFmt TUINT, hConv THCONV, hsz1, hsz2 THSZ, hData THDDEDATA, dwData1, dwData2 TULONG_PTR) THDDEDATA

var procEnumWindows = moduser32.NewProc("EnumWindows")

// __attribute__((dllimport)) WINBOOL EnumWindows(WNDENUMPROC lpEnumFunc,LPARAM lParam);
func XEnumWindows(tls *TLS, lpEnumFunc TWNDENUMPROC, lParam TLPARAM) (r TWINBOOL) {
	if lpEnumFunc != 0 {
		gofnp := lpEnumFunc
		f := (*struct{ f wndEnumProc })(unsafe.Pointer(&struct{ uintptr }{gofnp})).f
		cb := func(hwnd THWND, lParam TLPARAM) (r uintptr) {
			return uintptr(f(tls, hwnd, lParam))
		}
		lpEnumFunc = callbacks.register(tls, gofnp, cb)
	}
	r0, _, _ := procEnumWindows.Call(lpEnumFunc, uintptr(lParam))
	return TWINBOOL(r0)
}

// BOOL CALLBACK EnumWindowsProc(
//
//	_In_ HWND   hwnd,
//	_In_ LPARAM lParam
//
// );
type wndEnumProc func(tls *TLS, hwnd THWND, lParam TLPARAM) TBOOL

func winGetObject(stream uintptr) interface{} {
	if fd, ok := iobMap[stream]; ok {
		f, _ := fdToFile(fd)
		return f
	}

	return getObject(stream)
}

var (
	modcomdlg32 = windows.NewLazySystemDLL("comdlg32.dll")
	modole32    = windows.NewLazySystemDLL("ole32.dll")
	modshell32  = windows.NewLazySystemDLL("shell32.dll")
	moduserenv  = windows.NewLazySystemDLL("userenv.dll")
	modwinspool = windows.NewLazySystemDLL("winspool.dll")

	modcomctl32 = windows.NewLazySystemDLL("comctl32.dll")
	//--
	procInitCommonControlsEx = modcomctl32.NewProc("InitCommonControlsEx")
	//--

	modimm32 = windows.NewLazySystemDLL("imm32.dll")
	//--
	procImmSetCompositionWindow  = modimm32.NewProc("ImmSetCompositionWindow")
	procImmReleaseContext        = modimm32.NewProc("ImmReleaseContext")
	procImmGetContext            = modimm32.NewProc("ImmGetContext")
	procImmGetCompositionStringW = modimm32.NewProc("ImmGetCompositionStringW")
	//--

	modoleaut32 = windows.NewLazySystemDLL("oleaut32.dll")
	//--
	procSetErrorInfo   = modoleaut32.NewProc("SetErrorInfo")
	procSysStringLen   = modoleaut32.NewProc("SysStringLen")
	procSysFreeString  = modoleaut32.NewProc("SysFreeString")
	procSysAllocString = modoleaut32.NewProc("SysAllocString")
	//--

	modgdi32 = windows.NewLazySystemDLL("gdi32.dll")
	//--
	procGetTextCharset         = modgdi32.NewProc("GetTextCharset")
	procGetDIBits              = modgdi32.NewProc("GetDIBits")
	procGetCharWidthW          = modgdi32.NewProc("GetCharWidthW")
	procGetCharWidthA          = modgdi32.NewProc("GetCharWidthA")
	procGetObjectA             = modgdi32.NewProc("GetObjectA")
	procGetMapMode             = modgdi32.NewProc("GetMapMode")
	procGetFontData            = modgdi32.NewProc("GetFontData")
	procPatBlt                 = modgdi32.NewProc("PatBlt")
	procOffsetClipRgn          = modgdi32.NewProc("OffsetClipRgn")
	procGetTextFaceW           = modgdi32.NewProc("GetTextFaceW")
	procGetTextMetricsW        = modgdi32.NewProc("GetTextMetricsW")
	procSetPaletteEntries      = modgdi32.NewProc("SetPaletteEntries")
	procSetMapMode             = modgdi32.NewProc("SetMapMode")
	procSetBrushOrgEx          = modgdi32.NewProc("SetBrushOrgEx")
	procSetBkMode              = modgdi32.NewProc("SetBkMode")
	procSelectPalette          = modgdi32.NewProc("SelectPalette")
	procSelectObject           = modgdi32.NewProc("SelectObject")
	procSelectClipRgn          = modgdi32.NewProc("SelectClipRgn")
	procDeleteDC               = modgdi32.NewProc("DeleteDC")
	procDPtoLP                 = modgdi32.NewProc("DPtoLP")
	procCreateSolidBrush       = modgdi32.NewProc("CreateSolidBrush")
	procCreateRectRgnIndirect  = modgdi32.NewProc("CreateRectRgnIndirect")
	procCreateRectRgn          = modgdi32.NewProc("CreateRectRgn")
	procCreatePen              = modgdi32.NewProc("CreatePen")
	procCreatePatternBrush     = modgdi32.NewProc("CreatePatternBrush")
	procCreateFontIndirectW    = modgdi32.NewProc("CreateFontIndirectW")
	procTranslateCharsetInfo   = modgdi32.NewProc("TranslateCharsetInfo")
	procTextOutW               = modgdi32.NewProc("TextOutW")
	procTextOutA               = modgdi32.NewProc("TextOutA")
	procStrokePath             = modgdi32.NewProc("StrokePath")
	procStrokeAndFillPath      = modgdi32.NewProc("StrokeAndFillPath")
	procSetTextAlign           = modgdi32.NewProc("SetTextAlign")
	procSetRectRgn             = modgdi32.NewProc("SetRectRgn")
	procSetROP2                = modgdi32.NewProc("SetROP2")
	procSetPolyFillMode        = modgdi32.NewProc("SetPolyFillMode")
	procUpdateColors           = modgdi32.NewProc("UpdateColors")
	procGetStockObject         = modgdi32.NewProc("GetStockObject")
	procGetNearestColor        = modgdi32.NewProc("GetNearestColor")
	procDeleteObject           = modgdi32.NewProc("DeleteObject")
	procCreatePalette          = modgdi32.NewProc("CreatePalette")
	procResizePalette          = modgdi32.NewProc("ResizePalette")
	procGetPaletteEntries      = modgdi32.NewProc("GetPaletteEntries")
	procGetNearestPaletteIndex = modgdi32.NewProc("GetNearestPaletteIndex")
	procGetDeviceCaps          = modgdi32.NewProc("GetDeviceCaps")
	procStretchDIBits          = modgdi32.NewProc("StretchDIBits")
	procSetTextColor           = modgdi32.NewProc("SetTextColor")
	procSetBkColor             = modgdi32.NewProc("SetBkColor")
	//--

	modkernel32 = windows.NewLazySystemDLL("kernel32.dll")
	//--
	procGetLocaleInfoW    = modkernel32.NewProc("GetLocaleInfoW")
	procIsDBCSLeadByte    = modkernel32.NewProc("IsDBCSLeadByte")
	procLocalAlloc        = modkernel32.NewProc("LocalAlloc")
	procGetThreadLocale   = modkernel32.NewProc("GetThreadLocale")
	procFormatMessageA    = modkernel32.NewProc("FormatMessageA")
	procMulDiv            = modkernel32.NewProc("MulDiv")
	procGlobalAlloc       = modkernel32.NewProc("GlobalAlloc")
	procGetClipboardOwner = modkernel32.NewProc("GetClipboardOwner")
	procGetLocaleInfoA    = modkernel32.NewProc("GetLocaleInfoA")
	procGlobalLock        = modkernel32.NewProc("GlobalLock")
	procGlobalUnlock      = modkernel32.NewProc("GlobalUnlock")
	procLoadResource      = modkernel32.NewProc("LoadResource")
	procLockResource      = modkernel32.NewProc("LockResource")
	//	procAreFileApisANSI            = modkernel32.NewProc("AreFileApisANSI")
	procCopyFileW = modkernel32.NewProc("CopyFileW")
	//	procCreateEventA               = modkernel32.NewProc("CreateEventA")
	procCreateEventW = modkernel32.NewProc("CreateEventW")
	//	procCreateFileA                = modkernel32.NewProc("CreateFileA")
	procCreateFileW     = modkernel32.NewProc("CreateFileW")
	procCreateHardLinkW = modkernel32.NewProc("CreateHardLinkW")
	procCreatePipe      = modkernel32.NewProc("CreatePipe")
	//	procCreateProcessA             = modkernel32.NewProc("CreateProcessA")
	procCreateProcessW          = modkernel32.NewProc("CreateProcessW")
	procCreateThread            = modkernel32.NewProc("CreateThread")
	procDeleteCriticalSection   = modkernel32.NewProc("DeleteCriticalSection")
	procDeviceIoControl         = modkernel32.NewProc("DeviceIoControl")
	procDuplicateHandle         = modkernel32.NewProc("DuplicateHandle")
	procEnterCriticalSection    = modkernel32.NewProc("EnterCriticalSection")
	procFindClose               = modkernel32.NewProc("FindClose")
	procFindFirstFileExW        = modkernel32.NewProc("FindFirstFileExW")
	procFindFirstFileW          = modkernel32.NewProc("FindFirstFileW")
	procFindNextFileW           = modkernel32.NewProc("FindNextFileW")
	procFindResourceW           = modkernel32.NewProc("FindResourceW")
	procFormatMessageW          = modkernel32.NewProc("FormatMessageW")
	procGetACP                  = modkernel32.NewProc("GetACP")
	procGetCommState            = modkernel32.NewProc("GetCommState")
	procGetComputerNameExW      = modkernel32.NewProc("GetComputerNameExW")
	procGetConsoleCP            = modkernel32.NewProc("GetConsoleCP")
	procGetCurrentProcess       = modkernel32.NewProc("GetCurrentProcess")
	procGetCurrentProcessId     = modkernel32.NewProc("GetCurrentProcessId")
	procGetCurrentThread        = modkernel32.NewProc("GetCurrentThread")
	procGetCurrentThreadId      = modkernel32.NewProc("GetCurrentThreadId")
	procGetEnvironmentVariableA = modkernel32.NewProc("GetEnvironmentVariableA")
	procGetEnvironmentVariableW = modkernel32.NewProc("GetEnvironmentVariableW")
	procGetExitCodeProcess      = modkernel32.NewProc("GetExitCodeProcess")
	procGetExitCodeThread       = modkernel32.NewProc("GetExitCodeThread")
	procGetFileAttributesA      = modkernel32.NewProc("GetFileAttributesA")
	//	procGetFileAttributesExA       = modkernel32.NewProc("GetFileAttributesExA")
	procGetFileAttributesExW       = modkernel32.NewProc("GetFileAttributesExW")
	procGetFileInformationByHandle = modkernel32.NewProc("GetFileInformationByHandle")
	//	procGetFileSize                = modkernel32.NewProc("GetFileSize")
	procGetFullPathNameW = modkernel32.NewProc("GetFullPathNameW")
	//	procGetLastError               = modkernel32.NewProc("GetLastError")
	procGetLogicalDriveStringsA  = modkernel32.NewProc("GetLogicalDriveStringsA")
	procGetModuleFileNameW       = modkernel32.NewProc("GetModuleFileNameW")
	procGetModuleHandleA         = modkernel32.NewProc("GetModuleHandleA")
	procGetModuleHandleW         = modkernel32.NewProc("GetModuleHandleW")
	procGetPrivateProfileStringA = modkernel32.NewProc("GetPrivateProfileStringA")
	//	procGetProcAddress             = modkernel32.NewProc("GetProcAddress")
	procGetProcessHeap = modkernel32.NewProc("GetProcessHeap")
	procGetSystemInfo  = modkernel32.NewProc("GetSystemInfo")
	//	procGetSystemTime              = modkernel32.NewProc("GetSystemTime")
	procGetSystemTimeAsFileTime = modkernel32.NewProc("GetSystemTimeAsFileTime")
	procGetTempFileNameW        = modkernel32.NewProc("GetTempFileNameW")
	procGetTickCount            = modkernel32.NewProc("GetTickCount")
	//	procGetVersionExA              = modkernel32.NewProc("GetVersionExA")
	procGetVersionExW             = modkernel32.NewProc("GetVersionExW")
	procGetVolumeInformationA     = modkernel32.NewProc("GetVolumeInformationA")
	procGetVolumeInformationW     = modkernel32.NewProc("GetVolumeInformationW")
	procHeapAlloc                 = modkernel32.NewProc("HeapAlloc")
	procHeapFree                  = modkernel32.NewProc("HeapFree")
	procInitializeCriticalSection = modkernel32.NewProc("InitializeCriticalSection")
	procLeaveCriticalSection      = modkernel32.NewProc("LeaveCriticalSection")
	//	procLockFile                   = modkernel32.NewProc("LockFile")
	//	procLockFileEx                 = modkernel32.NewProc("LockFileEx")
	procLstrlenW            = modkernel32.NewProc("lstrlenW")
	procMoveFileW           = modkernel32.NewProc("MoveFileW")
	procMultiByteToWideChar = modkernel32.NewProc("MultiByteToWideChar")
	//	procOpenEventA                 = modkernel32.NewProc("OpenEventA")
	procOpenProcessToken          = modkernel32.NewProc("OpenProcessToken")
	procPeekConsoleInputW         = modkernel32.NewProc("PeekConsoleInputW")
	procPeekNamedPipe             = modkernel32.NewProc("PeekNamedPipe")
	procQueryPerformanceCounter   = modkernel32.NewProc("QueryPerformanceCounter")
	procQueryPerformanceFrequency = modkernel32.NewProc("QueryPerformanceFrequency")
	procRaiseException            = modkernel32.NewProc("RaiseException")
	procReadConsoleW              = modkernel32.NewProc("ReadConsoleW")
	procReadFile                  = modkernel32.NewProc("ReadFile")
	procResetEvent                = modkernel32.NewProc("ResetEvent")
	procSearchPathW               = modkernel32.NewProc("SearchPathW")
	//	procSetConsoleCtrlHandler      = modkernel32.NewProc("SetConsoleCtrlHandler")
	procSetConsoleMode = modkernel32.NewProc("SetConsoleMode")
	//	procSetConsoleTextAttribute    = modkernel32.NewProc("SetConsoleTextAttribute")
	procSetEvent       = modkernel32.NewProc("SetEvent")
	procSetFilePointer = modkernel32.NewProc("SetFilePointer")
	procSetFileTime    = modkernel32.NewProc("SetFileTime")
	procSleepEx        = modkernel32.NewProc("SleepEx")
	//	procSystemTimeToFileTime       = modkernel32.NewProc("SystemTimeToFileTime")
	procTerminateThread = modkernel32.NewProc("TerminateThread")
	//	procTryEnterCriticalSection    = modkernel32.NewProc("TryEnterCriticalSection")
	//	procUnlockFile                 = modkernel32.NewProc("UnlockFile")
	//	procUnlockFileEx               = modkernel32.NewProc("UnlockFileEx")
	procWaitForSingleObjectEx = modkernel32.NewProc("WaitForSingleObjectEx")
	procWideCharToMultiByte   = modkernel32.NewProc("WideCharToMultiByte")
	//	procWriteConsoleA              = modkernel32.NewProc("WriteConsoleA")
	procWriteConsoleW = modkernel32.NewProc("WriteConsoleW")
	procWriteFile     = modkernel32.NewProc("WriteFile")
	//
	//	//	procSetConsoleCP               = modkernel32.NewProc("SetConsoleCP")
	//	//	procSetThreadPriority          = modkernel32.NewProc("SetThreadPriority")
	//	//--

	modadvapi32 = windows.NewLazySystemDLL("advapi32.dll")
	//--
	procAccessCheck                = modadvapi32.NewProc("AccessCheck")
	procAddAce                     = modadvapi32.NewProc("AddAce")
	procEqualSid                   = modadvapi32.NewProc("EqualSid")
	procGetAce                     = modadvapi32.NewProc("GetAce")
	procGetAclInformation          = modadvapi32.NewProc("GetAclInformation")
	procGetFileSecurityA           = modadvapi32.NewProc("GetFileSecurityA")
	procGetFileSecurityW           = modadvapi32.NewProc("GetFileSecurityW")
	procGetLengthSid               = modadvapi32.NewProc("GetLengthSid")
	procGetNamedSecurityInfoW      = modadvapi32.NewProc("GetNamedSecurityInfoW")
	procGetSecurityDescriptorDacl  = modadvapi32.NewProc("GetSecurityDescriptorDacl")
	procGetSecurityDescriptorOwner = modadvapi32.NewProc("GetSecurityDescriptorOwner")
	procGetSidIdentifierAuthority  = modadvapi32.NewProc("GetSidIdentifierAuthority")
	procGetSidLengthRequired       = modadvapi32.NewProc("GetSidLengthRequired")
	procGetSidSubAuthority         = modadvapi32.NewProc("GetSidSubAuthority")
	procGetTokenInformation        = modadvapi32.NewProc("GetTokenInformation")
	procImpersonateSelf            = modadvapi32.NewProc("ImpersonateSelf")
	procInitializeAcl              = modadvapi32.NewProc("InitializeAcl")
	procInitializeSid              = modadvapi32.NewProc("InitializeSid")
	procOpenThreadToken            = modadvapi32.NewProc("OpenThreadToken")
	procRevertToSelf               = modadvapi32.NewProc("RevertToSelf")
	//--

	modws2_32 = windows.NewLazySystemDLL("ws2_32.dll")
	//--
	procWSAStartup = modws2_32.NewProc("WSAStartup")
	//--

	moduser32 = windows.NewLazySystemDLL("user32.dll")
	//--
	procGetFocus                    = moduser32.NewProc("GetFocus")
	procGetDlgItem                  = moduser32.NewProc("GetDlgItem")
	procGetDesktopWindow            = moduser32.NewProc("GetDesktopWindow")
	procGetCursorPos                = moduser32.NewProc("GetCursorPos")
	procGetClientRect               = moduser32.NewProc("GetClientRect")
	procGetClassLongPtrW            = moduser32.NewProc("GetClassLongPtrW")
	procGetMessagePos               = moduser32.NewProc("GetMessagePos")
	procGetMessageA                 = moduser32.NewProc("GetMessageA")
	procGetMenuItemCount            = moduser32.NewProc("GetMenuItemCount")
	procGetLastInputInfo            = moduser32.NewProc("GetLastInputInfo")
	procGetKeyboardLayout           = moduser32.NewProc("GetKeyboardLayout")
	procGetForegroundWindow         = moduser32.NewProc("GetForegroundWindow")
	procPeekMessageA                = moduser32.NewProc("PeekMessageA")
	procMoveWindow                  = moduser32.NewProc("MoveWindow")
	procLoadIconW                   = moduser32.NewProc("LoadIconW")
	procLoadCursorW                 = moduser32.NewProc("LoadCursorW")
	procLoadCursorFromFileA         = moduser32.NewProc("LoadCursorFromFileA")
	procLoadCursorA                 = moduser32.NewProc("LoadCursorA")
	procLoadBitmapW                 = moduser32.NewProc("LoadBitmapW")
	procIsZoomed                    = moduser32.NewProc("IsZoomed")
	procIsWindowVisible             = moduser32.NewProc("IsWindowVisible")
	procIsIconic                    = moduser32.NewProc("IsIconic")
	procInvalidateRect              = moduser32.NewProc("InvalidateRect")
	procInsertMenuW                 = moduser32.NewProc("InsertMenuW")
	procGetWindowTextW              = moduser32.NewProc("GetWindowTextW")
	procGetWindowRect               = moduser32.NewProc("GetWindowRect")
	procGetWindowPlacement          = moduser32.NewProc("GetWindowPlacement")
	procGetWindow                   = moduser32.NewProc("GetWindow")
	procSetMenu                     = moduser32.NewProc("SetMenu")
	procSetLayeredWindowAttributes  = moduser32.NewProc("SetLayeredWindowAttributes")
	procSetForegroundWindow         = moduser32.NewProc("SetForegroundWindow")
	procSetFocus                    = moduser32.NewProc("SetFocus")
	procSetCursorPos                = moduser32.NewProc("SetCursorPos")
	procSetCursor                   = moduser32.NewProc("SetCursor")
	procSetClassLongPtrW            = moduser32.NewProc("SetClassLongPtrW")
	procSetCaretPos                 = moduser32.NewProc("SetCaretPos")
	procSetCapture                  = moduser32.NewProc("SetCapture")
	procSetActiveWindow             = moduser32.NewProc("SetActiveWindow")
	procSendInput                   = moduser32.NewProc("SendInput")
	procScrollWindowEx              = moduser32.NewProc("ScrollWindowEx")
	procEnableWindow                = moduser32.NewProc("EnableWindow")
	procDrawMenuBar                 = moduser32.NewProc("DrawMenuBar")
	procDrawFrameControl            = moduser32.NewProc("DrawFrameControl")
	procDrawEdge                    = moduser32.NewProc("DrawEdge")
	procDestroyMenu                 = moduser32.NewProc("DestroyMenu")
	procDestroyIcon                 = moduser32.NewProc("DestroyIcon")
	procDestroyCaret                = moduser32.NewProc("DestroyCaret")
	procCreatePopupMenu             = moduser32.NewProc("CreatePopupMenu")
	procCreateMenu                  = moduser32.NewProc("CreateMenu")
	procCreateIconIndirect          = moduser32.NewProc("CreateIconIndirect")
	procCreateIconFromResourceEx    = moduser32.NewProc("CreateIconFromResourceEx")
	procCreateIconFromResource      = moduser32.NewProc("CreateIconFromResource")
	procTrackPopupMenu              = moduser32.NewProc("TrackPopupMenu")
	procToUnicode                   = moduser32.NewProc("ToUnicode")
	procSystemParametersInfoW       = moduser32.NewProc("SystemParametersInfoW")
	procShowWindow                  = moduser32.NewProc("ShowWindow")
	procSetWindowsHookExW           = moduser32.NewProc("SetWindowsHookExW")
	procSetWindowTextW              = moduser32.NewProc("SetWindowTextW")
	procSetScrollInfo               = moduser32.NewProc("SetScrollInfo")
	procSetParent                   = moduser32.NewProc("SetParent")
	procSendMessageA                = moduser32.NewProc("SendMessageA")
	procSendDlgItemMessageA         = moduser32.NewProc("SendDlgItemMessageA")
	procGetWindowThreadProcessId    = moduser32.NewProc("GetWindowThreadProcessId")
	procGetDlgCtrlID                = moduser32.NewProc("GetDlgCtrlID")
	procGetClassNameW               = moduser32.NewProc("GetClassNameW")
	procFindWindowExW               = moduser32.NewProc("FindWindowExW")
	procFindWindowA                 = moduser32.NewProc("FindWindowA")
	procEnumChildWindows            = moduser32.NewProc("EnumChildWindows")
	procUpdateWindow                = moduser32.NewProc("UpdateWindow")
	procUnhookWindowsHookEx         = moduser32.NewProc("UnhookWindowsHookEx")
	procGetKeyState                 = moduser32.NewProc("GetKeyState")
	procMapVirtualKeyW              = moduser32.NewProc("MapVirtualKeyW")
	procReleaseDC                   = moduser32.NewProc("ReleaseDC")
	procVkKeyScanW                  = moduser32.NewProc("VkKeyScanW")
	procWindowFromPoint             = moduser32.NewProc("WindowFromPoint")
	procAdjustWindowRectEx          = moduser32.NewProc("AdjustWindowRectEx")
	procSetClipboardData            = moduser32.NewProc("SetClipboardData")
	procGetDC                       = moduser32.NewProc("GetDC")
	procEmptyClipboard              = moduser32.NewProc("EmptyClipboard")
	procCloseClipboard              = moduser32.NewProc("CloseClipboard")
	procGetClipboardData            = moduser32.NewProc("GetClipboardData")
	procIsClipboardFormatAvailable  = moduser32.NewProc("IsClipboardFormatAvailable")
	procOpenClipboard               = moduser32.NewProc("OpenClipboard")
	procBeginPaint                  = moduser32.NewProc("BeginPaint")
	procEndPaint                    = moduser32.NewProc("EndPaint")
	procDrawFocusRect               = moduser32.NewProc("DrawFocusRect")
	procGetSysColor                 = moduser32.NewProc("GetSysColor")
	procGetSystemMetrics            = moduser32.NewProc("GetSystemMetrics")
	procSetWindowPos                = moduser32.NewProc("SetWindowPos")
	procCharLowerW                  = moduser32.NewProc("CharLowerW")
	procCreateWindowExW             = moduser32.NewProc("CreateWindowExW")
	procMsgWaitForMultipleObjectsEx = moduser32.NewProc("MsgWaitForMultipleObjectsEx")
	procPeekMessageW                = moduser32.NewProc("PeekMessageW")
	procWaitForInputIdle            = moduser32.NewProc("WaitForInputIdle")
	//	//--

	netapi             = windows.NewLazySystemDLL("netapi32.dll")
	procNetGetDCName   = netapi.NewProc("NetGetDCName")
	procNetUserGetInfo = netapi.NewProc("NetUserGetInfo")

	userenvapi                = windows.NewLazySystemDLL("userenv.dll")
	procGetProfilesDirectoryW = userenvapi.NewProc("GetProfilesDirectoryW")

	// tcl9 requires UCRT
	modcrt = windows.NewLazySystemDLL("ucrtbase.dll")
	//	procAccess    = modcrt.NewProc("_access")
	//	procGmtime32  = modcrt.NewProc("_gmtime32")
	//	procStat64i32 = modcrt.NewProc("_stat64i32")
	//	procStati64   = modcrt.NewProc("_stati64")
	//	procStrftime  = modcrt.NewProc("strftime")
	//
	//	moducrt         = windows.NewLazySystemDLL("ucrtbase.dll")
	//	procFindfirst32 = moducrt.NewProc("_findfirst32")
	//	procFindnext32  = moducrt.NewProc("_findnext32")
	//
)

var (
	threadCallback uintptr
)

func init() {
	isWindows = true
	threadCallback = windows.NewCallback(ThreadProc)
}

// ---------------------------------
// Windows filehandle-to-fd mapping
// so the lib-c interface contract looks
// like normal fds being passed around
// but we're mapping them back and forth to
// native windows file handles (windows.Handle)
//

var EBADF = errors.New("EBADF")

var w_nextFd int32 = 42
var w_fdLock sync.Mutex
var w_fd_to_file = map[int32]*file{}

type file struct {
	_fd    int32
	hadErr bool
	t      uintptr
	windows.Handle
}

func addFile(hdl windows.Handle, fd int32) uintptr {
	var f = file{_fd: fd, Handle: hdl}
	w_fdLock.Lock()
	defer w_fdLock.Unlock()
	w_fd_to_file[fd] = &f
	f.t = addObject(&f)
	return f.t
}

func remFile(f *file) {
	removeObject(f.t)
	w_fdLock.Lock()
	defer w_fdLock.Unlock()
	delete(w_fd_to_file, f._fd)
}

func fdToFile(fd int32) (*file, bool) {
	w_fdLock.Lock()
	defer w_fdLock.Unlock()
	f, ok := w_fd_to_file[fd]
	return f, ok
}

// Wrap the windows handle up tied to a unique fd
func wrapFdHandle(hdl windows.Handle) (uintptr, int32) {
	newFd := atomic.AddInt32(&w_nextFd, 1)
	return addFile(hdl, newFd), newFd
}

func (f *file) err() bool {
	return f.hadErr
}

func (f *file) setErr() {
	f.hadErr = true
}

// // https://github.com/golang/go/issues/41220
//
// func (tls *TLS) GetLastError() (r uint32) {
// 	if tls == nil {
// 		return 0
// 	}
//
// 	return tls.lastError
// }

// -----------------------------------
// On windows we have to fetch these
//
// stdout, stdin, sterr
//
// Using the windows specific GetStdHandle
// they're mapped to the standard fds (0,1,2)
// Note: it's possible they don't exist
// if the app has been built for a GUI only
// target in windows. If that's the case
// panic seems like the only reasonable option
// ------------------------------

func newFile(t *TLS, fd int32) uintptr {

	if fd == unistd.STDIN_FILENO {
		h, err := windows.GetStdHandle(windows.STD_INPUT_HANDLE)
		if err != nil {
			panic("no console")
		}
		return addFile(h, fd)
	}
	if fd == unistd.STDOUT_FILENO {
		h, err := windows.GetStdHandle(windows.STD_OUTPUT_HANDLE)
		if err != nil {
			panic("no console")
		}
		return addFile(h, fd)
	}
	if fd == unistd.STDERR_FILENO {
		h, err := windows.GetStdHandle(windows.STD_ERROR_HANDLE)
		if err != nil {
			panic("no console")
		}
		return addFile(h, fd)
	}

	// should not get here -- unless newFile
	// is being used from somewhere we don't know about
	// to originate fds.

	panic("unknown fd source")
	return 0
}

func (f *file) close(t *TLS) int32 {
	remFile(f)
	err := windows.Close(f.Handle)
	if err != nil {
		return (-1) // EOF
	}
	return 0
}

func fwrite(fd int32, b []byte) (int, error) {
	if fd == unistd.STDOUT_FILENO {
		return write(b)
	}

	f, ok := fdToFile(fd)
	if !ok {
		return -1, EBADF
	}

	if dmesgs {
		dmesg("%v: fd %v: %s", origin(1), fd, b)
	}
	return windows.Write(f.Handle, b)
}

// int fprintf(FILE *stream, const char *format, ...);
func Xfprintf(t *TLS, stream, format, args uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v args=%v, (%v:)", t, args, origin(2))
	}
	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}

	n, _ := fwrite(f._fd, printf(format, args))
	return int32(n)
}

// // int usleep(useconds_t usec);
// func Xusleep(t *TLS, usec types.Useconds_t) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v usec=%v, (%v:)", t, usec, origin(2))
// 	}
// 	gotime.Sleep(gotime.Microsecond * gotime.Duration(usec))
// 	return 0
// }
//
// // int getrusage(int who, struct rusage *usage);
// func Xgetrusage(t *TLS, who int32, usage uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v who=%v usage=%v, (%v:)", t, who, usage, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// if _, _, err := unix.Syscall(unix.SYS_GETRUSAGE, uintptr(who), usage, 0); err != 0 {
// 	// 	t.setErrno(err)
// 	// 	return -1
// 	// }
//
// 	// return 0
// }
//
// // int lstat(const char *pathname, struct stat *statbuf);
// func Xlstat(t *TLS, pathname, statbuf uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v statbuf=%v, (%v:)", t, statbuf, origin(2))
// 	}
// 	return Xlstat64(t, pathname, statbuf)
// }
//
// // int stat(const char *pathname, struct stat *statbuf);
// func Xstat(t *TLS, pathname, statbuf uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v statbuf=%v, (%v:)", t, statbuf, origin(2))
// 	}
// 	return Xstat64(t, pathname, statbuf)
// }
//
// // int chdir(const char *path);
// func Xchdir(t *TLS, path uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v path=%v, (%v:)", t, path, origin(2))
// 	}
// 	err := windows.Chdir(GoString(path))
// 	if err != nil {
// 		t.setErrno(err)
// 		return -1
// 	}
//
// 	if dmesgs {
// 		dmesg("%v: %q: ok", origin(1), GoString(path))
// 	}
// 	return 0
// }

var localtime time.Tm

// struct tm *localtime(const time_t *timep);
func Xlocaltime(_ *TLS, timep uintptr) uintptr {
	loc := getLocalLocation()
	ut := *(*time.Time_t)(unsafe.Pointer(timep))
	t := gotime.Unix(int64(ut), 0).In(loc)
	localtime.Ftm_sec = int32(t.Second())
	localtime.Ftm_min = int32(t.Minute())
	localtime.Ftm_hour = int32(t.Hour())
	localtime.Ftm_mday = int32(t.Day())
	localtime.Ftm_mon = int32(t.Month() - 1)
	localtime.Ftm_year = int32(t.Year() - 1900)
	localtime.Ftm_wday = int32(t.Weekday())
	localtime.Ftm_yday = int32(t.YearDay())
	localtime.Ftm_isdst = Bool32(isTimeDST(t))
	return uintptr(unsafe.Pointer(&localtime))
}

// struct tm *localtime(const time_t *timep);
func X_localtime64(_ *TLS, timep uintptr) uintptr {
	return Xlocaltime(nil, timep)
}

// // struct tm *localtime_r(const time_t *timep, struct tm *result);
// func Xlocaltime_r(_ *TLS, timep, result uintptr) uintptr {
// 	die(tls, "");panic(todo(""))
// 	// loc := getLocalLocation()
// 	// ut := *(*unix.Time_t)(unsafe.Pointer(timep))
// 	// t := gotime.Unix(int64(ut), 0).In(loc)
// 	// (*time.Tm)(unsafe.Pointer(result)).Ftm_sec = int32(t.Second())
// 	// (*time.Tm)(unsafe.Pointer(result)).Ftm_min = int32(t.Minute())
// 	// (*time.Tm)(unsafe.Pointer(result)).Ftm_hour = int32(t.Hour())
// 	// (*time.Tm)(unsafe.Pointer(result)).Ftm_mday = int32(t.Day())
// 	// (*time.Tm)(unsafe.Pointer(result)).Ftm_mon = int32(t.Month() - 1)
// 	// (*time.Tm)(unsafe.Pointer(result)).Ftm_year = int32(t.Year() - 1900)
// 	// (*time.Tm)(unsafe.Pointer(result)).Ftm_wday = int32(t.Weekday())
// 	// (*time.Tm)(unsafe.Pointer(result)).Ftm_yday = int32(t.YearDay())
// 	// (*time.Tm)(unsafe.Pointer(result)).Ftm_isdst = Bool32(isTimeDST(t))
// 	// return result
// }

// int _wopen(
//
//	const wchar_t *filename,
//	int oflag [,
//	int pmode]
//
// );
func X_wopen(t *TLS, pathname uintptr, flags int32, args uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v pathname=%v flags=%v args=%v, (%v:)", t, pathname, flags, args, origin(2))
	}
	var mode types.Mode_t
	if args != 0 {
		mode = *(*types.Mode_t)(unsafe.Pointer(args))
	}
	s := goWideString(pathname)
	h, err := windows.Open(GoString(pathname), int(flags), uint32(mode))
	if err != nil {
		if dmesgs {
			dmesg("%v: %q %#x: %v", origin(1), s, flags, err)
		}

		t.setErrno(err)
		return 0
	}

	_, n := wrapFdHandle(h)
	if dmesgs {
		dmesg("%v: %q flags %#x mode %#o: fd %v", origin(1), s, flags, mode, n)
	}
	return n
}

// int open(const char *pathname, int flags, ...);
func Xopen(t *TLS, pathname uintptr, flags int32, args uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v pathname=%v flags=%v args=%v, (%v:)", t, pathname, flags, args, origin(2))
	}
	return Xopen64(t, pathname, flags, args)
}

// int open(const char *pathname, int flags, ...);
func Xopen64(t *TLS, pathname uintptr, flags int32, cmode uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v pathname=%v flags=%v cmode=%v, (%v:)", t, pathname, flags, cmode, origin(2))
	}

	var mode types.Mode_t
	if cmode != 0 {
		mode = (types.Mode_t)(VaUint32(&cmode))
	}
	// 	fdcwd := fcntl.AT_FDCWD
	h, err := windows.Open(GoString(pathname), int(flags), uint32(mode))
	if err != nil {

		if dmesgs {
			dmesg("%v: %q %#x: %v", origin(1), GoString(pathname), flags, err)
		}

		t.setErrno(err)
		return -1
	}

	_, n := wrapFdHandle(h)
	if dmesgs {
		dmesg("%v: %q flags %#x mode %#o: fd %v", origin(1), GoString(pathname), flags, mode, n)
	}
	return n
}

// off_t lseek(int fd, off_t offset, int whence);
func Xlseek(t *TLS, fd int32, offset types.Off_t, whence int32) types.Off_t {
	if __ccgo_strace {
		trc("t=%v fd=%v offset=%v whence=%v, (%v:)", t, fd, offset, whence, origin(2))
	}
	return types.Off_t(Xlseek64(t, fd, offset, whence))
}

// off64_t lseek64(int fd, off64_t offset, int whence);
func Xlseek64(t *TLS, fd int32, offset types.Off_t, whence int32) types.Off_t {
	if __ccgo_strace {
		trc("t=%v fd=%v offset=%v whence=%v, (%v:)", t, fd, offset, whence, origin(2))
	}

	f, ok := fdToFile(fd)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}

	n, err := windows.Seek(f.Handle, offset, int(whence))
	if err != nil {
		if dmesgs {
			dmesg("%v: fd %v, off %#x, whence %v: %v", origin(1), f._fd, offset, whenceStr(whence), n)
		}
		t.setErrno(err)
		return -1
	}

	if dmesgs {
		dmesg("%v: fd %v, off %#x, whence %v: ok", origin(1), f._fd, offset, whenceStr(whence))
	}
	return n
}

func whenceStr(whence int32) string {
	switch whence {
	case windows.FILE_CURRENT:
		return "SEEK_CUR"
	case windows.FILE_END:
		return "SEEK_END"
	case windows.FILE_BEGIN:
		return "SEEK_SET"
	default:
		return fmt.Sprintf("whence(%d)", whence)
	}
}

// var fsyncStatbuf stat.Stat
//
// // int fsync(int fd);
// func Xfsync(t *TLS, fd int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v, (%v:)", t, fd, origin(2))
// 	}
//
// 	f, ok := fdToFile(fd)
// 	if !ok {
// 		t.setErrno(errno.EBADF)
// 		return -1
// 	}
// 	err := windows.FlushFileBuffers(f.Handle)
// 	if err != nil {
// 		t.setErrno(err)
// 		return -1
// 	}
//
// 	if dmesgs {
// 		dmesg("%v: %d: ok", origin(1), fd)
// 	}
// 	return 0
// }
//
// // long sysconf(int name);
// func Xsysconf(t *TLS, name int32) long {
// 	if __ccgo_strace {
// 		trc("t=%v name=%v, (%v:)", t, name, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// switch name {
// 	// case unistd.X_SC_PAGESIZE:
// 	// 	return long(unix.Getpagesize())
// 	// }
//
// 	// die(tls, "");panic(todo(""))
// }

// int close(int fd);
func Xclose(t *TLS, fd int32) int32 {
	if __ccgo_strace {
		trc("t=%v fd=%v, (%v:)", t, fd, origin(2))
	}

	f, ok := fdToFile(fd)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}

	err := windows.Close(f.Handle)
	if err != nil {
		t.setErrno(err)
		return -1
	}

	if dmesgs {
		dmesg("%v: %d: ok", origin(1), fd)
	}
	return 0
}

// // char *getcwd(char *buf, size_t size);
// func Xgetcwd(t *TLS, buf uintptr, size types.Size_t) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v buf=%v size=%v, (%v:)", t, buf, size, origin(2))
// 	}
//
// 	b := make([]uint16, size)
// 	n, err := windows.GetCurrentDirectory(uint32(len(b)), &b[0])
// 	if err != nil {
// 		t.setErrno(err)
// 		return 0
// 	}
// 	// to bytes
// 	var wd = []byte(string(utf16.Decode(b[0:n])))
// 	if types.Size_t(len(wd)) > size {
// 		t.setErrno(errno.ERANGE)
// 		return 0
// 	}
//
// 	copy((*RawMem)(unsafe.Pointer(buf))[:], wd)
// 	(*RawMem)(unsafe.Pointer(buf))[len(wd)] = 0
//
// 	if dmesgs {
// 		dmesg("%v: %q: ok", origin(1), GoString(buf))
// 	}
// 	return buf
// }
//
// // int fstat(int fd, struct stat *statbuf);
// func Xfstat(t *TLS, fd int32, statbuf uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v statbuf=%v, (%v:)", t, fd, statbuf, origin(2))
// 	}
// 	return Xfstat64(t, fd, statbuf)
// }
//
// // int ftruncate(int fd, off_t length);
// func Xftruncate(t *TLS, fd int32, length types.Off_t) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v length=%v, (%v:)", t, fd, length, origin(2))
// 	}
// 	return Xftruncate64(t, fd, length)
// }
//
// // int fcntl(int fd, int cmd, ... /* arg */ );
// func Xfcntl(t *TLS, fd, cmd int32, args uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v cmd=%v args=%v, (%v:)", t, cmd, args, origin(2))
// 	}
// 	return Xfcntl64(t, fd, cmd, args)
// }

// int _read( // https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/read?view=msvc-160
//
//	int const fd,
//	void * const buffer,
//	unsigned const buffer_size
//
// );
func Xread(t *TLS, fd int32, buf uintptr, count uint32) int32 {
	if __ccgo_strace {
		trc("t=%v fd=%v buf=%v count=%v, (%v:)", t, fd, buf, count, origin(2))
	}
	f, ok := fdToFile(fd)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}

	var obuf = ((*RawMem)(unsafe.Pointer(buf)))[:count]
	n, err := windows.Read(f.Handle, obuf)
	if err != nil {
		t.setErrno(err)
		return -1
	}

	if dmesgs {
		// dmesg("%v: %d %#x: %#x\n%s", origin(1), fd, count, n, hex.Dump(GoBytes(buf, int(n))))
		dmesg("%v: %d %#x: %#x", origin(1), fd, count, n)
	}
	return int32(n)
}

// func X_read(t *TLS, fd int32, buf uintptr, count uint32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v buf=%v count=%v, (%v:)", t, fd, buf, count, origin(2))
// 	}
// 	return Xread(t, fd, buf, count)
// }

// int _write( // https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/write?view=msvc-160
//
//	int fd,
//	const void *buffer,
//	unsigned int count
//
// );
func Xwrite(t *TLS, fd int32, buf uintptr, count uint32) int32 {
	if __ccgo_strace {
		trc("t=%v fd=%v buf=%v count=%v, (%v:)", t, fd, buf, count, origin(2))
	}
	f, ok := fdToFile(fd)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}

	var obuf = ((*RawMem)(unsafe.Pointer(buf)))[:count]
	n, err := windows.Write(f.Handle, obuf)
	if err != nil {
		if dmesgs {
			dmesg("%v: fd %v, count %#x: %v", origin(1), fd, count, err)
		}
		t.setErrno(err)
		return -1
	}

	if dmesgs {
		// dmesg("%v: %d %#x: %#x\n%s", origin(1), fd, count, n, hex.Dump(GoBytes(buf, int(n))))
		dmesg("%v: %d %#x: %#x", origin(1), fd, count, n)
	}
	return int32(n)
}

// func X_write(t *TLS, fd int32, buf uintptr, count uint32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v buf=%v count=%v, (%v:)", t, fd, buf, count, origin(2))
// 	}
// 	return Xwrite(t, fd, buf, count)
// }
//
// // int fchmod(int fd, mode_t mode);
// func Xfchmod(t *TLS, fd int32, mode types.Mode_t) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v mode=%v, (%v:)", t, fd, mode, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// if _, _, err := unix.Syscall(unix.SYS_FCHMOD, uintptr(fd), uintptr(mode), 0); err != 0 {
// 	// 	t.setErrno(err)
// 	// 	return -1
// 	// }
//
// 	// if dmesgs {
// 	// 	dmesg("%v: %d %#o: ok", origin(1), fd, mode)
// 	// }
// 	// return 0
// }
//
// // // int fchown(int fd, uid_t owner, gid_t group);
// // func Xfchown(t *TLS, fd int32, owner types.Uid_t, group types.Gid_t) int32 {
// // 	if _, _, err := unix.Syscall(unix.SYS_FCHOWN, uintptr(fd), uintptr(owner), uintptr(group)); err != 0 {
// // 		t.setErrno(err)
// // 		return -1
// // 	}
// //
// // 	return 0
// // }
//
// // // uid_t geteuid(void);
// // func Xgeteuid(t *TLS) types.Uid_t {
// // 	n, _, _ := unix.Syscall(unix.SYS_GETEUID, 0, 0, 0)
// // 	return types.Uid_t(n)
// // }
//
// // int munmap(void *addr, size_t length);
// func Xmunmap(t *TLS, addr uintptr, length types.Size_t) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v addr=%v length=%v, (%v:)", t, addr, length, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// if _, _, err := unix.Syscall(unix.SYS_MUNMAP, addr, uintptr(length), 0); err != 0 {
// 	// 	t.setErrno(err)
// 	// 	return -1
// 	// }
//
// 	// return 0
// }
//
// // int gettimeofday(struct timeval *tv, struct timezone *tz);
// func Xgettimeofday(t *TLS, tv, tz uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v tz=%v, (%v:)", t, tz, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// if tz != 0 {
// 	// 	die(tls, "");panic(todo(""))
// 	// }
//
// 	// var tvs unix.Timeval
// 	// err := unix.Gettimeofday(&tvs)
// 	// if err != nil {
// 	// 	t.setErrno(err)
// 	// 	return -1
// 	// }
//
// 	// *(*unix.Timeval)(unsafe.Pointer(tv)) = tvs
// 	// return 0
// }

// int getsockopt(int sockfd, int level, int optname, void *optval, socklen_t *optlen);
func Xgetsockopt(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
	// if _, _, err := unix.Syscall6(unix.SYS_GETSOCKOPT, uintptr(sockfd), uintptr(level), uintptr(optname), optval, optlen, 0); err != 0 {
	// 	t.setErrno(err)
	// 	return -1
	// }

	// return 0
}

// // int setsockopt(int sockfd, int level, int optname, const void *optval, socklen_t optlen);
func Xsetsockopt(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// // int ioctl(int fd, unsigned long request, ...);
// func Xioctl(t *TLS, fd int32, request ulong, va uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v request=%v va=%v, (%v:)", t, fd, request, va, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// var argp uintptr
// 	// if va != 0 {
// 	// 	argp = VaUintptr(&va)
// 	// }
// 	// n, _, err := unix.Syscall(unix.SYS_IOCTL, uintptr(fd), uintptr(request), argp)
// 	// if err != 0 {
// 	// 	t.setErrno(err)
// 	// 	return -1
// 	// }
//
// 	// return int32(n)
// }

// int select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout);
func Xselect(t *TLS, nfds int32, readfds, writefds, exceptfds, timeout uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v nfds=%v timeout=%v, (%v:)", t, nfds, timeout, origin(2))
	}
	die(t, "")
	panic(todo(""))
	// n, err := unix.Select(
	// 	int(nfds),
	// 	(*unix.FdSet)(unsafe.Pointer(readfds)),
	// 	(*unix.FdSet)(unsafe.Pointer(writefds)),
	// 	(*unix.FdSet)(unsafe.Pointer(exceptfds)),
	// 	(*unix.Timeval)(unsafe.Pointer(timeout)),
	// )
	// if err != nil {
	// 	t.setErrno(err)
	// 	return -1
	// }

	// return int32(n)
}

// // int mkfifo(const char *pathname, mode_t mode);
// func Xmkfifo(t *TLS, pathname uintptr, mode types.Mode_t) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v pathname=%v mode=%v, (%v:)", t, pathname, mode, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	if err := unix.Mkfifo(GoString(pathname), mode); err != nil {
// 	// 		t.setErrno(err)
// 	// 		return -1
// 	// 	}
// 	//
// 	// 	return 0
// }
//
// // mode_t umask(mode_t mask);
// func Xumask(t *TLS, mask types.Mode_t) types.Mode_t {
// 	if __ccgo_strace {
// 		trc("t=%v mask=%v, (%v:)", t, mask, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	n, _, _ := unix.Syscall(unix.SYS_UMASK, uintptr(mask), 0, 0)
// 	// 	return types.Mode_t(n)
// }
//
// // int execvp(const char *file, char *const argv[]);
// func Xexecvp(t *TLS, file, argv uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v argv=%v, (%v:)", t, argv, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	if _, _, err := unix.Syscall(unix.SYS_EXECVE, file, argv, Environ()); err != 0 {
// 	// 		t.setErrno(err)
// 	// 		return -1
// 	// 	}
// 	//
// 	// 	return 0
// }
//
// // pid_t waitpid(pid_t pid, int *wstatus, int options);
// func Xwaitpid(t *TLS, pid types.Pid_t, wstatus uintptr, optname int32) types.Pid_t {
// 	if __ccgo_strace {
// 		trc("t=%v pid=%v wstatus=%v optname=%v, (%v:)", t, pid, wstatus, optname, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	n, _, err := unix.Syscall6(unix.SYS_WAIT4, uintptr(pid), wstatus, uintptr(optname), 0, 0, 0)
// 	// 	if err != 0 {
// 	// 		t.setErrno(err)
// 	// 		return -1
// 	// 	}
// 	//
// 	// 	return types.Pid_t(n)
// }
//
// // int uname(struct utsname *buf);
// func Xuname(t *TLS, buf uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v buf=%v, (%v:)", t, buf, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	if _, _, err := unix.Syscall(unix.SYS_UNAME, buf, 0, 0); err != 0 {
// 	// 		t.setErrno(err)
// 	// 		return -1
// 	// 	}
// 	//
// 	// 	return 0
// }
//
// // int getrlimit(int resource, struct rlimit *rlim);
// func Xgetrlimit(t *TLS, resource int32, rlim uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v resource=%v rlim=%v, (%v:)", t, resource, rlim, origin(2))
// 	}
// 	return Xgetrlimit64(t, resource, rlim)
// }
//
// // int setrlimit(int resource, const struct rlimit *rlim);
// func Xsetrlimit(t *TLS, resource int32, rlim uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v resource=%v rlim=%v, (%v:)", t, resource, rlim, origin(2))
// 	}
// 	return Xsetrlimit64(t, resource, rlim)
// }
//
// // int setrlimit(int resource, const struct rlimit *rlim);
// func Xsetrlimit64(t *TLS, resource int32, rlim uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v resource=%v rlim=%v, (%v:)", t, resource, rlim, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	if _, _, err := unix.Syscall(unix.SYS_SETRLIMIT, uintptr(resource), uintptr(rlim), 0); err != 0 {
// 	// 		t.setErrno(err)
// 	// 		return -1
// 	// 	}
// 	//
// 	// 	return 0
// }
//
// // // uid_t getuid(void);
// // func Xgetuid(t *TLS) types.Uid_t {
// // 	return types.Uid_t(os.Getuid())
// // }

// pid_t getpid(void);
func Xgetpid(t *TLS) int32 {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	return int32(os.Getpid())
}

// // int system(const char *command);
// func Xsystem(t *TLS, command uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v command=%v, (%v:)", t, command, origin(2))
// 	}
// 	s := GoString(command)
// 	if command == 0 {
// 		die(tls, "");panic(todo(""))
// 	}
//
// 	cmd := exec.Command("sh", "-c", s)
// 	cmd.Stdout = os.Stdout
// 	cmd.Stderr = os.Stderr
// 	err := cmd.Run()
// 	if err != nil {
// 		ps := err.(*exec.ExitError)
// 		return int32(ps.ExitCode())
// 	}
//
// 	return 0
// }
//
// // var staticGetpwuid pwd.Passwd
//
// func init() {
// 	atExit = append(atExit, func() { closePasswd(&staticGetpwuid) })
// }
//
// // func closePasswd(p *pwd.Passwd) {
// // 	Xfree(nil, p.Fpw_name)
// // 	Xfree(nil, p.Fpw_passwd)
// // 	Xfree(nil, p.Fpw_gecos)
// // 	Xfree(nil, p.Fpw_dir)
// // 	Xfree(nil, p.Fpw_shell)
// // 	*p = pwd.Passwd{}
// // }
//
// // struct passwd *getpwuid(uid_t uid);
// func Xgetpwuid(t *TLS, uid uint32) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v uid=%v, (%v:)", t, uid, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	f, err := os.Open("/etc/passwd")
// 	// 	if err != nil {
// 	// 		die(tls, "");panic(todo("", err))
// 	// 	}
// 	//
// 	// 	defer f.Close()
// 	//
// 	// 	sid := strconv.Itoa(int(uid))
// 	// 	sc := bufio.NewScanner(f)
// 	// 	for sc.Scan() {
// 	// 		// eg. "root:x:0:0:root:/root:/bin/bash"
// 	// 		a := strings.Split(sc.Text(), ":")
// 	// 		if len(a) < 7 {
// 	// 			die(tls, "");panic(todo(""))
// 	// 		}
// 	//
// 	// 		if a[2] == sid {
// 	// 			uid, err := strconv.Atoi(a[2])
// 	// 			if err != nil {
// 	// 				die(tls, "");panic(todo(""))
// 	// 			}
// 	//
// 	// 			gid, err := strconv.Atoi(a[3])
// 	// 			if err != nil {
// 	// 				die(tls, "");panic(todo(""))
// 	// 			}
// 	//
// 	// 			closePasswd(&staticGetpwuid)
// 	// 			gecos := a[4]
// 	// 			if strings.Contains(gecos, ",") {
// 	// 				a := strings.Split(gecos, ",")
// 	// 				gecos = a[0]
// 	// 			}
// 	// 			initPasswd(t, &staticGetpwuid, a[0], a[1], uint32(uid), uint32(gid), gecos, a[5], a[6])
// 	// 			return uintptr(unsafe.Pointer(&staticGetpwuid))
// 	// 		}
// 	// 	}
// 	//
// 	// 	if sc.Err() != nil {
// 	// 		die(tls, "");panic(todo(""))
// 	// 	}
// 	//
// 	// 	return 0
// }
//
// // func initPasswd(t *TLS, p *pwd.Passwd, name, pwd string, uid, gid uint32, gecos, dir, shell string) {
// // 	p.Fpw_name = cString(t, name)
// // 	p.Fpw_passwd = cString(t, pwd)
// // 	p.Fpw_uid = uid
// // 	p.Fpw_gid = gid
// // 	p.Fpw_gecos = cString(t, gecos)
// // 	p.Fpw_dir = cString(t, dir)
// // 	p.Fpw_shell = cString(t, shell)
// // }
//
// // int setvbuf(FILE *stream, char *buf, int mode, size_t size);
// func Xsetvbuf(t *TLS, stream, buf uintptr, mode int32, size types.Size_t) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v buf=%v mode=%v size=%v, (%v:)", t, buf, mode, size, origin(2))
// 	}
// 	return 0 //TODO
// }
//
// // int raise(int sig);
// func Xraise(t *TLS, sig int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v sig=%v, (%v:)", t, sig, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int backtrace(void **buffer, int size);
// func Xbacktrace(t *TLS, buf uintptr, size int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v buf=%v size=%v, (%v:)", t, buf, size, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // void backtrace_symbols_fd(void *const *buffer, int size, int fd);
// func Xbacktrace_symbols_fd(t *TLS, buffer uintptr, size, fd int32) {
// 	if __ccgo_strace {
// 		trc("t=%v buffer=%v fd=%v, (%v:)", t, buffer, fd, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// int fileno(FILE *stream);
func Xfileno(t *TLS, stream uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
	}
	if stream == 0 {
		t.setErrno(errno.EBADF)
		return -1
	}

	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}
	return f._fd
}

// // var staticGetpwnam pwd.Passwd
// //
// // func init() {
// // 	atExit = append(atExit, func() { closePasswd(&staticGetpwnam) })
// // }
// //
// // // struct passwd *getpwnam(const char *name);
// // func Xgetpwnam(t *TLS, name uintptr) uintptr {
// // 	f, err := os.Open("/etc/passwd")
// // 	if err != nil {
// // 		die(tls, "");panic(todo("", err))
// // 	}
// //
// // 	defer f.Close()
// //
// // 	sname := GoString(name)
// // 	sc := bufio.NewScanner(f)
// // 	for sc.Scan() {
// // 		// eg. "root:x:0:0:root:/root:/bin/bash"
// // 		a := strings.Split(sc.Text(), ":")
// // 		if len(a) < 7 {
// // 			die(tls, "");panic(todo(""))
// // 		}
// //
// // 		if a[0] == sname {
// // 			uid, err := strconv.Atoi(a[2])
// // 			if err != nil {
// // 				die(tls, "");panic(todo(""))
// // 			}
// //
// // 			gid, err := strconv.Atoi(a[3])
// // 			if err != nil {
// // 				die(tls, "");panic(todo(""))
// // 			}
// //
// // 			closePasswd(&staticGetpwnam)
// // 			gecos := a[4]
// // 			if strings.Contains(gecos, ",") {
// // 				a := strings.Split(gecos, ",")
// // 				gecos = a[0]
// // 			}
// // 			initPasswd(t, &staticGetpwnam, a[0], a[1], uint32(uid), uint32(gid), gecos, a[5], a[6])
// // 			return uintptr(unsafe.Pointer(&staticGetpwnam))
// // 		}
// // 	}
// //
// // 	if sc.Err() != nil {
// // 		die(tls, "");panic(todo(""))
// // 	}
// //
// // 	return 0
// // }
// //
// // var staticGetgrnam grp.Group
// //
// // func init() {
// // 	atExit = append(atExit, func() { closeGroup(&staticGetgrnam) })
// // }
// //
// // // struct group *getgrnam(const char *name);
// // func Xgetgrnam(t *TLS, name uintptr) uintptr {
// // 	f, err := os.Open("/etc/group")
// // 	if err != nil {
// // 		die(tls, "");panic(todo(""))
// // 	}
// //
// // 	defer f.Close()
// //
// // 	sname := GoString(name)
// // 	sc := bufio.NewScanner(f)
// // 	for sc.Scan() {
// // 		// eg. "root:x:0:"
// // 		a := strings.Split(sc.Text(), ":")
// // 		if len(a) < 4 {
// // 			die(tls, "");panic(todo(""))
// // 		}
// //
// // 		if a[0] == sname {
// // 			closeGroup(&staticGetgrnam)
// // 			gid, err := strconv.Atoi(a[2])
// // 			if err != nil {
// // 				die(tls, "");panic(todo(""))
// // 			}
// //
// // 			var names []string
// // 			if a[3] != "" {
// // 				names = strings.Split(a[3], ",")
// // 			}
// // 			initGroup(t, &staticGetgrnam, a[0], a[1], uint32(gid), names)
// // 			return uintptr(unsafe.Pointer(&staticGetgrnam))
// // 		}
// // 	}
// //
// // 	if sc.Err() != nil {
// // 		die(tls, "");panic(todo(""))
// // 	}
// //
// // 	return 0
// // }
// //
// // func closeGroup(p *grp.Group) {
// // 	Xfree(nil, p.Fgr_name)
// // 	Xfree(nil, p.Fgr_passwd)
// // 	if p.Fgr_mem != 0 {
// // 		die(tls, "");panic(todo(""))
// // 	}
// //
// // 	*p = grp.Group{}
// // }
// //
// // func initGroup(t *TLS, p *grp.Group, name, pwd string, gid uint32, names []string) {
// // 	p.Fgr_name = cString(t, name)
// // 	p.Fgr_passwd = cString(t, pwd)
// // 	p.Fgr_gid = gid
// // 	p.Fgr_mem = 0
// // 	if len(names) != 0 {
// // 		die(tls, "");panic(todo("%q %q %v %q %v", name, pwd, gid, names, len(names)))
// // 	}
// // }
// //
// // func init() {
// // 	atExit = append(atExit, func() { closeGroup(&staticGetgrgid) })
// // }
// //
// // var staticGetgrgid grp.Group
// //
// // // struct group *getgrgid(gid_t gid);
// // func Xgetgrgid(t *TLS, gid uint32) uintptr {
// // 	f, err := os.Open("/etc/group")
// // 	if err != nil {
// // 		die(tls, "");panic(todo(""))
// // 	}
// //
// // 	defer f.Close()
// //
// // 	sid := strconv.Itoa(int(gid))
// // 	sc := bufio.NewScanner(f)
// // 	for sc.Scan() {
// // 		// eg. "root:x:0:"
// // 		a := strings.Split(sc.Text(), ":")
// // 		if len(a) < 4 {
// // 			die(tls, "");panic(todo(""))
// // 		}
// //
// // 		if a[2] == sid {
// // 			closeGroup(&staticGetgrgid)
// // 			var names []string
// // 			if a[3] != "" {
// // 				names = strings.Split(a[3], ",")
// // 			}
// // 			initGroup(t, &staticGetgrgid, a[0], a[1], gid, names)
// // 			return uintptr(unsafe.Pointer(&staticGetgrgid))
// // 		}
// // 	}
// //
// // 	if sc.Err() != nil {
// // 		die(tls, "");panic(todo(""))
// // 	}
// //
// // 	return 0
// // }
//
// // int mkstemps(char *template, int suffixlen);
// func Xmkstemps(t *TLS, template uintptr, suffixlen int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v template=%v suffixlen=%v, (%v:)", t, template, suffixlen, origin(2))
// 	}
// 	return Xmkstemps64(t, template, suffixlen)
// }
//
// // int mkstemps(char *template, int suffixlen);
// func Xmkstemps64(t *TLS, template uintptr, suffixlen int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v template=%v suffixlen=%v, (%v:)", t, template, suffixlen, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	len := uintptr(Xstrlen(t, template))
// 	// 	x := template + uintptr(len-6) - uintptr(suffixlen)
// 	// 	for i := uintptr(0); i < 6; i++ {
// 	// 		if *(*byte)(unsafe.Pointer(x + i)) != 'X' {
// 	// 			t.setErrno(errno.EINVAL)
// 	// 			return -1
// 	// 		}
// 	// 	}
// 	//
// 	// 	fd, err := tempFile(template, x)
// 	// 	if err != 0 {
// 	// 		t.setErrno(err)
// 	// 		return -1
// 	// 	}
// 	//
// 	// 	return int32(fd)
// }
//
// // int mkstemp(char *template);
// func Xmkstemp64(t *TLS, template uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v template=%v, (%v:)", t, template, origin(2))
// 	}
// 	return Xmkstemps64(t, template, 0)
// }
//
// // func newFtsent(t *TLS, info int, path string, stat *unix.Stat_t, err windows.Errno) (r *fts.FTSENT) {
// // 	var statp uintptr
// // 	if stat != nil {
// // 		statp = Xmalloc(t, types.Size_t(unsafe.Sizeof(unix.Stat_t{})))
// // 		if statp == 0 {
// // 			die(tls, "");panic("OOM")
// // 		}
// //
// // 		*(*unix.Stat_t)(unsafe.Pointer(statp)) = *stat
// // 	}
// // 	csp := CString(path)
// // 	if csp == 0 {
// // 		die(tls, "");panic("OOM")
// // 	}
// //
// // 	return &fts.FTSENT{
// // 		Ffts_info:    uint16(info),
// // 		Ffts_path:    csp,
// // 		Ffts_pathlen: uint16(len(path)),
// // 		Ffts_statp:   statp,
// // 		Ffts_errno:   int32(err),
// // 	}
// // }
// //
// // func newCFtsent(t *TLS, info int, path string, stat *unix.Stat_t, err windows.Errno) uintptr {
// // 	p := Xcalloc(t, types.Size_t(unsafe.Sizeof(fts.FTSENT{})))
// // 	if p == 0 {
// // 		die(tls, "");panic("OOM")
// // 	}
// //
// // 	*(*fts.FTSENT)(unsafe.Pointer(p)) = *newFtsent(t, info, path, stat, err)
// // 	return p
// // }
// //
// // func ftsentClose(t *TLS, p uintptr) {
// // 	Xfree(t, (*fts.FTSENT)(unsafe.Pointer(p)).Ffts_path)
// // 	Xfree(t, (*fts.FTSENT)(unsafe.Pointer(p)).Ffts_statp)
// // }
//
// type ftstream struct {
// 	s []uintptr
// 	x int
// }
//
// // func (f *ftstream) close(t *TLS) {
// // 	for _, p := range f.s {
// // 		ftsentClose(t, p)
// // 		Xfree(t, p)
// // 	}
// // 	*f = ftstream{}
// // }
// //
// // // FTS *fts_open(char * const *path_argv, int options, int (*compar)(const FTSENT **, const FTSENT **));
// // func Xfts_open(t *TLS, path_argv uintptr, options int32, compar uintptr) uintptr {
// // 	return Xfts64_open(t, path_argv, options, compar)
// // }
//
// // FTS *fts_open(char * const *path_argv, int options, int (*compar)(const FTSENT **, const FTSENT **));
// func Xfts64_open(t *TLS, path_argv uintptr, options int32, compar uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v path_argv=%v options=%v compar=%v, (%v:)", t, path_argv, options, compar, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	f := &ftstream{}
// 	//
// 	// 	var walk func(string)
// 	// 	walk = func(path string) {
// 	// 		var fi os.FileInfo
// 	// 		var err error
// 	// 		switch {
// 	// 		case options&fts.FTS_LOGICAL != 0:
// 	// 			fi, err = os.Stat(path)
// 	// 		case options&fts.FTS_PHYSICAL != 0:
// 	// 			fi, err = os.Lstat(path)
// 	// 		default:
// 	// 			die(tls, "");panic(todo(""))
// 	// 		}
// 	//
// 	// 		if err != nil {
// 	// 			die(tls, "");panic(todo(""))
// 	// 		}
// 	//
// 	// 		var statp *unix.Stat_t
// 	// 		if options&fts.FTS_NOSTAT == 0 {
// 	// 			var stat unix.Stat_t
// 	// 			switch {
// 	// 			case options&fts.FTS_LOGICAL != 0:
// 	// 				if err := unix.Stat(path, &stat); err != nil {
// 	// 					die(tls, "");panic(todo(""))
// 	// 				}
// 	// 			case options&fts.FTS_PHYSICAL != 0:
// 	// 				if err := unix.Lstat(path, &stat); err != nil {
// 	// 					die(tls, "");panic(todo(""))
// 	// 				}
// 	// 			default:
// 	// 				die(tls, "");panic(todo(""))
// 	// 			}
// 	//
// 	// 			statp = &stat
// 	// 		}
// 	//
// 	// 	out:
// 	// 		switch {
// 	// 		case fi.IsDir():
// 	// 			f.s = append(f.s, newCFtsent(t, fts.FTS_D, path, statp, 0))
// 	// 			g, err := os.Open(path)
// 	// 			switch x := err.(type) {
// 	// 			case nil:
// 	// 				// ok
// 	// 			case *os.PathError:
// 	// 				f.s = append(f.s, newCFtsent(t, fts.FTS_DNR, path, statp, errno.EACCES))
// 	// 				break out
// 	// 			default:
// 	// 				die(tls, "");panic(todo("%q: %v %T", path, x, x))
// 	// 			}
// 	//
// 	// 			names, err := g.Readdirnames(-1)
// 	// 			g.Close()
// 	// 			if err != nil {
// 	// 				die(tls, "");panic(todo(""))
// 	// 			}
// 	//
// 	// 			for _, name := range names {
// 	// 				walk(path + "/" + name)
// 	// 				if f == nil {
// 	// 					break out
// 	// 				}
// 	// 			}
// 	//
// 	// 			f.s = append(f.s, newCFtsent(t, fts.FTS_DP, path, statp, 0))
// 	// 		default:
// 	// 			info := fts.FTS_F
// 	// 			if fi.Mode()&os.ModeSymlink != 0 {
// 	// 				info = fts.FTS_SL
// 	// 			}
// 	// 			switch {
// 	// 			case statp != nil:
// 	// 				f.s = append(f.s, newCFtsent(t, info, path, statp, 0))
// 	// 			case options&fts.FTS_NOSTAT != 0:
// 	// 				f.s = append(f.s, newCFtsent(t, fts.FTS_NSOK, path, nil, 0))
// 	// 			default:
// 	// 				die(tls, "");panic(todo(""))
// 	// 			}
// 	// 		}
// 	// 	}
// 	//
// 	// 	for {
// 	// 		p := *(*uintptr)(unsafe.Pointer(path_argv))
// 	// 		if p == 0 {
// 	// 			if f == nil {
// 	// 				return 0
// 	// 			}
// 	//
// 	// 			if compar != 0 {
// 	// 				die(tls, "");panic(todo(""))
// 	// 			}
// 	//
// 	// 			return addObject(f)
// 	// 		}
// 	//
// 	// 		walk(GoString(p))
// 	// 		path_argv += unsafe.Sizeof(uintptr(0))
// 	// 	}
// }
//
// // FTSENT *fts_read(FTS *ftsp);
// func Xfts_read(t *TLS, ftsp uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v ftsp=%v, (%v:)", t, ftsp, origin(2))
// 	}
// 	return Xfts64_read(t, ftsp)
// }
//
// // FTSENT *fts_read(FTS *ftsp);
// func Xfts64_read(t *TLS, ftsp uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v ftsp=%v, (%v:)", t, ftsp, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	f := winGetObject(ftsp).(*ftstream)
// 	// 	if f.x == len(f.s) {
// 	// 		t.setErrno(0)
// 	// 		return 0
// 	// 	}
// 	//
// 	// 	r := f.s[f.x]
// 	// 	if e := (*fts.FTSENT)(unsafe.Pointer(r)).Ffts_errno; e != 0 {
// 	// 		t.setErrno(e)
// 	// 	}
// 	// 	f.x++
// 	// 	return r
// }
//
// // int fts_close(FTS *ftsp);
// func Xfts_close(t *TLS, ftsp uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ftsp=%v, (%v:)", t, ftsp, origin(2))
// 	}
// 	return Xfts64_close(t, ftsp)
// }
//
// // int fts_close(FTS *ftsp);
// func Xfts64_close(t *TLS, ftsp uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ftsp=%v, (%v:)", t, ftsp, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// 	// 	winGetObject(ftsp).(*ftstream).close(t)
// 	// 	removeObject(ftsp)
// 	// 	return 0
// }

// void tzset (void);
func Xtzset(t *TLS) {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	//TODO
}

var strerrorBuf [256]byte

// char *strerror(int errnum);
func Xstrerror(t *TLS, errnum int32) uintptr {
	if __ccgo_strace {
		trc("t=%v errnum=%v, (%v:)", t, errnum, origin(2))
	}
	copy((*RawMem)(unsafe.Pointer(&strerrorBuf[0]))[:len(strerrorBuf):len(strerrorBuf)], fmt.Sprintf("errno %d\x00", errnum))
	return uintptr(unsafe.Pointer(&strerrorBuf[0]))
}

// // void *dlopen(const char *filename, int flags);
// func Xdlopen(t *TLS, filename uintptr, flags int32) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v filename=%v flags=%v, (%v:)", t, filename, flags, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // char *dlerror(void);
// func Xdlerror(t *TLS) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v, (%v:)", t, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int dlclose(void *handle);
// func Xdlclose(t *TLS, handle uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v handle=%v, (%v:)", t, handle, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // void *dlsym(void *handle, const char *symbol);
// func Xdlsym(t *TLS, handle, symbol uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v symbol=%v, (%v:)", t, symbol, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// void perror(const char *s);
func Xperror(t *TLS, s uintptr) {
	if __ccgo_strace {
		trc("t=%v s=%v, (%v:)", t, s, origin(2))
	}
	die(t, "")
	panic(todo(""))
}

// // int pclose(FILE *stream);
// func Xpclose(t *TLS, stream uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// var gai_strerrorBuf [100]byte
//
// // const char *gai_strerror(int errcode);
// func Xgai_strerror(t *TLS, errcode int32) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v errcode=%v, (%v:)", t, errcode, origin(2))
// 	}
// 	copy(gai_strerrorBuf[:], fmt.Sprintf("gai error %d\x00", errcode))
// 	return uintptr(unsafe.Pointer(&gai_strerrorBuf))
// }
//
// // int tcgetattr(int fd, struct termios *termios_p);
// func Xtcgetattr(t *TLS, fd int32, termios_p uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v termios_p=%v, (%v:)", t, fd, termios_p, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int tcsetattr(int fd, int optional_actions, const struct termios *termios_p);
// func Xtcsetattr(t *TLS, fd, optional_actions int32, termios_p uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v optional_actions=%v termios_p=%v, (%v:)", t, optional_actions, termios_p, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // // speed_t cfgetospeed(const struct termios *termios_p);
// // func Xcfgetospeed(t *TLS, termios_p uintptr) termios.Speed_t {
// // 	die(tls, "");panic(todo(""))
// // }
//
// // int cfsetospeed(struct termios *termios_p, speed_t speed);
// func Xcfsetospeed(t *TLS, termios_p uintptr, speed uint32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v termios_p=%v speed=%v, (%v:)", t, termios_p, speed, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int cfsetispeed(struct termios *termios_p, speed_t speed);
// func Xcfsetispeed(t *TLS, termios_p uintptr, speed uint32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v termios_p=%v speed=%v, (%v:)", t, termios_p, speed, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // pid_t fork(void);
// func Xfork(t *TLS) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v, (%v:)", t, origin(2))
// 	}
// 	t.setErrno(errno.ENOSYS)
// 	return -1
// }

// char *setlocale(int category, const char *locale);
func Xsetlocale(t *TLS, category int32, locale uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v category=%v locale=%v, (%v:)", t, category, locale, origin(2))
	}
	return 0 //TODO
}

// // // char *nl_langinfo(nl_item item);
// // func Xnl_langinfo(t *TLS, item langinfo.Nl_item) uintptr {
// // 	die(tls, "");panic(todo(""))
// // }
//
// // FILE *popen(const char *command, const char *type);
// func Xpopen(t *TLS, command, type1 uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v type1=%v, (%v:)", t, type1, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // char *realpath(const char *path, char *resolved_path);
// func Xrealpath(t *TLS, path, resolved_path uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v resolved_path=%v, (%v:)", t, resolved_path, origin(2))
// 	}
// 	s, err := filepath.EvalSymlinks(GoString(path))
// 	if err != nil {
// 		if os.IsNotExist(err) {
// 			if dmesgs {
// 				dmesg("%v: %q: %v", origin(1), GoString(path), err)
// 			}
// 			t.setErrno(errno.ENOENT)
// 			return 0
// 		}
//
// 		die(tls, "");panic(todo("", err))
// 	}
//
// 	if resolved_path == 0 {
// 		die(tls, "");panic(todo(""))
// 	}
//
// 	if len(s) >= limits.PATH_MAX {
// 		s = s[:limits.PATH_MAX-1]
// 	}
//
// 	copy((*RawMem)(unsafe.Pointer(resolved_path))[:len(s):len(s)], s)
// 	(*RawMem)(unsafe.Pointer(resolved_path))[len(s)] = 0
// 	return resolved_path
// }
//
// // // char *inet_ntoa(struct in_addr in);
// // func Xinet_ntoa(t *TLS, in1 in.In_addr) uintptr {
// // 	die(tls, "");panic(todo(""))
// // }
//
// // func X__ccgo_in6addr_anyp(t *TLS) uintptr {
// // 	return uintptr(unsafe.Pointer(&in6_addr_any))
// // }

func Xabort(t *TLS) {
	windows.Exit(3)
}

// int fflush(FILE *stream);
func Xfflush(t *TLS, stream uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
	}
	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}
	err := windows.FlushFileBuffers(f.Handle)
	if err != nil {
		t.setErrno(err)
		return -1
	}
	return 0
}

// size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream);
func Xfread(t *TLS, ptr uintptr, size, nmemb types.Size_t, stream uintptr) types.Size_t {
	if __ccgo_strace {
		trc("t=%v ptr=%v nmemb=%v stream=%v, (%v:)", t, ptr, nmemb, stream, origin(2))
	}
	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return 0
	}

	var sz = size * nmemb
	var obuf = ((*RawMem)(unsafe.Pointer(ptr)))[:sz]
	n, err := windows.Read(f.Handle, obuf)
	if err != nil {
		f.setErr()
		return 0
	}

	if dmesgs {
		// dmesg("%v: %d %#x x %#x: %#x\n%s", origin(1), file(stream).fd(), size, nmemb, types.Size_t(m)/size, hex.Dump(GoBytes(ptr, int(m))))
		dmesg("%v: %d %#x x %#x: %#x\n%s", origin(1), f._fd, size, nmemb, types.Size_t(n)/size)
	}

	return types.Size_t(n) / size

}

// size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);
func Xfwrite(t *TLS, ptr uintptr, size, nmemb types.Size_t, stream uintptr) types.Size_t {
	if __ccgo_strace {
		trc("t=%v ptr=%v nmemb=%v stream=%v, (%v:)", t, ptr, nmemb, stream, origin(2))
	}
	if ptr == 0 || size == 0 {
		return 0
	}

	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return 0
	}

	var sz = size * nmemb
	var obuf = ((*RawMem)(unsafe.Pointer(ptr)))[:sz]
	n, err := windows.Write(f.Handle, obuf)
	if err != nil {
		f.setErr()
		return 0
	}

	if dmesgs {
		// 		// dmesg("%v: %d %#x x %#x: %#x\n%s", origin(1), file(stream).fd(), size, nmemb, types.Size_t(m)/size, hex.Dump(GoBytes(ptr, int(m))))
		dmesg("%v: %d %#x x %#x: %#x\n%s", origin(1), f._fd, size, nmemb, types.Size_t(n)/size)
	}
	return types.Size_t(n) / size
}

// int fclose(FILE *stream);
func Xfclose(t *TLS, stream uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
	}
	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}
	return f.close(t)
}

// int fputc(int c, FILE *stream);
func Xfputc(t *TLS, c int32, stream uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v c=%v stream=%v, (%v:)", t, c, stream, origin(2))
	}
	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}
	if _, err := fwrite(f._fd, []byte{byte(c)}); err != nil {
		return -1
	}
	return int32(byte(c))
}

// int fseek(FILE *stream, long offset, int whence);
func Xfseek(t *TLS, stream uintptr, offset long, whence int32) int32 {
	if __ccgo_strace {
		trc("t=%v stream=%v offset=%v whence=%v, (%v:)", t, stream, offset, whence, origin(2))
	}
	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}
	if n := Xlseek(t, f._fd, types.Off_t(offset), whence); n < 0 {
		if dmesgs {
			dmesg("%v: fd %v, off %#x, whence %v: %v", origin(1), f._fd, offset, whenceStr(whence), n)
		}
		f.setErr()
		return -1
	}

	if dmesgs {
		dmesg("%v: fd %v, off %#x, whence %v: ok", origin(1), f._fd, offset, whenceStr(whence))
	}
	return 0
}

// long ftell(FILE *stream);
func Xftell(t *TLS, stream uintptr) long {
	if __ccgo_strace {
		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
	}
	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}

	n := Xlseek(t, f._fd, 0, windows.FILE_CURRENT)
	if n < 0 {
		f.setErr()
		return -1
	}

	if dmesgs {
		dmesg("%v: fd %v, n %#x: ok %#x", origin(1), f._fd, n, long(n))
	}
	return long(n)
}

// int ferror(FILE *stream);
func Xferror(t *TLS, stream uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
	}
	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}

	return Bool32(f.err())
}

// int getc(FILE *stream);
func Xfgetc(t *TLS, stream uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
	}
	f, ok := winGetObject(stream).(*file)
	if !ok {
		t.setErrno(errno.EBADF)
		return stdio.EOF
	}

	var buf [1]byte
	if n, _ := windows.Read(f.Handle, buf[:]); n != 0 {
		return int32(buf[0])
	}

	return stdio.EOF
}

// // int ungetc(int c, FILE *stream);
// func Xungetc(t *TLS, c int32, stream uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v c=%v stream=%v, (%v:)", t, c, stream, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int fscanf(FILE *stream, const char *format, ...);
// func Xfscanf(t *TLS, stream, format, va uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v va=%v, (%v:)", t, va, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int fputs(const char *s, FILE *stream);
// func Xfputs(t *TLS, s, stream uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
// 	}
// 	f, ok := winGetObject(stream).(*file)
// 	if !ok {
// 		t.setErrno(errno.EBADF)
// 		return -1
// 	}
// 	gS := GoString(s)
// 	if _, err := fwrite(f._fd, []byte(gS)); err != nil {
// 		return -1
// 	}
// 	return 0
// }
//
// // var getservbynameStaticResult netdb.Servent
// //
// // // struct servent *getservbyname(const char *name, const char *proto);
// // func Xgetservbyname(t *TLS, name, proto uintptr) uintptr {
// // 	var protoent *gonetdb.Protoent
// // 	if proto != 0 {
// // 		protoent = gonetdb.GetProtoByName(GoString(proto))
// // 	}
// // 	servent := gonetdb.GetServByName(GoString(name), protoent)
// // 	if servent == nil {
// // 		if dmesgs {
// // 			dmesg("%q %q: nil (protoent %+v)", GoString(name), GoString(proto), protoent)
// // 		}
// // 		return 0
// // 	}
// //
// // 	Xfree(t, (*netdb.Servent)(unsafe.Pointer(&getservbynameStaticResult)).Fs_name)
// // 	if v := (*netdb.Servent)(unsafe.Pointer(&getservbynameStaticResult)).Fs_aliases; v != 0 {
// // 		for {
// // 			p := *(*uintptr)(unsafe.Pointer(v))
// // 			if p == 0 {
// // 				break
// // 			}
// //
// // 			Xfree(t, p)
// // 			v += unsafe.Sizeof(uintptr(0))
// // 		}
// // 		Xfree(t, v)
// // 	}
// // 	Xfree(t, (*netdb.Servent)(unsafe.Pointer(&getservbynameStaticResult)).Fs_proto)
// // 	cname, err := CString(servent.Name)
// // 	if err != nil {
// // 		getservbynameStaticResult = netdb.Servent{}
// // 		return 0
// // 	}
// //
// // 	var protoname uintptr
// // 	if protoent != nil {
// // 		if protoname, err = CString(protoent.Name); err != nil {
// // 			Xfree(t, cname)
// // 			getservbynameStaticResult = netdb.Servent{}
// // 			return 0
// // 		}
// // 	}
// // 	var a []uintptr
// // 	for _, v := range servent.Aliases {
// // 		cs, err := CString(v)
// // 		if err != nil {
// // 			for _, v := range a {
// // 				Xfree(t, v)
// // 			}
// // 			return 0
// // 		}
// //
// // 		a = append(a, cs)
// // 	}
// // 	v := Xcalloc(t, types.Size_t(len(a)+1), types.Size_t(unsafe.Sizeof(uintptr(0))))
// // 	if v == 0 {
// // 		Xfree(t, cname)
// // 		Xfree(t, protoname)
// // 		for _, v := range a {
// // 			Xfree(t, v)
// // 		}
// // 		getservbynameStaticResult = netdb.Servent{}
// // 		return 0
// // 	}
// // 	for _, p := range a {
// // 		*(*uintptr)(unsafe.Pointer(v)) = p
// // 		v += unsafe.Sizeof(uintptr(0))
// // 	}
// //
// // 	getservbynameStaticResult = netdb.Servent{
// // 		Fs_name:    cname,
// // 		Fs_aliases: v,
// // 		Fs_port:    int32(servent.Port),
// // 		Fs_proto:   protoname,
// // 	}
// // 	return uintptr(unsafe.Pointer(&getservbynameStaticResult))
// // }
//
// // func Xreaddir64(t *TLS, dir uintptr) uintptr {
// // 	return Xreaddir(t, dir)
// // }
//
// // func fcntlCmdStr(cmd int32) string {
// // 	switch cmd {
// // 	case fcntl.F_GETOWN:
// // 		return "F_GETOWN"
// // 	case fcntl.F_SETLK:
// // 		return "F_SETLK"
// // 	case fcntl.F_GETLK:
// // 		return "F_GETLK"
// // 	case fcntl.F_SETFD:
// // 		return "F_SETFD"
// // 	case fcntl.F_GETFD:
// // 		return "F_GETFD"
// // 	default:
// // 		return fmt.Sprintf("cmd(%d)", cmd)
// // 	}
// // }

// _CRTIMP extern int *__cdecl _errno(void); // /usr/share/mingw-w64/include/errno.h:17:
func X_errno(t *TLS) uintptr {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	return t.errnop
}

// // int vfscanf(FILE * restrict stream, const char * restrict format, va_list arg);
// func X__ms_vfscanf(t *TLS, stream, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ap=%v, (%v:)", t, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int vsscanf(const char *str, const char *format, va_list ap);
// func X__ms_vsscanf(t *TLS, str, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ap=%v, (%v:)", t, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int vscanf(const char *format, va_list ap);
// func X__ms_vscanf(t *TLS, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ap=%v, (%v:)", t, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// int vsnprintf(char *str, size_t size, const char *format, va_list ap);
func X__ms_vsnprintf(t *TLS, str uintptr, size types.Size_t, format, ap uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v str=%v size=%v ap=%v, (%v:)", t, str, size, ap, origin(2))
	}
	return Xvsnprintf(t, str, size, format, ap)
}

// // int vfwscanf(FILE *stream, const wchar_t *format, va_list argptr;);
// func X__ms_vfwscanf(t *TLS, stream uintptr, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v stream=%v ap=%v, (%v:)", t, stream, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int vwscanf(const wchar_t * restrict format, va_list arg);
// func X__ms_vwscanf(t *TLS, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ap=%v, (%v:)", t, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int _vsnwprintf(wchar_t *buffer, size_t count, const wchar_t *format, va_list argptr);
// func X_vsnwprintf(t *TLS, buffer uintptr, count types.Size_t, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v buffer=%v count=%v ap=%v, (%v:)", t, buffer, count, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int vswscanf(const wchar_t *buffer, const wchar_t *format, va_list arglist);
// func X__ms_vswscanf(t *TLS, stream uintptr, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v stream=%v ap=%v, (%v:)", t, stream, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// __acrt_iob_func
func X__acrt_iob_func(t *TLS, fd uint32) uintptr {
	if __ccgo_strace {
		trc("t=%v fd=%v, (%v:)", t, fd, origin(2))
	}

	f, ok := fdToFile(int32(fd))
	if !ok {
		t.setErrno(EBADF)
		return 0
	}
	return f.t
}

// BOOL SetEvent(
//
//	HANDLE hEvent
//
// );
func XSetEvent(t *TLS, hEvent uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v hEvent=%v, (%v:)", t, hEvent, origin(2))
	}
	r0, _, err := procSetEvent.Call(hEvent)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// int _stricmp(
//
//	const char *string1,
//	const char *string2
//
// );
func X_stricmp(t *TLS, string1, string2 uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v string2=%v, (%v:)", t, string2, origin(2))
	}
	var s1 = strings.ToLower(GoString(string1))
	var s2 = strings.ToLower(GoString(string2))
	return int32(strings.Compare(s1, s2))
}

// BOOL HeapFree(
//
//	HANDLE                 hHeap,
//	DWORD                  dwFlags,
//	_Frees_ptr_opt_ LPVOID lpMem
//
// );
func XHeapFree(t *TLS, hHeap uintptr, dwFlags uint32, lpMem uintptr) (r int32) {
	if __ccgo_strace {
		trc("t=%v hHeap=%v dwFlags=%v lpMem=%v, (%v:)", t, hHeap, dwFlags, lpMem, origin(2))
	}
	r0, _, err := procHeapFree.Call(hHeap, uintptr(dwFlags), lpMem)
	if r = int32(r0); r == 0 {
		t.setErrno(err)
	}
	return r
}

// HANDLE GetProcessHeap();
func XGetProcessHeap(t *TLS) uintptr {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	r0, _, err := procGetProcessHeap.Call()
	if r0 == 0 {
		t.setErrno(err)
	}
	return r0
}

// LPVOID HeapAlloc(
//
//	HANDLE hHeap,
//	DWORD  dwFlags,
//	SIZE_T dwBytes
//
// );
func XHeapAlloc(t *TLS, hHeap uintptr, dwFlags uint32, dwBytes types.Size_t) uintptr {
	if __ccgo_strace {
		trc("t=%v hHeap=%v dwFlags=%v dwBytes=%v, (%v:)", t, hHeap, dwFlags, dwBytes, origin(2))
	}
	r0, _, err := procHeapAlloc.Call(hHeap, uintptr(dwFlags), uintptr(dwBytes))
	if r0 == 0 {
		t.setErrno(err)
	}
	return r0
}

// WCHAR * gai_strerrorW(
//
//	int ecode
//
// );
func Xgai_strerrorW(t *TLS, _ ...interface{}) uintptr {
	die(t, "")
	panic(todo(""))
}

// servent * getservbyname(
//
//	const char *name,
//	const char *proto
//
// );
func Xgetservbyname(t *TLS, _ ...interface{}) uintptr {
	die(t, "")
	panic(todo(""))
}

// INT WSAAPI getaddrinfo(
//
//	PCSTR           pNodeName,
//	PCSTR           pServiceName,
//	const ADDRINFOA *pHints,
//	PADDRINFOA      *ppResult
//
// );
func XWspiapiGetAddrInfo(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// int wcscmp(
//
//	const wchar_t *string1,
//	const wchar_t *string2
//
// );
func Xwcscmp(t *TLS, string1, string2 uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v string2=%v, (%v:)", t, string2, origin(2))
	}
	var s1 = goWideString(string1)
	var s2 = goWideString(string2)
	return int32(strings.Compare(s1, s2))
}

// BOOL IsDebuggerPresent();
func XIsDebuggerPresent(t *TLS) int32 {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	return 0
}

func XExitProcess(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// BOOL GetVersionExW(
//
//	LPOSVERSIONINFOW lpVersionInformation
//
// );
func XGetVersionExW(t *TLS, lpVersionInformation uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpVersionInformation=%v, (%v:)", t, lpVersionInformation, origin(2))
	}
	r0, _, err := procGetVersionExW.Call(lpVersionInformation)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL GetVolumeNameForVolumeMountPointW(
//
//	LPCWSTR lpszVolumeMountPoint,
//	LPWSTR  lpszVolumeName,
//	DWORD   cchBufferLength
//
// );
func XGetVolumeNameForVolumeMountPointW(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// size_t wcslen(
//
//	const wchar_t *str
//
// );
func Xwcslen(t *TLS, str uintptr) types.Size_t {
	if __ccgo_strace {
		trc("t=%v str=%v, (%v:)", t, str, origin(2))
	}
	r0, _, _ := procLstrlenW.Call(str)
	return types.Size_t(r0)
}

// HANDLE WINAPI GetStdHandle(
//
//	_In_ DWORD nStdHandle
//
// );
func XGetStdHandle(t *TLS, nStdHandle uint32) uintptr {
	if __ccgo_strace {
		trc("t=%v nStdHandle=%v, (%v:)", t, nStdHandle, origin(2))
	}
	h, err := windows.GetStdHandle(nStdHandle)
	if err != nil {
		die(t, "")
		panic("no console")
	}
	return uintptr(h)
}

// BOOL CloseHandle(
//
//	HANDLE hObject
//
// );
func XCloseHandle(t *TLS, hObject uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v hObject=%v, (%v:)", t, hObject, origin(2))
	}
	r := windows.CloseHandle(windows.Handle(hObject))
	if r != nil {
		return errno.EINVAL
	}
	return 1
}

// DWORD GetLastError();
func XGetLastError(t *TLS) uint32 {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	var rv = *(*int32)(unsafe.Pointer(t.errnop))
	return uint32(rv)
}

// DWORD SetFilePointer(
//
//	HANDLE hFile,
//	LONG   lDistanceToMove,
//	PLONG  lpDistanceToMoveHigh,
//	DWORD  dwMoveMethod
//
// );
func XSetFilePointer(t *TLS, hFile uintptr, lDistanceToMove long, lpDistanceToMoveHigh uintptr, dwMoveMethod uint32) uint32 {
	if __ccgo_strace {
		trc("t=%v hFile=%v lDistanceToMove=%v lpDistanceToMoveHigh=%v dwMoveMethod=%v, (%v:)", t, hFile, lDistanceToMove, lpDistanceToMoveHigh, dwMoveMethod, origin(2))
	}
	r0, _, e1 := procSetFilePointer.Call(hFile, uintptr(lDistanceToMove), lpDistanceToMoveHigh, uintptr(dwMoveMethod))
	var uOff = uint32(r0)
	if uOff == 0xffffffff {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
	}
	return uint32(r0)
}

// BOOL SetEndOfFile(
//
//	HANDLE hFile
//
// );
func XSetEndOfFile(t *TLS, hFile uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v hFile=%v, (%v:)", t, hFile, origin(2))
	}
	err := windows.SetEndOfFile(windows.Handle(hFile))
	if err != nil {
		t.setErrno(err)
		return 0
	}
	return 1
}

// BOOL ReadFile(
//
//	HANDLE       hFile,
//	LPVOID       lpBuffer,
//	DWORD        nNumberOfBytesToRead,
//	LPDWORD      lpNumberOfBytesRead,
//	LPOVERLAPPED lpOverlapped
//
// );
func XReadFile(t *TLS, hFile, lpBuffer uintptr, nNumberOfBytesToRead uint32, lpNumberOfBytesRead, lpOverlapped uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpBuffer=%v nNumberOfBytesToRead=%v lpOverlapped=%v, (%v:)", t, lpBuffer, nNumberOfBytesToRead, lpOverlapped, origin(2))
	}
	r1, _, e1 := procReadFile.Call(hFile, lpBuffer, uintptr(nNumberOfBytesToRead), uintptr(lpNumberOfBytesRead), uintptr(lpOverlapped))
	if r1 == 0 {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
		return 0
	}
	return int32(r1)
}

// BOOL WriteFile(
//
//	HANDLE       hFile,
//	LPCVOID      lpBuffer,
//	DWORD        nNumberOfBytesToWrite,
//	LPDWORD      lpNumberOfBytesWritten,
//	LPOVERLAPPED lpOverlapped
//
// );
func XWriteFile(t *TLS, hFile, lpBuffer uintptr, nNumberOfBytesToWrite uint32, lpNumberOfBytesWritten, lpOverlapped uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpBuffer=%v nNumberOfBytesToWrite=%v lpOverlapped=%v, (%v:)", t, lpBuffer, nNumberOfBytesToWrite, lpOverlapped, origin(2))
	}
	r1, _, e1 := procWriteFile.Call(hFile, lpBuffer, uintptr(nNumberOfBytesToWrite), lpNumberOfBytesWritten, lpOverlapped)
	if r1 == 0 {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
		return 0
	}
	return int32(r1)
}

// DWORD GetFileAttributesW(
//
//	LPCWSTR lpFileName
//
// );
func XGetFileAttributesW(t *TLS, lpFileName uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v, (%v:)", t, lpFileName, origin(2))
	}
	attrs, err := windows.GetFileAttributes((*uint16)(unsafe.Pointer(lpFileName)))
	if attrs == windows.INVALID_FILE_ATTRIBUTES {
		if err != nil {
			t.setErrno(err)
		} else {
			t.setErrno(errno.EINVAL)
		}
	}
	return attrs
}

// HANDLE CreateFileW(
//
//	LPCWSTR               lpFileName,
//	DWORD                 dwDesiredAccess,
//	DWORD                 dwShareMode,
//	LPSECURITY_ATTRIBUTES lpSecurityAttributes,
//	DWORD                 dwCreationDisposition,
//	DWORD                 dwFlagsAndAttributes,
//	HANDLE                hTemplateFile
//
// );
func XCreateFileW(t *TLS, lpFileName uintptr, dwDesiredAccess, dwShareMode uint32, lpSecurityAttributes uintptr, dwCreationDisposition, dwFlagsAndAttributes uint32, hTemplateFile uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v dwShareMode=%v lpSecurityAttributes=%v dwFlagsAndAttributes=%v hTemplateFile=%v, (%v:)", t, lpFileName, dwShareMode, lpSecurityAttributes, dwFlagsAndAttributes, hTemplateFile, origin(2))
	}

	r0, _, e1 := procCreateFileW.Call(lpFileName, uintptr(dwDesiredAccess), uintptr(dwShareMode), lpSecurityAttributes,
		uintptr(dwCreationDisposition), uintptr(dwFlagsAndAttributes), hTemplateFile, 0, 0)
	h := windows.Handle(r0)
	if h == windows.InvalidHandle {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
		return r0
	}
	return uintptr(h)
}

// BOOL DuplicateHandle(
//
//	HANDLE   hSourceProcessHandle,
//	HANDLE   hSourceHandle,
//	HANDLE   hTargetProcessHandle,
//	LPHANDLE lpTargetHandle,
//	DWORD    dwDesiredAccess,
//	BOOL     bInheritHandle,
//	DWORD    dwOptions
//
// );
func XDuplicateHandle(t *TLS, hSourceProcessHandle, hSourceHandle, hTargetProcessHandle, lpTargetHandle uintptr, dwDesiredAccess uint32, bInheritHandle int32, dwOptions uint32) int32 {
	if __ccgo_strace {
		trc("t=%v lpTargetHandle=%v dwDesiredAccess=%v bInheritHandle=%v dwOptions=%v, (%v:)", t, lpTargetHandle, dwDesiredAccess, bInheritHandle, dwOptions, origin(2))
	}
	r0, _, err := procDuplicateHandle.Call(hSourceProcessHandle, hSourceHandle, hTargetProcessHandle,
		lpTargetHandle, uintptr(dwDesiredAccess), uintptr(bInheritHandle), uintptr(dwOptions), 0, 0)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// HANDLE GetCurrentProcess();
func XGetCurrentProcess(t *TLS) uintptr {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	r0, _, e1 := procGetCurrentProcess.Call()
	if r0 == 0 {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
	}
	return r0
}

// BOOL FlushFileBuffers(
//
//	HANDLE hFile
//
// );
func XFlushFileBuffers(t *TLS, hFile uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v hFile=%v, (%v:)", t, hFile, origin(2))
	}
	err := windows.FlushFileBuffers(windows.Handle(hFile))
	if err != nil {
		t.setErrno(err)
		return -1
	}
	return 1

}

// DWORD GetFileType(
//
//	HANDLE hFile
//
// );
func XGetFileType(t *TLS, hFile uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v hFile=%v, (%v:)", t, hFile, origin(2))
	}
	n, err := windows.GetFileType(windows.Handle(hFile))
	if err != nil {
		t.setErrno(err)
	}
	return n
}

// BOOL WINAPI GetConsoleMode(
//
//	_In_  HANDLE  hConsoleHandle,
//	_Out_ LPDWORD lpMode
//
// );
func XGetConsoleMode(t *TLS, hConsoleHandle, lpMode uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpMode=%v, (%v:)", t, lpMode, origin(2))
	}
	err := windows.GetConsoleMode(windows.Handle(hConsoleHandle), (*uint32)(unsafe.Pointer(lpMode)))
	if err != nil {
		t.setErrno(err)
		return 0
	}
	return 1
}

// BOOL GetCommState(
//
//	HANDLE hFile,
//	LPDCB  lpDCB
//
// );
func XGetCommState(t *TLS, hFile, lpDCB uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpDCB=%v, (%v:)", t, lpDCB, origin(2))
	}
	r1, _, err := procGetCommState.Call(hFile, lpDCB)
	if r1 == 0 {
		t.setErrno(err)
		return 0
	}
	return int32(r1)
}

// int _wcsnicmp(
//
//	const wchar_t *string1,
//	const wchar_t *string2,
//	size_t count
//
// );
func X_wcsnicmp(t *TLS, string1, string2 uintptr, count types.Size_t) int32 {
	if __ccgo_strace {
		trc("t=%v string2=%v count=%v, (%v:)", t, string2, count, origin(2))
	}

	var s1 = strings.ToLower(goWideString(string1))
	var l1 = len(s1)
	var s2 = strings.ToLower(goWideString(string2))
	var l2 = len(s2)

	// shorter is lesser
	if l1 < l2 {
		return -1
	}
	if l2 > l1 {
		return 1
	}

	// compare at most count
	var cmpLen = count
	if types.Size_t(l1) < cmpLen {
		cmpLen = types.Size_t(l1)
	}
	return int32(strings.Compare(s1[:cmpLen], s2[:cmpLen]))
}

// BOOL WINAPI ReadConsole(
//
//	_In_     HANDLE  hConsoleInput,
//	_Out_    LPVOID  lpBuffer,
//	_In_     DWORD   nNumberOfCharsToRead,
//	_Out_    LPDWORD lpNumberOfCharsRead,
//	_In_opt_ LPVOID  pInputControl
//
// );
func XReadConsoleW(t *TLS, hConsoleInput, lpBuffer uintptr, nNumberOfCharsToRead uint32, lpNumberOfCharsRead, pInputControl uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpBuffer=%v nNumberOfCharsToRead=%v pInputControl=%v, (%v:)", t, lpBuffer, nNumberOfCharsToRead, pInputControl, origin(2))
	}

	rv, _, err := procReadConsoleW.Call(hConsoleInput,
		lpBuffer, uintptr(nNumberOfCharsToRead), lpNumberOfCharsRead, pInputControl, 0)
	if rv == 0 {
		t.setErrno(err)
	}
	return int32(rv)
}

// BOOL WINAPI WriteConsoleW(
//
//	_In_             HANDLE  hConsoleOutput,
//	_In_       const VOID    *lpBuffer,
//	_In_             DWORD   nNumberOfCharsToWrite,
//	_Out_opt_        LPDWORD lpNumberOfCharsWritten,
//	_Reserved_       LPVOID  lpReserved
//
// );
func XWriteConsoleW(t *TLS, hConsoleOutput, lpBuffer uintptr, nNumberOfCharsToWrite uint32, lpNumberOfCharsWritten, lpReserved uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpBuffer=%v nNumberOfCharsToWrite=%v lpReserved=%v, (%v:)", t, lpBuffer, nNumberOfCharsToWrite, lpReserved, origin(2))
	}
	rv, _, err := procWriteConsoleW.Call(hConsoleOutput,
		lpBuffer, uintptr(nNumberOfCharsToWrite), lpNumberOfCharsWritten, lpReserved, 0)
	if rv == windows.WAIT_FAILED {
		t.setErrno(err)
	}
	return int32(rv)
}

// DWORD WaitForSingleObject(
//
//	HANDLE hHandle,
//	DWORD  dwMilliseconds
//
// );
func XWaitForSingleObject(t *TLS, hHandle uintptr, dwMilliseconds uint32) uint32 {
	if __ccgo_strace {
		trc("t=%v hHandle=%v dwMilliseconds=%v, (%v:)", t, hHandle, dwMilliseconds, origin(2))
	}
	rv, err := windows.WaitForSingleObject(windows.Handle(hHandle), dwMilliseconds)
	if err != nil {
		t.setErrno(err)
	}
	return rv
}

// BOOL ResetEvent(
//
//	HANDLE hEvent
//
// );
func XResetEvent(t *TLS, hEvent uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v hEvent=%v, (%v:)", t, hEvent, origin(2))
	}
	rv, _, err := procResetEvent.Call(hEvent)
	if rv == 0 {
		t.setErrno(err)
	}
	return int32(rv)
}

// BOOL WINAPI PeekConsoleInput(
//
//	_In_  HANDLE        hConsoleInput,
//	_Out_ PINPUT_RECORD lpBuffer,
//	_In_  DWORD         nLength,
//	_Out_ LPDWORD       lpNumberOfEventsRead
//
// );
func XPeekConsoleInputW(t *TLS, hConsoleInput, lpBuffer uintptr, nLength uint32, lpNumberOfEventsRead uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpBuffer=%v nLength=%v lpNumberOfEventsRead=%v, (%v:)", t, lpBuffer, nLength, lpNumberOfEventsRead, origin(2))
	}
	r0, _, err := procPeekConsoleInputW.Call(hConsoleInput, lpBuffer, uintptr(nLength), lpNumberOfEventsRead)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// int WINAPIV wsprintfA(
//
//	LPSTR  ,
//	LPCSTR ,
//	...
//
// );
func XwsprintfA(t *TLS, buf, format, args uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v args=%v, (%v:)", t, args, origin(2))
	}
	return Xsprintf(t, buf, format, args)
}

// UINT WINAPI GetConsoleCP(void);
func XGetConsoleCP(t *TLS) uint32 {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	r0, _, err := procGetConsoleCP.Call()
	if r0 == 0 {
		t.setErrno(err)
	}
	return uint32(r0)
}

// // UINT WINAPI SetConsoleCP(UNIT);
// //func setConsoleCP(cp uint32) uint32 {
// //
// //	r0, _, _ := procSetConsoleCP.Call(uintptr(cp))
// //	if r0 == 0 {
// //		die(tls, "");panic("setcp failed")
// //	}
// //	return uint32(r0)
// //}
//
// HANDLE CreateEventW(
//
//	LPSECURITY_ATTRIBUTES lpEventAttributes,
//	BOOL                  bManualReset,
//	BOOL                  bInitialState,
//	LPCWSTR               lpName
//
// );
func XCreateEventW(t *TLS, lpEventAttributes uintptr, bManualReset, bInitialState int32, lpName uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v lpEventAttributes=%v bInitialState=%v lpName=%v, (%v:)", t, lpEventAttributes, bInitialState, lpName, origin(2))
	}
	r0, _, err := procCreateEventW.Call(lpEventAttributes, uintptr(bManualReset),
		uintptr(bInitialState), lpName, 0, 0)
	if r0 == 0 {
		t.setErrno(err)
	}
	return r0
}

type ThreadAdapter struct {
	token      uintptr
	tls        *TLS
	param      uintptr
	threadFunc func(*TLS, uintptr) uint32
}

func (ta *ThreadAdapter) run() uintptr {
	runtime.LockOSThread()
	Dbg(ta.tls, "THREAD start")
	r := ta.threadFunc(ta.tls, ta.param)
	Dbg(ta.tls, "THREAD returned")
	ta.tls.Close()
	removeObject(ta.token)
	return uintptr(r)
}

func ThreadProc(p uintptr) uintptr {
	adp, ok := winGetObject(p).(*ThreadAdapter)
	if !ok {
		die(nil, "")
		panic("invalid thread")
	}
	return adp.run()
}

// HANDLE CreateThread(
//
//	LPSECURITY_ATTRIBUTES   lpThreadAttributes,
//	SIZE_T                  dwStackSize,
//	LPTHREAD_START_ROUTINE  lpStartAddress,
//	__drv_aliasesMem LPVOID lpParameter,
//	DWORD                   dwCreationFlags,
//	LPDWORD                 lpThreadId
//
// );
func XCreateThread(t *TLS, lpThreadAttributes uintptr, dwStackSize types.Size_t, lpStartAddress, lpParameter uintptr, dwCreationFlags uint32, lpThreadId uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v lpThreadAttributes=%v dwStackSize=%v lpParameter=%v dwCreationFlags=%v lpThreadId=%v, (%v:)", t, lpThreadAttributes, dwStackSize, lpParameter, dwCreationFlags, lpThreadId, origin(2))
	}
	f := (*struct{ f func(*TLS, uintptr) uint32 })(unsafe.Pointer(&struct{ uintptr }{lpStartAddress})).f
	var tAdp = ThreadAdapter{threadFunc: f, tls: NewTLS(), param: lpParameter}
	Dbg(t, "THREAD create new tls=%v", tAdp.tls.id())
	tAdp.token = addObject(&tAdp)

	r0, _, err := procCreateThread.Call(lpThreadAttributes, uintptr(dwStackSize), threadCallback, tAdp.token, uintptr(dwCreationFlags), lpThreadId)
	if r0 == 0 {
		t.setErrno(err)
	}
	return r0
}

// BOOL SetThreadPriority(
//
//	HANDLE hThread,
//	int    nPriority
//
// );
func XSetThreadPriority(t *TLS, hThread uintptr, nPriority int32) int32 {
	if __ccgo_strace {
		trc("t=%v hThread=%v nPriority=%v, (%v:)", t, hThread, nPriority, origin(2))
	}
	return 1
}

// BOOL WINAPI SetConsoleMode(
//
//	_In_ HANDLE hConsoleHandle,
//	_In_ DWORD  dwMode
//
// );
func XSetConsoleMode(t *TLS, hConsoleHandle uintptr, dwMode uint32) int32 {
	if __ccgo_strace {
		trc("t=%v hConsoleHandle=%v dwMode=%v, (%v:)", t, hConsoleHandle, dwMode, origin(2))
	}
	rv, _, err := procSetConsoleMode.Call(hConsoleHandle, uintptr(dwMode))
	if rv == 0 {
		t.setErrno(err)
	}
	return int32(rv)
}

func XPurgeComm(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func XClearCommError(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// void DeleteCriticalSection(
//
//	LPCRITICAL_SECTION lpCriticalSection
//
// );
func XDeleteCriticalSection(t *TLS, lpCriticalSection uintptr) {
	if __ccgo_strace {
		trc("t=%v lpCriticalSection=%v, (%v:)", t, lpCriticalSection, origin(2))
	}
	procDeleteCriticalSection.Call(lpCriticalSection)
}

// void EnterCriticalSection(
//
//	LPCRITICAL_SECTION lpCriticalSection
//
// );
func XEnterCriticalSection(t *TLS, lpCriticalSection uintptr) {
	if __ccgo_strace {
		trc("t=%v lpCriticalSection=%v, (%v:)", t, lpCriticalSection, origin(2))
	}
	procEnterCriticalSection.Call(lpCriticalSection)
}

// // BOOL TryEnterCriticalSection(
// //
// //	LPCRITICAL_SECTION lpCriticalSection
// //
// // );
// func XTryEnterCriticalSection(t *TLS, lpCriticalSection uintptr) (r int32) {
// 	if __ccgo_strace {
// 		trc("t=%v lpCriticalSection=%v, (%v:)", t, lpCriticalSection, origin(2))
// 	}
// 	r0, _, err := procTryEnterCriticalSection.Call(lpCriticalSection)
// 	if err != windows.ERROR_SUCCESS {
// 		t.setErrno(err)
// 	}
// 	return int32(r0)
// }

// void LeaveCriticalSection(
//
//	LPCRITICAL_SECTION lpCriticalSection
//
// );
func XLeaveCriticalSection(t *TLS, lpCriticalSection uintptr) {
	if __ccgo_strace {
		trc("t=%v lpCriticalSection=%v, (%v:)", t, lpCriticalSection, origin(2))
	}
	procLeaveCriticalSection.Call(lpCriticalSection)
}

func XGetOverlappedResult(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func XSetupComm(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func XSetCommTimeouts(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// void InitializeCriticalSection(
//
//	LPCRITICAL_SECTION lpCriticalSection
//
// );
func XInitializeCriticalSection(t *TLS, lpCriticalSection uintptr) {
	if __ccgo_strace {
		trc("t=%v lpCriticalSection=%v, (%v:)", t, lpCriticalSection, origin(2))
	}
	// InitializeCriticalSection always succeeds, even in low memory situations.
	procInitializeCriticalSection.Call(lpCriticalSection)
}

func XBuildCommDCBW(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func XSetCommState(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func XEscapeCommFunction(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func XGetCommModemStatus(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// BOOL MoveFileW(
//
//	LPCWSTR lpExistingFileName,
//	LPCWSTR lpNewFileName
//
// );
func XMoveFileW(t *TLS, lpExistingFileName, lpNewFileName uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpNewFileName=%v, (%v:)", t, lpNewFileName, origin(2))
	}
	r0, _, err := procMoveFileW.Call(lpExistingFileName, lpNewFileName)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// DWORD GetFullPathNameW(
//
//	LPCWSTR lpFileName,
//	DWORD   nBufferLength,
//	LPWSTR  lpBuffer,
//	LPWSTR  *lpFilePart
//
// );
func XGetFullPathNameW(t *TLS, lpFileName uintptr, nBufferLength uint32, lpBuffer, lpFilePart uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v nBufferLength=%v lpFilePart=%v, (%v:)", t, lpFileName, nBufferLength, lpFilePart, origin(2))
	}
	r0, _, e1 := procGetFullPathNameW.Call(lpFileName, uintptr(nBufferLength), uintptr(lpBuffer), uintptr(lpFilePart))
	n := uint32(r0)
	if n == 0 {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
	}
	return n
}

// __attribute__((dllimport)) LPWSTR CharLowerW(LPWSTR lpsz);
func XCharLowerW(tls *TLS, _lpsz uintptr) (r uintptr) {
	if __ccgo_strace {
		trc("lpsz=%+v", _lpsz)
		defer func() { trc(`XCharLowerW->%+v`, r) }()
	}
	r0, _, _ := procCharLowerW.Call(_lpsz)
	return r0
}

// BOOL CreateDirectoryW(
//
//	LPCWSTR                lpPathName,
//	LPSECURITY_ATTRIBUTES lpSecurityAttributes
//
// );
func XCreateDirectoryW(t *TLS, lpPathName, lpSecurityAttributes uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpSecurityAttributes=%v, (%v:)", t, lpSecurityAttributes, origin(2))
	}
	err := windows.CreateDirectory((*uint16)(unsafe.Pointer(lpPathName)),
		(*windows.SecurityAttributes)(unsafe.Pointer(lpSecurityAttributes)))
	if err != nil {
		t.setErrno(err)
		return 0
	}
	return 1
}

// BOOL SetFileAttributesW(
//
//	LPCWSTR lpFileName,
//	DWORD   dwFileAttributes
//
// );
func XSetFileAttributesW(t *TLS, lpFileName uintptr, dwFileAttributes uint32) int32 {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v dwFileAttributes=%v, (%v:)", t, lpFileName, dwFileAttributes, origin(2))
	}
	err := windows.SetFileAttributes((*uint16)(unsafe.Pointer(lpFileName)), dwFileAttributes)
	if err != nil {
		t.setErrno(err)
		return 0
	}
	return 1
}

// UINT GetTempFileNameW(
//
//	LPCWSTR lpPathName,
//	LPCWSTR lpPrefixString,
//	UINT    uUnique,
//	LPWSTR  lpTempFileName
//
// );
func XGetTempFileNameW(t *TLS, lpPathName, lpPrefixString uintptr, uUnique uint32, lpTempFileName uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v lpPrefixString=%v uUnique=%v lpTempFileName=%v, (%v:)", t, lpPrefixString, uUnique, lpTempFileName, origin(2))
	}
	r0, _, e1 := procGetTempFileNameW.Call(lpPathName, lpPrefixString, uintptr(uUnique), lpTempFileName)
	if r0 == 0 {
		t.setErrno(e1)
	}
	return uint32(r0)
}

// BOOL CopyFileW(
//
//	LPCWSTR lpExistingFileName,
//	LPCWSTR lpNewFileName,
//	BOOL    bFailIfExists
//
// );
func XCopyFileW(t *TLS, lpExistingFileName, lpNewFileName uintptr, bFailIfExists int32) int32 {
	if __ccgo_strace {
		trc("t=%v lpNewFileName=%v bFailIfExists=%v, (%v:)", t, lpNewFileName, bFailIfExists, origin(2))
	}
	r0, _, e1 := procCopyFileW.Call(lpExistingFileName, lpNewFileName, uintptr(bFailIfExists))
	if r0 == 0 {
		t.setErrno(e1)
	}
	return int32(r0)
}

// BOOL DeleteFileW(
//
//	LPCWSTR lpFileName
//
// );
func XDeleteFileW(t *TLS, lpFileName uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v, (%v:)", t, lpFileName, origin(2))
	}
	err := windows.DeleteFile((*uint16)(unsafe.Pointer(lpFileName)))
	if err != nil {
		t.setErrno(err)
		return 0
	}
	return 1
}

// BOOL RemoveDirectoryW(
//
//	LPCWSTR lpPathName
//
// );
func XRemoveDirectoryW(t *TLS, lpPathName uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpPathName=%v, (%v:)", t, lpPathName, origin(2))
	}
	err := windows.RemoveDirectory((*uint16)(unsafe.Pointer(lpPathName)))
	if err != nil {
		t.setErrno(err)
		return 0
	}
	return 1
}

// HANDLE FindFirstFileW(LPCWSTR lpFileName, LPWIN32_FIND_DATAW lpFindFileData);
func XFindFirstFileW(t *TLS, lpFileName, lpFindFileData uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v lpFindFileData=%v, (%v:)", t, lpFindFileData, origin(2))
	}
	r0, _, e1 := procFindFirstFileW.Call(lpFileName, lpFindFileData)
	handle := windows.Handle(r0)
	if handle == windows.InvalidHandle {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
	}
	return r0
}

// HANDLE FindFirstFileExW(
//
//	LPCWSTR            lpFileName,
//	FINDEX_INFO_LEVELS fInfoLevelId,
//	LPVOID             lpFindFileData,
//	FINDEX_SEARCH_OPS  fSearchOp,
//	LPVOID             lpSearchFilter,
//	DWORD              dwAdditionalFlags
//
// );
func XFindFirstFileExW(t *TLS, lpFileName uintptr, fInfoLevelId int32, lpFindFileData uintptr, fSearchOp int32, lpSearchFilter uintptr, dwAdditionalFlags uint32) uintptr {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v fInfoLevelId=%v lpFindFileData=%v fSearchOp=%v lpSearchFilter=%v dwAdditionalFlags=%v, (%v:)", t, lpFileName, fInfoLevelId, lpFindFileData, fSearchOp, lpSearchFilter, dwAdditionalFlags, origin(2))
	}
	r0, _, e1 := procFindFirstFileExW.Call(lpFileName, uintptr(fInfoLevelId), lpFindFileData, uintptr(fSearchOp), lpSearchFilter, uintptr(dwAdditionalFlags))
	handle := windows.Handle(r0)
	if handle == windows.InvalidHandle {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
	}
	return r0
}

// BOOL FindClose(HANDLE hFindFile);
func XFindClose(t *TLS, hFindFile uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v hFindFile=%v, (%v:)", t, hFindFile, origin(2))
	}
	r0, _, e1 := procFindClose.Call(hFindFile)
	if r0 == 0 {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
	}
	return int32(r0)
}

// BOOL FindNextFileW(
//
//	HANDLE             hFindFile,
//	LPWIN32_FIND_DATAW lpFindFileData
//
// );
func XFindNextFileW(t *TLS, hFindFile, lpFindFileData uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpFindFileData=%v, (%v:)", t, lpFindFileData, origin(2))
	}
	r0, _, e1 := procFindNextFileW.Call(hFindFile, lpFindFileData)
	if r0 == 0 {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
	}
	return int32(r0)
}

// DWORD GetLogicalDriveStringsA(
//
//	DWORD nBufferLength,
//	LPSTR lpBuffer
//
// );
func XGetLogicalDriveStringsA(t *TLS, nBufferLength uint32, lpBuffer uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v nBufferLength=%v lpBuffer=%v, (%v:)", t, nBufferLength, lpBuffer, origin(2))
	}
	r0, _, err := procGetLogicalDriveStringsA.Call(uintptr(nBufferLength), lpBuffer)
	if r0 == 0 {
		t.setErrno(err)
	}
	return uint32(r0)
}

// BOOL GetVolumeInformationA(
//
//	LPCSTR  lpRootPathName,
//	LPSTR   lpVolumeNameBuffer,
//	DWORD   nVolumeNameSize,
//	LPDWORD lpVolumeSerialNumber,
//	LPDWORD lpMaximumComponentLength,
//	LPDWORD lpFileSystemFlags,
//	LPSTR   lpFileSystemNameBuffer,
//	DWORD   nFileSystemNameSize
//
// );
func XGetVolumeInformationA(t *TLS, lpRootPathName, lpVolumeNameBuffer uintptr, nVolumeNameSize uint32, lpVolumeSerialNumber, lpMaximumComponentLength, lpFileSystemFlags, lpFileSystemNameBuffer uintptr, nFileSystemNameSize uint32) int32 {
	if __ccgo_strace {
		trc("t=%v lpVolumeNameBuffer=%v nVolumeNameSize=%v lpFileSystemNameBuffer=%v nFileSystemNameSize=%v, (%v:)", t, lpVolumeNameBuffer, nVolumeNameSize, lpFileSystemNameBuffer, nFileSystemNameSize, origin(2))
	}
	r0, _, err := procGetVolumeInformationA.Call(lpRootPathName,
		lpVolumeNameBuffer,
		uintptr(nVolumeNameSize),
		lpVolumeSerialNumber,
		lpMaximumComponentLength,
		lpFileSystemFlags,
		lpFileSystemNameBuffer,
		uintptr(nFileSystemNameSize),
		0,
	)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL CreateHardLinkW(
//
//	LPCWSTR               lpFileName,
//	LPCWSTR               lpExistingFileName,
//	LPSECURITY_ATTRIBUTES lpSecurityAttributes
//
// );
func XCreateHardLinkW(t *TLS, lpFileName, lpExistingFileName, lpSecurityAttributes uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpSecurityAttributes=%v, (%v:)", t, lpSecurityAttributes, origin(2))
	}
	r0, _, err := procCreateHardLinkW.Call(lpFileName, lpExistingFileName, lpSecurityAttributes)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL DeviceIoControl(
//
//	HANDLE       hDevice,
//	DWORD        dwIoControlCode,
//	LPVOID       lpInBuffer,
//	DWORD        nInBufferSize,
//	LPVOID       lpOutBuffer,
//	DWORD        nOutBufferSize,
//	LPDWORD      lpBytesReturned,
//	LPOVERLAPPED lpOverlapped
//
// );
func XDeviceIoControl(t *TLS, hDevice uintptr, dwIoControlCode uint32, lpInBuffer uintptr, nInBufferSize uint32, lpOutBuffer uintptr, nOutBufferSize uint32, lpBytesReturned, lpOverlapped uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v hDevice=%v dwIoControlCode=%v lpInBuffer=%v nInBufferSize=%v lpOutBuffer=%v nOutBufferSize=%v lpOverlapped=%v, (%v:)", t, hDevice, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpOverlapped, origin(2))
	}
	r0, _, err := procDeviceIoControl.Call(hDevice, uintptr(dwIoControlCode), lpInBuffer,
		uintptr(nInBufferSize), lpOutBuffer, uintptr(nOutBufferSize), lpBytesReturned, lpOverlapped, 0)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// int wcsncmp(
//
//	const wchar_t *string1,
//	const wchar_t *string2,
//	size_t count
//
// );
func Xwcsncmp(t *TLS, string1, string2 uintptr, count types.Size_t) int32 {
	if __ccgo_strace {
		trc("t=%v string2=%v count=%v, (%v:)", t, string2, count, origin(2))
	}
	var s1 = goWideString(string1)
	var l1 = len(s1)
	var s2 = goWideString(string2)
	var l2 = len(s2)

	// shorter is lesser
	if l1 < l2 {
		return -1
	}
	if l2 > l1 {
		return 1
	}

	// compare at most count
	var cmpLen = count
	if types.Size_t(l1) < cmpLen {
		cmpLen = types.Size_t(l1)
	}
	return int32(strings.Compare(s1[:cmpLen], s2[:cmpLen]))
}

// int MultiByteToWideChar(
//
//	UINT                              CodePage,
//	DWORD                             dwFlags,
//	_In_NLS_string_(cbMultiByte)LPCCH lpMultiByteStr,
//	int                               cbMultiByte,
//	LPWSTR                            lpWideCharStr,
//	int                               cchWideChar
//
// );
func XMultiByteToWideChar(t *TLS, CodePage uint32, dwFlags uint32, lpMultiByteStr uintptr, cbMultiByte int32, lpWideCharStr uintptr, cchWideChar int32) int32 {
	if __ccgo_strace {
		trc("t=%v CodePage=%v dwFlags=%v lpMultiByteStr=%v cbMultiByte=%v lpWideCharStr=%v cchWideChar=%v, (%v:)", t, CodePage, dwFlags, lpMultiByteStr, cbMultiByte, lpWideCharStr, cchWideChar, origin(2))
	}
	r1, _, _ := procMultiByteToWideChar.Call(uintptr(CodePage), uintptr(dwFlags), uintptr(lpMultiByteStr),
		uintptr(cbMultiByte), uintptr(lpWideCharStr), uintptr(cchWideChar))
	return (int32(r1))
}

// void OutputDebugStringW(
//
//	LPCWSTR lpOutputString
//
// );
func XOutputDebugStringW(t *TLS, lpOutputString uintptr) {
	if __ccgo_strace {
		trc("t=%v lpOutputString=%v, (%v:)", t, lpOutputString, origin(2))
	}
	die(t, "")
	panic(todo(""))
}

var procMessageBeep = moduser32.NewProc("MessageBeep")

// __attribute__((dllimport)) WINBOOL MessageBeep(UINT uType);
func XMessageBeep(tls *TLS, _uType TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("uType=%+v", _uType)
		defer func() { trc(`XMessageBeep->%+v`, r) }()
	}
	r0, _, err := procMessageBeep.Call(uintptr(_uType))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

//====

// long _InterlockedCompareExchange(
//
//	long volatile * Destination,
//	long Exchange,
//	long Comparand
//
// );
func X_InterlockedCompareExchange(t *TLS, Destination uintptr, Exchange, Comparand long) long {
	if __ccgo_strace {
		trc("t=%v Destination=%v Comparand=%v, (%v:)", t, Destination, Comparand, origin(2))
	}

	// The function returns the initial value of the Destination parameter.
	var v = *(*int32)(unsafe.Pointer(Destination))
	_ = atomic.CompareAndSwapInt32((*int32)(unsafe.Pointer(Destination)), Comparand, Exchange)
	return long(v)
}

// // int rename(const char *oldpath, const char *newpath);
// func Xrename(t *TLS, oldpath, newpath uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v newpath=%v, (%v:)", t, newpath, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // BOOL AreFileApisANSI();
// func XAreFileApisANSI(t *TLS) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v, (%v:)", t, origin(2))
// 	}
//
// 	r0, _, _ := procAreFileApisANSI.Call()
// 	return int32(r0)
// }
//
// // HANDLE CreateFileA(
// //
// //	LPCSTR                lpFileName,
// //	DWORD                 dwDesiredAccess,
// //	DWORD                 dwShareMode,
// //	LPSECURITY_ATTRIBUTES lpSecurityAttributes,
// //	DWORD                 dwCreationDisposition,
// //	DWORD                 dwFlagsAndAttributes,
// //	HANDLE                hTemplateFile
// //
// // );
// func XCreateFileA(t *TLS, lpFileName uintptr, dwDesiredAccess, dwShareMode uint32,
// 	lpSecurityAttributes uintptr, dwCreationDisposition, dwFlagsAndAttributes uint32, hTemplateFile uintptr) uintptr {
//
// 	r0, _, e1 := procCreateFileA.Call(lpFileName, uintptr(dwDesiredAccess), uintptr(dwShareMode), lpSecurityAttributes,
// 		uintptr(dwCreationDisposition), uintptr(dwFlagsAndAttributes), hTemplateFile, 0, 0)
// 	h := windows.Handle(r0)
// 	if h == windows.InvalidHandle {
// 		if e1 != windows.ERROR_SUCCESS {
// 			t.setErrno(e1)
// 		} else {
// 			t.setErrno(errno.EINVAL)
// 		}
// 		return r0
// 	}
// 	return uintptr(h)
//
// }
//
// // HANDLE CreateFileMappingA(
// //
// //	HANDLE                hFile,
// //	LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
// //	DWORD                 flProtect,
// //	DWORD                 dwMaximumSizeHigh,
// //	DWORD                 dwMaximumSizeLow,
// //	LPCSTR                lpName
// //
// // );
// func XCreateFileMappingA(t *TLS, hFile, lpFileMappingAttributes uintptr, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow uint32, lpName uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v lpFileMappingAttributes=%v dwMaximumSizeLow=%v lpName=%v, (%v:)", t, lpFileMappingAttributes, dwMaximumSizeLow, lpName, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // HANDLE CreateMutexW(
// //
// //	LPSECURITY_ATTRIBUTES lpMutexAttributes,
// //	BOOL                  bInitialOwner,
// //	LPCWSTR               lpName
// //
// // );
// func XCreateMutexW(t *TLS, lpMutexAttributes uintptr, bInitialOwner int32, lpName uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v lpMutexAttributes=%v bInitialOwner=%v lpName=%v, (%v:)", t, lpMutexAttributes, bInitialOwner, lpName, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // BOOL DeleteFileA(
// //
// //	LPCSTR lpFileName
// //
// // );
// func XDeleteFileA(t *TLS, lpFileName uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v lpFileName=%v, (%v:)", t, lpFileName, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// DWORD FormatMessageW(
//
//	DWORD   dwFlags,
//	LPCVOID lpSource,
//	DWORD   dwMessageId,
//	DWORD   dwLanguageId,
//	LPWSTR  lpBuffer,
//	DWORD   nSize,
//	va_list *Arguments
//
// );
func XFormatMessageW(t *TLS, dwFlags uint32, lpSource uintptr, dwMessageId, dwLanguageId uint32, lpBuffer uintptr, nSize uint32, Arguments uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v dwFlags=%v lpSource=%v dwLanguageId=%v lpBuffer=%v nSize=%v Arguments=%v, (%v:)", t, dwFlags, lpSource, dwLanguageId, lpBuffer, nSize, Arguments, origin(2))
	}
	r0, _, e1 := procFormatMessageW.Call(uintptr(dwFlags), lpSource, uintptr(dwMessageId), uintptr(dwLanguageId),
		lpBuffer, uintptr(nSize), Arguments, 0, 0)
	n := uint32(r0)
	if n == 0 {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
	}
	return n
}

// BOOL FreeLibrary(HMODULE hLibModule);
func XFreeLibrary(t *TLS, hLibModule uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v hLibModule=%v, (%v:)", t, hLibModule, origin(2))
	}
	die(t, "")
	panic(todo(""))
}

// DWORD GetCurrentProcessId();
func XGetCurrentProcessId(t *TLS) uint32 {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	r0, _, _ := procGetCurrentProcessId.Call()
	return uint32(r0)
}

// // BOOL GetDiskFreeSpaceA(
// //
// //	LPCSTR  lpRootPathName,
// //	LPDWORD lpSectorsPerCluster,
// //	LPDWORD lpBytesPerSector,
// //	LPDWORD lpNumberOfFreeClusters,
// //	LPDWORD lpTotalNumberOfClusters
// //
// // );
// func XGetDiskFreeSpaceA(t *TLS, lpRootPathName, lpSectorsPerCluster, lpBytesPerSector, lpNumberOfFreeClusters, lpTotalNumberOfClusters uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v lpTotalNumberOfClusters=%v, (%v:)", t, lpTotalNumberOfClusters, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // BOOL GetDiskFreeSpaceW(
// //
// //	LPCWSTR lpRootPathName,
// //	LPDWORD lpSectorsPerCluster,
// //	LPDWORD lpBytesPerSector,
// //	LPDWORD lpNumberOfFreeClusters,
// //	LPDWORD lpTotalNumberOfClusters
// //
// // );
// func XGetDiskFreeSpaceW(t *TLS, lpRootPathName, lpSectorsPerCluster, lpBytesPerSector, lpNumberOfFreeClusters, lpTotalNumberOfClusters uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v lpTotalNumberOfClusters=%v, (%v:)", t, lpTotalNumberOfClusters, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// DWORD GetFileAttributesA(
//
//	LPCSTR lpFileName
//
// );
func XGetFileAttributesA(t *TLS, lpFileName uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v, (%v:)", t, lpFileName, origin(2))
	}
	r0, _, err := procGetFileAttributesA.Call(lpFileName)
	if r0 == windows.INVALID_FILE_ATTRIBUTES {
		t.setErrno(err)
	}
	return uint32(r0)
}

// BOOL GetFileAttributesExW(
//
//	LPCWSTR                lpFileName,
//	GET_FILEEX_INFO_LEVELS fInfoLevelId,
//	LPVOID                 lpFileInformation
//
// );
func XGetFileAttributesExW(t *TLS, lpFileName uintptr, fInfoLevelId int32, lpFileInformation uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v fInfoLevelId=%v lpFileInformation=%v, (%v:)", t, lpFileName, fInfoLevelId, lpFileInformation, origin(2))
	}
	r1, _, e1 := procGetFileAttributesExW.Call(lpFileName, uintptr(fInfoLevelId), lpFileInformation)
	if r1 == 0 {
		if e1 != windows.ERROR_SUCCESS {
			t.setErrno(e1)
		} else {
			t.setErrno(errno.EINVAL)
		}
		return 0
	}
	return int32(r1)
}

// // DWORD GetFileSize(
// //
// //	HANDLE  hFile,
// //	LPDWORD lpFileSizeHigh
// //
// // );
// func XGetFileSize(t *TLS, hFile, lpFileSizeHigh uintptr) uint32 {
// 	if __ccgo_strace {
// 		trc("t=%v lpFileSizeHigh=%v, (%v:)", t, lpFileSizeHigh, origin(2))
// 	}
// 	r1, _, e1 := procGetFileSize.Call(hFile, lpFileSizeHigh)
// 	if r1 == math.MaxUint32 {
// 		if lpFileSizeHigh == 0 {
// 			// If the function fails and lpFileSizeHigh is NULL, the return value is INVALID_FILE_SIZE.
// 			// Note that if the return value is INVALID_FILE_SIZE (0xffffffff),
// 			// an application must call GetLastError to determine whether the function has succeeded or failed.
// 			t.setErrno(e1)
// 			return math.MaxUint32
// 		} else {
// 			// If the function fails and lpFileSizeHigh is non-NULL, the return value is INVALID_FILE_SIZE
// 			// and GetLastError will return a value other than NO_ERROR.
// 			t.setErrno(e1)
// 			return math.MaxUint32
// 		}
// 	}
// 	return uint32(r1)
// }
//
// // DWORD GetFullPathNameA(
// //
// //	LPCSTR lpFileName,
// //	DWORD  nBufferLength,
// //	LPSTR  lpBuffer,
// //	LPSTR  *lpFilePart
// //
// // );
// func XGetFullPathNameA(t *TLS, lpFileName uintptr, nBufferLength uint32, lpBuffer, lpFilePart uintptr) uint32 {
// 	if __ccgo_strace {
// 		trc("t=%v lpFileName=%v nBufferLength=%v lpFilePart=%v, (%v:)", t, lpFileName, nBufferLength, lpFilePart, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// FARPROC GetProcAddress(HMODULE hModule, LPCSTR  lpProcName);
func XGetProcAddress(t *TLS, hModule, lpProcName uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v lpProcName=%v, (%v:)", t, lpProcName, origin(2))
	}

	return 0

	//die(tls, "");panic(todo(GoString(lpProcName)))
	//
	//r0, _, err := procGetProcAddress.Call(hModule, lpProcName)
	//if r0 == 0 {
	//	t.setErrno(err)
	//}
	//return r0
}

// // NTSYSAPI NTSTATUS RtlGetVersion( // ntdll.dll
// //
// //	PRTL_OSVERSIONINFOW lpVersionInformation
// //
// // );
// func XRtlGetVersion(t *TLS, lpVersionInformation uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v lpVersionInformation=%v, (%v:)", t, lpVersionInformation, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// void GetSystemInfo(
//
//	LPSYSTEM_INFO lpSystemInfo
//
// );
func XGetSystemInfo(t *TLS, lpSystemInfo uintptr) {
	if __ccgo_strace {
		trc("t=%v lpSystemInfo=%v, (%v:)", t, lpSystemInfo, origin(2))
	}
	procGetSystemInfo.Call(lpSystemInfo)
}

// // void GetSystemTime(LPSYSTEMTIME lpSystemTime);
// func XGetSystemTime(t *TLS, lpSystemTime uintptr) {
// 	if __ccgo_strace {
// 		trc("t=%v lpSystemTime=%v, (%v:)", t, lpSystemTime, origin(2))
// 	}
// 	procGetSystemTime.Call(lpSystemTime)
// }

// void GetSystemTimeAsFileTime(
//
//	LPFILETIME lpSystemTimeAsFileTime
//
// );
func XGetSystemTimeAsFileTime(t *TLS, lpSystemTimeAsFileTime uintptr) {
	if __ccgo_strace {
		trc("t=%v lpSystemTimeAsFileTime=%v, (%v:)", t, lpSystemTimeAsFileTime, origin(2))
	}
	procGetSystemTimeAsFileTime.Call(lpSystemTimeAsFileTime)
}

// // DWORD GetTempPathA(
// //
// //	DWORD nBufferLength,
// //	LPSTR lpBuffer
// //
// // );
// func XGetTempPathA(t *TLS, nBufferLength uint32, lpBuffer uintptr) uint32 {
// 	if __ccgo_strace {
// 		trc("t=%v nBufferLength=%v lpBuffer=%v, (%v:)", t, nBufferLength, lpBuffer, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// DWORD GetTempPathW(
//
//	DWORD  nBufferLength,
//	LPWSTR lpBuffer
//
// );
func XGetTempPathW(t *TLS, nBufferLength uint32, lpBuffer uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v nBufferLength=%v lpBuffer=%v, (%v:)", t, nBufferLength, lpBuffer, origin(2))
	}
	rv, err := windows.GetTempPath(nBufferLength, (*uint16)(unsafe.Pointer(lpBuffer)))
	if rv == 0 {
		t.setErrno(err)
	}
	return rv
}

// // BOOL GetVersionExA(
// //
// //	LPOSVERSIONINFOA lpVersionInformation
// //
// // );
// func XGetVersionExA(t *TLS, lpVersionInformation uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v lpVersionInformation=%v, (%v:)", t, lpVersionInformation, origin(2))
// 	}
// 	r0, _, err := procGetVersionExA.Call(lpVersionInformation)
// 	if r0 == 0 {
// 		t.setErrno(err)
// 	}
// 	return int32(r0)
// }
//
// // HANDLE HeapCreate(
// //
// //	DWORD  flOptions,
// //	SIZE_T dwInitialSize,
// //	SIZE_T dwMaximumSize
// //
// // );
// func XHeapCreate(t *TLS, flOptions uint32, dwInitialSize, dwMaximumSize types.Size_t) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v flOptions=%v dwMaximumSize=%v, (%v:)", t, flOptions, dwMaximumSize, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // BOOL HeapDestroy(
// //
// //	HANDLE hHeap
// //
// // );
// func XHeapDestroy(t *TLS, hHeap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v hHeap=%v, (%v:)", t, hHeap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

var procHeapReAlloc = modkernel32.NewProc("HeapReAlloc")

// __attribute__((dllimport)) LPVOID HeapReAlloc (HANDLE hHeap, DWORD dwFlags, LPVOID lpMem, SIZE_T dwBytes);
func XHeapReAlloc(tls *TLS, _hHeap THANDLE, _dwFlags TDWORD, _lpMem TLPVOID, _dwBytes TSIZE_T) (r TLPVOID) {
	if __ccgo_strace {
		trc("hHeap=%+v dwFlags=%+v lpMem=%+v dwBytes=%+v", _hHeap, _dwFlags, _lpMem, _dwBytes)
		defer func() { trc(`XHeapReAlloc->%+v`, r) }()
	}
	r0, _, _ := procHeapReAlloc.Call(_hHeap, uintptr(_dwFlags), _lpMem, uintptr(_dwBytes))
	return TLPVOID(r0)
}

// // SIZE_T HeapSize(
// //
// //	HANDLE  hHeap,
// //	DWORD   dwFlags,
// //	LPCVOID lpMem
// //
// // );
// func XHeapSize(t *TLS, hHeap uintptr, dwFlags uint32, lpMem uintptr) types.Size_t {
// 	if __ccgo_strace {
// 		trc("t=%v hHeap=%v dwFlags=%v lpMem=%v, (%v:)", t, hHeap, dwFlags, lpMem, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // BOOL HeapValidate(
// //
// //	HANDLE  hHeap,
// //	DWORD   dwFlags,
// //	LPCVOID lpMem
// //
// // );
// func XHeapValidate(t *TLS, hHeap uintptr, dwFlags uint32, lpMem uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v hHeap=%v dwFlags=%v lpMem=%v, (%v:)", t, hHeap, dwFlags, lpMem, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // SIZE_T HeapCompact(
// //
// //	HANDLE hHeap,
// //	DWORD  dwFlags
// //
// // );
// func XHeapCompact(t *TLS, hHeap uintptr, dwFlags uint32) types.Size_t {
// 	if __ccgo_strace {
// 		trc("t=%v hHeap=%v dwFlags=%v, (%v:)", t, hHeap, dwFlags, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // HMODULE LoadLibraryA(LPCSTR lpLibFileName);
// func XLoadLibraryA(t *TLS, lpLibFileName uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v lpLibFileName=%v, (%v:)", t, lpLibFileName, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// HLOCAL LocalFree(
//
//	HLOCAL hMem
//
// );
func XLocalFree(t *TLS, hMem uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v hMem=%v, (%v:)", t, hMem, origin(2))
	}
	h, err := windows.LocalFree(windows.Handle(hMem))
	if h != 0 {
		if err != nil {
			t.setErrno(err)
		} else {
			t.setErrno(errno.EINVAL)
		}
		return uintptr(h)
	}
	return 0
}

// // BOOL LockFile(
// //
// //	HANDLE hFile,
// //	DWORD  dwFileOffsetLow,
// //	DWORD  dwFileOffsetHigh,
// //	DWORD  nNumberOfBytesToLockLow,
// //	DWORD  nNumberOfBytesToLockHigh
// //
// // );
// func XLockFile(t *TLS, hFile uintptr, dwFileOffsetLow, dwFileOffsetHigh, nNumberOfBytesToLockLow, nNumberOfBytesToLockHigh uint32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v hFile=%v nNumberOfBytesToLockHigh=%v, (%v:)", t, hFile, nNumberOfBytesToLockHigh, origin(2))
// 	}
//
// 	r1, _, e1 := procLockFile.Call(hFile, uintptr(dwFileOffsetLow), uintptr(dwFileOffsetHigh), uintptr(nNumberOfBytesToLockLow), uintptr(nNumberOfBytesToLockHigh))
// 	if r1 == 0 {
// 		if e1 != windows.ERROR_SUCCESS {
// 			t.setErrno(e1)
// 		} else {
// 			t.setErrno(errno.EINVAL)
// 		}
// 		return 0
// 	}
// 	return int32(r1)
//
// }
//
// // BOOL LockFileEx(
// //
// //	HANDLE       hFile,
// //	DWORD        dwFlags,
// //	DWORD        dwReserved,
// //	DWORD        nNumberOfBytesToLockLow,
// //	DWORD        nNumberOfBytesToLockHigh,
// //	LPOVERLAPPED lpOverlapped
// //
// // );
// func XLockFileEx(t *TLS, hFile uintptr, dwFlags, dwReserved, nNumberOfBytesToLockLow, nNumberOfBytesToLockHigh uint32, lpOverlapped uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v hFile=%v nNumberOfBytesToLockHigh=%v lpOverlapped=%v, (%v:)", t, hFile, nNumberOfBytesToLockHigh, lpOverlapped, origin(2))
// 	}
// 	r1, _, e1 := procLockFileEx.Call(hFile, uintptr(dwFlags), uintptr(dwReserved), uintptr(nNumberOfBytesToLockLow), uintptr(nNumberOfBytesToLockHigh), lpOverlapped)
// 	if r1 == 0 {
// 		if e1 != windows.ERROR_SUCCESS {
// 			t.setErrno(e1)
// 		} else {
// 			t.setErrno(errno.EINVAL)
// 		}
// 		return 0
// 	}
// 	return int32(r1)
// }

// BOOL QueryPerformanceCounter(
//
//	LARGE_INTEGER *lpPerformanceCount
//
// );
func XQueryPerformanceCounter(t *TLS, lpPerformanceCount uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpPerformanceCount=%v, (%v:)", t, lpPerformanceCount, origin(2))
	}
	r0, _, _ := procQueryPerformanceCounter.Call(lpPerformanceCount)
	return int32(r0)
}

// void Sleep(
//
//	DWORD dwMilliseconds
//
// );
func XSleep(t *TLS, dwMilliseconds uint32) {
	if __ccgo_strace {
		trc("t=%v dwMilliseconds=%v, (%v:)", t, dwMilliseconds, origin(2))
	}
	gotime.Sleep(gotime.Duration(dwMilliseconds) * gotime.Millisecond)
}

// // BOOL SystemTimeToFileTime(const SYSTEMTIME *lpSystemTime, LPFILETIME lpFileTime);
// func XSystemTimeToFileTime(t *TLS, lpSystemTime, lpFileTime uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v lpFileTime=%v, (%v:)", t, lpFileTime, origin(2))
// 	}
// 	r0, _, _ := procSystemTimeToFileTime.Call(lpSystemTime, lpFileTime)
// 	return int32(r0)
// }
//
// // BOOL UnlockFile(
// //
// //	HANDLE hFile,
// //	DWORD  dwFileOffsetLow,
// //	DWORD  dwFileOffsetHigh,
// //	DWORD  nNumberOfBytesToUnlockLow,
// //	DWORD  nNumberOfBytesToUnlockHigh
// //
// // );
// func XUnlockFile(t *TLS, hFile uintptr, dwFileOffsetLow, dwFileOffsetHigh, nNumberOfBytesToUnlockLow, nNumberOfBytesToUnlockHigh uint32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v hFile=%v nNumberOfBytesToUnlockHigh=%v, (%v:)", t, hFile, nNumberOfBytesToUnlockHigh, origin(2))
// 	}
// 	r1, _, e1 := procUnlockFile.Call(hFile, uintptr(dwFileOffsetLow), uintptr(dwFileOffsetHigh), uintptr(nNumberOfBytesToUnlockLow), uintptr(nNumberOfBytesToUnlockHigh))
// 	if r1 == 0 {
// 		if e1 != windows.ERROR_SUCCESS {
// 			t.setErrno(e1)
// 		} else {
// 			t.setErrno(errno.EINVAL)
// 		}
// 		return 0
// 	}
// 	return int32(r1)
// }
//
// // BOOL UnlockFileEx(
// //
// //	HANDLE       hFile,
// //	DWORD        dwReserved,
// //	DWORD        nNumberOfBytesToUnlockLow,
// //	DWORD        nNumberOfBytesToUnlockHigh,
// //	LPOVERLAPPED lpOverlapped
// //
// // );
// func XUnlockFileEx(t *TLS, hFile uintptr, dwReserved, nNumberOfBytesToUnlockLow, nNumberOfBytesToUnlockHigh uint32, lpOverlapped uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v hFile=%v nNumberOfBytesToUnlockHigh=%v lpOverlapped=%v, (%v:)", t, hFile, nNumberOfBytesToUnlockHigh, lpOverlapped, origin(2))
// 	}
// 	r1, _, e1 := procUnlockFileEx.Call(hFile, uintptr(dwReserved), uintptr(nNumberOfBytesToUnlockLow), uintptr(nNumberOfBytesToUnlockHigh), lpOverlapped)
// 	if r1 == 0 {
// 		if e1 != windows.ERROR_SUCCESS {
// 			t.setErrno(e1)
// 		} else {
// 			t.setErrno(errno.EINVAL)
// 		}
// 		return 0
// 	}
// 	return int32(r1)
// }

var procUnmapViewOfFile = modkernel32.NewProc("UnmapViewOfFile")

// __attribute__((dllimport)) WINBOOL UnmapViewOfFile (LPCVOID lpBaseAddress);
func XUnmapViewOfFile(tls *TLS, _lpBaseAddress TLPCVOID) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lpBaseAddress=%+v", _lpBaseAddress)
		defer func() { trc(`XUnmapViewOfFile->%+v`, r) }()
	}
	r0, _, err := procUnmapViewOfFile.Call(_lpBaseAddress)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// int WideCharToMultiByte(
//
//	UINT                               CodePage,
//	DWORD                              dwFlags,
//	_In_NLS_string_(cchWideChar)LPCWCH lpWideCharStr,
//	int                                cchWideChar,
//	LPSTR                              lpMultiByteStr,
//	int                                cbMultiByte,
//	LPCCH                              lpDefaultChar,
//	LPBOOL                             lpUsedDefaultChar
//
// );
func XWideCharToMultiByte(t *TLS, CodePage uint32, dwFlags uint32, lpWideCharStr uintptr, cchWideChar int32, lpMultiByteStr uintptr, cbMultiByte int32, lpDefaultChar, lpUsedDefaultChar uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v CodePage=%v dwFlags=%v lpWideCharStr=%v cchWideChar=%v lpMultiByteStr=%v cbMultiByte=%v lpUsedDefaultChar=%v, (%v:)", t, CodePage, dwFlags, lpWideCharStr, cchWideChar, lpMultiByteStr, cbMultiByte, lpUsedDefaultChar, origin(2))
	}
	r1, _, _ := procWideCharToMultiByte.Call(uintptr(CodePage), uintptr(dwFlags), lpWideCharStr,
		uintptr(cchWideChar), lpMultiByteStr, uintptr(cbMultiByte),
		lpDefaultChar, lpUsedDefaultChar, 0)
	return (int32(r1))
}

// // BOOL FlushViewOfFile(
// //
// //	LPCVOID lpBaseAddress,
// //	SIZE_T  dwNumberOfBytesToFlush
// //
// // );
// func XFlushViewOfFile(t *TLS, lpBaseAddress uintptr, dwNumberOfBytesToFlush types.Size_t) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v lpBaseAddress=%v dwNumberOfBytesToFlush=%v, (%v:)", t, lpBaseAddress, dwNumberOfBytesToFlush, origin(2))
// 	}
// 	err := windows.FlushViewOfFile(lpBaseAddress, uintptr(dwNumberOfBytesToFlush))
// 	if err != nil {
// 		t.setErrno(err)
// 		return 0
// 	}
// 	return 1
// }
//
// type _ino_t = uint16 /* types.h:43:24 */
// type _dev_t = uint32 /* types.h:51:22 */
// type _stat64 = struct {
// 	Fst_dev   _dev_t
// 	Fst_ino   _ino_t
// 	Fst_mode  uint16
// 	Fst_nlink int16
// 	Fst_uid   int16
// 	Fst_gid   int16
// 	_         [2]byte
// 	Fst_rdev  _dev_t
// 	_         [4]byte
// 	Fst_size  int64
// 	Fst_atime int64
// 	Fst_mtime int64
// 	Fst_ctime int64
// } /* _mingw_stat64.h:83:3 */
//
// var (
// 	Windows_Tick   int64 = 10000000
// 	SecToUnixEpoch int64 = 11644473600
// )
//
// func WindowsTickToUnixSeconds(windowsTicks int64) int64 {
// 	return (windowsTicks/Windows_Tick - SecToUnixEpoch)
// }
//
// // int _stat64(const char *path, struct __stat64 *buffer);
// func X_stat64(t *TLS, path, buffer uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v buffer=%v, (%v:)", t, buffer, origin(2))
// 	}
//
// 	var fa windows.Win32FileAttributeData
// 	r1, _, e1 := procGetFileAttributesExA.Call(path, windows.GetFileExInfoStandard, (uintptr)(unsafe.Pointer(&fa)))
// 	if r1 == 0 {
// 		if e1 != windows.ERROR_SUCCESS {
// 			t.setErrno(e1)
// 		} else {
// 			t.setErrno(errno.EINVAL)
// 		}
// 		return -1
// 	}
//
// 	var bStat64 = (*_stat64)(unsafe.Pointer(buffer))
// 	var accessTime = int64(fa.LastAccessTime.HighDateTime)<<32 + int64(fa.LastAccessTime.LowDateTime)
// 	bStat64.Fst_atime = WindowsTickToUnixSeconds(accessTime)
// 	var modTime = int64(fa.LastWriteTime.HighDateTime)<<32 + int64(fa.LastWriteTime.LowDateTime)
// 	bStat64.Fst_mtime = WindowsTickToUnixSeconds(modTime)
// 	var crTime = int64(fa.CreationTime.HighDateTime)<<32 + int64(fa.CreationTime.LowDateTime)
// 	bStat64.Fst_ctime = WindowsTickToUnixSeconds(crTime)
// 	var fSz = int64(fa.FileSizeHigh)<<32 + int64(fa.FileSizeLow)
// 	bStat64.Fst_size = fSz
// 	bStat64.Fst_mode = WindowsAttrbiutesToStat(fa.FileAttributes)
//
// 	return 0
// }
//
// func WindowsAttrbiutesToStat(fa uint32) uint16 {
// 	var src_mode = fa & 0xff
// 	var st_mode uint16
// 	if (src_mode & windows.FILE_ATTRIBUTE_DIRECTORY) != 0 {
// 		st_mode = windows.S_IFDIR
// 	} else {
// 		st_mode = windows.S_IFREG
// 	}
//
// 	if src_mode&windows.FILE_ATTRIBUTE_READONLY != 0 {
// 		st_mode = st_mode | windows.S_IRUSR
// 	} else {
// 		st_mode = st_mode | windows.S_IRUSR | windows.S_IWUSR
// 	}
// 	// fill group fields
// 	st_mode = st_mode | (st_mode&0x700)>>3
// 	st_mode = st_mode | (st_mode&0x700)>>6
// 	return st_mode
// }
//
// // int _chsize(
// //
// //	int fd,
// //	long size
// //
// // );
// func X_chsize(t *TLS, fd int32, size long) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v size=%v, (%v:)", t, fd, size, origin(2))
// 	}
//
// 	f, ok := fdToFile(fd)
// 	if !ok {
// 		t.setErrno(EBADF)
// 		return -1
// 	}
//
// 	err := windows.Ftruncate(f.Handle, int64(size))
// 	if err != nil {
// 		t.setErrno(err)
// 		return -1
// 	}
//
// 	return 0
// }
//
// // int _snprintf(char *str, size_t size, const char *format, ...);
// func X_snprintf(t *TLS, str uintptr, size types.Size_t, format, args uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v str=%v size=%v args=%v, (%v:)", t, str, size, args, origin(2))
// 	}
// 	return Xsnprintf(t, str, size, format, args)
// }
//
// const wErr_ERROR_INSUFFICIENT_BUFFER = 122
//
// func win32FindDataToFileInfo(t *TLS, fdata *stat.X_finddata64i32_t, wfd *windows.Win32finddata) int32 {
// 	// t64 = 64-bit time value
// 	var accessTime = int64(wfd.LastAccessTime.HighDateTime)<<32 + int64(wfd.LastAccessTime.LowDateTime)
// 	fdata.Ftime_access = WindowsTickToUnixSeconds(accessTime)
// 	var modTime = int64(wfd.LastWriteTime.HighDateTime)<<32 + int64(wfd.LastWriteTime.LowDateTime)
// 	fdata.Ftime_write = WindowsTickToUnixSeconds(modTime)
// 	var crTime = int64(wfd.CreationTime.HighDateTime)<<32 + int64(wfd.CreationTime.LowDateTime)
// 	fdata.Ftime_create = WindowsTickToUnixSeconds(crTime)
// 	// i32 = 32-bit size
// 	fdata.Fsize = wfd.FileSizeLow
// 	fdata.Fattrib = wfd.FileAttributes
//
// 	var cp = XGetConsoleCP(t)
// 	var wcFn = (uintptr)(unsafe.Pointer(&wfd.FileName[0]))
// 	var mbcsFn = (uintptr)(unsafe.Pointer(&fdata.Fname[0]))
// 	rv := XWideCharToMultiByte(t, cp, 0, wcFn, -1, mbcsFn, 260, 0, 0)
// 	if rv == wErr_ERROR_INSUFFICIENT_BUFFER {
// 		t.setErrno(errno.ENOMEM)
// 		return -1
// 	}
// 	return 0
// }
//
// // intptr_t _findfirst64i32(
// //
// //	const char *filespec,
// //	struct _finddata64i32_t *fileinfo
// //
// // );
// func X_findfirst64i32(t *TLS, filespec, fileinfo uintptr) types.Intptr_t {
// 	if __ccgo_strace {
// 		trc("t=%v fileinfo=%v, (%v:)", t, fileinfo, origin(2))
// 	}
//
// 	// Note: this is the 'narrow' character findfirst -- expects output
// 	// as mbcs -- conversion below -- via ToFileInfo
//
// 	var gsFileSpec = GoString(filespec)
// 	namep, err := windows.UTF16PtrFromString(gsFileSpec)
// 	if err != nil {
// 		t.setErrno(err)
// 		return types.Intptr_t(-1)
// 	}
//
// 	var fdata = (*stat.X_finddata64i32_t)(unsafe.Pointer(fileinfo))
// 	var wfd windows.Win32finddata
// 	h, err := windows.FindFirstFile((*uint16)(unsafe.Pointer(namep)), &wfd)
// 	if err != nil {
// 		t.setErrno(err)
// 		return types.Intptr_t(-1)
// 	}
// 	rv := win32FindDataToFileInfo(t, fdata, &wfd)
// 	if rv != 0 {
// 		if h != 0 {
// 			windows.FindClose(h)
// 		}
// 		return types.Intptr_t(-1)
// 	}
// 	return types.Intptr_t(h)
// }
//
// // int _findnext64i32(
// //
// //	intptr_t handle,
// //	struct _finddata64i32_t *fileinfo
// //
// // );
// func X_findnext64i32(t *TLS, handle types.Intptr_t, fileinfo uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v handle=%v fileinfo=%v, (%v:)", t, handle, fileinfo, origin(2))
// 	}
//
// 	var fdata = (*stat.X_finddata64i32_t)(unsafe.Pointer(fileinfo))
// 	var wfd windows.Win32finddata
//
// 	err := windows.FindNextFile(windows.Handle(handle), &wfd)
// 	if err != nil {
// 		t.setErrno(err)
// 		return -1
// 	}
//
// 	rv := win32FindDataToFileInfo(t, fdata, &wfd)
// 	if rv != 0 {
// 		return -1
// 	}
// 	return 0
// }
//
// // int _findclose(
// //
// //	intptr_t handle
// //
// // );
// func X_findclose(t *TLS, handle types.Intptr_t) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v handle=%v, (%v:)", t, handle, origin(2))
// 	}
//
// 	err := windows.FindClose(windows.Handle(handle))
// 	if err != nil {
// 		t.setErrno(err)
// 		return -1
// 	}
// 	return 0
// }

// DWORD GetEnvironmentVariableA(
//
//	LPCSTR lpName,
//	LPSTR  lpBuffer,
//	DWORD  nSize
//
// );
func XGetEnvironmentVariableA(t *TLS, lpName, lpBuffer uintptr, nSize uint32) (r uint32) {
	if __ccgo_strace {
		trc("t=%v lpBuffer=%v nSize=%v, (%v:)", t, lpBuffer, nSize, origin(2))
	}
	r0, _, _ := procGetEnvironmentVariableA.Call(lpName, lpBuffer, uintptr(nSize))
	if r = uint32(r0); r == 0 {
		t.setErrno(windows.ERROR_ENVVAR_NOT_FOUND)
	}
	return r
}

// DWORD GetEnvironmentVariableW(
//
//	LPCWSTR lpName,
//	LPWSTR  lpBuffer,
//	DWORD   nSize
//
// );
func XGetEnvironmentVariableW(t *TLS, lpName, lpBuffer uintptr, nSize uint32) (r uint32) {
	if __ccgo_strace {
		trc("t=%v lpBuffer=%v nSize=%v, (%v:)", t, lpBuffer, nSize, origin(2))
	}
	r0, _, _ := procGetEnvironmentVariableW.Call(lpName, lpBuffer, uintptr(nSize))
	if r = uint32(r0); r == 0 {
		t.setErrno(windows.ERROR_ENVVAR_NOT_FOUND)
	}
	return r
}

// // int _fstat64(
// //
// //	int fd,
// //	struct __stat64 *buffer
// //
// // );
// func X_fstat64(t *TLS, fd int32, buffer uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v buffer=%v, (%v:)", t, fd, buffer, origin(2))
// 	}
//
// 	f, ok := fdToFile(fd)
// 	if !ok {
// 		t.setErrno(EBADF)
// 		return -1
// 	}
//
// 	var d windows.ByHandleFileInformation
// 	err := windows.GetFileInformationByHandle(f.Handle, &d)
// 	if err != nil {
// 		t.setErrno(EBADF)
// 		return -1
// 	}
//
// 	var bStat64 = (*_stat64)(unsafe.Pointer(buffer))
// 	var accessTime = int64(d.LastAccessTime.HighDateTime)<<32 + int64(d.LastAccessTime.LowDateTime)
// 	bStat64.Fst_atime = WindowsTickToUnixSeconds(accessTime)
// 	var modTime = int64(d.LastWriteTime.HighDateTime)<<32 + int64(d.LastWriteTime.LowDateTime)
// 	bStat64.Fst_mtime = WindowsTickToUnixSeconds(modTime)
// 	var crTime = int64(d.CreationTime.HighDateTime)<<32 + int64(d.CreationTime.LowDateTime)
// 	bStat64.Fst_ctime = WindowsTickToUnixSeconds(crTime)
// 	var fSz = int64(d.FileSizeHigh)<<32 + int64(d.FileSizeLow)
// 	bStat64.Fst_size = fSz
// 	bStat64.Fst_mode = WindowsAttrbiutesToStat(d.FileAttributes)
//
// 	return 0
// }
//
// // HANDLE CreateEventA(
// //
// //	LPSECURITY_ATTRIBUTES lpEventAttributes,
// //	BOOL                  bManualReset,
// //	BOOL                  bInitialState,
// //	LPCSTR                lpName
// //
// // );
// func XCreateEventA(t *TLS, lpEventAttributes uintptr, bManualReset, bInitialState int32, lpName uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v lpEventAttributes=%v bInitialState=%v lpName=%v, (%v:)", t, lpEventAttributes, bInitialState, lpName, origin(2))
// 	}
// 	r0, _, err := procCreateEventA.Call(lpEventAttributes, uintptr(bManualReset),
// 		uintptr(bInitialState), lpName, 0, 0)
// 	if r0 == 0 {
// 		t.setErrno(err)
// 	}
// 	return r0
// }

func X_endthreadex(t *TLS, _ ...interface{}) {
	// NOOP
}

// // The calling convention for beginthread is cdecl -- but in this
// // case we're just intercepting it and sending it through CreateThread which expects stdcall
// // and gets that via the go callback. This is safe because the thread is calling into go
// // not a cdecl function which would expect the stack setup of cdecl.
// func X_beginthread(t *TLS, procAddr uintptr, stack_sz uint32, args uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v procAddr=%v stack_sz=%v args=%v, (%v:)", t, procAddr, stack_sz, args, origin(2))
// 	}
// 	f := (*struct{ f func(*TLS, uintptr) uint32 })(unsafe.Pointer(&struct{ uintptr }{procAddr})).f
// 	var tAdp = ThreadAdapter{threadFunc: f, tls: NewTLS(), param: args}
// 	tAdp.token = addObject(&tAdp)
//
// 	r0, _, err := procCreateThread.Call(0, uintptr(stack_sz),
// 		threadCallback, tAdp.token, 0, 0)
// 	if r0 == 0 {
// 		t.setErrno(err)
// 	}
// 	return int32(r0)
// }

// uintptr_t _beginthreadex( // NATIVE CODE
//
//	void *security,
//	unsigned stack_size,
//	unsigned ( __stdcall *start_address )( void * ),
//	void *arglist,
//	unsigned initflag,
//	unsigned *thrdaddr
//
// );
func X_beginthreadex(t *TLS, _ uintptr, stack_sz uint32, procAddr uintptr, args uintptr, initf uint32, thAddr uintptr) int32 {
	f := (*struct{ f func(*TLS, uintptr) uint32 })(unsafe.Pointer(&struct{ uintptr }{procAddr})).f
	var tAdp = ThreadAdapter{threadFunc: f, tls: NewTLS(), param: args}
	tAdp.token = addObject(&tAdp)

	r0, _, err := procCreateThread.Call(0, uintptr(stack_sz),
		threadCallback, tAdp.token, uintptr(initf), thAddr)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// DWORD GetCurrentThreadId();
func XGetCurrentThreadId(t *TLS) uint32 {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	r0, _, _ := procGetCurrentThreadId.Call()
	return uint32(r0)
}

// BOOL GetExitCodeThread(
//
//	HANDLE  hThread,
//	LPDWORD lpExitCode
//
// );
func XGetExitCodeThread(t *TLS, hThread, lpExitCode uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpExitCode=%v, (%v:)", t, lpExitCode, origin(2))
	}
	r0, _, _ := procGetExitCodeThread.Call(hThread, lpExitCode)
	return int32(r0)
}

// DWORD WaitForSingleObjectEx(
//
//	HANDLE hHandle,
//	DWORD  dwMilliseconds,
//	BOOL   bAlertable
//
// );
func XWaitForSingleObjectEx(t *TLS, hHandle uintptr, dwMilliseconds uint32, bAlertable int32) uint32 {
	if __ccgo_strace {
		trc("t=%v hHandle=%v dwMilliseconds=%v bAlertable=%v, (%v:)", t, hHandle, dwMilliseconds, bAlertable, origin(2))
	}
	rv, _, _ := procWaitForSingleObjectEx.Call(hHandle, uintptr(dwMilliseconds), uintptr(bAlertable))
	return uint32(rv)
}

// DWORD MsgWaitForMultipleObjectsEx(
//
//	DWORD        nCount,
//	const HANDLE *pHandles,
//	DWORD        dwMilliseconds,
//	DWORD        dwWakeMask,
//	DWORD        dwFlags
//
// );
func XMsgWaitForMultipleObjectsEx(t *TLS, nCount uint32, pHandles uintptr, dwMilliseconds, dwWakeMask, dwFlags uint32) uint32 {
	if __ccgo_strace {
		trc("t=%v nCount=%v pHandles=%v dwFlags=%v, (%v:)", t, nCount, pHandles, dwFlags, origin(2))
	}
	r0, _, err := procMsgWaitForMultipleObjectsEx.Call(uintptr(nCount),
		pHandles,
		uintptr(dwMilliseconds),
		uintptr(dwWakeMask),
		uintptr(dwFlags),
		0,
	)
	if r0 == windows.WAIT_FAILED {
		t.setErrno(err)
	}
	return uint32(r0)
}

var procMessageBoxW = moduser32.NewProc("MessageBoxW")

// __attribute__((dllimport)) int MessageBoxW(HWND hWnd,LPCWSTR lpText,LPCWSTR lpCaption,UINT uType);
func XMessageBoxW(tls *TLS, _hWnd THWND, _lpText TLPCWSTR, _lpCaption TLPCWSTR, _uType TUINT) (r int32) {
	if __ccgo_strace {
		trc("hWnd=%+v lpText=%+v lpCaption=%+v uType=%+v", _hWnd, _lpText, _lpCaption, _uType)
		defer func() { trc(`XMessageBoxW->%+v`, r) }()
	}
	r0, _, err := procMessageBoxW.Call(_hWnd, _lpText, _lpCaption, uintptr(_uType))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// DWORD GetModuleFileNameW(
//
//	HMODULE hModule,
//	LPWSTR  lpFileName,
//	DWORD   nSize
//
// );
func XGetModuleFileNameW(t *TLS, hModule, lpFileName uintptr, nSize uint32) uint32 {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v nSize=%v, (%v:)", t, lpFileName, nSize, origin(2))
	}
	r0, _, err := procGetModuleFileNameW.Call(hModule, lpFileName, uintptr(nSize))
	if r0 == 0 {
		t.setErrno(err)
	}
	return uint32(r0)
}

// NET_API_STATUS NET_API_FUNCTION NetGetDCName(
//
//	LPCWSTR ServerName,
//	LPCWSTR DomainName,
//	LPBYTE  *Buffer
//
// );
func XNetGetDCName(t *TLS, ServerName, DomainName, Buffer uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v Buffer=%v, (%v:)", t, Buffer, origin(2))
	}
	r0, _, _ := procNetGetDCName.Call(ServerName, DomainName, Buffer)
	return int32(r0)
}

// NET_API_STATUS NET_API_FUNCTION NetUserGetInfo(
//
//	LPCWSTR servername,
//	LPCWSTR username,
//	DWORD   level,
//	LPBYTE  *bufptr
//
// );
func XNetUserGetInfo(t *TLS, servername, username uintptr, level uint32, bufptr uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v username=%v level=%v bufptr=%v, (%v:)", t, username, level, bufptr, origin(2))
	}
	r0, _, _ := procNetUserGetInfo.Call(servername,
		username,
		uintptr(level),
		bufptr,
		0,
		0,
	)
	return uint32(r0)
}

func XlstrlenW(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// USERENVAPI BOOL GetProfilesDirectoryW(
//
//	[out]     LPWSTR  lpProfileDir,
//	[in, out] LPDWORD lpcchSize
//
// );
func XGetProfilesDirectoryW(t *TLS, lpProfileDir, lpcchSize uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpcchSize=%v, (%v:)", t, lpcchSize, origin(2))
	}
	r0, _, err := procGetProfilesDirectoryW.Call(lpProfileDir, lpcchSize)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

func XNetApiBufferFree(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// DWORD GetPrivateProfileStringA(
//
//	LPCSTR lpAppName,
//	LPCSTR lpKeyName,
//	LPCSTR lpDefault,
//	LPSTR  lpReturnedString,
//	DWORD  nSize,
//	LPCSTR lpFileName
//
// );
func XGetPrivateProfileStringA(t *TLS, lpAppName, lpKeyName, lpDefault, lpReturnedString uintptr, nSize uint32, lpFileName uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v lpReturnedString=%v nSize=%v lpFileName=%v, (%v:)", t, lpReturnedString, nSize, lpFileName, origin(2))
	}
	r0, _, _ := procGetPrivateProfileStringA.Call(lpAppName,
		lpKeyName,
		lpDefault,
		lpReturnedString,
		uintptr(nSize),
		lpFileName,
	)
	if r0 == 0 {
		t.setErrno(0x02)
	}
	return uint32(r0)
}

func XGetWindowsDirectoryA(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// BOOL GetFileSecurityW(
//
//	LPCSTR               lpFileName,
//	SECURITY_INFORMATION RequestedInformation,
//	PSECURITY_DESCRIPTOR pSecurityDescriptor,
//	DWORD                nLength,
//	LPDWORD              lpnLengthNeeded
//
// );
func XGetFileSecurityW(t *TLS, lpFileName uintptr, RequestedInformation uint32, pSecurityDescriptor uintptr, nLength uint32, lpnLengthNeeded uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v RequestedInformation=%v pSecurityDescriptor=%v nLength=%v lpnLengthNeeded=%v, (%v:)", t, lpFileName, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded, origin(2))
	}
	r0, _, err := procGetFileSecurityW.Call(lpFileName, uintptr(RequestedInformation), pSecurityDescriptor, uintptr(nLength), lpnLengthNeeded)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL GetSecurityDescriptorOwner(
//
//	PSECURITY_DESCRIPTOR pSecurityDescriptor,
//	PSID                 *pOwner,
//	LPBOOL               lpbOwnerDefaulted
//
// );
func XGetSecurityDescriptorOwner(t *TLS, pSecurityDescriptor, pOwner, lpbOwnerDefaulted uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpbOwnerDefaulted=%v, (%v:)", t, lpbOwnerDefaulted, origin(2))
	}
	r0, _, err := procGetSecurityDescriptorOwner.Call(pSecurityDescriptor, pOwner, lpbOwnerDefaulted)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)

}

// PSID_IDENTIFIER_AUTHORITY GetSidIdentifierAuthority(
//
//	PSID pSid
//
// );
func XGetSidIdentifierAuthority(t *TLS, pSid uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v pSid=%v, (%v:)", t, pSid, origin(2))
	}
	r0, _, _ := procGetSidIdentifierAuthority.Call(pSid)
	return r0
}

// BOOL ImpersonateSelf(
//
//	SECURITY_IMPERSONATION_LEVEL ImpersonationLevel
//
// );
func XImpersonateSelf(t *TLS, ImpersonationLevel int32) int32 {
	if __ccgo_strace {
		trc("t=%v ImpersonationLevel=%v, (%v:)", t, ImpersonationLevel, origin(2))
	}
	r0, _, err := procImpersonateSelf.Call(uintptr(ImpersonationLevel))
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL OpenThreadToken(
//
//	HANDLE  ThreadHandle,
//	DWORD   DesiredAccess,
//	BOOL    OpenAsSelf,
//	PHANDLE TokenHandle
//
// );
func XOpenThreadToken(t *TLS, ThreadHandle uintptr, DesiredAccess uint32, OpenAsSelf int32, TokenHandle uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v ThreadHandle=%v DesiredAccess=%v OpenAsSelf=%v TokenHandle=%v, (%v:)", t, ThreadHandle, DesiredAccess, OpenAsSelf, TokenHandle, origin(2))
	}
	r0, _, err := procOpenThreadToken.Call(ThreadHandle, uintptr(DesiredAccess), uintptr(OpenAsSelf), TokenHandle)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// HANDLE GetCurrentThread();
func XGetCurrentThread(t *TLS) uintptr {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	r0, _, _ := procGetCurrentThread.Call()
	return r0
}

// BOOL RevertToSelf();
func XRevertToSelf(t *TLS) int32 {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	r0, _, err := procRevertToSelf.Call()
	if err != windows.ERROR_SUCCESS {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL AccessCheck(
//
//	PSECURITY_DESCRIPTOR pSecurityDescriptor,
//	HANDLE               ClientToken,
//	DWORD                DesiredAccess,
//	PGENERIC_MAPPING     GenericMapping,
//	PPRIVILEGE_SET       PrivilegeSet,
//	LPDWORD              PrivilegeSetLength,
//	LPDWORD              GrantedAccess,
//	LPBOOL               AccessStatus
//
// );
func XAccessCheck(t *TLS, pSecurityDescriptor, ClientToken uintptr, DesiredAccess uint32, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccess, AccessStatus uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v ClientToken=%v DesiredAccess=%v AccessStatus=%v, (%v:)", t, ClientToken, DesiredAccess, AccessStatus, origin(2))
	}
	r0, _, err := procAccessCheck.Call(pSecurityDescriptor,
		ClientToken,
		uintptr(DesiredAccess),
		GenericMapping,
		PrivilegeSet,
		PrivilegeSetLength,
		GrantedAccess,
		AccessStatus,
		0,
	)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// int _wcsicmp(
//
//	const wchar_t *string1,
//	const wchar_t *string2
//
// );
func Xwcsicmp(t *TLS, string1, string2 uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v string2=%v, (%v:)", t, string2, origin(2))
	}
	var s1 = strings.ToLower(goWideString(string1))
	var s2 = strings.ToLower(goWideString(string2))
	return int32(strings.Compare(s1, s2))
}

// BOOL SetCurrentDirectoryW(
//
//	LPCTSTR lpPathName
//
// );
func XSetCurrentDirectoryW(t *TLS, lpPathName uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpPathName=%v, (%v:)", t, lpPathName, origin(2))
	}
	err := windows.SetCurrentDirectory((*uint16)(unsafe.Pointer(lpPathName)))
	if err != nil {
		t.setErrno(err)
		return 0
	}
	return 1
}

// DWORD GetCurrentDirectory(
//
//	DWORD  nBufferLength,
//	LPWTSTR lpBuffer
//
// );
func XGetCurrentDirectoryW(t *TLS, nBufferLength uint32, lpBuffer uintptr) uint32 {
	if __ccgo_strace {
		trc("t=%v nBufferLength=%v lpBuffer=%v, (%v:)", t, nBufferLength, lpBuffer, origin(2))
	}
	n, err := windows.GetCurrentDirectory(nBufferLength, (*uint16)(unsafe.Pointer(lpBuffer)))
	if err != nil {
		t.setErrno(err)
	}
	return n
}

// BOOL GetFileInformationByHandle(
//
//	HANDLE                       hFile,
//	LPBY_HANDLE_FILE_INFORMATION lpFileInformation
//
// );
func XGetFileInformationByHandle(t *TLS, hFile, lpFileInformation uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpFileInformation=%v, (%v:)", t, lpFileInformation, origin(2))
	}
	r1, _, e1 := procGetFileInformationByHandle.Call(hFile, lpFileInformation)
	if r1 == 0 {
		t.setErrno(e1)
	}
	return int32(r1)
}

// BOOL GetVolumeInformationW(
//
//	LPCWSTR lpRootPathName,
//	LPWSTR  lpVolumeNameBuffer,
//	DWORD   nVolumeNameSize,
//	LPDWORD lpVolumeSerialNumber,
//	LPDWORD lpMaximumComponentLength,
//	LPDWORD lpFileSystemFlags,
//	LPWSTR  lpFileSystemNameBuffer,
//	DWORD   nFileSystemNameSize
//
// );
func XGetVolumeInformationW(t *TLS, lpRootPathName, lpVolumeNameBuffer uintptr, nVolumeNameSize uint32, lpVolumeSerialNumber, lpMaximumComponentLength, lpFileSystemFlags, lpFileSystemNameBuffer uintptr, nFileSystemNameSize uint32) int32 {
	if __ccgo_strace {
		trc("t=%v lpVolumeNameBuffer=%v nVolumeNameSize=%v lpFileSystemNameBuffer=%v nFileSystemNameSize=%v, (%v:)", t, lpVolumeNameBuffer, nVolumeNameSize, lpFileSystemNameBuffer, nFileSystemNameSize, origin(2))
	}
	r0, _, err := procGetVolumeInformationW.Call(lpRootPathName,
		lpVolumeNameBuffer,
		uintptr(nVolumeNameSize),
		lpVolumeSerialNumber,
		lpMaximumComponentLength,
		lpFileSystemFlags,
		lpFileSystemNameBuffer,
		uintptr(nFileSystemNameSize),
		0,
	)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// wchar_t *wcschr(
//
//	const wchar_t *str,
//	wchar_t c
//
// );
func Xwcschr(t *TLS, str uintptr, c wchar_t) uintptr {
	if __ccgo_strace {
		trc("t=%v str=%v c=%v, (%v:)", t, str, c, origin(2))
	}
	var source = str
	for {
		var buf = *(*uint16)(unsafe.Pointer(source))
		if buf == 0 {
			return 0
		}
		if buf == c {
			return source
		}
		// wchar_t = 2 bytes
		source++
		source++
	}
}

// BOOL SetFileTime(
//
//	HANDLE         hFile,
//	const FILETIME *lpCreationTime,
//	const FILETIME *lpLastAccessTime,
//	const FILETIME *lpLastWriteTime
//
// );
func XSetFileTime(t *TLS, _hFile uintptr, _lpCreationTime, _lpLastAccessTime, _lpLastWriteTime uintptr) (r int32) {
	if __ccgo_strace {
		trc("hFile=%+v lpCreationTime=%+v lpLastAccessTime=%+v lpLastWriteTime=%+v", _hFile, _lpCreationTime, _lpLastAccessTime, _lpLastWriteTime)
		defer func() { trc(`XSetFileTime->%+v`, r) }()
	}
	r0, _, err := procSetFileTime.Call(_hFile, _lpCreationTime, _lpLastAccessTime, _lpLastWriteTime)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) DWORD GetNamedSecurityInfoW (LPCWSTR pObjectName, SE_OBJECT_TYPE ObjectType, SECURITY_INFORMATION SecurityInfo, PSID *ppsidOwner, PSID *ppsidGroup, PACL *ppDacl, PACL *ppSacl, PSECURITY_DESCRIPTOR *ppSecurityDescriptor);
func XGetNamedSecurityInfoW(tls *TLS, _pObjectName uintptr, _ObjectType int32, _SecurityInfo uint32, _ppsidOwner uintptr, _ppsidGroup uintptr, _ppDacl uintptr, _ppSacl uintptr, _ppSecurityDescriptor uintptr) (r uint32) {
	if __ccgo_strace {
		trc("pObjectName=%+v ObjectType=%+v SecurityInfo=%+v ppsidOwner=%+v ppsidGroup=%+v ppDacl=%+v ppSacl=%+v ppSecurityDescriptor=%+v", _pObjectName, _ObjectType, _SecurityInfo, _ppsidOwner, _ppsidGroup, _ppDacl, _ppSacl, _ppSecurityDescriptor)
		defer func() { trc(`XGetNamedSecurityInfoW->%+v`, r) }()
	}
	r0, _, err := procGetNamedSecurityInfoW.Call(_pObjectName, uintptr(_ObjectType), uintptr(_SecurityInfo), _ppsidOwner, _ppsidGroup, _ppDacl, _ppSacl, _ppSecurityDescriptor)
	if err != windows.ERROR_SUCCESS {
		tls.setErrno(err)
	}
	return uint32(r0)
}

// __attribute__((dllimport)) WINBOOL OpenProcessToken (HANDLE ProcessHandle, DWORD DesiredAccess, PHANDLE TokenHandle);
func XOpenProcessToken(tls *TLS, _ProcessHandle uintptr, _DesiredAccess uint32, _TokenHandle uintptr) (r int32) {
	if __ccgo_strace {
		trc("ProcessHandle=%+v DesiredAccess=%+v TokenHandle=%+v", _ProcessHandle, _DesiredAccess, _TokenHandle)
		defer func() { trc(`XOpenProcessToken->%+v`, r) }()
	}
	r0, _, err := procOpenProcessToken.Call(_ProcessHandle, uintptr(_DesiredAccess), _TokenHandle)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) WINBOOL GetTokenInformation (HANDLE TokenHandle, TOKEN_INFORMATION_CLASS TokenInformationClass, LPVOID TokenInformation, DWORD TokenInformationLength, PDWORD ReturnLength);
func XGetTokenInformation(tls *TLS, _TokenHandle uintptr, _TokenInformationClass int32, _TokenInformation uintptr, _TokenInformationLength uint32, _ReturnLength uintptr) (r int32) {
	if __ccgo_strace {
		trc("TokenHandle=%+v TokenInformationClass=%+v TokenInformation=%+v TokenInformationLength=%+v ReturnLength=%+v", _TokenHandle, _TokenInformationClass, _TokenInformation, _TokenInformationLength, _ReturnLength)
		defer func() { trc(`XGetTokenInformation->%+v`, r) }()
	}
	r0, _, err := procGetTokenInformation.Call(_TokenHandle, uintptr(_TokenInformationClass), _TokenInformation, uintptr(_TokenInformationLength), _ReturnLength)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) WINBOOL EqualSid (PSID pSid1, PSID pSid2);
func XEqualSid(tls *TLS, _pSid1 uintptr, _pSid2 uintptr) (r int32) {
	if __ccgo_strace {
		trc("pSid1=%+v pSid2=%+v", _pSid1, _pSid2)
		defer func() { trc(`XEqualSid->%+v`, r) }()
	}
	r0, _, _ := procEqualSid.Call(_pSid1, _pSid2)
	return int32(r0)
}

// int WSAStartup(
//
//	WORD      wVersionRequired,
//	LPWSADATA lpWSAData
//
// );
func XWSAStartup(t *TLS, wVersionRequired uint16, lpWSAData uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v wVersionRequired=%v lpWSAData=%v, (%v:)", t, wVersionRequired, lpWSAData, origin(2))
	}
	r0, _, _ := procWSAStartup.Call(uintptr(wVersionRequired), lpWSAData)
	return int32(r0)
}

// HMODULE GetModuleHandleA(LPCSTR lpModuleName);
func XGetModuleHandleA(t *TLS, lpModuleName uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v lpModuleName=%v, (%v:)", t, lpModuleName, origin(2))
	}
	r0, _, err := procGetModuleHandleA.Call(lpModuleName)
	if r0 == 0 {
		t.setErrno(err)
	}
	return r0
}

// HMODULE GetModuleHandleW(
//
//	LPCWSTR lpModuleName
//
// );
func XGetModuleHandleW(t *TLS, lpModuleName uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v lpModuleName=%v, (%v:)", t, lpModuleName, origin(2))
	}
	r0, _, err := procGetModuleHandleW.Call(lpModuleName)
	if r0 == 0 {
		t.setErrno(err)
	}
	return r0
}

func X_strcmpi(t *TLS, lpString1, lpString2 uintptr) int32 {
	var s1 = strings.ToLower(GoString(lpString1))
	var s2 = strings.ToLower(GoString(lpString2))
	return int32(strings.Compare(s1, s2))
}

// int lstrcmpiA(
//
//	LPCSTR lpString1,
//	LPCSTR lpString2
//
// );
func XlstrcmpiA(t *TLS, lpString1, lpString2 uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpString2=%v, (%v:)", t, lpString2, origin(2))
	}
	var s1 = strings.ToLower(GoString(lpString1))
	var s2 = strings.ToLower(GoString(lpString2))
	return int32(strings.Compare(s1, s2))
}

func XGetModuleFileNameA(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// UINT GetACP();
func XGetACP(t *TLS) uint32 {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	r0, _, _ := procGetACP.Call()
	return uint32(r0)
}

// BOOL GetUserNameW(
//
//	LPWSTR  lpBuffer,
//	LPDWORD pcbBuffer
//
// );
func XGetUserNameW(t *TLS, lpBuffer, pcbBuffer uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v pcbBuffer=%v, (%v:)", t, pcbBuffer, origin(2))
	}
	u, err := user.Current()
	if err != nil {
		die(t, "")
		panic(todo(""))
		return 0
	}

	wcnt := *(*uint16)(unsafe.Pointer(pcbBuffer))
	s := utf16.Encode([]rune(u.Username))
	if len(s)+1 > int(wcnt) {
		die(t, "")
		panic(todo(""))
	}

	*(*uint16)(unsafe.Pointer(pcbBuffer)) = uint16(len(s) + 1)
	for _, v := range s {
		*(*uint16)(unsafe.Pointer(lpBuffer)) = v
		lpBuffer += 2
	}
	return 1
}

// HMODULE LoadLibraryExW(
//
//	LPCWSTR lpLibFileName,
//	HANDLE  hFile,
//	DWORD   dwFlags
//
// );
func XLoadLibraryExW(t *TLS, lpLibFileName, hFile uintptr, dwFlags uint32) uintptr {
	if __ccgo_strace {
		trc("t=%v hFile=%v dwFlags=%v, (%v:)", t, hFile, dwFlags, origin(2))
	}
	return 0 // If the function fails, the return value is NULL.
}

// wchar_t *wcscpy(
//
//	wchar_t *strDestination,
//	const wchar_t *strSource
//
// );
func Xwcscpy(t *TLS, strDestination, strSource uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v strSource=%v, (%v:)", t, strSource, origin(2))
	}
	if strSource == 0 {
		return 0
	}

	d := strDestination
	for {
		c := *(*uint16)(unsafe.Pointer(strSource))
		strSource += 2
		*(*uint16)(unsafe.Pointer(d)) = c
		d += 2
		if c == 0 {
			return strDestination
		}
	}
}

func XwsprintfW(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

type TLPCSTR = uintptr

type THBRUSH = uintptr

type THCURSOR = uintptr

type TWNDPROC = uintptr

type THINSTANCE = uintptr

type THICON = uintptr

type TATOM = uint16

func XKillTimer(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

var procDestroyWindow = moduser32.NewProc("DestroyWindow")

// __attribute__((dllimport)) WINBOOL DestroyWindow(HWND hWnd);
func XDestroyWindow(tls *TLS, _hWnd THWND) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XDestroyWindow->%+v`, r) }()
	}
	r0, _, err := procDestroyWindow.Call(_hWnd)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procUnregisterClassW = moduser32.NewProc("UnregisterClassW")

// __attribute__((dllimport)) WINBOOL UnregisterClassW (LPCWSTR lpClassName, HINSTANCE hInstance);
func XUnregisterClassW(tls *TLS, _lpClassName TLPCWSTR, _hInstance THINSTANCE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lpClassName=%+v hInstance=%+v", _lpClassName, _hInstance)
		defer func() { trc(`XUnregisterClassW->%+v`, r) }()
	}
	r0, _, err := procUnregisterClassW.Call(_lpClassName, _hInstance)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procPostMessageW = moduser32.NewProc("PostMessageW")

// __attribute__((dllimport)) WINBOOL PostMessageW (HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
func XPostMessageW(tls *TLS, _hWnd THWND, _Msg TUINT, _wParam TWPARAM, _lParam TLPARAM) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v Msg=%+v wParam=%+v lParam=%+v", _hWnd, _Msg, _wParam, _lParam)
		defer func() { trc(`XPostMessageW->%+v`, r) }()
	}
	r0, _, err := procPostMessageW.Call(_hWnd, uintptr(_Msg), uintptr(_wParam), uintptr(_lParam))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

func XSetTimer(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// HWND CreateWindowExW(
//
//	DWORD     dwExStyle,
//	LPCWSTR   lpClassName,
//	LPCWSTR   lpWindowName,
//	DWORD     dwStyle,
//	int       X,
//	int       Y,
//	int       nWidth,
//	int       nHeight,
//	HWND      hWndParent,
//	HMENU     hMenu,
//	HINSTANCE hInstance,
//	LPVOID    lpParam
//
// );
func XCreateWindowExW(t *TLS, dwExStyle uint32, lpClassName, lpWindowName uintptr, dwStyle uint32, x, y, nWidth, nHeight int32, hWndParent, hMenu, hInstance, lpParam uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v dwExStyle=%v lpWindowName=%v dwStyle=%v nHeight=%v lpParam=%v, (%v:)", t, dwExStyle, lpWindowName, dwStyle, nHeight, lpParam, origin(2))
	}
	r0, _, err := procCreateWindowExW.Call(
		uintptr(dwExStyle),
		lpClassName,
		lpWindowName,
		uintptr(dwStyle),
		uintptr(x),
		uintptr(y),
		uintptr(nWidth),
		uintptr(nHeight),
		hWndParent,
		hMenu,
		hInstance,
		lpParam,
	)
	if r0 == 0 {
		t.setErrno(err)
	}
	return r0
}

// BOOL PeekMessageW(
//
//	LPMSG lpMsg,
//	HWND  hWnd,
//	UINT  wMsgFilterMin,
//	UINT  wMsgFilterMax,
//	UINT  wRemoveMsg
//
// );
func XPeekMessageW(t *TLS, lpMsg, hWnd uintptr, wMsgFilterMin, wMsgFilterMax, wRemoveMsg uint32) int32 {
	if __ccgo_strace {
		trc("t=%v hWnd=%v wRemoveMsg=%v, (%v:)", t, hWnd, wRemoveMsg, origin(2))
	}
	r0, _, _ := procPeekMessageW.Call(lpMsg,
		hWnd,
		uintptr(wMsgFilterMin),
		uintptr(wMsgFilterMax),
		uintptr(wRemoveMsg),
		0,
	)
	return int32(r0)
}

// DWORD SleepEx(
//
//	DWORD dwMilliseconds,
//	BOOL  bAlertable
//
// );
func XSleepEx(t *TLS, dwMilliseconds uint32, bAlertable int32) uint32 {
	if __ccgo_strace {
		trc("t=%v dwMilliseconds=%v bAlertable=%v, (%v:)", t, dwMilliseconds, bAlertable, origin(2))
	}
	r0, _, _ := procSleepEx.Call(uintptr(dwMilliseconds), uintptr(bAlertable))
	return uint32(r0)
}

// BOOL CreatePipe(
//
//	PHANDLE               hReadPipe,
//	PHANDLE               hWritePipe,
//	LPSECURITY_ATTRIBUTES lpPipeAttributes,
//	DWORD                 nSize
//
// );
func XCreatePipe(t *TLS, hReadPipe, hWritePipe, lpPipeAttributes uintptr, nSize uint32) int32 {
	if __ccgo_strace {
		trc("t=%v lpPipeAttributes=%v nSize=%v, (%v:)", t, lpPipeAttributes, nSize, origin(2))
	}
	r0, _, err := procCreatePipe.Call(hReadPipe, hWritePipe, lpPipeAttributes, uintptr(nSize))
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL CreateProcessW(
//
//	LPCWSTR               lpApplicationName,
//	LPWSTR                lpCommandLine,
//	LPSECURITY_ATTRIBUTES lpProcessAttributes,
//	LPSECURITY_ATTRIBUTES lpThreadAttributes,
//	BOOL                  bInheritHandles,
//	DWORD                 dwCreationFlags,
//	LPVOID                lpEnvironment,
//	LPCWSTR               lpCurrentDirectory,
//	LPSTARTUPINFOW        lpStartupInfo,
//	LPPROCESS_INFORMATION lpProcessInformation
//
// );
func XCreateProcessW(t *TLS, lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes uintptr, bInheritHandles int32, dwCreationFlags uint32,
	lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation uintptr) int32 {

	r1, _, e1 := procCreateProcessW.Call(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes,
		uintptr(bInheritHandles), uintptr(dwCreationFlags), lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation, 0, 0)
	if r1 == 0 {
		t.setErrno(e1)
	}
	return int32(r1)
}

// DWORD WaitForInputIdle(
//
//	HANDLE hProcess,
//	DWORD  dwMilliseconds
//
// );
func XWaitForInputIdle(t *TLS, hProcess uintptr, dwMilliseconds uint32) int32 {
	if __ccgo_strace {
		trc("t=%v hProcess=%v dwMilliseconds=%v, (%v:)", t, hProcess, dwMilliseconds, origin(2))
	}
	r0, _, _ := procWaitForInputIdle.Call(hProcess, uintptr(dwMilliseconds))
	return int32(r0)
}

// DWORD SearchPathW(
//
//	LPCWSTR lpPath,
//	LPCWSTR lpFileName,
//	LPCWSTR lpExtension,
//	DWORD   nBufferLength,
//	LPWSTR  lpBuffer,
//	LPWSTR  *lpFilePart
//
// );
func XSearchPathW(t *TLS, lpPath, lpFileName, lpExtension uintptr, nBufferLength uint32, lpBuffer, lpFilePart uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpExtension=%v nBufferLength=%v lpFilePart=%v, (%v:)", t, lpExtension, nBufferLength, lpFilePart, origin(2))
	}
	r0, _, err := procSearchPathW.Call(lpPath, lpFileName, lpExtension, uintptr(nBufferLength), lpBuffer, lpFilePart)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

func XGetShortPathNameW(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// BOOL GetExitCodeProcess(
//
//	HANDLE  hProcess,
//	LPDWORD lpExitCode
//
// );
func XGetExitCodeProcess(t *TLS, hProcess, lpExitCode uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpExitCode=%v, (%v:)", t, lpExitCode, origin(2))
	}
	r0, _, err := procGetExitCodeProcess.Call(hProcess, lpExitCode)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL PeekNamedPipe(
//
//	HANDLE  hNamedPipe,
//	LPVOID  lpBuffer,
//	DWORD   nBufferSize,
//	LPDWORD lpBytesRead,
//	LPDWORD lpTotalBytesAvail,
//	LPDWORD lpBytesLeftThisMessage
//
// );
func XPeekNamedPipe(t *TLS, hNamedPipe, lpBuffer uintptr, nBufferSize uint32, lpBytesRead, lpTotalBytesAvail, lpBytesLeftThisMessage uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpBuffer=%v nBufferSize=%v lpBytesLeftThisMessage=%v, (%v:)", t, lpBuffer, nBufferSize, lpBytesLeftThisMessage, origin(2))
	}
	r0, _, err := procPeekNamedPipe.Call(hNamedPipe, lpBuffer, uintptr(nBufferSize), lpBytesRead, lpTotalBytesAvail, lpBytesLeftThisMessage)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// long _InterlockedExchange(
//
//	long volatile * Target,
//	long Value
//
// );
func X_InterlockedExchange(t *TLS, Target uintptr, Value long) long {
	if __ccgo_strace {
		trc("t=%v Target=%v Value=%v, (%v:)", t, Target, Value, origin(2))
	}
	old := atomic.SwapInt32((*int32)(unsafe.Pointer(Target)), Value)
	return old
}

// BOOL TerminateThread(
//
//	[in, out] HANDLE hThread,
//	[in]      DWORD  dwExitCode
//
// );
func XTerminateThread(t *TLS, hThread uintptr, dwExitCode uint32) int32 {
	if __ccgo_strace {
		trc("t=%v hThread=%v dwExitCode=%v, (%v:)", t, hThread, dwExitCode, origin(2))
	}
	r0, _, err := procTerminateThread.Call(hThread, uintptr(dwExitCode))
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL GetComputerNameW(
//
//	LPWSTR  lpBuffer,
//	LPDWORD nSize
//
// );
func XGetComputerNameW(t *TLS, lpBuffer, nSize uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v nSize=%v, (%v:)", t, nSize, origin(2))
	}
	die(t, "")
	panic(todo(""))
}

func Xgethostname(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

var procSendMessageW = moduser32.NewProc("SendMessageW")

// __attribute__((dllimport)) LRESULT SendMessageW(HWND hWnd,UINT Msg,WPARAM wParam,LPARAM lParam);
func XSendMessageW(tls *TLS, _hWnd THWND, _Msg TUINT, _wParam TWPARAM, _lParam TLPARAM) (r TLRESULT) {
	if __ccgo_strace {
		trc("hWnd=%+v Msg=%+v wParam=%+v lParam=%+v", _hWnd, _Msg, _wParam, _lParam)
		defer func() { trc(`XSendMessageW->%+v`, r) }()
	}
	r0, _, _ := procSendMessageW.Call(_hWnd, uintptr(_Msg), uintptr(_wParam), uintptr(_lParam))
	return TLRESULT(r0)
}

func XWSAGetLastError(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func Xclosesocket(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func XWspiapiFreeAddrInfo(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func XWspiapiGetNameInfo(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

// func XIN6_ADDR_EQUAL(t *TLS, _ ...interface{}) int32 {
// 	die(tls, "");panic(todo(""))
// }
//
// func X__ccgo_in6addr_anyp(t *TLS, _ ...interface{}) int32 {
// 	die(tls, "");panic(todo(""))
// }
//
// func XIN6_IS_ADDR_V4MAPPED(t *TLS, _ ...interface{}) int32 {
// 	die(tls, "");panic(todo(""))
// }

func XSetHandleInformation(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func Xioctlsocket(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func XWSAAsyncSelect(t *TLS, _ ...interface{}) int32 {
	die(t, "")
	panic(todo(""))
}

func Xinet_ntoa(t *TLS, _ ...interface{}) uintptr {
	die(t, "")
	panic(todo(""))
}

func X_controlfp(t *TLS, _ ...interface{}) uint32 {
	die(t, "")
	panic(todo(""))
}

// BOOL QueryPerformanceFrequency(
//
//	LARGE_INTEGER *lpFrequency
//
// );
func XQueryPerformanceFrequency(t *TLS, lpFrequency uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpFrequency=%v, (%v:)", t, lpFrequency, origin(2))
	}

	r1, _, err := procQueryPerformanceFrequency.Call(lpFrequency)
	if r1 == 0 {
		t.setErrno(err)
	}
	return int32(r1)
}

// func inDST(t gotime.Time) bool {
//
// 	jan1st := gotime.Date(t.Year(), 1, 1, 0, 0, 0, 0, t.Location()) // January 1st is always outside DST window
//
// 	_, off1 := t.Zone()
// 	_, off2 := jan1st.Zone()
//
// 	return off1 != off2
// }
//
// // void _ftime( struct _timeb *timeptr );
// func X_ftime(t *TLS, timeptr uintptr) {
// 	if __ccgo_strace {
// 		trc("t=%v timeptr=%v, (%v:)", t, timeptr, origin(2))
// 	}
// 	var tm = gotime.Now()
// 	var tPtr = (*time.X__timeb64)(unsafe.Pointer(timeptr))
// 	tPtr.Ftime = tm.Unix()
// 	tPtr.Fmillitm = uint16(gotime.Duration(tm.Nanosecond()) / gotime.Millisecond)
// 	if inDST(tm) {
// 		tPtr.Fdstflag = 1
// 	}
// 	_, offset := tm.Zone()
// 	tPtr.Ftimezone = int16(offset)
// }

var procDdeCreateStringHandleW = moduser32.NewProc("DdeCreateStringHandleW")

// HSZ DdeCreateStringHandleW(DWORD idInst,LPCWSTR psz,int iCodePage);
func XDdeCreateStringHandleW(tls *TLS, _idInst TDWORD, _psz TLPCWSTR, _iCodePage int32) (r THSZ) {
	if __ccgo_strace {
		trc("idInst=%+v psz=%+v iCodePage=%+v", _idInst, _psz, _iCodePage)
		defer func() { trc(`XDdeCreateStringHandleW->%+v`, r) }()
	}
	r0, _, _ := procDdeCreateStringHandleW.Call(uintptr(_idInst), _psz, uintptr(_iCodePage))
	return THSZ(r0)
}

var procDdeNameService = moduser32.NewProc("DdeNameService")

// HDDEDATA DdeNameService(DWORD idInst,HSZ hsz1,HSZ hsz2,UINT afCmd);
func XDdeNameService(tls *TLS, _idInst TDWORD, _hsz1 THSZ, _hsz2 THSZ, _afCmd TUINT) (r THDDEDATA) {
	if __ccgo_strace {
		trc("idInst=%+v hsz1=%+v hsz2=%+v afCmd=%+v", _idInst, _hsz1, _hsz2, _afCmd)
		defer func() { trc(`XDdeNameService->%+v`, r) }()
	}
	r0, _, _ := procDdeNameService.Call(uintptr(_idInst), _hsz1, _hsz2, uintptr(_afCmd))
	return THDDEDATA(r0)
}

// int _snwprintf(wchar_t *buffer, size_t count, wchar_t *format, ...);
func X_snwprintf(tls *TLS, buffer uintptr, count size_t, format uintptr, va uintptr) int32 {
	fmt := goWideString(format)
	bp := tls.Alloc(len(fmt))
	defer tls.Free(len(fmt))
	copy(unsafe.Slice((*byte)(unsafe.Pointer(bp)), len(fmt)), fmt)
	s := printf(bp, va)
	s16 := utf16.Encode([]rune(string(s)))
	switch n := len(s16); {
	case count == 0:
		// nop
	case size_t(n)+1 <= count:
		// ok
	default:
		s16 = s16[:count-1]
	}
	copy(unsafe.Slice((*uint16)(unsafe.Pointer(buffer)), count), s16)
	return int32(len(s16))
}

var procDdeQueryStringW = moduser32.NewProc("DdeQueryStringW")

// DWORD DdeQueryStringW(DWORD idInst,HSZ hsz,LPWSTR psz,DWORD cchMax,int iCodePage);
func XDdeQueryStringW(tls *TLS, _idInst TDWORD, _hsz THSZ, _psz TLPWSTR, _cchMax TDWORD, _iCodePage int32) (r TDWORD) {
	if __ccgo_strace {
		trc("idInst=%+v hsz=%+v psz=%+v cchMax=%+v iCodePage=%+v", _idInst, _hsz, _psz, _cchMax, _iCodePage)
		defer func() { trc(`XDdeQueryStringW->%+v`, r) }()
	}
	r0, _, _ := procDdeQueryStringW.Call(uintptr(_idInst), _hsz, _psz, uintptr(_cchMax), uintptr(_iCodePage))
	return TDWORD(r0)
}

type THSZ = uintptr

// int _wcsicmp(
//
//	const wchar_t *string1,
//	const wchar_t *string2
//
// );
func X_wcsicmp(t *TLS, string1, string2 uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v string2=%v, (%v:)", t, string2, origin(2))
	}
	return Xwcsicmp(t, string1, string2)
}

var procDdeCreateDataHandle = moduser32.NewProc("DdeCreateDataHandle")

// HDDEDATA DdeCreateDataHandle(DWORD idInst,LPBYTE pSrc,DWORD cb,DWORD cbOff,HSZ hszItem,UINT wFmt,UINT afCmd);
func XDdeCreateDataHandle(tls *TLS, _idInst TDWORD, _pSrc TLPBYTE, _cb TDWORD, _cbOff TDWORD, _hszItem THSZ, _wFmt TUINT, _afCmd TUINT) (r THDDEDATA) {
	if __ccgo_strace {
		trc("idInst=%+v pSrc=%+v cb=%+v cbOff=%+v hszItem=%+v wFmt=%+v afCmd=%+v", _idInst, _pSrc, _cb, _cbOff, _hszItem, _wFmt, _afCmd)
		defer func() { trc(`XDdeCreateDataHandle->%+v`, r) }()
	}
	r0, _, _ := procDdeCreateDataHandle.Call(uintptr(_idInst), _pSrc, uintptr(_cb), uintptr(_cbOff), _hszItem, uintptr(_wFmt), uintptr(_afCmd))
	return THDDEDATA(r0)
}

var procDdeAccessData = moduser32.NewProc("DdeAccessData")

// LPBYTE DdeAccessData(HDDEDATA hData,LPDWORD pcbDataSize);
func XDdeAccessData(tls *TLS, _hData THDDEDATA, _pcbDataSize TLPDWORD) (r TLPBYTE) {
	if __ccgo_strace {
		trc("hData=%+v pcbDataSize=%+v", _hData, _pcbDataSize)
		defer func() { trc(`XDdeAccessData->%+v`, r) }()
	}
	r0, _, _ := procDdeAccessData.Call(_hData, _pcbDataSize)
	return TLPBYTE(r0)
}

var procDdeUnaccessData = moduser32.NewProc("DdeUnaccessData")

// WINBOOL DdeUnaccessData(HDDEDATA hData);
func XDdeUnaccessData(tls *TLS, _hData THDDEDATA) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hData=%+v", _hData)
		defer func() { trc(`XDdeUnaccessData->%+v`, r) }()
	}
	r0, _, _ := procDdeUnaccessData.Call(_hData)
	return TWINBOOL(r0)
}

var procDdeUninitialize = moduser32.NewProc("DdeUninitialize")

// WINBOOL DdeUninitialize(DWORD idInst);
func XDdeUninitialize(tls *TLS, _idInst TDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("idInst=%+v", _idInst)
		defer func() { trc(`XDdeUninitialize->%+v`, r) }()
	}
	r0, _, _ := procDdeUninitialize.Call(uintptr(_idInst))
	return TWINBOOL(r0)
}

var procDdeConnect = moduser32.NewProc("DdeConnect")

// HCONV DdeConnect(DWORD idInst,HSZ hszService,HSZ hszTopic,PCONVCONTEXT pCC);
func XDdeConnect(tls *TLS, _idInst TDWORD, _hszService THSZ, _hszTopic THSZ, _pCC TPCONVCONTEXT) (r THCONV) {
	if __ccgo_strace {
		trc("idInst=%+v hszService=%+v hszTopic=%+v pCC=%+v", _idInst, _hszService, _hszTopic, _pCC)
		defer func() { trc(`XDdeConnect->%+v`, r) }()
	}
	r0, _, _ := procDdeConnect.Call(uintptr(_idInst), _hszService, _hszTopic, _pCC)
	return THCONV(r0)
}

type TPCONVCONTEXT = uintptr

var procDdeFreeStringHandle = moduser32.NewProc("DdeFreeStringHandle")

// WINBOOL DdeFreeStringHandle(DWORD idInst,HSZ hsz);
func XDdeFreeStringHandle(tls *TLS, _idInst TDWORD, _hsz THSZ) (r TWINBOOL) {
	if __ccgo_strace {
		trc("idInst=%+v hsz=%+v", _idInst, _hsz)
		defer func() { trc(`XDdeFreeStringHandle->%+v`, r) }()
	}
	r0, _, _ := procDdeFreeStringHandle.Call(uintptr(_idInst), _hsz)
	return TWINBOOL(r0)
}

var procGlobalGetAtomNameW = modkernel32.NewProc("GlobalGetAtomNameW")

// __attribute__((dllimport)) UINT GlobalGetAtomNameW (ATOM nAtom, LPWSTR lpBuffer, int nSize);
func XGlobalGetAtomNameW(tls *TLS, _nAtom TATOM, _lpBuffer TLPWSTR, _nSize int32) (r TUINT) {
	if __ccgo_strace {
		trc("nAtom=%+v lpBuffer=%+v nSize=%+v", _nAtom, _lpBuffer, _nSize)
		defer func() { trc(`XGlobalGetAtomNameW->%+v`, r) }()
	}
	r0, _, err := procGlobalGetAtomNameW.Call(uintptr(_nAtom), _lpBuffer, uintptr(_nSize))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TUINT(r0)
}

var procGlobalAddAtomW = modkernel32.NewProc("GlobalAddAtomW")

// __attribute__((dllimport)) ATOM GlobalAddAtomW (LPCWSTR lpString);
func XGlobalAddAtomW(tls *TLS, _lpString TLPCWSTR) (r TATOM) {
	if __ccgo_strace {
		trc("lpString=%+v", _lpString)
		defer func() { trc(`XGlobalAddAtomW->%+v`, r) }()
	}
	r0, _, err := procGlobalAddAtomW.Call(_lpString)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TATOM(r0)
}

var procIsWindow = moduser32.NewProc("IsWindow")

// __attribute__((dllimport)) WINBOOL IsWindow(HWND hWnd);
func XIsWindow(tls *TLS, _hWnd THWND) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XIsWindow->%+v`, r) }()
	}
	r0, _, _ := procIsWindow.Call(_hWnd)
	return TWINBOOL(r0)
}

var procGlobalDeleteAtom = modkernel32.NewProc("GlobalDeleteAtom")

// __attribute__((dllimport)) ATOM GlobalDeleteAtom (ATOM nAtom);
func XGlobalDeleteAtom(tls *TLS, _nAtom TATOM) (r TATOM) {
	if __ccgo_strace {
		trc("nAtom=%+v", _nAtom)
		defer func() { trc(`XGlobalDeleteAtom->%+v`, r) }()
	}
	r0, _, err := procGlobalDeleteAtom.Call(uintptr(_nAtom))
	if err != nil {
		tls.setErrno(err)
	}
	return TATOM(r0)
}

var procDdeGetLastError = moduser32.NewProc("DdeGetLastError")

// UINT DdeGetLastError(DWORD idInst);
func XDdeGetLastError(tls *TLS, _idInst TDWORD) (r TUINT) {
	r0, _, _ := procDdeGetLastError.Call(uintptr(_idInst))
	return TUINT(r0)
}

var procDdeClientTransaction = moduser32.NewProc("DdeClientTransaction")

// HDDEDATA DdeClientTransaction(LPBYTE pData,DWORD cbData,HCONV hConv,HSZ hszItem,UINT wFmt,UINT wType,DWORD dwTimeout,LPDWORD pdwResult);
func XDdeClientTransaction(tls *TLS, _pData TLPBYTE, _cbData TDWORD, _hConv THCONV, _hszItem THSZ, _wFmt TUINT, _wType TUINT, _dwTimeout TDWORD, _pdwResult TLPDWORD) (r THDDEDATA) {
	if __ccgo_strace {
		trc("pData=%+v cbData=%+v hConv=%+v hszItem=%+v wFmt=%+v wType=%+v dwTimeout=%+v pdwResult=%+v", _pData, _cbData, _hConv, _hszItem, _wFmt, _wType, _dwTimeout, _pdwResult)
		defer func() { trc(`XDdeClientTransaction->%+v`, r) }()
	}
	r0, _, _ := procDdeClientTransaction.Call(_pData, uintptr(_cbData), _hConv, _hszItem, uintptr(_wFmt), uintptr(_wType), uintptr(_dwTimeout), _pdwResult)
	return THDDEDATA(r0)
}

var procDdeAbandonTransaction = moduser32.NewProc("DdeAbandonTransaction")

// WINBOOL DdeAbandonTransaction(DWORD idInst,HCONV hConv,DWORD idTransaction);
func XDdeAbandonTransaction(tls *TLS, _idInst TDWORD, _hConv THCONV, _idTransaction TDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("idInst=%+v hConv=%+v idTransaction=%+v", _idInst, _hConv, _idTransaction)
		defer func() { trc(`XDdeAbandonTransaction->%+v`, r) }()
	}
	r0, _, _ := procDdeAbandonTransaction.Call(uintptr(_idInst), _hConv, uintptr(_idTransaction))
	return TWINBOOL(r0)
}

var procDdeFreeDataHandle = moduser32.NewProc("DdeFreeDataHandle")

// WINBOOL DdeFreeDataHandle(HDDEDATA hData);
func XDdeFreeDataHandle(tls *TLS, _hData THDDEDATA) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hData=%+v", _hData)
		defer func() { trc(`XDdeFreeDataHandle->%+v`, r) }()
	}
	r0, _, _ := procDdeFreeDataHandle.Call(_hData)
	return TWINBOOL(r0)
}

var procDdeGetData = moduser32.NewProc("DdeGetData")

// DWORD DdeGetData(HDDEDATA hData,LPBYTE pDst,DWORD cbMax,DWORD cbOff);
func XDdeGetData(tls *TLS, _hData THDDEDATA, _pDst TLPBYTE, _cbMax TDWORD, _cbOff TDWORD) (r TDWORD) {
	if __ccgo_strace {
		trc("hData=%+v pDst=%+v cbMax=%+v cbOff=%+v", _hData, _pDst, _cbMax, _cbOff)
		defer func() { trc(`XDdeGetData->%+v`, r) }()
	}
	r0, _, _ := procDdeGetData.Call(_hData, _pDst, uintptr(_cbMax), uintptr(_cbOff))
	return TDWORD(r0)
}

type THDDEDATA = uintptr

var procDdeDisconnect = moduser32.NewProc("DdeDisconnect")

// WINBOOL DdeDisconnect(HCONV hConv);
func XDdeDisconnect(tls *TLS, _hConv THCONV) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hConv=%+v", _hConv)
		defer func() { trc(`XDdeDisconnect->%+v`, r) }()
	}
	r0, _, _ := procDdeDisconnect.Call(_hConv)
	return TWINBOOL(r0)
}

type THCONV = uintptr

var procRegCloseKey = modadvapi32.NewProc("RegCloseKey")

// __attribute__((dllimport)) LONG RegCloseKey(HKEY hKey);
func XRegCloseKey(tls *TLS, _hKey THKEY) (r TLONG) {
	if __ccgo_strace {
		trc("hKey=%+v", _hKey)
		defer func() { trc(`XRegCloseKey->%+v`, r) }()
	}
	r0, _, _ := procRegCloseKey.Call(_hKey)
	return TLONG(r0)
}

var procRegDeleteValueW = modadvapi32.NewProc("RegDeleteValueW")

// __attribute__((dllimport)) LONG RegDeleteValueW(HKEY hKey,LPCWSTR lpValueName);
func XRegDeleteValueW(tls *TLS, _hKey THKEY, _lpValueName TLPCWSTR) (r TLONG) {
	if __ccgo_strace {
		trc("hKey=%+v lpValueName=%+v", _hKey, _lpValueName)
		defer func() { trc(`XRegDeleteValueW->%+v`, r) }()
	}
	r0, _, _ := procRegDeleteValueW.Call(_hKey, _lpValueName)
	return TLONG(r0)
}

var procRegEnumKeyExW = modadvapi32.NewProc("RegEnumKeyExW")

// __attribute__((dllimport)) LONG RegEnumKeyExW(HKEY hKey,DWORD dwIndex,LPWSTR lpName,LPDWORD lpcchName,LPDWORD lpReserved,LPWSTR lpClass,LPDWORD lpcchClass,PFILETIME lpftLastWriteTime);
func XRegEnumKeyExW(tls *TLS, _hKey THKEY, _dwIndex TDWORD, _lpName TLPWSTR, _lpcchName TLPDWORD, _lpReserved TLPDWORD, _lpClass TLPWSTR, _lpcchClass TLPDWORD, _lpftLastWriteTime TPFILETIME) (r TLONG) {
	if __ccgo_strace {
		trc("hKey=%+v dwIndex=%+v lpName=%+v lpcchName=%+v lpReserved=%+v lpClass=%+v lpcchClass=%+v lpftLastWriteTime=%+v", _hKey, _dwIndex, _lpName, _lpcchName, _lpReserved, _lpClass, _lpcchClass, _lpftLastWriteTime)
		defer func() { trc(`XRegEnumKeyExW->%+v`, r) }()
	}
	r0, _, _ := procRegEnumKeyExW.Call(_hKey, uintptr(_dwIndex), _lpName, _lpcchName, _lpReserved, _lpClass, _lpcchClass, _lpftLastWriteTime)
	return TLONG(r0)
}

type TPFILETIME = uintptr

var procRegQueryValueExW = modadvapi32.NewProc("RegQueryValueExW")

// __attribute__((dllimport)) LONG RegQueryValueExW(HKEY hKey,LPCWSTR lpValueName,LPDWORD lpReserved,LPDWORD lpType,LPBYTE lpData,LPDWORD lpcbData);
func XRegQueryValueExW(tls *TLS, _hKey THKEY, _lpValueName TLPCWSTR, _lpReserved TLPDWORD, _lpType TLPDWORD, _lpData TLPBYTE, _lpcbData TLPDWORD) (r TLONG) {
	if __ccgo_strace {
		trc("hKey=%+v lpValueName=%+v lpReserved=%+v lpType=%+v lpData=%+v lpcbData=%+v", _hKey, _lpValueName, _lpReserved, _lpType, _lpData, _lpcbData)
		defer func() { trc(`XRegQueryValueExW->%+v`, r) }()
	}
	r0, _, _ := procRegQueryValueExW.Call(_hKey, _lpValueName, _lpReserved, _lpType, _lpData, _lpcbData)
	return TLONG(r0)
}

var procRegEnumValueW = modadvapi32.NewProc("RegEnumValueW")

// __attribute__((dllimport)) LONG RegEnumValueW(HKEY hKey,DWORD dwIndex,LPWSTR lpValueName,LPDWORD lpcchValueName,LPDWORD lpReserved,LPDWORD lpType,LPBYTE lpData,LPDWORD lpcbData);
func XRegEnumValueW(tls *TLS, _hKey THKEY, _dwIndex TDWORD, _lpValueName TLPWSTR, _lpcchValueName TLPDWORD, _lpReserved TLPDWORD, _lpType TLPDWORD, _lpData TLPBYTE, _lpcbData TLPDWORD) (r TLONG) {
	if __ccgo_strace {
		trc("hKey=%+v dwIndex=%+v lpValueName=%+v lpcchValueName=%+v lpReserved=%+v lpType=%+v lpData=%+v lpcbData=%+v", _hKey, _dwIndex, _lpValueName, _lpcchValueName, _lpReserved, _lpType, _lpData, _lpcbData)
		defer func() { trc(`XRegEnumValueW->%+v`, r) }()
	}
	r0, _, _ := procRegEnumValueW.Call(_hKey, uintptr(_dwIndex), _lpValueName, _lpcchValueName, _lpReserved, _lpType, _lpData, _lpcbData)
	return TLONG(r0)
}

type TLPBYTE = uintptr

var procRegConnectRegistryW = modadvapi32.NewProc("RegConnectRegistryW")

// __attribute__((dllimport)) LONG RegConnectRegistryW(LPCWSTR lpMachineName,HKEY hKey,PHKEY phkResult);
func XRegConnectRegistryW(tls *TLS, _lpMachineName TLPCWSTR, _hKey THKEY, _phkResult TPHKEY) (r TLONG) {
	if __ccgo_strace {
		trc("lpMachineName=%+v hKey=%+v phkResult=%+v", _lpMachineName, _hKey, _phkResult)
		defer func() { trc(`XRegConnectRegistryW->%+v`, r) }()
	}
	r0, _, _ := procRegConnectRegistryW.Call(_lpMachineName, _hKey, _phkResult)
	return TLONG(r0)
}

var procRegCreateKeyExW = modadvapi32.NewProc("RegCreateKeyExW")

// __attribute__((dllimport)) LONG RegCreateKeyExW(HKEY hKey,LPCWSTR lpSubKey,DWORD Reserved,LPWSTR lpClass,DWORD dwOptions,REGSAM samDesired,LPSECURITY_ATTRIBUTES lpSecurityAttributes,PHKEY phkResult,LPDWORD lpdwDisposition);
func XRegCreateKeyExW(tls *TLS, _hKey THKEY, _lpSubKey TLPCWSTR, _Reserved TDWORD, _lpClass TLPWSTR, _dwOptions TDWORD, _samDesired TREGSAM, _lpSecurityAttributes TLPSECURITY_ATTRIBUTES, _phkResult TPHKEY, _lpdwDisposition TLPDWORD) (r TLONG) {
	if __ccgo_strace {
		trc("hKey=%+v lpSubKey=%+v Reserved=%+v lpClass=%+v dwOptions=%+v samDesired=%+v lpSecurityAttributes=%+v phkResult=%+v lpdwDisposition=%+v", _hKey, _lpSubKey, _Reserved, _lpClass, _dwOptions, _samDesired, _lpSecurityAttributes, _phkResult, _lpdwDisposition)
		defer func() { trc(`XRegCreateKeyExW->%+v`, r) }()
	}
	r0, _, _ := procRegCreateKeyExW.Call(_hKey, _lpSubKey, uintptr(_Reserved), _lpClass, uintptr(_dwOptions), uintptr(_samDesired), _lpSecurityAttributes, _phkResult, _lpdwDisposition)
	return TLONG(r0)
}

var procRegOpenKeyExW = modadvapi32.NewProc("RegOpenKeyExW")

// __attribute__((dllimport)) LONG RegOpenKeyExW(HKEY hKey,LPCWSTR lpSubKey,DWORD ulOptions,REGSAM samDesired,PHKEY phkResult);
func XRegOpenKeyExW(tls *TLS, _hKey THKEY, _lpSubKey TLPCWSTR, _ulOptions TDWORD, _samDesired TREGSAM, _phkResult TPHKEY) (r TLONG) {
	if __ccgo_strace {
		trc("hKey=%+v lpSubKey=%+v ulOptions=%+v samDesired=%+v phkResult=%+v", _hKey, _lpSubKey, _ulOptions, _samDesired, _phkResult)
		defer func() { trc(`XRegOpenKeyExW->%+v`, r) }()
	}
	r0, _, _ := procRegOpenKeyExW.Call(_hKey, _lpSubKey, uintptr(_ulOptions), uintptr(_samDesired), _phkResult)
	return TLONG(r0)
}

type TREGSAM = uint32

type TPHKEY = uintptr

var procRegDeleteKeyW = modadvapi32.NewProc("RegDeleteKeyW")

// __attribute__((dllimport)) LONG RegDeleteKeyW(HKEY hKey,LPCWSTR lpSubKey);
func XRegDeleteKeyW(tls *TLS, _hKey THKEY, _lpSubKey TLPCWSTR) (r TLONG) {
	if __ccgo_strace {
		trc("hKey=%+v lpSubKey=%+v", _hKey, _lpSubKey)
		defer func() { trc(`XRegDeleteKeyW->%+v`, r) }()
	}
	r0, _, _ := procRegDeleteKeyW.Call(_hKey, _lpSubKey)
	return TLONG(r0)
}

var procRegSetValueExW = modadvapi32.NewProc("RegSetValueExW")

// __attribute__((dllimport)) LONG RegSetValueExW(HKEY hKey,LPCWSTR lpValueName,DWORD Reserved,DWORD dwType, const BYTE *lpData,DWORD cbData);
func XRegSetValueExW(tls *TLS, _hKey THKEY, _lpValueName TLPCWSTR, _Reserved TDWORD, _dwType TDWORD, _lpData uintptr, _cbData TDWORD) (r TLONG) {
	if __ccgo_strace {
		trc("hKey=%+v lpValueName=%+v Reserved=%+v dwType=%+v lpData=%+v cbData=%+v", _hKey, _lpValueName, _Reserved, _dwType, _lpData, _cbData)
		defer func() { trc(`XRegSetValueExW->%+v`, r) }()
	}
	r0, _, _ := procRegSetValueExW.Call(_hKey, _lpValueName, uintptr(_Reserved), uintptr(_dwType), _lpData, uintptr(_cbData))
	return TLONG(r0)
}

type THKEY = uintptr

// // int _vsnwprintf(
// //
// //	wchar_t *buffer,
// //	size_t count,
// //	const wchar_t *format,
// //	va_list argptr
// //
// // );
// func X__mingw_vsnwprintf(t *TLS, buffer uintptr, count types.Size_t, format, va uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v buffer=%v count=%v va=%v, (%v:)", t, buffer, count, va, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int vprintf(const char *format, va_list ap);
//
// func X__mingw_vprintf(t *TLS, s, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ap=%v, (%v:)", t, ap, origin(2))
// 	}
// 	return Xvprintf(t, s, ap)
// }
//
// // int vfscanf(FILE * restrict stream, const char * restrict format, va_list arg);
// func X__mingw_vfscanf(t *TLS, stream, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ap=%v, (%v:)", t, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int vsscanf(const char *str, const char *format, va_list ap);
// func X__mingw_vsscanf(t *TLS, str, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ap=%v, (%v:)", t, ap, origin(2))
// 	}
// 	return Xsscanf(t, str, format, ap)
// }
//
// // int vfprintf(FILE * restrict stream, const char * restrict format, va_list arg);
// func X__mingw_vfprintf(t *TLS, f uintptr, format, va uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v f=%v va=%v, (%v:)", t, f, va, origin(2))
// 	}
// 	return Xvfprintf(t, f, format, va)
// }
//
// // int vsprintf(char * restrict s, const char * restrict format, va_list arg);
// func X__mingw_vsprintf(t *TLS, s, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ap=%v, (%v:)", t, ap, origin(2))
// 	}
// 	return Xvsprintf(t, s, format, ap)
// }
//
// // int vsnprintf(char *str, size_t size, const char *format, va_list ap);
// func X__mingw_vsnprintf(t *TLS, str uintptr, size types.Size_t, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v str=%v size=%v ap=%v, (%v:)", t, str, size, ap, origin(2))
// 	}
// 	return Xvsnprintf(t, str, size, format, ap)
// }
//
// // int putchar(int char)
// func X_putchar(t *TLS, c int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v c=%v, (%v:)", t, c, origin(2))
// 	}
// 	if _, err := fwrite(unistd.STDOUT_FILENO, []byte{byte(c)}); err != nil {
// 		return -1
// 	}
// 	return int32(byte(c))
// }
//
// // int vfwscanf(FILE *stream, const wchar_t *format, va_list argptr;);
// func X__mingw_vfwscanf(t *TLS, stream uintptr, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v stream=%v ap=%v, (%v:)", t, stream, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int vswscanf(const wchar_t *buffer, const wchar_t *format, va_list arglist);
// func X__mingw_vswscanf(t *TLS, stream uintptr, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v stream=%v ap=%v, (%v:)", t, stream, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int vfwprintf(FILE * restrict stream, const wchar_t * restrict format, va_list arg);
// func X__mingw_vfwprintf(t *TLS, stream, format, ap uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v ap=%v, (%v:)", t, ap, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int putchar(int c);
// func Xputchar(t *TLS, c int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v c=%v, (%v:)", t, c, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // void _assert(
// //
// //	char const* message,
// //	char const* filename,
// //	unsigned line
// //
// // );
// func X_assert(t *TLS, message, filename uintptr, line uint32) {
// 	if __ccgo_strace {
// 		trc("t=%v filename=%v line=%v, (%v:)", t, filename, line, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // char *strdup(const char *s);
// func X_strdup(t *TLS, s uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v s=%v, (%v:)", t, s, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int _access(
// //
// //	const char *path,
// //	int mode
// //
// // );
// func X_access(t *TLS, pathname uintptr, mode int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v pathname=%v mode=%v, (%v:)", t, pathname, mode, origin(2))
// 	}
//
// 	var path = GoString(pathname)
//
// 	info, err := os.Stat(path)
// 	if err != nil {
// 		// doesn't exist
// 		return errno.ENOENT
// 	}
//
// 	switch mode {
// 	case 0:
// 		// exists
// 		return 0
// 	case 2:
// 		// write-only
// 		// Check if the user bit is enabled in file permission
// 		if info.Mode().Perm()&(1<<(uint(7))) == 1 {
// 			// write-able
// 			return 0
// 		}
// 	case 4:
// 		// read-only
// 		// Check if the user bit is enabled in file permission
// 		if info.Mode().Perm()&(1<<(uint(7))) == 0 {
// 			// not set, so read-only
// 			return 0
// 		}
// 	case 6:
// 		// r/w
// 		if info.Mode().Perm()&(1<<(uint(7))) == 1 {
// 			// write-able
// 			return 0
// 		}
// 	}
//
// 	return errno.EACCES
//
// }
//
// // BOOL WINAPI SetConsoleCtrlHandler(
// //
// //	_In_opt_ PHANDLER_ROUTINE HandlerRoutine,
// //	_In_     BOOL             Add
// //
// // );
// func XSetConsoleCtrlHandler(t *TLS, HandlerRoutine uintptr, Add int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v HandlerRoutine=%v Add=%v, (%v:)", t, HandlerRoutine, Add, origin(2))
// 	}
//
// 	//var fcc = &struct {
// 	//	f func(*TLS, uint32) int32
// 	//}{}
// 	//fcc = (*struct{ f func(*TLS, uint32) int32 })(unsafe.Pointer(HandlerRoutine))
// 	//var hdlr = fcc.f
// 	//
// 	//_, _, err := procSetConsoleCtrlHandler.Call(
// 	//windows.NewCallback(func(controlType uint) uint {
// 	//		return uint( hdlr(t, uint32(controlType)) )
// 	//	}), 1)
// 	//
// 	//if err != nil {
// 	//	die(tls, "");panic("failed: SetConsoleCtrlHandler")
// 	//}
//
// 	return 0
// }
//
// // DebugBreak
// func XDebugBreak(t *TLS) {
// 	if __ccgo_strace {
// 		trc("t=%v, (%v:)", t, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// int _isatty( int fd );
func X_isatty(t *TLS, fd int32) int32 {
	if __ccgo_strace {
		trc("t=%v fd=%v, (%v:)", t, fd, origin(2))
	}

	f, ok := fdToFile(fd)
	if !ok {
		t.setErrno(errno.EBADF)
		return 0
	}

	if fd == unistd.STDOUT_FILENO ||
		fd == unistd.STDIN_FILENO ||
		fd == unistd.STDERR_FILENO {
		var mode uint32
		err := windows.GetConsoleMode(f.Handle, &mode)
		if err != nil {
			t.setErrno(errno.EINVAL)
			return 0
		}
		// is console
		return 1
	}

	return 0
}

// // BOOL WINAPI SetConsoleTextAttribute(
// //
// //	_In_ HANDLE hConsoleOutput,
// //	_In_ WORD   wAttributes
// //
// // );
// func XSetConsoleTextAttribute(t *TLS, hConsoleOutput uintptr, wAttributes uint16) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v hConsoleOutput=%v wAttributes=%v, (%v:)", t, hConsoleOutput, wAttributes, origin(2))
// 	}
// 	r1, _, _ := procSetConsoleTextAttribute.Call(hConsoleOutput, uintptr(wAttributes))
// 	return int32(r1)
// }
// // FILE *_popen(
// //
// //	const char *command,
// //	const char *mode
// //
// // );
// func X_popen(t *TLS, command, mode uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v mode=%v, (%v:)", t, mode, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int _wunlink(
// //
// //	const wchar_t *filename
// //
// // );
// func X_wunlink(t *TLS, filename uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v filename=%v, (%v:)", t, filename, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// func Xclosedir(tls *TLS, dir uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("tls=%v dir=%v, (%v:)", tls, dir, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// func Xopendir(tls *TLS, name uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("tls=%v name=%v, (%v:)", tls, name, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// func Xreaddir(tls *TLS, dir uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("tls=%v dir=%v, (%v:)", tls, dir, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int _unlink(
// //
// //	const char *filename
// //
// // );
// func X_unlink(t *TLS, filename uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v filename=%v, (%v:)", t, filename, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int pclose(FILE *stream);
// func X_pclose(t *TLS, stream uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// int setmode (int fd, int mode);
func Xsetmode(t *TLS, fd, mode int32) int32 {
	if __ccgo_strace {
		trc("t=%v mode=%v, (%v:)", t, mode, origin(2))
	}
	return X_setmode(t, fd, mode)
}

// int _setmode (int fd, int mode);
func X_setmode(t *TLS, fd, mode int32) int32 {
	if __ccgo_strace {
		trc("t=%v mode=%v, (%v:)", t, mode, origin(2))
	}

	_, ok := fdToFile(fd)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}

	// we're always in binary mode.
	// at least for now.

	if mode == fcntl.O_BINARY {
		return fcntl.O_BINARY
	} else {
		t.setErrno(errno.EINVAL)
		return -1
	}
}

// // int _mkdir(const char *dirname);
// func X_mkdir(t *TLS, dirname uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v dirname=%v, (%v:)", t, dirname, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int _chmod( const char *filename, int pmode );
// func X_chmod(t *TLS, filename uintptr, pmode int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v filename=%v pmode=%v, (%v:)", t, filename, pmode, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // int _fileno(FILE *stream);
// func X_fileno(t *TLS, stream uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
// 	}
// 	f, ok := winGetObject(stream).(*file)
// 	if !ok {
// 		t.setErrno(errno.EBADF)
// 		return -1
// 	}
// 	return f._fd
// }
//
// // void rewind(FILE *stream);
// func Xrewind(t *TLS, stream uintptr) {
// 	if __ccgo_strace {
// 		trc("t=%v stream=%v, (%v:)", t, stream, origin(2))
// 	}
// 	Xfseek(t, stream, 0, unistd.SEEK_SET)
// }
//
// // __atomic_load_n
// func X__atomic_load_n(t *TLS) {
// 	if __ccgo_strace {
// 		trc("t=%v, (%v:)", t, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // __atomic_store_n
// func X__atomic_store_n(t *TLS, _ ...interface{}) int32 {
// 	die(tls, "");panic(todo(""))
// }
//
// // __builtin_add_overflow
// func X__builtin_add_overflow(t *TLS) {
// 	if __ccgo_strace {
// 		trc("t=%v, (%v:)", t, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // __builtin_mul_overflow
// func X__builtin_mul_overflow(t *TLS) {
// 	if __ccgo_strace {
// 		trc("t=%v, (%v:)", t, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// // __builtin_sub_overflow
// func X__builtin_sub_overflow(t *TLS) {
// 	if __ccgo_strace {
// 		trc("t=%v, (%v:)", t, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }
//
// func goWideBytes(p uintptr, n int) []uint16 {
// 	b := GoBytes(p, 2*n)
// 	var w []uint16
// 	for i := 0; i < len(b); i += 2 {
// 		w = append(w, *(*uint16)(unsafe.Pointer(&b[i])))
// 	}
// 	return w
// }

// This version does include the zero terminator in the returned Go string.
func goWideString(p uintptr) string {
	if p == 0 {
		return ""
	}
	var w []uint16
	var raw = (*RawMem)(unsafe.Pointer(p))
	var i = 0
	for {
		wc := *(*uint16)(unsafe.Pointer(&raw[i]))
		w = append(w, wc)
		// append until U0000
		if wc == 0 {
			break
		}
		i = i + 2
	}
	s := utf16.Decode(w)
	return string(s)
}

// func goWideStringN(p uintptr, n int) string {
// 	die(tls, "");panic(todo(""))
// }

func GoWideString(p uintptr) string {
	return goWideStringNZ(p)
}

// This version does not include the zero terminator in the returned Go string.
func goWideStringNZ(p uintptr) string {
	if p == 0 {
		return ""
	}

	var w []uint16
	var raw = (*RawMem)(unsafe.Pointer(p))
	var i = 0
	for {
		wc := *(*uint16)(unsafe.Pointer(&raw[i]))
		if wc == 0 {
			break
		}

		w = append(w, wc)
		i = i + 2
	}
	s := utf16.Decode(w)
	return string(s)
}

// LPWSTR GetCommandLineW();
func XGetCommandLineW(t *TLS) uintptr {
	if __ccgo_strace {
		trc("t=%v, (%v:)", t, origin(2))
	}
	return uintptr(unsafe.Pointer(windows.GetCommandLine()))
}

var procAddAccessDeniedAce = modadvapi32.NewProc("AddAccessDeniedAce")

// __attribute__((dllimport)) WINBOOL AddAccessDeniedAce (PACL pAcl, DWORD dwAceRevision, DWORD AccessMask, PSID pSid);
func XAddAccessDeniedAce(tls *TLS, _pAcl TPACL, _dwAceRevision TDWORD, _AccessMask TDWORD, _pSid TPSID) (r TWINBOOL) {
	if __ccgo_strace {
		trc("pAcl=%+v dwAceRevision=%+v AccessMask=%+v pSid=%+v", _pAcl, _dwAceRevision, _AccessMask, _pSid)
		defer func() { trc(`XAddAccessDeniedAce->%+v`, r) }()
	}
	r0, _, err := procAddAccessDeniedAce.Call(_pAcl, uintptr(_dwAceRevision), uintptr(_AccessMask), _pSid)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL AddAce (PACL pAcl, DWORD dwAceRevision, DWORD dwStartingAceIndex, LPVOID pAceList, DWORD nAceListLength);
func XAddAce(tls *TLS, _pAcl uintptr, _dwAceRevision uint32, _dwStartingAceIndex uint32, _pAceList uintptr, _nAceListLength uint32) (r uint32) {
	if __ccgo_strace {
		trc("pAcl=%+v dwAceRevision=%+v dwStartingAceIndex=%+v pAceList=%+v nAceListLength=%+v", _pAcl, _dwAceRevision, _dwStartingAceIndex, _pAceList, _nAceListLength)
		defer func() { trc(`XAddAce->%+v`, r) }()
	}
	r0, _, err := procAddAce.Call(_pAcl, uintptr(_dwAceRevision), uintptr(_dwStartingAceIndex), _pAceList, uintptr(_nAceListLength))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return uint32(r0)
}

// __attribute__((dllimport)) WINBOOL GetAce (PACL pAcl, DWORD dwAceIndex, LPVOID *pAce);
func XGetAce(tls *TLS, _pAcl uintptr, _dwAceIndex uint32, _pAce uintptr) (r int32) {
	if __ccgo_strace {
		trc("pAcl=%+v dwAceIndex=%+v pAce=%+v", _pAcl, _dwAceIndex, _pAce)
		defer func() { trc(`XGetAce->%+v`, r) }()
	}
	r0, _, err := procGetAce.Call(_pAcl, uintptr(_dwAceIndex), _pAce)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// BOOL GetAclInformation(
//
//	PACL                  pAcl,
//	LPVOID                pAclInformation,
//	DWORD                 nAclInformationLength,
//	ACL_INFORMATION_CLASS dwAclInformationClass
//
// );
func XGetAclInformation(t *TLS, pAcl, pAclInformation uintptr, nAclInformationLength uint32, dwAclInformationClass int32) int32 {
	if __ccgo_strace {
		trc("t=%v pAclInformation=%v dwAclInformationClass=%v, (%v:)", t, pAclInformation, dwAclInformationClass, origin(2))
	}
	r0, _, err := procGetAclInformation.Call(pAclInformation,
		pAclInformation,
		uintptr(nAclInformationLength),
		uintptr(dwAclInformationClass),
		0,
		0,
	)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// BOOL GetFileSecurityA(
//
//	LPCSTR               lpFileName,
//	SECURITY_INFORMATION RequestedInformation,
//	PSECURITY_DESCRIPTOR pSecurityDescriptor,
//	DWORD                nLength,
//	LPDWORD              lpnLengthNeeded
//
// );
func XGetFileSecurityA(t *TLS, lpFileName uintptr, RequestedInformation uint32, pSecurityDescriptor uintptr, nLength uint32, lpnLengthNeeded uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpFileName=%v RequestedInformation=%v pSecurityDescriptor=%v nLength=%v lpnLengthNeeded=%v, (%v:)", t, lpFileName, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded, origin(2))
	}
	r0, _, err := procGetFileSecurityA.Call(lpFileName,
		uintptr(RequestedInformation),
		pSecurityDescriptor,
		uintptr(nLength),
		lpnLengthNeeded,
		0,
	)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) DWORD GetLengthSid (PSID pSid);
func XGetLengthSid(tls *TLS, _pSid uintptr) (r uint32) {
	if __ccgo_strace {
		trc("pSid=%+v", _pSid)
		defer func() { trc(`XGetLengthSid->%+v`, r) }()
	}
	r0, _, _ := procGetLengthSid.Call(_pSid)
	return uint32(r0)
}

// BOOL GetSecurityDescriptorDacl(
//
//	PSECURITY_DESCRIPTOR pSecurityDescriptor,
//	LPBOOL               lpbDaclPresent,
//	PACL                 *pDacl,
//	LPBOOL               lpbDaclDefaulted
//
// );
func XGetSecurityDescriptorDacl(t *TLS, pSecurityDescriptor, lpbDaclPresent, pDacl, lpbDaclDefaulted uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v lpbDaclDefaulted=%v, (%v:)", t, lpbDaclDefaulted, origin(2))
	}
	r0, _, err := procGetSecurityDescriptorDacl.Call(pSecurityDescriptor,
		lpbDaclPresent,
		pDacl,
		lpbDaclDefaulted,
		0,
		0,
	)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// DWORD GetSidLengthRequired(
//
//	UCHAR nSubAuthorityCount
//
// );
func XGetSidLengthRequired(t *TLS, nSubAuthorityCount uint8) int32 {
	if __ccgo_strace {
		trc("t=%v nSubAuthorityCount=%v, (%v:)", t, nSubAuthorityCount, origin(2))
	}
	r0, _, _ := procGetSidLengthRequired.Call(uintptr(nSubAuthorityCount))
	return int32(r0)
}

// PDWORD GetSidSubAuthority(
//
//	PSID  pSid,
//	DWORD nSubAuthority
//
// );
func XGetSidSubAuthority(t *TLS, pSid uintptr, nSubAuthority uint32) uintptr {
	if __ccgo_strace {
		trc("t=%v pSid=%v nSubAuthority=%v, (%v:)", t, pSid, nSubAuthority, origin(2))
	}
	r0, _, _ := procGetSidSubAuthority.Call(pSid, uintptr(nSubAuthority))
	return r0
}

// __attribute__((dllimport)) WINBOOL InitializeAcl (PACL pAcl, DWORD nAclLength, DWORD dwAclRevision);
func XInitializeAcl(tls *TLS, _pAcl uintptr, _nAclLength uint32, _dwAclRevision uint32) (r int32) {
	if __ccgo_strace {
		trc("pAcl=%+v nAclLength=%+v dwAclRevision=%+v", _pAcl, _nAclLength, _dwAclRevision)
		defer func() { trc(`XInitializeAcl->%+v`, r) }()
	}
	r0, _, err := procInitializeAcl.Call(_pAcl, uintptr(_nAclLength), uintptr(_dwAclRevision))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// BOOL InitializeSid(
//
//	PSID                      Sid,
//	PSID_IDENTIFIER_AUTHORITY pIdentifierAuthority,
//	BYTE                      nSubAuthorityCount
//
// );
func XInitializeSid(t *TLS, Sid, pIdentifierAuthority uintptr, nSubAuthorityCount uint8) int32 {
	if __ccgo_strace {
		trc("t=%v pIdentifierAuthority=%v nSubAuthorityCount=%v, (%v:)", t, pIdentifierAuthority, nSubAuthorityCount, origin(2))
	}
	r0, _, err := procInitializeSid.Call(Sid, pIdentifierAuthority, uintptr(nSubAuthorityCount))
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// VOID RaiseException(
//
//	DWORD           dwExceptionCode,
//	DWORD           dwExceptionFlags,
//	DWORD           nNumberOfArguments,
//	const ULONG_PTR *lpArguments
//
// );
func XRaiseException(t *TLS, dwExceptionCode, dwExceptionFlags, nNumberOfArguments uint32, lpArguments uintptr) {
	if __ccgo_strace {
		trc("t=%v nNumberOfArguments=%v lpArguments=%v, (%v:)", t, nNumberOfArguments, lpArguments, origin(2))
	}
	procRaiseException.Call(uintptr(dwExceptionCode), uintptr(dwExceptionFlags), uintptr(nNumberOfArguments), lpArguments)
}

// UINT SetErrorMode(
//
//	UINT uMode
//
// );
func XSetErrorMode(t *TLS, uMode uint32) uint32 {
	return windows.SetErrorMode(uMode)
}

var procSetNamedSecurityInfoA = modadvapi32.NewProc("SetNamedSecurityInfoA")

// __attribute__((dllimport)) DWORD SetNamedSecurityInfoA (LPSTR pObjectName, SE_OBJECT_TYPE ObjectType, SECURITY_INFORMATION SecurityInfo, PSID psidOwner, PSID psidGroup, PACL pDacl, PACL pSacl);
func XSetNamedSecurityInfoA(tls *TLS, _pObjectName TLPSTR, _ObjectType TSE_OBJECT_TYPE, _SecurityInfo TSECURITY_INFORMATION, _psidOwner TPSID, _psidGroup TPSID, _pDacl TPACL, _pSacl TPACL) (r TDWORD) {
	if __ccgo_strace {
		trc("pObjectName=%+v ObjectType=%+v SecurityInfo=%+v psidOwner=%+v psidGroup=%+v pDacl=%+v pSacl=%+v", _pObjectName, _ObjectType, _SecurityInfo, _psidOwner, _psidGroup, _pDacl, _pSacl)
		defer func() { trc(`XSetNamedSecurityInfoA->%+v`, r) }()
	}
	r0, _, _ := procSetNamedSecurityInfoA.Call(_pObjectName, uintptr(_ObjectType), uintptr(_SecurityInfo), _psidOwner, _psidGroup, _pDacl, _pSacl)
	return TDWORD(r0)
}

type TSE_OBJECT_TYPE = int32

type TSECURITY_INFORMATION = uint32

// // BOOL CreateProcessA(
// //
// //	LPCSTR                lpApplicationName,
// //	LPSTR                 lpCommandLine,
// //	LPSECURITY_ATTRIBUTES lpProcessAttributes,
// //	LPSECURITY_ATTRIBUTES lpThreadAttributes,
// //	BOOL                  bInheritHandles,
// //	DWORD                 dwCreationFlags,
// //	LPVOID                lpEnvironment,
// //	LPCSTR                lpCurrentDirectory,
// //	LPSTARTUPINFOA        lpStartupInfo,
// //	LPPROCESS_INFORMATION lpProcessInformation
// //
// // );
// func XCreateProcessA(t *TLS, lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes uintptr, bInheritHandles int32,
// 	dwCreationFlags uint32, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation uintptr) int32 {
// 	r1, _, err := procCreateProcessA.Call(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes,
// 		uintptr(bInheritHandles), uintptr(dwCreationFlags), lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation, 0, 0)
// 	if r1 == 0 {
// 		if err != windows.ERROR_SUCCESS {
// 			t.setErrno(err)
// 		} else {
// 			t.setErrno(errno.EINVAL)
// 		}
// 	}
// 	return int32(r1)
// }
//
// // unsigned int _set_abort_behavior(
// //
// //	unsigned int flags,
// //	unsigned int mask
// //
// // );
// func X_set_abort_behavior(t *TLS, _ ...interface{}) uint32 {
// 	die(tls, "");panic(todo(""))
// }
//
// // HANDLE OpenEventA(
// //
// //	DWORD  dwDesiredAccess,
// //	BOOL   bInheritHandle,
// //	LPCSTR lpName
// //
// // );
// func XOpenEventA(t *TLS, dwDesiredAccess uint32, bInheritHandle uint32, lpName uintptr) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v dwDesiredAccess=%v bInheritHandle=%v lpName=%v, (%v:)", t, dwDesiredAccess, bInheritHandle, lpName, origin(2))
// 	}
// 	r0, _, err := procOpenEventA.Call(uintptr(dwDesiredAccess), uintptr(bInheritHandle), lpName)
// 	if r0 == 0 {
// 		t.setErrno(err)
// 	}
// 	return r0
// }
//
// // size_t _msize(
// //
// //	void *memblock
// //
// // );
// func X_msize(t *TLS, memblock uintptr) types.Size_t {
// 	if __ccgo_strace {
// 		trc("t=%v memblock=%v, (%v:)", t, memblock, origin(2))
// 	}
// 	return types.Size_t(UsableSize(memblock))
// }
//
// // unsigned long _byteswap_ulong ( unsigned long val );
// func X_byteswap_ulong(t *TLS, val ulong) ulong {
// 	if __ccgo_strace {
// 		trc("t=%v val=%v, (%v:)", t, val, origin(2))
// 	}
// 	return X__builtin_bswap32(t, val)
// }
//
// // unsigned __int64 _byteswap_uint64 ( unsigned __int64 val );
// func X_byteswap_uint64(t *TLS, val uint64) uint64 {
// 	if __ccgo_strace {
// 		trc("t=%v val=%v, (%v:)", t, val, origin(2))
// 	}
// 	return X__builtin_bswap64(t, val)
// }
//
// // int _commit(
// //
// //	int fd
// //
// // );
// func X_commit(t *TLS, fd int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v fd=%v, (%v:)", t, fd, origin(2))
// 	}
// 	return Xfsync(t, fd)
// }
//
// // int _stati64(
// //
// //	const char *path,
// //	struct _stati64 *buffer
// //
// // );
// func X_stati64(t *TLS, path, buffer uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v path=%v buffer=%v, (%v:)", t, path, buffer, origin(2))
// 	}
// 	r0, _, err := procStati64.Call(uintptr(path), uintptr(buffer))
// 	if err != windows.ERROR_SUCCESS {
// 		t.setErrno(err)
// 	}
// 	return int32(r0)
// }
//
// // int _fstati64(int fd, struct _stati64 *buffer);
// func X_fstati64(t *TLS, fd int32, buffer uintptr) int32 {
// 	return X_fstat64(t, fd, buffer)
// }
//
// // int _findnext32(
// //
// //	intptr_t handle,
// //	struct _finddata32_t *fileinfo
// //
// // );
// func X_findnext32(t *TLS, handle types.Intptr_t, buffer uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v handle=%v buffer=%v, (%v:)", t, handle, buffer, origin(2))
// 	}
// 	r0, _, err := procFindnext32.Call(uintptr(handle), buffer)
// 	if err != windows.ERROR_SUCCESS {
// 		t.setErrno(err)
// 	}
// 	return int32(r0)
// }
//
// // intptr_t _findfirst32(
// //
// //	const char *filespec,
// //	struct _finddata32_t *fileinfo
// //
// // );
// func X_findfirst32(t *TLS, filespec, fileinfo uintptr) types.Intptr_t {
// 	if __ccgo_strace {
// 		trc("t=%v fileinfo=%v, (%v:)", t, fileinfo, origin(2))
// 	}
// 	r0, _, err := procFindfirst32.Call(filespec, fileinfo)
// 	if err != windows.ERROR_SUCCESS {
// 		t.setErrno(err)
// 	}
// 	return types.Intptr_t(r0)
// }

/*-
 * Copyright (c) 1990 The Regents of the University of California.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

// long strtol(const char *nptr, char **endptr, int base);
func Xstrtol(t *TLS, nptr, endptr uintptr, base int32) long {
	if __ccgo_strace {
		trc("t=%v endptr=%v base=%v, (%v:)", t, endptr, base, origin(2))
	}

	var s uintptr = nptr
	var acc ulong
	var c byte
	var cutoff ulong
	var neg int32
	var any int32
	var cutlim int32

	/*
	 * Skip white space and pick up leading +/- sign if any.
	 * If base is 0, allow 0x for hex and 0 for octal, else
	 * assume decimal; if base is already 16, allow 0x.
	 */
	for {
		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
		var sp = strings.TrimSpace(string(c))
		if len(sp) > 0 {
			break
		}
	}

	if c == '-' {
		neg = 1
		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
	} else if c == '+' {
		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
	}

	sp := *(*byte)(unsafe.Pointer(s))

	if (base == 0 || base == 16) &&
		c == '0' && (sp == 'x' || sp == 'X') {
		PostIncUintptr(&s, 1)
		c = *(*byte)(unsafe.Pointer(s)) //s[1];
		PostIncUintptr(&s, 1)
		base = 16
	}
	if base == 0 {
		if c == '0' {
			base = 0
		} else {
			base = 10
		}
	}
	/*
	 * Compute the cutoff value between legal numbers and illegal
	 * numbers.  That is the largest legal value, divided by the
	 * base.  An input number that is greater than this value, if
	 * followed by a legal input character, is too big.  One that
	 * is equal to this value may be valid or not; the limit
	 * between valid and invalid numbers is then based on the last
	 * digit.  For instance, if the range for longs is
	 * [-2147483648..2147483647] and the input base is 10,
	 * cutoff will be set to 214748364 and cutlim to either
	 * 7 (neg==0) or 8 (neg==1), meaning that if we have accumulated
	 * a value > 214748364, or equal but the next digit is > 7 (or 8),
	 * the number is too big, and we will return a range error.
	 *
	 * Set any if any `digits' consumed; make it negative to indicate
	 * overflow.
	 */
	var ULONG_MAX ulong = 0xFFFFFFFF
	var LONG_MAX long = long(ULONG_MAX >> 1)
	var LONG_MIN long = ^LONG_MAX

	if neg == 1 {
		cutoff = ulong(-1 * LONG_MIN)
	} else {
		cutoff = ulong(LONG_MAX)
	}
	cutlim = int32(cutoff % ulong(base))
	cutoff = cutoff / ulong(base)

	acc = 0
	any = 0

	for {
		var cs = string(c)
		if unicode.IsDigit([]rune(cs)[0]) {
			c -= '0'
		} else if unicode.IsLetter([]rune(cs)[0]) {
			if unicode.IsUpper([]rune(cs)[0]) {
				c -= 'A' - 10
			} else {
				c -= 'a' - 10
			}
		} else {
			break
		}

		if int32(c) >= base {
			break
		}
		if any < 0 || acc > cutoff || (acc == cutoff && int32(c) > cutlim) {
			any = -1

		} else {
			any = 1
			acc *= ulong(base)
			acc += ulong(c)
		}

		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
	}

	if any < 0 {
		if neg == 1 {
			acc = ulong(LONG_MIN)
		} else {
			acc = ulong(LONG_MAX)
		}
		t.setErrno(errno.ERANGE)
	} else if neg == 1 {
		acc = -acc
	}

	if endptr != 0 {
		if any == 1 {
			PostDecUintptr(&s, 1)
			AssignPtrUintptr(endptr, s)
		} else {
			AssignPtrUintptr(endptr, nptr)
		}
	}
	return long(acc)
}

// unsigned long int strtoul(const char *nptr, char **endptr, int base);
func Xstrtoul(t *TLS, nptr, endptr uintptr, base int32) ulong {
	if __ccgo_strace {
		trc("t=%v endptr=%v base=%v, (%v:)", t, endptr, base, origin(2))
	}
	var s uintptr = nptr
	var acc ulong
	var c byte
	var cutoff ulong
	var neg int32
	var any int32
	var cutlim int32

	/*
	 * Skip white space and pick up leading +/- sign if any.
	 * If base is 0, allow 0x for hex and 0 for octal, else
	 * assume decimal; if base is already 16, allow 0x.
	 */
	for {
		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
		var sp = strings.TrimSpace(string(c))
		if len(sp) > 0 {
			break
		}
	}

	if c == '-' {
		neg = 1
		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
	} else if c == '+' {
		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
	}

	sp := *(*byte)(unsafe.Pointer(s))

	if (base == 0 || base == 16) &&
		c == '0' && (sp == 'x' || sp == 'X') {
		PostIncUintptr(&s, 1)
		c = *(*byte)(unsafe.Pointer(s)) //s[1];
		PostIncUintptr(&s, 1)
		base = 16
	}
	if base == 0 {
		if c == '0' {
			base = 0
		} else {
			base = 10
		}
	}
	var ULONG_MAX ulong = 0xFFFFFFFF

	cutoff = ULONG_MAX / ulong(base)
	cutlim = int32(ULONG_MAX % ulong(base))

	acc = 0
	any = 0

	for {
		var cs = string(c)
		if unicode.IsDigit([]rune(cs)[0]) {
			c -= '0'
		} else if unicode.IsLetter([]rune(cs)[0]) {
			if unicode.IsUpper([]rune(cs)[0]) {
				c -= 'A' - 10
			} else {
				c -= 'a' - 10
			}
		} else {
			break
		}

		if int32(c) >= base {
			break
		}
		if any < 0 || acc > cutoff || (acc == cutoff && int32(c) > cutlim) {
			any = -1

		} else {
			any = 1
			acc *= ulong(base)
			acc += ulong(c)
		}

		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
	}

	if any < 0 {
		acc = ULONG_MAX
		t.setErrno(errno.ERANGE)
	} else if neg == 1 {
		acc = -acc
	}

	if endptr != 0 {
		if any == 1 {
			PostDecUintptr(&s, 1)
			AssignPtrUintptr(endptr, s)
		} else {
			AssignPtrUintptr(endptr, nptr)
		}
	}
	return acc
}

// // int __isoc99_sscanf(const char *str, const char *format, ...);
// func X__isoc99_sscanf(t *TLS, str, format, va uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v va=%v, (%v:)", t, va, origin(2))
// 	}
// 	r := scanf(strings.NewReader(GoString(str)), format, va)
// 	// if dmesgs {
// 	// 	dmesg("%v: %q %q: %d", origin(1), GoString(str), GoString(format), r)
// 	// }
// 	return r
// }

// int sscanf(const char *str, const char *format, ...);
func Xsscanf(t *TLS, str, format, va uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v va=%v, (%v:)", t, va, origin(2))
	}
	r := scanf(strings.NewReader(GoString(str)), format, va)
	// if dmesgs {
	// 	dmesg("%v: %q %q: %d", origin(1), GoString(str), GoString(format), r)
	// }
	return r
}

func Xrint(tls *TLS, x float64) float64 {
	if __ccgo_strace {
		trc("tls=%v x=%v, (%v:)", tls, x, origin(2))
	}
	switch {
	case x == 0: // also +0 and -0
		return 0
	case math.IsInf(x, 0), math.IsNaN(x):
		return x
	case x >= math.MinInt64 && x <= math.MaxInt64 && float64(int64(x)) == x:
		return x
	case x >= 0:
		return math.Floor(x + 0.5)
	default:
		return math.Ceil(x - 0.5)
	}
}

// FILE *fdopen(int fd, const char *mode);
func Xfdopen(t *TLS, fd int32, mode uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v fd=%v mode=%v, (%v:)", t, fd, mode, origin(2))
	}
	die(t, "")
	panic(todo(""))
}

var procGmtime64 = modcrt.NewProc("_gmtime64")
var _ = procGmtime64.Addr()

// struct tm *_gmtime64( const __time64_t *sourceTime );
func X_gmtime64(t *TLS, sourceTime uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v sourceTime=%v, (%v:)", t, sourceTime, origin(2))
	}
	r0, _, _ := procGmtime64.Call(uintptr(sourceTime))
	return uintptr(r0)
}

// __time64_t _mktime64(struct tm *timeptr);
func X_mktime64(t *TLS, timeptr uintptr) time.X__time64_t {
	if __ccgo_strace {
		trc("t=%v timeptr=%v, (%v:)", t, timeptr, origin(2))
	}
	return time.X__time64_t(Xmktime(t, timeptr))
}

// // char * gai_strerrorA(int ecode);
// func Xgai_strerrorA(t *TLS, ecode int32) uintptr {
// 	if __ccgo_strace {
// 		trc("t=%v ecode=%v, (%v:)", t, ecode, origin(2))
// 	}
// 	die(tls, "");panic(todo(""))
// }

// https://github.com/Alexpux/mingw-w64/blob/master/mingw-w64-headers/crt/sys/timeb.h#L69
//
// struct __timeb64 {
//     __time64_t time;
//     unsigned short millitm;
//     short timezone;
//     short dstflag;
//   };

type __timeb64 struct {
	time     types.X__time64_t
	millitm  uint32
	timezone int16
	dstflag  int16
}

// void _ftime64( struct __timeb64 *timeptr );
func X_ftime64(t *TLS, timeptr uintptr) {
	if __ccgo_strace {
		trc("t=%v timeptr=%v, (%v:)", t, timeptr, origin(2))
	}
	tm := gotime.Now()
	(*__timeb64)(unsafe.Pointer(timeptr)).time = types.X__time64_t(tm.Unix())

	//TODO When Go 1.16 is no more supported
	// (*__timeb64)(unsafe.Pointer(timeptr)).millitm = uint32(tm.UnixMilli() % 1000)

	(*__timeb64)(unsafe.Pointer(timeptr)).millitm = uint32(int64(tm.Nanosecond()) / 1e6)
}

func X__ccgo_getMutexType(tls *TLS, m uintptr) int32 { /* pthread_mutex_lock.c:3:5: */
	if __ccgo_strace {
		trc("tls=%v m=%v, (%v:)", tls, m, origin(2))
	}
	return *(*int32)(unsafe.Pointer(m)) & 15
}

func X__ccgo_pthreadAttrGetDetachState(tls *TLS, a uintptr) int32 { /* pthread_attr_get.c:3:5: */
	if __ccgo_strace {
		trc("tls=%v a=%v, (%v:)", tls, a, origin(2))
	}
	return *(*int32)(unsafe.Pointer(a))
}

func X__ccgo_pthreadMutexattrGettype(tls *TLS, a uintptr) int32 { /* pthread_attr_get.c:93:5: */
	if __ccgo_strace {
		trc("tls=%v a=%v, (%v:)", tls, a, origin(2))
	}
	return *(*int32)(unsafe.Pointer(a)) & int32(3)
}

var procChmod = modcrt.NewProc("_chmod")
var _ = procChmod.Addr()

func Xchmod(t *TLS, pathname uintptr, mode int32) int32 {
	r0, _, err := procChmod.Call(pathname, uintptr(mode))
	if err != windows.ERROR_SUCCESS {
		t.setErrno(err)
	}
	return int32(r0)
}

// // typedef enum _COMPUTER_NAME_FORMAT {
// //   ComputerNameNetBIOS,
// //   ComputerNameDnsHostname,
// //   ComputerNameDnsDomain,
// //   ComputerNameDnsFullyQualified,
// //   ComputerNamePhysicalNetBIOS,
// //   ComputerNamePhysicalDnsHostname,
// //   ComputerNamePhysicalDnsDomain,
// //   ComputerNamePhysicalDnsFullyQualified,
// //   ComputerNameMax
// // } COMPUTER_NAME_FORMAT;

// BOOL GetComputerNameExW(
//
//	[in]      COMPUTER_NAME_FORMAT NameType,
//	[out]     LPWSTR               lpBuffer,
//	[in, out] LPDWORD              nSize
//
// );
func XGetComputerNameExW(t *TLS, nameType int32, lpBuffer, nSize uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v nameType=%v nSize=%v, (%v:)", t, nameType, nSize, origin(2))
	}
	r0, _, err := procGetComputerNameExW.Call(uintptr(nameType), lpBuffer, nSize)
	if r0 == 0 {
		t.setErrno(err)
	}
	return int32(r0)
}

// double _copysign(
//
//	double x,
//	double y
//
// );

func X_copysign(t *TLS, x, y float64) float64 {
	if __ccgo_strace {
		trc("t=%v y=%v, (%v:)", t, y, origin(2))
	}
	return Xcopysign(t, x, y)
}

// int _wtoi(
//
//	const wchar_t *str
//
// );
func X_wtoi(t *TLS, str uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v str=%v, (%v:)", t, str, origin(2))
	}
	die(t, "")
	panic(todo(""))
}

func allocW(t *TLS, v string) (r uintptr) {
	s := utf16.Encode([]rune(v))
	p := Xcalloc(t, types.Size_t(len(s)+1), 2)
	if p == 0 {
		die(t, "")
		panic(todo(""))
	}

	r = p
	for _, v := range s {
		*(*uint16)(unsafe.Pointer(p)) = v
		p += 2
	}
	return r
}

// wchar_t *_wgetenv(
//
//	const wchar_t *varname
//
// );
func X_wgetenv(t *TLS, varname uintptr) uintptr {
	if __ccgo_strace {
		trc("t=%v varname=%v, (%v:)", t, varname, origin(2))
	}
	if !wenvValid {
		bootWinEnviron(t)
	}
	k := strings.ToLower(goWideStringNZ(varname))
	for _, v := range winEnviron[:len(winEnviron)-1] {
		s := strings.ToLower(goWideStringNZ(v))
		x := strings.IndexByte(s, '=')
		if s[:x] == k {
			// trc("%v: %q -> %q", origin(1), goWideStringNZ(varname), goWideStringNZ(v))
			return v
		}
	}

	// trc("%v: %q -> %q", origin(1), goWideStringNZ(varname), "")
	return 0
}

// int _wputenv(
//
//	const wchar_t *envstring
//
// );
func X_wputenv(t *TLS, envstring uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v envstring=%v, (%v:)", t, envstring, origin(2))
	}
	if !wenvValid {
		bootWinEnviron(t)
	}
	s0 := goWideStringNZ(envstring)
	s := strings.ToLower(s0)
	x := strings.IndexByte(s, '=')
	k := s[:x]
	os.Setenv(s, k)
	for i, v := range winEnviron[:len(winEnviron)-1] {
		s2 := strings.ToLower(goWideStringNZ(v))
		x := strings.IndexByte(s2, '=')
		if s2[:x] == k {
			Xfree(t, v)
			winEnviron[i] = allocW(t, s0)
			return 0
		}
	}

	np := allocW(t, s0)
	winEnviron = winEnviron[:len(winEnviron)-1]
	winEnviron = append(winEnviron, np, 0)
	wenviron = uintptr(unsafe.Pointer(&winEnviron[0]))
	return 0
}

func bootWinEnviron(t *TLS) {
	winEnviron = winEnviron[:0]
	p := Environ()
	for {
		q := *(*uintptr)(unsafe.Pointer(p))
		p += unsafe.Sizeof(uintptr(0))
		if q == 0 {
			break
		}

		s := GoString(q)
		// trc("%v: %q", origin(1), s)
		r := allocW(t, s)
		winEnviron = append(winEnviron, r)
	}
	wenviron = uintptr(unsafe.Pointer(&winEnviron[0]))
	wenvValid = true
}

func Xfabsl(t *TLS, x float64) float64 {
	if __ccgo_strace {
		trc("t=%v x=%v, (%v:)", t, x, origin(2))
	}
	return math.Abs(x)
}

// func X__stdio_common_vfprintf(t *TLS, args ...interface{}) int32     { die(tls, "");panic("TODO") }
// func X__stdio_common_vfprintf_p(t *TLS, args ...interface{}) int32   { die(tls, "");panic("TODO") }
// func X__stdio_common_vfprintf_s(t *TLS, args ...interface{}) int32   { die(tls, "");panic("TODO") }
// func X__stdio_common_vfscanf(t *TLS, args ...interface{}) int32      { die(tls, "");panic("TODO") }
// func X__stdio_common_vfwprintf_s(t *TLS, args ...interface{}) int32  { die(tls, "");panic("TODO") }
// func X__stdio_common_vfwscanf(t *TLS, args ...interface{}) int32     { die(tls, "");panic("TODO") }
// func X__stdio_common_vsnprintf_s(t *TLS, args ...interface{}) int32  { die(tls, "");panic("TODO") }
// func X__stdio_common_vsnwprintf_s(t *TLS, args ...interface{}) int32 { die(tls, "");panic("TODO") }
// func X__stdio_common_vsprintf(t *TLS, args ...interface{}) int32     { die(tls, "");panic("TODO") }
// func X__stdio_common_vsprintf_p(t *TLS, args ...interface{}) int32   { die(tls, "");panic("TODO") }
// func X__stdio_common_vsprintf_s(t *TLS, args ...interface{}) int32   { die(tls, "");panic("TODO") }
// func X__stdio_common_vsscanf(t *TLS, args ...interface{}) int32      { die(tls, "");panic("TODO") }
// func X__stdio_common_vswprintf(t *TLS, args ...interface{}) int32    { die(tls, "");panic("TODO") }
// func X__stdio_common_vswprintf_s(t *TLS, args ...interface{}) int32  { die(tls, "");panic("TODO") }
// func X__stdio_common_vswscanf(t *TLS, args ...interface{}) int32     { die(tls, "");panic("TODO") }

func X_lseeki64(t *TLS, fd int32, offset int64, whence int32) int64 {
	if __ccgo_strace {
		trc("t=%v fd=%v offset=%v whence=%v, (%v:)", t, fd, offset, whence, origin(2))
	}

	f, ok := fdToFile(fd)
	if !ok {
		t.setErrno(errno.EBADF)
		return -1
	}

	n, err := windows.Seek(f.Handle, offset, int(whence))
	if err != nil {
		if dmesgs {
			dmesg("%v: fd %v, off %#x, whence %v: %v", origin(1), f._fd, offset, whenceStr(whence), n)
		}
		t.setErrno(err)
		return -1
	}

	if dmesgs {
		dmesg("%v: fd %v, off %#x, whence %v: ok", origin(1), f._fd, offset, whenceStr(whence))
	}
	return n
}

func Xislower(tls *TLS, c int32) int32 { /* islower.c:4:5: */
	if __ccgo_strace {
		trc("tls=%v c=%v, (%v:)", tls, c, origin(2))
	}
	return Bool32(uint32(c)-uint32('a') < uint32(26))
}

func Xisupper(tls *TLS, c int32) int32 { /* isupper.c:4:5: */
	if __ccgo_strace {
		trc("tls=%v c=%v, (%v:)", tls, c, origin(2))
	}
	return Bool32(uint32(c)-uint32('A') < uint32(26))
}

// // int access(const char *pathname, int mode);
// func Xaccess(t *TLS, pathname uintptr, mode int32) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v pathname=%v mode=%v, (%v:)", t, pathname, mode, origin(2))
// 	}
// 	r0, _, err := procAccess.Call(uintptr(pathname), uintptr(mode))
// 	if err != windows.ERROR_SUCCESS {
// 		t.setErrno(err)
// 	}
// 	return int32(r0)
// }

// int _vscprintf(const char *format, va_list argptr);
func X_vscprintf(t *TLS, format uintptr, argptr uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v format=%v argptr=%v, (%v:)", t, format, argptr, origin(2))
	}

	return int32(len(printf(format, argptr)))
}

// // int _stat32i64(const char *path, struct _stat32i64 *buffer);
// func X_stat64i32(t *TLS, path uintptr, buffer uintptr) int32 {
// 	if __ccgo_strace {
// 		trc("t=%v path=%v buffer=%v, (%v:)", t, path, buffer, origin(2))
// 	}
// 	r0, _, err := procStat64i32.Call(uintptr(path), uintptr(buffer))
// 	if err != windows.ERROR_SUCCESS {
// 		t.setErrno(err)
// 	}
// 	return int32(r0)
// }
//
// func AtomicLoadNUint8(ptr uintptr, memorder int32) uint8 {
// 	return byte(a_load_8(ptr))
// }

// struct tm *gmtime( const time_t *sourceTime );
func Xgmtime(tls *TLS, sourceTime uintptr) uintptr {
	return Xgmtime_r(tls, sourceTime, uintptr(unsafe.Pointer(&_tm)))
}

var _tm time.Tm

func Xgmtime_r(tls *TLS, t uintptr, tm uintptr) (r uintptr) {
	if x___secs_to_tm(tls, int64(*(*time.Time_t)(unsafe.Pointer(t))), tm) < 0 {
		tls.setErrno(errno.EOVERFLOW)
		return uintptr(0)
	}
	(*time.Tm)(unsafe.Pointer(tm)).Ftm_isdst = 0
	// (*time.Tm)(unsafe.Pointer(tm)).Ftm_gmtoff = 0
	// (*time.Tm)(unsafe.Pointer(tm)).Ftm_zone = uintptr(unsafe.Pointer(&x___utc))
	return tm
}

var x___utc = [4]int8{'U', 'T', 'C'}

func x___secs_to_tm(tls *TLS, t int64, tm uintptr) (r int32) {
	var c_cycles, leap, months, q_cycles, qc_cycles, remdays, remsecs, remyears, wday, yday int32
	var days, secs, years int64
	_, _, _, _, _, _, _, _, _, _, _, _, _ = c_cycles, days, leap, months, q_cycles, qc_cycles, remdays, remsecs, remyears, secs, wday, yday, years
	/* Reject time_t values whose year would overflow int */
	if t < int64(-Int32FromInt32(1)-Int32FromInt32(0x7fffffff))*Int64FromInt64(31622400) || t > Int64FromInt32(limits.INT_MAX)*Int64FromInt64(31622400) {
		return -int32(1)
	}
	secs = t - (Int64FromInt64(946684800) + int64(Int32FromInt32(86400)*(Int32FromInt32(31)+Int32FromInt32(29))))
	days = secs / int64(86400)
	remsecs = int32(secs % int64(86400))
	if remsecs < 0 {
		remsecs += int32(86400)
		days--
	}
	wday = int32((int64(3) + days) % int64(7))
	if wday < 0 {
		wday += int32(7)
	}
	qc_cycles = int32(days / int64(Int32FromInt32(365)*Int32FromInt32(400)+Int32FromInt32(97)))
	remdays = int32(days % int64(Int32FromInt32(365)*Int32FromInt32(400)+Int32FromInt32(97)))
	if remdays < 0 {
		remdays += Int32FromInt32(365)*Int32FromInt32(400) + Int32FromInt32(97)
		qc_cycles--
	}
	c_cycles = remdays / (Int32FromInt32(365)*Int32FromInt32(100) + Int32FromInt32(24))
	if c_cycles == int32(4) {
		c_cycles--
	}
	remdays -= c_cycles * (Int32FromInt32(365)*Int32FromInt32(100) + Int32FromInt32(24))
	q_cycles = remdays / (Int32FromInt32(365)*Int32FromInt32(4) + Int32FromInt32(1))
	if q_cycles == int32(25) {
		q_cycles--
	}
	remdays -= q_cycles * (Int32FromInt32(365)*Int32FromInt32(4) + Int32FromInt32(1))
	remyears = remdays / int32(365)
	if remyears == int32(4) {
		remyears--
	}
	remdays -= remyears * int32(365)
	leap = BoolInt32(!(remyears != 0) && (q_cycles != 0 || !(c_cycles != 0)))
	yday = remdays + int32(31) + int32(28) + leap
	if yday >= int32(365)+leap {
		yday -= int32(365) + leap
	}
	years = int64(remyears+int32(4)*q_cycles+int32(100)*c_cycles) + int64(400)*int64(int64(qc_cycles))
	months = 0
	for {
		if !(int32(_days_in_month[months]) <= remdays) {
			break
		}
		remdays -= int32(_days_in_month[months])
		goto _1
	_1:
		months++
	}
	if months >= int32(10) {
		months -= int32(12)
		years++
	}
	if years+int64(100) > int64(limits.INT_MAX) || years+int64(100) < int64(-Int32FromInt32(1)-Int32FromInt32(0x7fffffff)) {
		return -int32(1)
	}
	(*time.Tm)(unsafe.Pointer(tm)).Ftm_year = int32(years + int64(100))
	(*time.Tm)(unsafe.Pointer(tm)).Ftm_mon = months + int32(2)
	(*time.Tm)(unsafe.Pointer(tm)).Ftm_mday = remdays + int32(1)
	(*time.Tm)(unsafe.Pointer(tm)).Ftm_wday = wday
	(*time.Tm)(unsafe.Pointer(tm)).Ftm_yday = yday
	(*time.Tm)(unsafe.Pointer(tm)).Ftm_hour = remsecs / int32(3600)
	(*time.Tm)(unsafe.Pointer(tm)).Ftm_min = remsecs / int32(60) % int32(60)
	(*time.Tm)(unsafe.Pointer(tm)).Ftm_sec = remsecs % int32(60)
	return 0
}

var _days_in_month = [12]int8{
	0:  int8(31),
	1:  int8(30),
	2:  int8(31),
	3:  int8(30),
	4:  int8(31),
	5:  int8(31),
	6:  int8(30),
	7:  int8(31),
	8:  int8(30),
	9:  int8(31),
	10: int8(31),
	11: int8(29),
}

// // size_t strftime(
// //
// //	char *strDest,
// //	size_t maxsize,
// //	const char *format,
// //	const struct tm *timeptr
// //
// // );
// func Xstrftime(tls *TLS, s uintptr, n size_t, f uintptr, tm uintptr) (r size_t) {
// 	if __ccgo_strace {
// 		trc("tls=%v s=%v n=%v f=%v tm=%v, (%v:)", tls, s, n, f, tm, origin(2))
// 		defer func() { trc("-> %v", r) }()
// 	}
// 	tt := gotime.Date(
// 		int((*time.Tm)(unsafe.Pointer(tm)).Ftm_year+1900),
// 		gotime.Month((*time.Tm)(unsafe.Pointer(tm)).Ftm_mon+1),
// 		int((*time.Tm)(unsafe.Pointer(tm)).Ftm_mday),
// 		int((*time.Tm)(unsafe.Pointer(tm)).Ftm_hour),
// 		int((*time.Tm)(unsafe.Pointer(tm)).Ftm_min),
// 		int((*time.Tm)(unsafe.Pointer(tm)).Ftm_sec),
// 		0,
// 		gotime.UTC,
// 	)
// 	fmt := GoString(f)
// 	var result string
// 	if fmt != "" {
// 		result = strftime.Format(fmt, tt)
// 	}
// 	switch r = size_t(len(result)); {
// 	case r > n:
// 		r = 0
// 	default:
// 		copy((*RawMem)(unsafe.Pointer(s))[:r:r], result)
// 		*(*byte)(unsafe.Pointer(s + uintptr(r))) = 0
// 	}
// 	return r
//
// }
//
// func X__mingw_strtod(t *TLS, s uintptr, p uintptr) float64 {
// 	return Xstrtod(t, s, p)
// }

var procStrtod = modcrt.NewProc("strtod")
var _ = procStrtod.Addr()

func Xstrtod(t *TLS, s uintptr, p uintptr) float64 {
	if __ccgo_strace {
		trc("tls=%v s=%v p=%v, (%v:)", t, s, p, origin(2))
	}
	r0, _, err := procStrtod.Call(uintptr(s), uintptr(p))
	if err != windows.ERROR_SUCCESS {
		t.setErrno(err)
	}
	return math.Float64frombits(uint64(r0)) //TODO Test 386
}

// int vsnprintf(char *str, size_t size, const char *format, va_list ap);
func X_vsnprintf(t *TLS, str uintptr, size types.Size_t, format, ap uintptr) int32 {
	if __ccgo_strace {
		trc("t=%v str=%v size=%v ap=%v, (%v:)", t, str, size, ap, origin(2))
	}
	return Xvsnprintf(t, str, size, format, ap)
}

// func CreateThread(t *TLS, lpThreadAttributes uintptr, dwStackSize types.Size_t, lpStartAddress, lpParameter uintptr, dwCreationFlags uint32, lpThreadId uintptr) uintptr {
// 	return XCreateThread(t, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId)
// }

var procWcsncpy = modcrt.NewProc("wcsncpy")
var _ = procWcsncpy.Addr()

// wchar_t *wcsncpy(wchar_t *strDest, const wchar_t *strSource, size_t count);
func Xwcsncpy(t *TLS, strDest, strSource uintptr, count types.Size_t) uintptr {
	r0, _, _ := procWcsncpy.Call(strDest, strSource, uintptr(count))
	return r0
}

var procWcsrchr = modcrt.NewProc("wcsrchr")
var _ = procWcsrchr.Addr()

// wchar_t *wcsrchr(const wchar_t *str, wchar_t c);
func Xwcsrchr(t *TLS, str uintptr, c types.Wchar_t) uintptr {
	r0, _, _ := procWcsrchr.Call(str, uintptr(c))
	return r0
}

var procCtime64 = modcrt.NewProc("_ctime64")
var _ = procCtime64.Addr()

// __attribute__ ((__dllimport__)) char * __attribute__((__cdecl__)) _ctime64(const __time64_t *_Time);
func X_ctime64(tls *TLS, __Time uintptr) (r uintptr) {
	if __ccgo_strace {
		trc("_Time=%+v", __Time)
		defer func() { trc(`X_ctime64->%+v`, r) }()
	}
	r0, _, _ := procCtime64.Call(__Time)
	return uintptr(r0)
}

var procTime64 = modcrt.NewProc("_time64")
var _ = procTime64.Addr()

// __attribute__ ((__dllimport__)) __time64_t __attribute__((__cdecl__)) _time64(__time64_t *_Time);
func X_time64(tls *TLS, __Time uintptr) (r int64) {
	if __ccgo_strace {
		trc("_Time=%+v", __Time)
		defer func() { trc(`X_time64->%+v`, r) }()
	}
	r0, _, _ := procTime64.Call(__Time)
	return int64(r0)
}

var procStrnicmp = modcrt.NewProc("_strnicmp")
var _ = procStrnicmp.Addr()

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strnicmp(const char *_Str1,const char *_Str2,size_t _MaxCount);
func X_strnicmp(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount types.Size_t) (r int32) {
	if __ccgo_strace {
		trc("_Str1=%+v _Str2=%+v _MaxCount=%+v", __Str1, __Str2, __MaxCount)
		defer func() { trc(`X_strnicmp->%+v`, r) }()
	}
	r0, _, err := procStrnicmp.Call(__Str1, __Str2, uintptr(__MaxCount))
	if err != windows.ERROR_SUCCESS {
		tls.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) HRSRC FindResourceW(HMODULE hModule, LPCWSTR lpName, LPCWSTR lpType);
func XFindResourceW(tls *TLS, _hModule THMODULE, _lpName TLPCWSTR, _lpType TLPCWSTR) (r THRSRC) {
	if __ccgo_strace {
		trc("hModule=%+v lpName=%+v lpType=%+v", _hModule, _lpName, _lpType)
		defer func() { trc(`XFindResourceW->%+v`, r) }()
	}
	r0, _, err := procFindResourceW.Call(_hModule, _lpName, _lpType)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THRSRC(r0)
}

type THGLOBAL = uintptr

// __attribute__((dllimport)) HGLOBAL LoadResource (HMODULE hModule, HRSRC hResInfo);
func XLoadResource(tls *TLS, _hModule THMODULE, _hResInfo THRSRC) (r THGLOBAL) {
	if __ccgo_strace {
		trc("hModule=%+v hResInfo=%+v", _hModule, _hResInfo)
		defer func() { trc(`XLoadResource->%+v`, r) }()
	}
	r0, _, err := procLoadResource.Call(_hModule, _hResInfo)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THGLOBAL(r0)
}

// __attribute__((dllimport)) LPVOID LockResource (HGLOBAL hResData);
func XLockResource(tls *TLS, _hResData THGLOBAL) (r TLPVOID) {
	if __ccgo_strace {
		trc("hResData=%+v", _hResData)
		defer func() { trc(`XLockResource->%+v`, r) }()
	}
	r0, _, _ := procLockResource.Call(_hResData)
	return TLPVOID(r0)
}

// __attribute__((dllimport)) int GetSystemMetrics(int nIndex);
func XGetSystemMetrics(tls *TLS, _nIndex int32) (r int32) {
	if __ccgo_strace {
		trc("nIndex=%+v", _nIndex)
		defer func() { trc(`XGetSystemMetrics->%+v`, r) }()
	}
	r0, _, err := procGetSystemMetrics.Call(uintptr(_nIndex))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) WINBOOL SetWindowPos (HWND hWnd, HWND hWndInsertAfter, int X, int Y, int cx, int cy, UINT uFlags);
func XSetWindowPos(tls *TLS, _hWnd THWND, _hWndInsertAfter THWND, _X int32, _Y int32, _cx int32, _cy int32, _uFlags TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v hWndInsertAfter=%+v X=%+v Y=%+v cx=%+v cy=%+v uFlags=%+v", _hWnd, _hWndInsertAfter, _X, _Y, _cx, _cy, _uFlags)
		defer func() { trc(`XSetWindowPos->%+v`, r) }()
	}
	r0, _, err := procSetWindowPos.Call(_hWnd, _hWndInsertAfter, uintptr(_X), uintptr(_Y), uintptr(_cx), uintptr(_cy), uintptr(_uFlags))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) DWORD GetSysColor(int nIndex);
func XGetSysColor(tls *TLS, _nIndex int32) (r TDWORD) {
	if __ccgo_strace {
		trc("nIndex=%+v", _nIndex)
		defer func() { trc(`XGetSysColor->%+v`, r) }()
	}
	r0, _, _ := procGetSysColor.Call(uintptr(_nIndex))
	return TDWORD(r0)
}

// __attribute__((dllimport)) COLORREF SetTextColor(HDC hdc,COLORREF color);
func XSetTextColor(tls *TLS, _hdc THDC, _color TCOLORREF) (r TCOLORREF) {
	if __ccgo_strace {
		trc("hdc=%+v color=%+v", _hdc, _color)
		defer func() { trc(`XSetTextColor->%+v`, r) }()
	}
	r0, _, _ := procSetTextColor.Call(_hdc, uintptr(_color))
	return TCOLORREF(r0)
}

// __attribute__((dllimport)) COLORREF SetBkColor(HDC hdc,COLORREF color);
func XSetBkColor(tls *TLS, _hdc THDC, _color TCOLORREF) (r TCOLORREF) {
	if __ccgo_strace {
		trc("hdc=%+v color=%+v", _hdc, _color)
		defer func() { trc(`XSetBkColor->%+v`, r) }()
	}
	r0, _, _ := procSetBkColor.Call(_hdc, uintptr(_color))
	return TCOLORREF(r0)
}

// __attribute__((dllimport)) WINBOOL DrawFocusRect(HDC hDC, const RECT *lprc);
func XDrawFocusRect(tls *TLS, _hDC THDC, _lprc uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hDC=%+v lprc=%+v", _hDC, _lprc)
		defer func() { trc(`XDrawFocusRect->%+v`, r) }()
	}
	r0, _, err := procDrawFocusRect.Call(_hDC, _lprc)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) int StretchDIBits(HDC hdc,int xDest,int yDest,int DestWidth,int DestHeight,int xSrc,int ySrc,int SrcWidth,int SrcHeight, const void *lpBits, const BITMAPINFO *lpbmi,UINT iUsage,DWORD rop);
func XStretchDIBits(tls *TLS, _hdc THDC, _xDest int32, _yDest int32, _DestWidth int32, _DestHeight int32, _xSrc int32, _ySrc int32, _SrcWidth int32, _SrcHeight int32, _lpBits uintptr, _lpbmi uintptr, _iUsage TUINT, _rop TDWORD) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v xDest=%+v yDest=%+v DestWidth=%+v DestHeight=%+v xSrc=%+v ySrc=%+v SrcWidth=%+v SrcHeight=%+v lpBits=%+v lpbmi=%+v iUsage=%+v rop=%+v", _hdc, _xDest, _yDest, _DestWidth, _DestHeight, _xSrc, _ySrc, _SrcWidth, _SrcHeight, _lpBits, _lpbmi, _iUsage, _rop)
		defer func() { trc(`XStretchDIBits->%+v`, r) }()
	}
	r0, _, _ := procStretchDIBits.Call(_hdc, uintptr(_xDest), uintptr(_yDest), uintptr(_DestWidth), uintptr(_DestHeight), uintptr(_xSrc), uintptr(_ySrc), uintptr(_SrcWidth), uintptr(_SrcHeight), _lpBits, _lpbmi, uintptr(_iUsage), uintptr(_rop))
	return int32(r0)
}

// __attribute__((dllimport)) HDC BeginPaint(HWND hWnd,LPPAINTSTRUCT lpPaint);
func XBeginPaint(tls *TLS, _hWnd THWND, _lpPaint TLPPAINTSTRUCT) (r THDC) {
	if __ccgo_strace {
		trc("hWnd=%+v lpPaint=%+v", _hWnd, _lpPaint)
		defer func() { trc(`XBeginPaint->%+v`, r) }()
	}
	r0, _, err := procBeginPaint.Call(_hWnd, _lpPaint)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THDC(r0)
}

// __attribute__((dllimport)) WINBOOL EndPaint(HWND hWnd, const PAINTSTRUCT *lpPaint);
func XEndPaint(tls *TLS, _hWnd THWND, _lpPaint uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v lpPaint=%+v", _hWnd, _lpPaint)
		defer func() { trc(`XEndPaint->%+v`, r) }()
	}
	r0, _, _ := procEndPaint.Call(_hWnd, _lpPaint)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL OpenClipboard(HWND hWndNewOwner);
func XOpenClipboard(tls *TLS, _hWndNewOwner THWND) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWndNewOwner=%+v", _hWndNewOwner)
		defer func() { trc(`XOpenClipboard->%+v`, r) }()
	}
	r0, _, err := procOpenClipboard.Call(_hWndNewOwner)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL IsClipboardFormatAvailable(UINT format);
func XIsClipboardFormatAvailable(tls *TLS, _format TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("format=%+v", _format)
		defer func() { trc(`XIsClipboardFormatAvailable->%+v`, r) }()
	}
	r0, _, err := procIsClipboardFormatAvailable.Call(uintptr(_format))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) HANDLE GetClipboardData(UINT uFormat);
func XGetClipboardData(tls *TLS, _uFormat TUINT) (r THANDLE) {
	if __ccgo_strace {
		trc("uFormat=%+v", _uFormat)
		defer func() { trc(`XGetClipboardData->%+v`, r) }()
	}
	r0, _, err := procGetClipboardData.Call(uintptr(_uFormat))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THANDLE(r0)
}

// __attribute__((dllimport)) WINBOOL CloseClipboard( void);
func XCloseClipboard(tls *TLS) (r TWINBOOL) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XCloseClipboard->%+v`, r) }()
	}
	r0, _, err := procCloseClipboard.Call()
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) LPVOID GlobalLock (HGLOBAL hMem);
func XGlobalLock(tls *TLS, _hMem THGLOBAL) (r TLPVOID) {
	if __ccgo_strace {
		trc("hMem=%+v", _hMem)
		defer func() { trc(`XGlobalLock->%+v`, r) }()
	}
	r0, _, err := procGlobalLock.Call(_hMem)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TLPVOID(r0)
}

// __attribute__((dllimport)) WINBOOL GlobalUnlock (HGLOBAL hMem);
func XGlobalUnlock(tls *TLS, _hMem THGLOBAL) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hMem=%+v", _hMem)
		defer func() { trc(`XGlobalUnlock->%+v`, r) }()
	}
	r0, _, err := procGlobalUnlock.Call(_hMem)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) int GetLocaleInfoA (LCID Locale, LCTYPE LCType, LPSTR lpLCData, int cchData);
func XGetLocaleInfoA(tls *TLS, _Locale TLCID, _LCType TLCTYPE, _lpLCData TLPSTR, _cchData int32) (r int32) {
	if __ccgo_strace {
		trc("Locale=%+v LCType=%+v lpLCData=%+v cchData=%+v", _Locale, _LCType, _lpLCData, _cchData)
		defer func() { trc(`XGetLocaleInfoA->%+v`, r) }()
	}
	r0, _, err := procGetLocaleInfoA.Call(uintptr(_Locale), uintptr(_LCType), _lpLCData, uintptr(_cchData))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) HWND GetClipboardOwner( void);
func XGetClipboardOwner(tls *TLS) (r THWND) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XGetClipboardOwner->%+v`, r) }()
	}
	r0, _, err := procGetClipboardOwner.Call()
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THWND(r0)
}

// __attribute__((dllimport)) WINBOOL EmptyClipboard( void);
func XEmptyClipboard(tls *TLS) (r TWINBOOL) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XEmptyClipboard->%+v`, r) }()
	}
	r0, _, err := procEmptyClipboard.Call()
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) HDC GetDC(HWND hWnd);
func XGetDC(tls *TLS, _hWnd THWND) (r THDC) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XGetDC->%+v`, r) }()
	}
	r0, _, _ := procGetDC.Call(_hWnd)
	return THDC(r0)
}

type TWINBOOL = int32
type TUINT = uint32
type THWND = uintptr
type TDWORD = uint32
type THRSRC = uintptr
type THMODULE = uintptr
type TLPCWSTR = uintptr
type TLPVOID = uintptr
type THDC = uintptr
type TCOLORREF = uint32
type TLPPAINTSTRUCT = uintptr
type THANDLE = uintptr
type TLCID = uint32
type TLCTYPE = uint32
type TLPSTR = uintptr

// __attribute__((dllimport)) int GetDeviceCaps(HDC hdc,int index);
func XGetDeviceCaps(tls *TLS, _hdc THDC, _index int32) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v index=%+v", _hdc, _index)
		defer func() { trc(`XGetDeviceCaps->%+v`, r) }()
	}
	r0, _, _ := procGetDeviceCaps.Call(_hdc, uintptr(_index))
	return int32(r0)
}

// __attribute__((dllimport)) UINT GetNearestPaletteIndex(HPALETTE h,COLORREF color);
func XGetNearestPaletteIndex(tls *TLS, _h THPALETTE, _color TCOLORREF) (r TUINT) {
	if __ccgo_strace {
		trc("h=%+v color=%+v", _h, _color)
		defer func() { trc(`XGetNearestPaletteIndex->%+v`, r) }()
	}
	r0, _, _ := procGetNearestPaletteIndex.Call(_h, uintptr(_color))
	return TUINT(r0)
}

// __attribute__((dllimport)) UINT GetPaletteEntries(HPALETTE hpal,UINT iStart,UINT cEntries,LPPALETTEENTRY pPalEntries);
func XGetPaletteEntries(tls *TLS, _hpal THPALETTE, _iStart TUINT, _cEntries TUINT, _pPalEntries TLPPALETTEENTRY) (r TUINT) {
	if __ccgo_strace {
		trc("hpal=%+v iStart=%+v cEntries=%+v pPalEntries=%+v", _hpal, _iStart, _cEntries, _pPalEntries)
		defer func() { trc(`XGetPaletteEntries->%+v`, r) }()
	}
	r0, _, _ := procGetPaletteEntries.Call(_hpal, uintptr(_iStart), uintptr(_cEntries), _pPalEntries)
	return TUINT(r0)
}

// __attribute__((dllimport)) HGLOBAL GlobalAlloc (UINT uFlags, SIZE_T dwBytes);
func XGlobalAlloc(tls *TLS, _uFlags TUINT, _dwBytes TSIZE_T) (r THGLOBAL) {
	if __ccgo_strace {
		trc("uFlags=%+v dwBytes=%+v", _uFlags, _dwBytes)
		defer func() { trc(`XGlobalAlloc->%+v`, r) }()
	}
	r0, _, err := procGlobalAlloc.Call(uintptr(_uFlags), uintptr(_dwBytes))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THGLOBAL(r0)
}

// __attribute__((dllimport)) WINBOOL ResizePalette(HPALETTE hpal,UINT n);
func XResizePalette(tls *TLS, _hpal THPALETTE, _n TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hpal=%+v n=%+v", _hpal, _n)
		defer func() { trc(`XResizePalette->%+v`, r) }()
	}
	r0, _, _ := procResizePalette.Call(_hpal, uintptr(_n))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) HANDLE SetClipboardData(UINT uFormat, HANDLE hMem);
func XSetClipboardData(tls *TLS, _uFormat TUINT, _hMem THANDLE) (r THANDLE) {
	if __ccgo_strace {
		trc("uFormat=%+v hMem=%+v", _uFormat, _hMem)
		defer func() { trc(`XSetClipboardData->%+v`, r) }()
	}
	r0, _, err := procSetClipboardData.Call(uintptr(_uFormat), _hMem)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THANDLE(r0)
}

type TSIZE_T = types.Size_t
type THPALETTE = uintptr
type TLPPALETTEENTRY = uintptr

// __attribute__((dllimport)) HPALETTE CreatePalette( const LOGPALETTE *plpal);
func XCreatePalette(tls *TLS, _plpal uintptr) (r THPALETTE) {
	if __ccgo_strace {
		trc("plpal=%+v", _plpal)
		defer func() { trc(`XCreatePalette->%+v`, r) }()
	}
	r0, _, _ := procCreatePalette.Call(_plpal)
	return THPALETTE(r0)
}

// __attribute__((dllimport)) WINBOOL DeleteObject(HGDIOBJ ho);
func XDeleteObject(tls *TLS, _ho THGDIOBJ) (r TWINBOOL) {
	if __ccgo_strace {
		trc("ho=%+v", _ho)
		defer func() { trc(`XDeleteObject->%+v`, r) }()
	}
	r0, _, _ := procDeleteObject.Call(_ho)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) COLORREF GetNearestColor(HDC hdc,COLORREF color);
func XGetNearestColor(tls *TLS, _hdc THDC, _color TCOLORREF) (r TCOLORREF) {
	if __ccgo_strace {
		trc("hdc=%+v color=%+v", _hdc, _color)
		defer func() { trc(`XGetNearestColor->%+v`, r) }()
	}
	r0, _, _ := procGetNearestColor.Call(_hdc, uintptr(_color))
	return TCOLORREF(r0)
}

type THGDIOBJ = uintptr
type TLPRECT = uintptr

// __attribute__((dllimport)) WINBOOL AdjustWindowRectEx(LPRECT lpRect,DWORD dwStyle,WINBOOL bMenu,DWORD dwExStyle);
func XAdjustWindowRectEx(tls *TLS, _lpRect TLPRECT, _dwStyle TDWORD, _bMenu TWINBOOL, _dwExStyle TDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lpRect=%+v dwStyle=%+v bMenu=%+v dwExStyle=%+v", _lpRect, _dwStyle, _bMenu, _dwExStyle)
		defer func() { trc(`XAdjustWindowRectEx->%+v`, r) }()
	}
	r0, _, err := procAdjustWindowRectEx.Call(_lpRect, uintptr(_dwStyle), uintptr(_bMenu), uintptr(_dwExStyle))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

type TPOINT = struct {
	Fx TLONG
	Fy TLONG
}

type TLONG = int32

// __attribute__((dllimport)) HWND WindowFromPoint(POINT Point);
func XWindowFromPoint(tls *TLS, _Point TPOINT) (r THWND) {
	if __ccgo_strace {
		trc("Point=%+v", _Point)
		defer func() { trc(`XWindowFromPoint->%+v`, r) }()
	}
	r0, _, _ := procWindowFromPoint.Call(uintptr(*(*int64)(unsafe.Pointer(&_Point))))
	return THWND(r0)
}

type TSHORT = int16
type TWCHAR = uint16

// __attribute__((dllimport)) SHORT VkKeyScanW(WCHAR ch);
func XVkKeyScanW(tls *TLS, _ch TWCHAR) (r TSHORT) {
	if __ccgo_strace {
		trc("ch=%+v", _ch)
		defer func() { trc(`XVkKeyScanW->%+v`, r) }()
	}
	r0, _, _ := procVkKeyScanW.Call(uintptr(_ch))
	return TSHORT(r0)
}

// var procVariantInit = dll.NewProc("VariantInit")

// extern __attribute__((dllimport))void VariantInit(VARIANTARG *pvarg);
func XVariantInit(tls *TLS, _pvarg uintptr) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

func XVariantChangeType(t *TLS, _ ...any) THRESULT {
	die(t, "syscall with func pointer")
	panic(todo(""))
}

func XVariantClear(t *TLS, _ ...any) uintptr {
	die(t, "syscall with func pointer")
	panic(todo(""))
}

type TWNDENUMPROC = uintptr

// __attribute__((dllimport)) WINBOOL EnumChildWindows(HWND hWndParent,WNDENUMPROC lpEnumFunc,LPARAM lParam);
func XEnumChildWindows(tls *TLS, _hWndParent THWND, _lpEnumFunc TWNDENUMPROC, _lParam TLPARAM) (r TWINBOOL) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

// __attribute__((dllimport)) HHOOK SetWindowsHookExW (int idHook, HOOKPROC lpfn, HINSTANCE hmod, DWORD dwThreadId);
func XSetWindowsHookExW(tls *TLS, _idHook int32, _lpfn THOOKPROC, _hmod THINSTANCE, _dwThreadId TDWORD) (r THHOOK) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

type THOOKPROC = uintptr

// extern __attribute__((dllimport)) HRESULT SetErrorInfo(ULONG dwReserved,IErrorInfo *perrinfo);
func XSetErrorInfo(tls *TLS, _dwReserved TULONG, _perrinfo uintptr) (r THRESULT) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

type TULONG = uint32

// __attribute__((dllimport)) WINBOOL GetOpenFileNameW(LPOPENFILENAMEW);
func XGetOpenFileNameW(tls *TLS, _0 TLPOPENFILENAMEW) (r TWINBOOL) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

type TLPOPENFILENAMEW = uintptr

var procCreateErrorInfo = modole32.NewProc("CreateErrorInfo")

// extern __attribute__((dllimport)) HRESULT CreateErrorInfo(ICreateErrorInfo **pperrinfo);
func XCreateErrorInfo(tls *TLS, _pperrinfo uintptr) (r THRESULT) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

var procCreateFileMoniker = modole32.NewProc("CreateFileMoniker")

// extern __attribute__((modole32import)) HRESULT CreateFileMoniker (LPCOLESTR lpszPathName, LPMONIKER *ppmk);
func XCreateFileMoniker(tls *TLS, _lpszPathName TLPCOLESTR, _ppmk uintptr) (r THRESULT) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

var procGetRunningObjectTable = modole32.NewProc("GetRunningObjectTable")

// extern __attribute__((modole32import)) HRESULT GetRunningObjectTable (DWORD reserved, LPRUNNINGOBJECTTABLE *pprot);
func XGetRunningObjectTable(tls *TLS, _reserved TDWORD, _pprot uintptr) (r THRESULT) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

type TLPCOLESTR = uintptr

var procGetSaveFileNameW = modcomdlg32.NewProc("GetSaveFileNameW")

// __attribute__((dllimport)) WINBOOL GetSaveFileNameW(LPOPENFILENAMEW);
func XGetSaveFileNameW(tls *TLS, _0 TLPOPENFILENAMEW) (r TWINBOOL) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

var procSHBrowseForFolderW = modshell32.NewProc("SHBrowseForFolderW")

// __attribute__((dllimport)) LPITEMIDLIST SHBrowseForFolderW (LPBROWSEINFOW lpbi);
func XSHBrowseForFolderW(tls *TLS, _lpbi TLPBROWSEINFOW) (r TLPITEMIDLIST) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

type TLPITEMIDLIST = uintptr

type TLPBROWSEINFOW = uintptr

var procSHGetDesktopFolder = modshell32.NewProc("SHGetDesktopFolder")

// __attribute__((dllimport)) HRESULT SHGetDesktopFolder (IShellFolder **ppshf);
func XSHGetDesktopFolder(tls *TLS, _ppshf uintptr) (r THRESULT) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

var procSHGetMalloc = modshell32.NewProc("SHGetMalloc")

// __attribute__((dllimport)) HRESULT SHGetMalloc (IMalloc **ppMalloc);
func XSHGetMalloc(tls *TLS, _ppMalloc uintptr) (r THRESULT) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

var procCreateBindCtx = modole32.NewProc("CreateBindCtx")

// extern __attribute__((modole32import)) HRESULT CreateBindCtx (DWORD reserved, LPBC *ppbc);
func XCreateBindCtx(tls *TLS, _reserved TDWORD, _ppbc uintptr) (r THRESULT) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

var procCoCreateInstance = modole32.NewProc("CoCreateInstance")

// extern __attribute__((modole32import)) HRESULT CoCreateInstance ( const IID * const rclsid, LPUNKNOWN pUnkOuter, DWORD dwClsContext, const IID * const riid, LPVOID *ppv);
func XCoCreateInstance(tls *TLS, _rclsid uintptr, _pUnkOuter TLPUNKNOWN, _dwClsContext TDWORD, _riid uintptr, _ppv uintptr) (r THRESULT) {
	r0, _, _ := procCoCreateInstance.Call(_rclsid, _pUnkOuter, uintptr(_dwClsContext), _riid, _ppv)
	return THRESULT(r0)
}

type TLPUNKNOWN = uintptr

var procCallWindowProcW = moduser32.NewProc("CallWindowProcW")

// __attribute__((moduser32import)) LRESULT CallWindowProcW (WNDPROC lpPrevWndFunc, HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
func XCallWindowProcW(tls *TLS, _lpPrevWndFunc TWNDPROC, _hWnd THWND, _Msg TUINT, _wParam TWPARAM, _lParam TLPARAM) (r TLRESULT) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

var procChooseColorW = modcomdlg32.NewProc("ChooseColorW")

// __attribute__((dllimport)) WINBOOL ChooseColorW(LPCHOOSECOLORW);
func XChooseColorW(tls *TLS, _0 TLPCHOOSECOLORW) (r TWINBOOL) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

type TLPCHOOSECOLORW = uintptr

var procChooseFontW = modcomdlg32.NewProc("ChooseFontW")

// __attribute__((dllimport)) WINBOOL ChooseFontW(LPCHOOSEFONTW);
func XChooseFontW(tls *TLS, _0 TLPCHOOSEFONTW) (r TWINBOOL) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

type TLPCHOOSEFONTW = uintptr

var procPrintDlgW = modcomdlg32.NewProc("PrintDlgW")

// __attribute__((dllimport)) WINBOOL PrintDlgW(LPPRINTDLGW);
func XPrintDlgW(tls *TLS, _0 TLPPRINTDLGW) (r TWINBOOL) {
	die(tls, "syscall with func pointer")
	panic(todo(""))
}

type TLPPRINTDLGW = uintptr

// ----

type THRESULT = int32

type TGUID = struct {
	FData1 uint32
	FData2 uint16
	FData3 uint16
	FData4 [8]uint8
}

var XIID_IUnknown = TGUID{
	FData4: [8]uint8{
		0: uint8(0xc0),
		7: uint8(0x46),
	},
}

var XGUID_NULL TGUID

var XIID_IDispatch = TGUID{
	FData1: uint32(0x00020400),
	FData4: [8]uint8{
		0: uint8(0xc0),
		7: uint8(0x46),
	},
}

var XIID_IErrorInfo = TGUID{
	FData1: uint32(0x1cf2b120),
	FData2: uint16(0x547d),
	FData3: uint16(0x101b),
	FData4: [8]uint8{
		0: uint8(0x8e),
		1: uint8(0x65),
		2: uint8(0x08),
		4: uint8(0x2b),
		5: uint8(0x2b),
		6: uint8(0xd1),
		7: uint8(0x19),
	},
}

var XIID_ISupportErrorInfo = TGUID{
	FData1: uint32(0xdf0b3d60),
	FData2: uint16(0x548f),
	FData3: uint16(0x101b),
	FData4: [8]uint8{
		0: uint8(0x8e),
		1: uint8(0x65),
		2: uint8(0x08),
		4: uint8(0x2b),
		5: uint8(0x2b),
		6: uint8(0xd1),
		7: uint8(0x19),
	},
}

var XCLSID_TaskbarList = TGUID{
	FData1: uint32(0x56fdf344),
	FData2: uint16(0xfd6d),
	FData3: uint16(0x11d0),
	FData4: [8]uint8{
		0: uint8(0x95),
		1: uint8(0x8a),
		3: uint8(0x60),
		4: uint8(0x97),
		5: uint8(0xc9),
		6: uint8(0xa0),
		7: uint8(0x90),
	},
}

var XIID_ITaskbarList3 = TGUID{
	FData1: uint32(0xea1afb91),
	FData2: uint16(0x9e28),
	FData3: uint16(0x4b86),
	FData4: [8]uint8{
		0: uint8(0x90),
		1: uint8(0xe9),
		2: uint8(0x9e),
		3: uint8(0x9f),
		4: uint8(0x8a),
		5: uint8(0x5e),
		6: uint8(0xef),
		7: uint8(0xaf),
	},
}

// __attribute__((dllimport)) int MulDiv (int nNumber, int nNumerator, int nDenominator);
func XMulDiv(tls *TLS, _nNumber int32, _nNumerator int32, _nDenominator int32) (r int32) {
	if __ccgo_strace {
		trc("nNumber=%+v nNumerator=%+v nDenominator=%+v", _nNumber, _nNumerator, _nDenominator)
		defer func() { trc(`XMulDiv->%+v`, r) }()
	}
	r0, _, _ := procMulDiv.Call(uintptr(_nNumber), uintptr(_nNumerator), uintptr(_nDenominator))
	return int32(r0)
}

// __attribute__((dllimport)) int ReleaseDC(HWND hWnd,HDC hDC);
func XReleaseDC(tls *TLS, _hWnd THWND, _hDC THDC) (r int32) {
	if __ccgo_strace {
		trc("hWnd=%+v hDC=%+v", _hWnd, _hDC)
		defer func() { trc(`XReleaseDC->%+v`, r) }()
	}
	r0, _, _ := procReleaseDC.Call(_hWnd, _hDC)
	return int32(r0)
}

// __attribute__((dllimport)) HGDIOBJ GetStockObject(int i);
func XGetStockObject(tls *TLS, _i int32) (r THGDIOBJ) {
	if __ccgo_strace {
		trc("i=%+v", _i)
		defer func() { trc(`XGetStockObject->%+v`, r) }()
	}
	r0, _, _ := procGetStockObject.Call(uintptr(_i))
	return THGDIOBJ(r0)
}

// __attribute__((dllimport)) DWORD GetTickCount ( void);
func XGetTickCount(tls *TLS) (r TDWORD) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XGetTickCount->%+v`, r) }()
	}
	r0, _, _ := procGetTickCount.Call()
	return TDWORD(r0)
}

// __attribute__((dllimport)) UINT MapVirtualKeyW(UINT uCode,UINT uMapType);
func XMapVirtualKeyW(tls *TLS, _uCode TUINT, _uMapType TUINT) (r TUINT) {
	if __ccgo_strace {
		trc("uCode=%+v uMapType=%+v", _uCode, _uMapType)
		defer func() { trc(`XMapVirtualKeyW->%+v`, r) }()
	}
	r0, _, _ := procMapVirtualKeyW.Call(uintptr(_uCode), uintptr(_uMapType))
	return TUINT(r0)
}

// __attribute__((dllimport)) SHORT GetKeyState(int nVirtKey);
func XGetKeyState(tls *TLS, _nVirtKey int32) (r TSHORT) {
	if __ccgo_strace {
		trc("nVirtKey=%+v", _nVirtKey)
		defer func() { trc(`XGetKeyState->%+v`, r) }()
	}
	r0, _, _ := procGetKeyState.Call(uintptr(_nVirtKey))
	return TSHORT(r0)
}

type THHOOK = uintptr

// __attribute__((dllimport)) WINBOOL UnhookWindowsHookEx (HHOOK hhk);
func XUnhookWindowsHookEx(tls *TLS, _hhk THHOOK) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hhk=%+v", _hhk)
		defer func() { trc(`XUnhookWindowsHookEx->%+v`, r) }()
	}
	r0, _, err := procUnhookWindowsHookEx.Call(_hhk)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL UpdateColors(HDC hdc);
func XUpdateColors(tls *TLS, _hdc THDC) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XUpdateColors->%+v`, r) }()
	}
	r0, _, _ := procUpdateColors.Call(_hdc)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL UpdateWindow(HWND hWnd);
func XUpdateWindow(tls *TLS, _hWnd THWND) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XUpdateWindow->%+v`, r) }()
	}
	r0, _, _ := procUpdateWindow.Call(_hWnd)
	return TWINBOOL(r0)
}

// LONG InterlockedDecrement(
//
//	[in, out] LONG volatile *Addend
//
// );
func X_InterlockedDecrement(t *TLS, Addend uintptr) int32 {
	return atomic.AddInt32((*int32)(unsafe.Pointer(Addend)), -1)
}

// LONG InterlockedIncrement(
//
//	[in, out] LONG volatile *Addend
//
// );
func X_InterlockedIncrement(t *TLS, Addend uintptr) int32 {
	return atomic.AddInt32((*int32)(unsafe.Pointer(Addend)), 1)
}

// __attribute__((dllimport)) HWND FindWindowA(LPCSTR lpClassName,LPCSTR lpWindowName);
func XFindWindowA(tls *TLS, _lpClassName TLPCSTR, _lpWindowName TLPCSTR) (r THWND) {
	if __ccgo_strace {
		trc("lpClassName=%+v lpWindowName=%+v", _lpClassName, _lpWindowName)
		defer func() { trc(`XFindWindowA->%+v`, r) }()
	}
	r0, _, _ := procFindWindowA.Call(_lpClassName, _lpWindowName)
	return THWND(r0)
}

// __attribute__((dllimport)) HWND FindWindowExW(HWND hWndParent,HWND hWndChildAfter,LPCWSTR lpszClass,LPCWSTR lpszWindow);
func XFindWindowExW(tls *TLS, _hWndParent THWND, _hWndChildAfter THWND, _lpszClass TLPCWSTR, _lpszWindow TLPCWSTR) (r THWND) {
	if __ccgo_strace {
		trc("hWndParent=%+v hWndChildAfter=%+v lpszClass=%+v lpszWindow=%+v", _hWndParent, _hWndChildAfter, _lpszClass, _lpszWindow)
		defer func() { trc(`XFindWindowExW->%+v`, r) }()
	}
	r0, _, err := procFindWindowExW.Call(_hWndParent, _hWndChildAfter, _lpszClass, _lpszWindow)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THWND(r0)
}

type TLPCVOID = uintptr

// __attribute__((dllimport)) DWORD FormatMessageA (DWORD dwFlags, LPCVOID lpSource, DWORD dwMessageId, DWORD dwLanguageId, LPSTR lpBuffer, DWORD nSize, va_list *Arguments);
func XFormatMessageA(tls *TLS, _dwFlags TDWORD, _lpSource TLPCVOID, _dwMessageId TDWORD, _dwLanguageId TDWORD, _lpBuffer TLPSTR, _nSize TDWORD, _Arguments uintptr) (r TDWORD) {
	if __ccgo_strace {
		trc("dwFlags=%+v lpSource=%+v dwMessageId=%+v dwLanguageId=%+v lpBuffer=%+v nSize=%+v Arguments=%+v", _dwFlags, _lpSource, _dwMessageId, _dwLanguageId, _lpBuffer, _nSize, _Arguments)
		defer func() { trc(`XFormatMessageA->%+v`, r) }()
	}
	r0, _, err := procFormatMessageA.Call(uintptr(_dwFlags), _lpSource, uintptr(_dwMessageId), uintptr(_dwLanguageId), _lpBuffer, uintptr(_nSize), _Arguments)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TDWORD(r0)
}

type TLPWSTR = uintptr

// __attribute__((dllimport)) int GetClassNameW(HWND hWnd,LPWSTR lpClassName,int nMaxCount);
func XGetClassNameW(tls *TLS, _hWnd THWND, _lpClassName TLPWSTR, _nMaxCount int32) (r int32) {
	if __ccgo_strace {
		trc("hWnd=%+v lpClassName=%+v nMaxCount=%+v", _hWnd, _lpClassName, _nMaxCount)
		defer func() { trc(`XGetClassNameW->%+v`, r) }()
	}
	r0, _, err := procGetClassNameW.Call(_hWnd, _lpClassName, uintptr(_nMaxCount))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) int GetDlgCtrlID(HWND hWnd);
func XGetDlgCtrlID(tls *TLS, _hWnd THWND) (r int32) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XGetDlgCtrlID->%+v`, r) }()
	}
	r0, _, err := procGetDlgCtrlID.Call(_hWnd)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) LCID GetThreadLocale (void);
func XGetThreadLocale(tls *TLS) (r TLCID) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XGetThreadLocale->%+v`, r) }()
	}
	r0, _, _ := procGetThreadLocale.Call()
	return TLCID(r0)
}

type TLPDWORD = uintptr

// __attribute__((dllimport)) DWORD GetWindowThreadProcessId(HWND hWnd,LPDWORD lpdwProcessId);
func XGetWindowThreadProcessId(tls *TLS, _hWnd THWND, _lpdwProcessId TLPDWORD) (r TDWORD) {
	if __ccgo_strace {
		trc("hWnd=%+v lpdwProcessId=%+v", _hWnd, _lpdwProcessId)
		defer func() { trc(`XGetWindowThreadProcessId->%+v`, r) }()
	}
	r0, _, err := procGetWindowThreadProcessId.Call(_hWnd, _lpdwProcessId)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TDWORD(r0)
}

type THLOCAL = uintptr

// __attribute__((dllimport)) HLOCAL LocalAlloc (UINT uFlags, SIZE_T uBytes);
func XLocalAlloc(tls *TLS, _uFlags TUINT, _uBytes TSIZE_T) (r THLOCAL) {
	if __ccgo_strace {
		trc("uFlags=%+v uBytes=%+v", _uFlags, _uBytes)
		defer func() { trc(`XLocalAlloc->%+v`, r) }()
	}
	r0, _, err := procLocalAlloc.Call(uintptr(_uFlags), uintptr(_uBytes))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THLOCAL(r0)
}

// __attribute__((dllimport)) LRESULT SendDlgItemMessageA(HWND hDlg,int nIDDlgItem,UINT Msg,WPARAM wParam,LPARAM lParam);
func XSendDlgItemMessageA(tls *TLS, _hDlg THWND, _nIDDlgItem int32, _Msg TUINT, _wParam TWPARAM, _lParam TLPARAM) (r TLRESULT) {
	if __ccgo_strace {
		trc("hDlg=%+v nIDDlgItem=%+v Msg=%+v wParam=%+v lParam=%+v", _hDlg, _nIDDlgItem, _Msg, _wParam, _lParam)
		defer func() { trc(`XSendDlgItemMessageA->%+v`, r) }()
	}
	r0, _, _ := procSendDlgItemMessageA.Call(_hDlg, uintptr(_nIDDlgItem), uintptr(_Msg), uintptr(_wParam), uintptr(_lParam))
	return TLRESULT(r0)
}

// __attribute__((dllimport)) LRESULT SendMessageA(HWND hWnd,UINT Msg,WPARAM wParam,LPARAM lParam);
func XSendMessageA(tls *TLS, _hWnd THWND, _Msg TUINT, _wParam TWPARAM, _lParam TLPARAM) (r TLRESULT) {
	if __ccgo_strace {
		trc("hWnd=%+v Msg=%+v wParam=%+v lParam=%+v", _hWnd, _Msg, _wParam, _lParam)
		defer func() { trc(`XSendMessageA->%+v`, r) }()
	}
	r0, _, _ := procSendMessageA.Call(_hWnd, uintptr(_Msg), uintptr(_wParam), uintptr(_lParam))
	return TLRESULT(r0)
}

// __attribute__((dllimport)) HWND SetParent(HWND hWndChild,HWND hWndNewParent);
func XSetParent(tls *TLS, _hWndChild THWND, _hWndNewParent THWND) (r THWND) {
	if __ccgo_strace {
		trc("hWndChild=%+v hWndNewParent=%+v", _hWndChild, _hWndNewParent)
		defer func() { trc(`XSetParent->%+v`, r) }()
	}
	r0, _, err := procSetParent.Call(_hWndChild, _hWndNewParent)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THWND(r0)
}

// __attribute__((dllimport)) int SetPolyFillMode(HDC hdc,int mode);
func XSetPolyFillMode(tls *TLS, _hdc THDC, _mode int32) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v mode=%+v", _hdc, _mode)
		defer func() { trc(`XSetPolyFillMode->%+v`, r) }()
	}
	r0, _, _ := procSetPolyFillMode.Call(_hdc, uintptr(_mode))
	return int32(r0)
}

// __attribute__((dllimport)) int SetROP2(HDC hdc,int rop2);
func XSetROP2(tls *TLS, _hdc THDC, _rop2 int32) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v rop2=%+v", _hdc, _rop2)
		defer func() { trc(`XSetROP2->%+v`, r) }()
	}
	r0, _, _ := procSetROP2.Call(_hdc, uintptr(_rop2))
	return int32(r0)
}

// __attribute__((dllimport)) WINBOOL SetRectRgn(HRGN hrgn,int left,int top,int right,int bottom);
func XSetRectRgn(tls *TLS, _hrgn THRGN, _left int32, _top int32, _right int32, _bottom int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hrgn=%+v left=%+v top=%+v right=%+v bottom=%+v", _hrgn, _left, _top, _right, _bottom)
		defer func() { trc(`XSetRectRgn->%+v`, r) }()
	}
	r0, _, _ := procSetRectRgn.Call(_hrgn, uintptr(_left), uintptr(_top), uintptr(_right), uintptr(_bottom))
	return TWINBOOL(r0)
}

type THRGN = uintptr

// __attribute__((dllimport)) int SetScrollInfo(HWND hwnd,int nBar,LPCSCROLLINFO lpsi,WINBOOL redraw);
func XSetScrollInfo(tls *TLS, _hwnd THWND, _nBar int32, _lpsi TLPCSCROLLINFO, _redraw TWINBOOL) (r int32) {
	if __ccgo_strace {
		trc("hwnd=%+v nBar=%+v lpsi=%+v redraw=%+v", _hwnd, _nBar, _lpsi, _redraw)
		defer func() { trc(`XSetScrollInfo->%+v`, r) }()
	}
	r0, _, _ := procSetScrollInfo.Call(_hwnd, uintptr(_nBar), _lpsi, uintptr(_redraw))
	return int32(r0)
}

type TLPCSCROLLINFO = uintptr

// __attribute__((dllimport)) UINT SetTextAlign(HDC hdc,UINT align);
func XSetTextAlign(tls *TLS, _hdc THDC, _align TUINT) (r TUINT) {
	if __ccgo_strace {
		trc("hdc=%+v align=%+v", _hdc, _align)
		defer func() { trc(`XSetTextAlign->%+v`, r) }()
	}
	r0, _, _ := procSetTextAlign.Call(_hdc, uintptr(_align))
	return TUINT(r0)
}

// __attribute__((dllimport)) WINBOOL SetWindowTextW(HWND hWnd,LPCWSTR lpString);
func XSetWindowTextW(tls *TLS, _hWnd THWND, _lpString TLPCWSTR) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v lpString=%+v", _hWnd, _lpString)
		defer func() { trc(`XSetWindowTextW->%+v`, r) }()
	}
	r0, _, err := procSetWindowTextW.Call(_hWnd, _lpString)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL ShowWindow(HWND hWnd,int nCmdShow);
func XShowWindow(tls *TLS, _hWnd THWND, _nCmdShow int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v nCmdShow=%+v", _hWnd, _nCmdShow)
		defer func() { trc(`XShowWindow->%+v`, r) }()
	}
	r0, _, _ := procShowWindow.Call(_hWnd, uintptr(_nCmdShow))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL StrokeAndFillPath(HDC hdc);
func XStrokeAndFillPath(tls *TLS, _hdc THDC) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XStrokeAndFillPath->%+v`, r) }()
	}
	r0, _, _ := procStrokeAndFillPath.Call(_hdc)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL StrokePath(HDC hdc);
func XStrokePath(tls *TLS, _hdc THDC) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XStrokePath->%+v`, r) }()
	}
	r0, _, _ := procStrokePath.Call(_hdc)
	return TWINBOOL(r0)
}

// extern __attribute__((dllimport))BSTR SysAllocString(const OLECHAR *);
func XSysAllocString(tls *TLS, _0 uintptr) (r TBSTR) {
	if __ccgo_strace {
		trc("0=%+v", _0)
		defer func() { trc(`XSysAllocString->%+v`, r) }()
	}
	r0, _, _ := procSysAllocString.Call(_0)
	return TBSTR(r0)
}

// extern __attribute__((dllimport))void SysFreeString(BSTR);
func XSysFreeString(tls *TLS, _0 TBSTR) {
	if __ccgo_strace {
		trc("0=%+v", _0)
	}
	procSysFreeString.Call(_0)
}

// extern __attribute__((dllimport))UINT SysStringLen(BSTR);
func XSysStringLen(tls *TLS, _0 TBSTR) (r TUINT) {
	if __ccgo_strace {
		trc("0=%+v", _0)
		defer func() { trc(`XSysStringLen->%+v`, r) }()
	}
	r0, _, _ := procSysStringLen.Call(_0)
	return TUINT(r0)
}

type TBSTR = uintptr

// __attribute__((dllimport)) WINBOOL SystemParametersInfoW(UINT uiAction,UINT uiParam,PVOID pvParam,UINT fWinIni);
func XSystemParametersInfoW(tls *TLS, _uiAction TUINT, _uiParam TUINT, _pvParam TPVOID, _fWinIni TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("uiAction=%+v uiParam=%+v pvParam=%+v fWinIni=%+v", _uiAction, _uiParam, _pvParam, _fWinIni)
		defer func() { trc(`XSystemParametersInfoW->%+v`, r) }()
	}
	r0, _, err := procSystemParametersInfoW.Call(uintptr(_uiAction), uintptr(_uiParam), _pvParam, uintptr(_fWinIni))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

type TPVOID = uintptr

// __attribute__((dllimport)) WINBOOL TextOutA(HDC hdc,int x,int y,LPCSTR lpString,int c);
func XTextOutA(tls *TLS, _hdc THDC, _x int32, _y int32, _lpString TLPCSTR, _c int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v lpString=%+v c=%+v", _hdc, _x, _y, _lpString, _c)
		defer func() { trc(`XTextOutA->%+v`, r) }()
	}
	r0, _, _ := procTextOutA.Call(_hdc, uintptr(_x), uintptr(_y), _lpString, uintptr(_c))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL TextOutW(HDC hdc,int x,int y,LPCWSTR lpString,int c);
func XTextOutW(tls *TLS, _hdc THDC, _x int32, _y int32, _lpString TLPCWSTR, _c int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v lpString=%+v c=%+v", _hdc, _x, _y, _lpString, _c)
		defer func() { trc(`XTextOutW->%+v`, r) }()
	}
	r0, _, _ := procTextOutW.Call(_hdc, uintptr(_x), uintptr(_y), _lpString, uintptr(_c))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) int ToUnicode(UINT wVirtKey,UINT wScanCode, const BYTE *lpKeyState,LPWSTR pwszBuff,int cchBuff,UINT wFlags);
func XToUnicode(tls *TLS, _wVirtKey TUINT, _wScanCode TUINT, _lpKeyState uintptr, _pwszBuff TLPWSTR, _cchBuff int32, _wFlags TUINT) (r int32) {
	if __ccgo_strace {
		trc("wVirtKey=%+v wScanCode=%+v lpKeyState=%+v pwszBuff=%+v cchBuff=%+v wFlags=%+v", _wVirtKey, _wScanCode, _lpKeyState, _pwszBuff, _cchBuff, _wFlags)
		defer func() { trc(`XToUnicode->%+v`, r) }()
	}
	r0, _, _ := procToUnicode.Call(uintptr(_wVirtKey), uintptr(_wScanCode), _lpKeyState, _pwszBuff, uintptr(_cchBuff), uintptr(_wFlags))
	return int32(r0)
}

// __attribute__((dllimport)) WINBOOL TrackPopupMenu(HMENU hMenu,UINT uFlags,int x,int y,int nReserved,HWND hWnd, const RECT *prcRect);
func XTrackPopupMenu(tls *TLS, _hMenu THMENU, _uFlags TUINT, _x int32, _y int32, _nReserved int32, _hWnd THWND, _prcRect uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hMenu=%+v uFlags=%+v x=%+v y=%+v nReserved=%+v hWnd=%+v prcRect=%+v", _hMenu, _uFlags, _x, _y, _nReserved, _hWnd, _prcRect)
		defer func() { trc(`XTrackPopupMenu->%+v`, r) }()
	}
	r0, _, err := procTrackPopupMenu.Call(_hMenu, uintptr(_uFlags), uintptr(_x), uintptr(_y), uintptr(_nReserved), _hWnd, _prcRect)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

type THMENU = uintptr

type TLPCHARSETINFO = uintptr

// __attribute__((dllimport)) WINBOOL TranslateCharsetInfo(DWORD *lpSrc,LPCHARSETINFO lpCs,DWORD dwFlags);
func XTranslateCharsetInfo(tls *TLS, _lpSrc uintptr, _lpCs TLPCHARSETINFO, _dwFlags TDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lpSrc=%+v lpCs=%+v dwFlags=%+v", _lpSrc, _lpCs, _dwFlags)
		defer func() { trc(`XTranslateCharsetInfo->%+v`, r) }()
	}
	r0, _, err := procTranslateCharsetInfo.Call(_lpSrc, _lpCs, uintptr(_dwFlags))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) HFONT CreateFontIndirectW( const LOGFONTW *lplf);
func XCreateFontIndirectW(tls *TLS, _lplf uintptr) (r THFONT) {
	if __ccgo_strace {
		trc("lplf=%+v", _lplf)
		defer func() { trc(`XCreateFontIndirectW->%+v`, r) }()
	}
	r0, _, _ := procCreateFontIndirectW.Call(_lplf)
	return THFONT(r0)
}

type THFONT = uintptr

// __attribute__((dllimport)) HICON CreateIconFromResource(PBYTE presbits,DWORD dwResSize,WINBOOL fIcon,DWORD dwVer);
func XCreateIconFromResource(tls *TLS, _presbits TPBYTE, _dwResSize TDWORD, _fIcon TWINBOOL, _dwVer TDWORD) (r THICON) {
	if __ccgo_strace {
		trc("presbits=%+v dwResSize=%+v fIcon=%+v dwVer=%+v", _presbits, _dwResSize, _fIcon, _dwVer)
		defer func() { trc(`XCreateIconFromResource->%+v`, r) }()
	}
	r0, _, err := procCreateIconFromResource.Call(_presbits, uintptr(_dwResSize), uintptr(_fIcon), uintptr(_dwVer))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THICON(r0)
}

// __attribute__((dllimport)) HICON CreateIconFromResourceEx(PBYTE presbits,DWORD dwResSize,WINBOOL fIcon,DWORD dwVer,int cxDesired,int cyDesired,UINT Flags);
func XCreateIconFromResourceEx(tls *TLS, _presbits TPBYTE, _dwResSize TDWORD, _fIcon TWINBOOL, _dwVer TDWORD, _cxDesired int32, _cyDesired int32, _Flags TUINT) (r THICON) {
	if __ccgo_strace {
		trc("presbits=%+v dwResSize=%+v fIcon=%+v dwVer=%+v cxDesired=%+v cyDesired=%+v Flags=%+v", _presbits, _dwResSize, _fIcon, _dwVer, _cxDesired, _cyDesired, _Flags)
		defer func() { trc(`XCreateIconFromResourceEx->%+v`, r) }()
	}
	r0, _, err := procCreateIconFromResourceEx.Call(_presbits, uintptr(_dwResSize), uintptr(_fIcon), uintptr(_dwVer), uintptr(_cxDesired), uintptr(_cyDesired), uintptr(_Flags))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THICON(r0)
}

type TPBYTE = uintptr

// __attribute__((dllimport)) HICON CreateIconIndirect(PICONINFO piconinfo);
func XCreateIconIndirect(tls *TLS, _piconinfo TPICONINFO) (r THICON) {
	if __ccgo_strace {
		trc("piconinfo=%+v", _piconinfo)
		defer func() { trc(`XCreateIconIndirect->%+v`, r) }()
	}
	r0, _, err := procCreateIconIndirect.Call(_piconinfo)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THICON(r0)
}

type TPICONINFO = uintptr

// __attribute__((dllimport)) HMENU CreateMenu( void);
func XCreateMenu(tls *TLS) (r THMENU) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XCreateMenu->%+v`, r) }()
	}
	r0, _, err := procCreateMenu.Call()
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THMENU(r0)
}

// __attribute__((dllimport)) HBRUSH CreatePatternBrush(HBITMAP hbm);
func XCreatePatternBrush(tls *TLS, _hbm THBITMAP) (r THBRUSH) {
	if __ccgo_strace {
		trc("hbm=%+v", _hbm)
		defer func() { trc(`XCreatePatternBrush->%+v`, r) }()
	}
	r0, _, _ := procCreatePatternBrush.Call(_hbm)
	return THBRUSH(r0)
}

type THBITMAP = uintptr

// __attribute__((dllimport)) HPEN CreatePen(int iStyle,int cWidth,COLORREF color);
func XCreatePen(tls *TLS, _iStyle int32, _cWidth int32, _color TCOLORREF) (r THPEN) {
	if __ccgo_strace {
		trc("iStyle=%+v cWidth=%+v color=%+v", _iStyle, _cWidth, _color)
		defer func() { trc(`XCreatePen->%+v`, r) }()
	}
	r0, _, _ := procCreatePen.Call(uintptr(_iStyle), uintptr(_cWidth), uintptr(_color))
	return THPEN(r0)
}

type THPEN = uintptr

// __attribute__((dllimport)) HMENU CreatePopupMenu( void);
func XCreatePopupMenu(tls *TLS) (r THMENU) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XCreatePopupMenu->%+v`, r) }()
	}
	r0, _, err := procCreatePopupMenu.Call()
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THMENU(r0)
}

// __attribute__((dllimport)) HRGN CreateRectRgn(int x1,int y1,int x2,int y2);
func XCreateRectRgn(tls *TLS, _x1 int32, _y1 int32, _x2 int32, _y2 int32) (r THRGN) {
	if __ccgo_strace {
		trc("x1=%+v y1=%+v x2=%+v y2=%+v", _x1, _y1, _x2, _y2)
		defer func() { trc(`XCreateRectRgn->%+v`, r) }()
	}
	r0, _, _ := procCreateRectRgn.Call(uintptr(_x1), uintptr(_y1), uintptr(_x2), uintptr(_y2))
	return THRGN(r0)
}

// __attribute__((dllimport)) HRGN CreateRectRgnIndirect( const RECT *lprect);
func XCreateRectRgnIndirect(tls *TLS, _lprect uintptr) (r THRGN) {
	if __ccgo_strace {
		trc("lprect=%+v", _lprect)
		defer func() { trc(`XCreateRectRgnIndirect->%+v`, r) }()
	}
	r0, _, _ := procCreateRectRgnIndirect.Call(_lprect)
	return THRGN(r0)
}

// __attribute__((dllimport)) HBRUSH CreateSolidBrush(COLORREF color);
func XCreateSolidBrush(tls *TLS, _color TCOLORREF) (r THBRUSH) {
	if __ccgo_strace {
		trc("color=%+v", _color)
		defer func() { trc(`XCreateSolidBrush->%+v`, r) }()
	}
	r0, _, _ := procCreateSolidBrush.Call(uintptr(_color))
	return THBRUSH(r0)
}

// __attribute__((dllimport)) WINBOOL DPtoLP(HDC hdc,LPPOINT lppt,int c);
func XDPtoLP(tls *TLS, _hdc THDC, _lppt TLPPOINT, _c int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v lppt=%+v c=%+v", _hdc, _lppt, _c)
		defer func() { trc(`XDPtoLP->%+v`, r) }()
	}
	r0, _, _ := procDPtoLP.Call(_hdc, _lppt, uintptr(_c))
	return TWINBOOL(r0)
}

type TLPPOINT = uintptr

// __attribute__((dllimport)) WINBOOL DeleteDC(HDC hdc);
func XDeleteDC(tls *TLS, _hdc THDC) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XDeleteDC->%+v`, r) }()
	}
	r0, _, _ := procDeleteDC.Call(_hdc)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL DestroyCaret( void);
func XDestroyCaret(tls *TLS) (r TWINBOOL) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XDestroyCaret->%+v`, r) }()
	}
	r0, _, err := procDestroyCaret.Call()
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL DestroyIcon(HICON hIcon);
func XDestroyIcon(tls *TLS, _hIcon THICON) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hIcon=%+v", _hIcon)
		defer func() { trc(`XDestroyIcon->%+v`, r) }()
	}
	r0, _, err := procDestroyIcon.Call(_hIcon)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL DestroyMenu(HMENU hMenu);
func XDestroyMenu(tls *TLS, _hMenu THMENU) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hMenu=%+v", _hMenu)
		defer func() { trc(`XDestroyMenu->%+v`, r) }()
	}
	r0, _, err := procDestroyMenu.Call(_hMenu)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL DrawEdge(HDC hdc,LPRECT qrc,UINT edge,UINT grfFlags);
func XDrawEdge(tls *TLS, _hdc THDC, _qrc TLPRECT, _edge TUINT, _grfFlags TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v qrc=%+v edge=%+v grfFlags=%+v", _hdc, _qrc, _edge, _grfFlags)
		defer func() { trc(`XDrawEdge->%+v`, r) }()
	}
	r0, _, _ := procDrawEdge.Call(_hdc, _qrc, uintptr(_edge), uintptr(_grfFlags))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL DrawFrameControl(HDC,LPRECT,UINT,UINT);
func XDrawFrameControl(tls *TLS, _0 THDC, _1 TLPRECT, _2 TUINT, _3 TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("0=%+v 1=%+v 2=%+v 3=%+v", _0, _1, _2, _3)
		defer func() { trc(`XDrawFrameControl->%+v`, r) }()
	}
	r0, _, _ := procDrawFrameControl.Call(_0, _1, uintptr(_2), uintptr(_3))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL DrawMenuBar(HWND hWnd);
func XDrawMenuBar(tls *TLS, _hWnd THWND) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XDrawMenuBar->%+v`, r) }()
	}
	r0, _, err := procDrawMenuBar.Call(_hWnd)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL EnableWindow(HWND hWnd,WINBOOL bEnable);
func XEnableWindow(tls *TLS, _hWnd THWND, _bEnable TWINBOOL) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v bEnable=%+v", _hWnd, _bEnable)
		defer func() { trc(`XEnableWindow->%+v`, r) }()
	}
	r0, _, _ := procEnableWindow.Call(_hWnd, uintptr(_bEnable))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) int ScrollWindowEx(HWND hWnd,int dx,int dy, const RECT *prcScroll, const RECT *prcClip,HRGN hrgnUpdate,LPRECT prcUpdate,UINT flags);
func XScrollWindowEx(tls *TLS, _hWnd THWND, _dx int32, _dy int32, _prcScroll uintptr, _prcClip uintptr, _hrgnUpdate THRGN, _prcUpdate TLPRECT, _flags TUINT) (r int32) {
	if __ccgo_strace {
		trc("hWnd=%+v dx=%+v dy=%+v prcScroll=%+v prcClip=%+v hrgnUpdate=%+v prcUpdate=%+v flags=%+v", _hWnd, _dx, _dy, _prcScroll, _prcClip, _hrgnUpdate, _prcUpdate, _flags)
		defer func() { trc(`XScrollWindowEx->%+v`, r) }()
	}
	r0, _, err := procScrollWindowEx.Call(_hWnd, uintptr(_dx), uintptr(_dy), _prcScroll, _prcClip, _hrgnUpdate, _prcUpdate, uintptr(_flags))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) int SelectClipRgn(HDC hdc,HRGN hrgn);
func XSelectClipRgn(tls *TLS, _hdc THDC, _hrgn THRGN) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v hrgn=%+v", _hdc, _hrgn)
		defer func() { trc(`XSelectClipRgn->%+v`, r) }()
	}
	r0, _, _ := procSelectClipRgn.Call(_hdc, _hrgn)
	return int32(r0)
}

// __attribute__((dllimport)) HGDIOBJ SelectObject(HDC hdc,HGDIOBJ h);
func XSelectObject(tls *TLS, _hdc THDC, _h THGDIOBJ) (r THGDIOBJ) {
	if __ccgo_strace {
		trc("hdc=%+v h=%+v", _hdc, _h)
		defer func() { trc(`XSelectObject->%+v`, r) }()
	}
	r0, _, _ := procSelectObject.Call(_hdc, _h)
	return THGDIOBJ(r0)
}

// __attribute__((dllimport)) HPALETTE SelectPalette(HDC hdc,HPALETTE hPal,WINBOOL bForceBkgd);
func XSelectPalette(tls *TLS, _hdc THDC, _hPal THPALETTE, _bForceBkgd TWINBOOL) (r THPALETTE) {
	if __ccgo_strace {
		trc("hdc=%+v hPal=%+v bForceBkgd=%+v", _hdc, _hPal, _bForceBkgd)
		defer func() { trc(`XSelectPalette->%+v`, r) }()
	}
	r0, _, _ := procSelectPalette.Call(_hdc, _hPal, uintptr(_bForceBkgd))
	return THPALETTE(r0)
}

// __attribute__((dllimport)) UINT SendInput(UINT cInputs,LPINPUT pInputs,int cbSize);
func XSendInput(tls *TLS, _cInputs TUINT, _pInputs TLPINPUT, _cbSize int32) (r TUINT) {
	if __ccgo_strace {
		trc("cInputs=%+v pInputs=%+v cbSize=%+v", _cInputs, _pInputs, _cbSize)
		defer func() { trc(`XSendInput->%+v`, r) }()
	}
	r0, _, err := procSendInput.Call(uintptr(_cInputs), _pInputs, uintptr(_cbSize))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TUINT(r0)
}

type TLPINPUT = uintptr

// __attribute__((dllimport)) HWND SetActiveWindow(HWND hWnd);
func XSetActiveWindow(tls *TLS, _hWnd THWND) (r THWND) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XSetActiveWindow->%+v`, r) }()
	}
	r0, _, err := procSetActiveWindow.Call(_hWnd)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THWND(r0)
}

// __attribute__((dllimport)) int SetBkMode(HDC hdc,int mode);
func XSetBkMode(tls *TLS, _hdc THDC, _mode int32) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v mode=%+v", _hdc, _mode)
		defer func() { trc(`XSetBkMode->%+v`, r) }()
	}
	r0, _, _ := procSetBkMode.Call(_hdc, uintptr(_mode))
	return int32(r0)
}

// __attribute__((dllimport)) WINBOOL SetBrushOrgEx(HDC hdc,int x,int y,LPPOINT lppt);
func XSetBrushOrgEx(tls *TLS, _hdc THDC, _x int32, _y int32, _lppt TLPPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v lppt=%+v", _hdc, _x, _y, _lppt)
		defer func() { trc(`XSetBrushOrgEx->%+v`, r) }()
	}
	r0, _, _ := procSetBrushOrgEx.Call(_hdc, uintptr(_x), uintptr(_y), _lppt)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) HWND SetCapture(HWND hWnd);
func XSetCapture(tls *TLS, _hWnd THWND) (r THWND) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XSetCapture->%+v`, r) }()
	}
	r0, _, _ := procSetCapture.Call(_hWnd)
	return THWND(r0)
}

// __attribute__((dllimport)) WINBOOL SetCaretPos(int X,int Y);
func XSetCaretPos(tls *TLS, _X int32, _Y int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("X=%+v Y=%+v", _X, _Y)
		defer func() { trc(`XSetCaretPos->%+v`, r) }()
	}
	r0, _, err := procSetCaretPos.Call(uintptr(_X), uintptr(_Y))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) ULONG_PTR SetClassLongPtrW(HWND hWnd,int nIndex,LONG_PTR dwNewLong);
func XSetClassLongPtrW(tls *TLS, _hWnd THWND, _nIndex int32, _dwNewLong TLONG_PTR) (r TULONG_PTR) {
	if __ccgo_strace {
		trc("hWnd=%+v nIndex=%+v dwNewLong=%+v", _hWnd, _nIndex, _dwNewLong)
		defer func() { trc(`XSetClassLongPtrW->%+v`, r) }()
	}
	r0, _, err := procSetClassLongPtrW.Call(_hWnd, uintptr(_nIndex), uintptr(_dwNewLong))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TULONG_PTR(r0)
}

type TLONG_PTR = int64

type TULONG_PTR = uint64

// __attribute__((dllimport)) HCURSOR SetCursor(HCURSOR hCursor);
func XSetCursor(tls *TLS, _hCursor THCURSOR) (r THCURSOR) {
	if __ccgo_strace {
		trc("hCursor=%+v", _hCursor)
		defer func() { trc(`XSetCursor->%+v`, r) }()
	}
	r0, _, _ := procSetCursor.Call(_hCursor)
	return THCURSOR(r0)
}

// __attribute__((dllimport)) WINBOOL SetCursorPos(int X,int Y);
func XSetCursorPos(tls *TLS, _X int32, _Y int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("X=%+v Y=%+v", _X, _Y)
		defer func() { trc(`XSetCursorPos->%+v`, r) }()
	}
	r0, _, err := procSetCursorPos.Call(uintptr(_X), uintptr(_Y))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) HWND SetFocus(HWND hWnd);
func XSetFocus(tls *TLS, _hWnd THWND) (r THWND) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XSetFocus->%+v`, r) }()
	}
	r0, _, err := procSetFocus.Call(_hWnd)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THWND(r0)
}

// __attribute__((dllimport)) WINBOOL SetForegroundWindow(HWND hWnd);
func XSetForegroundWindow(tls *TLS, _hWnd THWND) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XSetForegroundWindow->%+v`, r) }()
	}
	r0, _, _ := procSetForegroundWindow.Call(_hWnd)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL SetLayeredWindowAttributes (HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
func XSetLayeredWindowAttributes(tls *TLS, _hwnd THWND, _crKey TCOLORREF, _bAlpha TBYTE, _dwFlags TDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hwnd=%+v crKey=%+v bAlpha=%+v dwFlags=%+v", _hwnd, _crKey, _bAlpha, _dwFlags)
		defer func() { trc(`XSetLayeredWindowAttributes->%+v`, r) }()
	}
	r0, _, err := procSetLayeredWindowAttributes.Call(_hwnd, uintptr(_crKey), uintptr(_bAlpha), uintptr(_dwFlags))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

type TBYTE = uint8

// __attribute__((dllimport)) int SetMapMode(HDC hdc,int iMode);
func XSetMapMode(tls *TLS, _hdc THDC, _iMode int32) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v iMode=%+v", _hdc, _iMode)
		defer func() { trc(`XSetMapMode->%+v`, r) }()
	}
	r0, _, _ := procSetMapMode.Call(_hdc, uintptr(_iMode))
	return int32(r0)
}

// __attribute__((dllimport)) WINBOOL SetMenu(HWND hWnd,HMENU hMenu);
func XSetMenu(tls *TLS, _hWnd THWND, _hMenu THMENU) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v hMenu=%+v", _hWnd, _hMenu)
		defer func() { trc(`XSetMenu->%+v`, r) }()
	}
	r0, _, err := procSetMenu.Call(_hWnd, _hMenu)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) UINT SetPaletteEntries(HPALETTE hpal,UINT iStart,UINT cEntries, const PALETTEENTRY *pPalEntries);
func XSetPaletteEntries(tls *TLS, _hpal THPALETTE, _iStart TUINT, _cEntries TUINT, _pPalEntries uintptr) (r TUINT) {
	if __ccgo_strace {
		trc("hpal=%+v iStart=%+v cEntries=%+v pPalEntries=%+v", _hpal, _iStart, _cEntries, _pPalEntries)
		defer func() { trc(`XSetPaletteEntries->%+v`, r) }()
	}
	r0, _, _ := procSetPaletteEntries.Call(_hpal, uintptr(_iStart), uintptr(_cEntries), _pPalEntries)
	return TUINT(r0)
}

// __attribute__((dllimport)) WINBOOL GetTextMetricsW(HDC hdc,LPTEXTMETRICW lptm);
func XGetTextMetricsW(tls *TLS, _hdc THDC, _lptm TLPTEXTMETRICW) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v lptm=%+v", _hdc, _lptm)
		defer func() { trc(`XGetTextMetricsW->%+v`, r) }()
	}
	r0, _, _ := procGetTextMetricsW.Call(_hdc, _lptm)
	return TWINBOOL(r0)
}

type TLPTEXTMETRICW = uintptr

// __attribute__((dllimport)) HWND GetWindow(HWND hWnd,UINT uCmd);
func XGetWindow(tls *TLS, _hWnd THWND, _uCmd TUINT) (r THWND) {
	if __ccgo_strace {
		trc("hWnd=%+v uCmd=%+v", _hWnd, _uCmd)
		defer func() { trc(`XGetWindow->%+v`, r) }()
	}
	r0, _, err := procGetWindow.Call(_hWnd, uintptr(_uCmd))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THWND(r0)
}

// __attribute__((dllimport)) WINBOOL GetWindowPlacement (HWND hWnd, WINDOWPLACEMENT *lpwndpl);
func XGetWindowPlacement(tls *TLS, _hWnd THWND, _lpwndpl uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v lpwndpl=%+v", _hWnd, _lpwndpl)
		defer func() { trc(`XGetWindowPlacement->%+v`, r) }()
	}
	r0, _, err := procGetWindowPlacement.Call(_hWnd, _lpwndpl)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL GetWindowRect(HWND hWnd,LPRECT lpRect);
func XGetWindowRect(tls *TLS, _hWnd THWND, _lpRect TLPRECT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v lpRect=%+v", _hWnd, _lpRect)
		defer func() { trc(`XGetWindowRect->%+v`, r) }()
	}
	r0, _, err := procGetWindowRect.Call(_hWnd, _lpRect)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) int GetWindowTextW(HWND hWnd,LPWSTR lpString,int nMaxCount);
func XGetWindowTextW(tls *TLS, _hWnd THWND, _lpString TLPWSTR, _nMaxCount int32) (r int32) {
	if __ccgo_strace {
		trc("hWnd=%+v lpString=%+v nMaxCount=%+v", _hWnd, _lpString, _nMaxCount)
		defer func() { trc(`XGetWindowTextW->%+v`, r) }()
	}
	r0, _, err := procGetWindowTextW.Call(_hWnd, _lpString, uintptr(_nMaxCount))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// LONG ImmGetCompositionStringW(HIMC,DWORD,LPVOID,DWORD);
func XImmGetCompositionStringW(tls *TLS, _0 THIMC, _1 TDWORD, _2 TLPVOID, _3 TDWORD) (r TLONG) {
	if __ccgo_strace {
		trc("0=%+v 1=%+v 2=%+v 3=%+v", _0, _1, _2, _3)
		defer func() { trc(`XImmGetCompositionStringW->%+v`, r) }()
	}
	r0, _, _ := procImmGetCompositionStringW.Call(_0, uintptr(_1), _2, uintptr(_3))
	return TLONG(r0)
}

// HIMC ImmGetContext(HWND);
func XImmGetContext(tls *TLS, _0 THWND) (r THIMC) {
	if __ccgo_strace {
		trc("0=%+v", _0)
		defer func() { trc(`XImmGetContext->%+v`, r) }()
	}
	r0, _, _ := procImmGetContext.Call(_0)
	return THIMC(r0)
}

// WINBOOL ImmReleaseContext(HWND,HIMC);
func XImmReleaseContext(tls *TLS, _0 THWND, _1 THIMC) (r TWINBOOL) {
	if __ccgo_strace {
		trc("0=%+v 1=%+v", _0, _1)
		defer func() { trc(`XImmReleaseContext->%+v`, r) }()
	}
	r0, _, _ := procImmReleaseContext.Call(_0, _1)
	return TWINBOOL(r0)
}

// WINBOOL ImmSetCompositionWindow(HIMC,LPCOMPOSITIONFORM);
func XImmSetCompositionWindow(tls *TLS, _0 THIMC, _1 TLPCOMPOSITIONFORM) (r TWINBOOL) {
	if __ccgo_strace {
		trc("0=%+v 1=%+v", _0, _1)
		defer func() { trc(`XImmSetCompositionWindow->%+v`, r) }()
	}
	r0, _, _ := procImmSetCompositionWindow.Call(_0, _1)
	return TWINBOOL(r0)
}

type THIMC = uintptr

type TLPCOMPOSITIONFORM = uintptr

// __attribute__((dllimport)) WINBOOL InitCommonControlsEx(const INITCOMMONCONTROLSEX *);
func XInitCommonControlsEx(tls *TLS, _0 uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("0=%+v", _0)
		defer func() { trc(`XInitCommonControlsEx->%+v`, r) }()
	}
	r0, _, _ := procInitCommonControlsEx.Call(_0)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL InsertMenuW(HMENU hMenu,UINT uPosition,UINT uFlags,UINT_PTR uIDNewItem,LPCWSTR lpNewItem);
func XInsertMenuW(tls *TLS, _hMenu THMENU, _uPosition TUINT, _uFlags TUINT, _uIDNewItem TUINT_PTR, _lpNewItem TLPCWSTR) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hMenu=%+v uPosition=%+v uFlags=%+v uIDNewItem=%+v lpNewItem=%+v", _hMenu, _uPosition, _uFlags, _uIDNewItem, _lpNewItem)
		defer func() { trc(`XInsertMenuW->%+v`, r) }()
	}
	r0, _, err := procInsertMenuW.Call(_hMenu, uintptr(_uPosition), uintptr(_uFlags), uintptr(_uIDNewItem), _lpNewItem)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

type TUINT_PTR = uint64

func XInterlockedDecrement(t *TLS, Addend uintptr) int32 {
	return atomic.AddInt32((*int32)(unsafe.Pointer(Addend)), -1)
}

func XInterlockedInrement(t *TLS, Addend uintptr) int32 {
	return atomic.AddInt32((*int32)(unsafe.Pointer(Addend)), 1)
}

// __attribute__((dllimport)) WINBOOL InvalidateRect(HWND hWnd, const RECT *lpRect,WINBOOL bErase);
func XInvalidateRect(tls *TLS, _hWnd THWND, _lpRect uintptr, _bErase TWINBOOL) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v lpRect=%+v bErase=%+v", _hWnd, _lpRect, _bErase)
		defer func() { trc(`XInvalidateRect->%+v`, r) }()
	}
	r0, _, _ := procInvalidateRect.Call(_hWnd, _lpRect, uintptr(_bErase))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL IsDBCSLeadByte (BYTE TestChar);
func XIsDBCSLeadByte(tls *TLS, _TestChar TBYTE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("TestChar=%+v", _TestChar)
		defer func() { trc(`XIsDBCSLeadByte->%+v`, r) }()
	}
	r0, _, err := procIsDBCSLeadByte.Call(uintptr(_TestChar))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL IsIconic (HWND hWnd);
func XIsIconic(tls *TLS, _hWnd THWND) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XIsIconic->%+v`, r) }()
	}
	r0, _, _ := procIsIconic.Call(_hWnd)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL IsWindowVisible (HWND hWnd);
func XIsWindowVisible(tls *TLS, _hWnd THWND) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XIsWindowVisible->%+v`, r) }()
	}
	r0, _, _ := procIsWindowVisible.Call(_hWnd)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL IsZoomed (HWND hWnd);
func XIsZoomed(tls *TLS, _hWnd THWND) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XIsZoomed->%+v`, r) }()
	}
	r0, _, _ := procIsZoomed.Call(_hWnd)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) HBITMAP LoadBitmapW(HINSTANCE hInstance,LPCWSTR lpBitmapName);
func XLoadBitmapW(tls *TLS, _hInstance THINSTANCE, _lpBitmapName TLPCWSTR) (r THBITMAP) {
	if __ccgo_strace {
		trc("hInstance=%+v lpBitmapName=%+v", _hInstance, _lpBitmapName)
		defer func() { trc(`XLoadBitmapW->%+v`, r) }()
	}
	r0, _, _ := procLoadBitmapW.Call(_hInstance, _lpBitmapName)
	return THBITMAP(r0)
}

// __attribute__((dllimport)) HCURSOR LoadCursorA(HINSTANCE hInstance,LPCSTR lpCursorName);
func XLoadCursorA(tls *TLS, _hInstance THINSTANCE, _lpCursorName TLPCSTR) (r THCURSOR) {
	if __ccgo_strace {
		trc("hInstance=%+v lpCursorName=%+v", _hInstance, _lpCursorName)
		defer func() { trc(`XLoadCursorA->%+v`, r) }()
	}
	r0, _, err := procLoadCursorA.Call(_hInstance, _lpCursorName)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THCURSOR(r0)
}

// __attribute__((dllimport)) int GetTextFaceW(HDC hdc,int c,LPWSTR lpName);
func XGetTextFaceW(tls *TLS, _hdc THDC, _c int32, _lpName TLPWSTR) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v c=%+v lpName=%+v", _hdc, _c, _lpName)
		defer func() { trc(`XGetTextFaceW->%+v`, r) }()
	}
	r0, _, _ := procGetTextFaceW.Call(_hdc, uintptr(_c), _lpName)
	return int32(r0)
}

// __attribute__((dllimport)) HCURSOR LoadCursorFromFileA(LPCSTR lpFileName);
func XLoadCursorFromFileA(tls *TLS, _lpFileName TLPCSTR) (r THCURSOR) {
	if __ccgo_strace {
		trc("lpFileName=%+v", _lpFileName)
		defer func() { trc(`XLoadCursorFromFileA->%+v`, r) }()
	}
	r0, _, err := procLoadCursorFromFileA.Call(_lpFileName)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THCURSOR(r0)
}

// __attribute__((dllimport)) HCURSOR LoadCursorW(HINSTANCE hInstance,LPCWSTR lpCursorName);
func XLoadCursorW(tls *TLS, _hInstance THINSTANCE, _lpCursorName TLPCWSTR) (r THCURSOR) {
	if __ccgo_strace {
		trc("hInstance=%+v lpCursorName=%+v", _hInstance, _lpCursorName)
		defer func() { trc(`XLoadCursorW->%+v`, r) }()
	}
	r0, _, err := procLoadCursorW.Call(_hInstance, _lpCursorName)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THCURSOR(r0)
}

// __attribute__((dllimport)) HICON LoadIconW(HINSTANCE hInstance,LPCWSTR lpIconName);
func XLoadIconW(tls *TLS, _hInstance THINSTANCE, _lpIconName TLPCWSTR) (r THICON) {
	if __ccgo_strace {
		trc("hInstance=%+v lpIconName=%+v", _hInstance, _lpIconName)
		defer func() { trc(`XLoadIconW->%+v`, r) }()
	}
	r0, _, err := procLoadIconW.Call(_hInstance, _lpIconName)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THICON(r0)
}

// __attribute__((dllimport)) HMODULE LoadLibraryW(LPCWSTR lpLibFileName);
func XLoadLibraryW(tls *TLS, _lpLibFileName TLPCWSTR) (r THMODULE) {
	if __ccgo_strace {
		trc("lpLibFileName=%+v", _lpLibFileName)
		defer func() { trc(`XLoadLibraryW->%+v`, r) }()
	}
	tls.setErrno(windows.ERROR_INVALID_LIBRARY)
	return THMODULE(0)
}

// __attribute__((dllimport)) WINBOOL MoveWindow (HWND hWnd, int X, int Y, int nWidth, int nHeight, WINBOOL bRepaint);
func XMoveWindow(tls *TLS, _hWnd THWND, _X int32, _Y int32, _nWidth int32, _nHeight int32, _bRepaint TWINBOOL) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v X=%+v Y=%+v nWidth=%+v nHeight=%+v bRepaint=%+v", _hWnd, _X, _Y, _nWidth, _nHeight, _bRepaint)
		defer func() { trc(`XMoveWindow->%+v`, r) }()
	}
	r0, _, err := procMoveWindow.Call(_hWnd, uintptr(_X), uintptr(_Y), uintptr(_nWidth), uintptr(_nHeight), uintptr(_bRepaint))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) int OffsetClipRgn(HDC hdc,int x,int y);
func XOffsetClipRgn(tls *TLS, _hdc THDC, _x int32, _y int32) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v", _hdc, _x, _y)
		defer func() { trc(`XOffsetClipRgn->%+v`, r) }()
	}
	r0, _, _ := procOffsetClipRgn.Call(_hdc, uintptr(_x), uintptr(_y))
	return int32(r0)
}

// __attribute__((dllimport)) void OutputDebugStringA (LPCSTR lpOutputString);
func XOutputDebugStringA(tls *TLS, _lpOutputString TLPCSTR) {
	if __ccgo_strace {
		trc("lpOutputString=%+v", _lpOutputString)
	}
	if dmesgs {
		dmesg("OutputDebugStringA: %s", GoString(_lpOutputString))
	}
}

// __attribute__((dllimport)) WINBOOL PatBlt(HDC hdc,int x,int y,int w,int h,DWORD rop);
func XPatBlt(tls *TLS, _hdc THDC, _x int32, _y int32, _w int32, _h int32, _rop TDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v w=%+v h=%+v rop=%+v", _hdc, _x, _y, _w, _h, _rop)
		defer func() { trc(`XPatBlt->%+v`, r) }()
	}
	r0, _, _ := procPatBlt.Call(_hdc, uintptr(_x), uintptr(_y), uintptr(_w), uintptr(_h), uintptr(_rop))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL PeekMessageA(LPMSG lpMsg,HWND hWnd,UINT wMsgFilterMin,UINT wMsgFilterMax,UINT wRemoveMsg);
func XPeekMessageA(tls *TLS, _lpMsg TLPMSG, _hWnd THWND, _wMsgFilterMin TUINT, _wMsgFilterMax TUINT, _wRemoveMsg TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lpMsg=%+v hWnd=%+v wMsgFilterMin=%+v wMsgFilterMax=%+v wRemoveMsg=%+v", _lpMsg, _hWnd, _wMsgFilterMin, _wMsgFilterMax, _wRemoveMsg)
		defer func() { trc(`XPeekMessageA->%+v`, r) }()
	}
	r0, _, _ := procPeekMessageA.Call(_lpMsg, _hWnd, uintptr(_wMsgFilterMin), uintptr(_wMsgFilterMax), uintptr(_wRemoveMsg))
	return TWINBOOL(r0)
}

type TLPMSG = uintptr

// __attribute__((dllimport)) DWORD GetFontData (HDC hdc,DWORD dwTable,DWORD dwOffset,PVOID pvBuffer,DWORD cjBuffer);
func XGetFontData(tls *TLS, _hdc THDC, _dwTable TDWORD, _dwOffset TDWORD, _pvBuffer TPVOID, _cjBuffer TDWORD) (r TDWORD) {
	if __ccgo_strace {
		trc("hdc=%+v dwTable=%+v dwOffset=%+v pvBuffer=%+v cjBuffer=%+v", _hdc, _dwTable, _dwOffset, _pvBuffer, _cjBuffer)
		defer func() { trc(`XGetFontData->%+v`, r) }()
	}
	r0, _, _ := procGetFontData.Call(_hdc, uintptr(_dwTable), uintptr(_dwOffset), _pvBuffer, uintptr(_cjBuffer))
	return TDWORD(r0)
}

// __attribute__((dllimport)) HWND GetForegroundWindow( void);
func XGetForegroundWindow(tls *TLS) (r THWND) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XGetForegroundWindow->%+v`, r) }()
	}
	r0, _, _ := procGetForegroundWindow.Call()
	return THWND(r0)
}

// __attribute__((dllimport)) HKL GetKeyboardLayout(DWORD idThread);
func XGetKeyboardLayout(tls *TLS, _idThread TDWORD) (r THKL) {
	if __ccgo_strace {
		trc("idThread=%+v", _idThread)
		defer func() { trc(`XGetKeyboardLayout->%+v`, r) }()
	}
	r0, _, _ := procGetKeyboardLayout.Call(uintptr(_idThread))
	return THKL(r0)
}

type THKL = uintptr

// __attribute__((dllimport)) WINBOOL GetLastInputInfo(PLASTINPUTINFO plii);
func XGetLastInputInfo(tls *TLS, _plii TPLASTINPUTINFO) (r TWINBOOL) {
	if __ccgo_strace {
		trc("plii=%+v", _plii)
		defer func() { trc(`XGetLastInputInfo->%+v`, r) }()
	}
	r0, _, _ := procGetLastInputInfo.Call(_plii)
	return TWINBOOL(r0)
}

type TPLASTINPUTINFO = uintptr

// __attribute__((dllimport)) int GetLocaleInfoW (LCID Locale, LCTYPE LCType, LPWSTR lpLCData, int cchData);
func XGetLocaleInfoW(tls *TLS, _Locale TLCID, _LCType TLCTYPE, _lpLCData TLPWSTR, _cchData int32) (r int32) {
	if __ccgo_strace {
		trc("Locale=%+v LCType=%+v lpLCData=%+v cchData=%+v", _Locale, _LCType, _lpLCData, _cchData)
		defer func() { trc(`XGetLocaleInfoW->%+v`, r) }()
	}
	r0, _, err := procGetLocaleInfoW.Call(uintptr(_Locale), uintptr(_LCType), _lpLCData, uintptr(_cchData))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return int32(r0)
}

// __attribute__((dllimport)) int GetMapMode(HDC hdc);
func XGetMapMode(tls *TLS, _hdc THDC) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XGetMapMode->%+v`, r) }()
	}
	r0, _, _ := procGetMapMode.Call(_hdc)
	return int32(r0)
}

// __attribute__((dllimport)) int GetMenuItemCount(HMENU hMenu);
func XGetMenuItemCount(tls *TLS, _hMenu THMENU) (r int32) {
	if __ccgo_strace {
		trc("hMenu=%+v", _hMenu)
		defer func() { trc(`XGetMenuItemCount->%+v`, r) }()
	}
	r0, _, err := procGetMenuItemCount.Call(_hMenu)
	if r = int32(r0); r == -1 {
		tls.setErrno(err)
	}
	return r
}

// __attribute__((dllimport)) WINBOOL GetMessageA(LPMSG lpMsg,HWND hWnd,UINT wMsgFilterMin,UINT wMsgFilterMax);
func XGetMessageA(tls *TLS, _lpMsg TLPMSG, _hWnd THWND, _wMsgFilterMin TUINT, _wMsgFilterMax TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lpMsg=%+v hWnd=%+v wMsgFilterMin=%+v wMsgFilterMax=%+v", _lpMsg, _hWnd, _wMsgFilterMin, _wMsgFilterMax)
		defer func() { trc(`XGetMessageA->%+v`, r) }()
	}
	r0, _, err := procGetMessageA.Call(_lpMsg, _hWnd, uintptr(_wMsgFilterMin), uintptr(_wMsgFilterMax))
	if r = TWINBOOL(r0); r == -1 {
		tls.setErrno(err)
	}
	return r
}

// __attribute__((dllimport)) DWORD GetMessagePos( void);
func XGetMessagePos(tls *TLS) (r TDWORD) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XGetMessagePos->%+v`, r) }()
	}
	r0, _, _ := procGetMessagePos.Call()
	return TDWORD(r0)
}

// __attribute__((dllimport)) int GetObjectA(HANDLE h,int c,LPVOID pv);
func XGetObjectA(tls *TLS, _h THANDLE, _c int32, _pv TLPVOID) (r int32) {
	if __ccgo_strace {
		trc("h=%+v c=%+v pv=%+v", _h, _c, _pv)
		defer func() { trc(`XGetObjectA->%+v`, r) }()
	}
	r0, _, _ := procGetObjectA.Call(_h, uintptr(_c), _pv)
	return int32(r0)
}

// __attribute__((dllimport)) WINBOOL GetCharWidthA(HDC hdc,UINT iFirst,UINT iLast,LPINT lpBuffer);
func XGetCharWidthA(tls *TLS, _hdc THDC, _iFirst TUINT, _iLast TUINT, _lpBuffer TLPINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v iFirst=%+v iLast=%+v lpBuffer=%+v", _hdc, _iFirst, _iLast, _lpBuffer)
		defer func() { trc(`XGetCharWidthA->%+v`, r) }()
	}
	r0, _, _ := procGetCharWidthA.Call(_hdc, uintptr(_iFirst), uintptr(_iLast), _lpBuffer)
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL GetCharWidthW(HDC hdc,UINT iFirst,UINT iLast,LPINT lpBuffer);
func XGetCharWidthW(tls *TLS, _hdc THDC, _iFirst TUINT, _iLast TUINT, _lpBuffer TLPINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v iFirst=%+v iLast=%+v lpBuffer=%+v", _hdc, _iFirst, _iLast, _lpBuffer)
		defer func() { trc(`XGetCharWidthW->%+v`, r) }()
	}
	r0, _, _ := procGetCharWidthW.Call(_hdc, uintptr(_iFirst), uintptr(_iLast), _lpBuffer)
	return TWINBOOL(r0)
}

type TLPINT = uintptr

// __attribute__((dllimport)) ULONG_PTR GetClassLongPtrW(HWND hWnd,int nIndex);
func XGetClassLongPtrW(tls *TLS, _hWnd THWND, _nIndex int32) (r TULONG_PTR) {
	if __ccgo_strace {
		trc("hWnd=%+v nIndex=%+v", _hWnd, _nIndex)
		defer func() { trc(`XGetClassLongPtrW->%+v`, r) }()
	}
	r0, _, err := procGetClassLongPtrW.Call(_hWnd, uintptr(_nIndex))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TULONG_PTR(r0)
}

// __attribute__((dllimport)) WINBOOL GetClientRect(HWND hWnd,LPRECT lpRect);
func XGetClientRect(tls *TLS, _hWnd THWND, _lpRect TLPRECT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v lpRect=%+v", _hWnd, _lpRect)
		defer func() { trc(`XGetClientRect->%+v`, r) }()
	}
	r0, _, err := procGetClientRect.Call(_hWnd, _lpRect)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) WINBOOL GetCursorPos(LPPOINT lpPoint);
func XGetCursorPos(tls *TLS, _lpPoint TLPPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lpPoint=%+v", _lpPoint)
		defer func() { trc(`XGetCursorPos->%+v`, r) }()
	}
	r0, _, err := procGetCursorPos.Call(_lpPoint)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) int GetDIBits(HDC hdc,HBITMAP hbm,UINT start,UINT cLines,LPVOID lpvBits,LPBITMAPINFO lpbmi,UINT usage);
func XGetDIBits(tls *TLS, _hdc THDC, _hbm THBITMAP, _start TUINT, _cLines TUINT, _lpvBits TLPVOID, _lpbmi TLPBITMAPINFO, _usage TUINT) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v hbm=%+v start=%+v cLines=%+v lpvBits=%+v lpbmi=%+v usage=%+v", _hdc, _hbm, _start, _cLines, _lpvBits, _lpbmi, _usage)
		defer func() { trc(`XGetDIBits->%+v`, r) }()
	}
	r0, _, _ := procGetDIBits.Call(_hdc, _hbm, uintptr(_start), uintptr(_cLines), _lpvBits, _lpbmi, uintptr(_usage))
	return int32(r0)
}

type TLPBITMAPINFO = uintptr

// __attribute__((dllimport)) HWND GetDesktopWindow( void);
func XGetDesktopWindow(tls *TLS) (r THWND) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XGetDesktopWindow->%+v`, r) }()
	}
	r0, _, _ := procGetDesktopWindow.Call()
	return THWND(r0)
}

// __attribute__((dllimport)) HWND GetDlgItem(HWND hDlg,int nIDDlgItem);
func XGetDlgItem(tls *TLS, _hDlg THWND, _nIDDlgItem int32) (r THWND) {
	if __ccgo_strace {
		trc("hDlg=%+v nIDDlgItem=%+v", _hDlg, _nIDDlgItem)
		defer func() { trc(`XGetDlgItem->%+v`, r) }()
	}
	r0, _, err := procGetDlgItem.Call(_hDlg, uintptr(_nIDDlgItem))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THWND(r0)
}

// __attribute__((dllimport)) HWND GetFocus( void);
func XGetFocus(tls *TLS) (r THWND) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XGetFocus->%+v`, r) }()
	}
	r0, _, _ := procGetFocus.Call()
	return THWND(r0)
}

// __attribute__((dllimport)) int GetTextCharset(HDC hdc);
func XGetTextCharset(tls *TLS, _hdc THDC) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XGetTextCharset->%+v`, r) }()
	}
	r0, _, _ := procGetTextCharset.Call(_hdc)
	return int32(r0)
}

var procGetTextExtentPoint32A = modgdi32.NewProc("GetTextExtentPoint32A")

// __attribute__((dllimport)) WINBOOL GetTextExtentPoint32A(HDC hdc,LPCSTR lpString,int c,LPSIZE psizl);
func XGetTextExtentPoint32A(tls *TLS, _hdc THDC, _lpString TLPCSTR, _c int32, _psizl TLPSIZE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v lpString=%+v c=%+v psizl=%+v", _hdc, _lpString, _c, _psizl)
		defer func() { trc(`XGetTextExtentPoint32A->%+v`, r) }()
	}
	r0, _, _ := procGetTextExtentPoint32A.Call(_hdc, _lpString, uintptr(_c), _psizl)
	return TWINBOOL(r0)
}

var procGetTextExtentPoint32W = modgdi32.NewProc("GetTextExtentPoint32W")

// __attribute__((dllimport)) WINBOOL GetTextExtentPoint32W(HDC hdc,LPCWSTR lpString,int c,LPSIZE psizl);
func XGetTextExtentPoint32W(tls *TLS, _hdc THDC, _lpString TLPCWSTR, _c int32, _psizl TLPSIZE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v lpString=%+v c=%+v psizl=%+v", _hdc, _lpString, _c, _psizl)
		defer func() { trc(`XGetTextExtentPoint32W->%+v`, r) }()
	}
	r0, _, _ := procGetTextExtentPoint32W.Call(_hdc, _lpString, uintptr(_c), _psizl)
	return TWINBOOL(r0)
}

var procGetTextExtentPointA = modgdi32.NewProc("GetTextExtentPointA")

// __attribute__((dllimport)) WINBOOL GetTextExtentPointA(HDC hdc,LPCSTR lpString,int c,LPSIZE lpsz);
func XGetTextExtentPointA(tls *TLS, _hdc THDC, _lpString TLPCSTR, _c int32, _lpsz TLPSIZE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v lpString=%+v c=%+v lpsz=%+v", _hdc, _lpString, _c, _lpsz)
		defer func() { trc(`XGetTextExtentPointA->%+v`, r) }()
	}
	r0, _, _ := procGetTextExtentPointA.Call(_hdc, _lpString, uintptr(_c), _lpsz)
	return TWINBOOL(r0)
}

type TLPSIZE = uintptr

var procGetTextFaceA = modgdi32.NewProc("GetTextFaceA")

// __attribute__((dllimport)) int GetTextFaceA(HDC hdc,int c,LPSTR lpName);
func XGetTextFaceA(tls *TLS, _hdc THDC, _c int32, _lpName TLPSTR) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v c=%+v lpName=%+v", _hdc, _c, _lpName)
		defer func() { trc(`XGetTextFaceA->%+v`, r) }()
	}
	r0, _, _ := procGetTextFaceA.Call(_hdc, uintptr(_c), _lpName)
	return int32(r0)
}

var procPie = modgdi32.NewProc("Pie")

// __attribute__((dllimport)) WINBOOL Pie(HDC hdc,int left,int top,int right,int bottom,int xr1,int yr1,int xr2,int yr2);
func XPie(tls *TLS, _hdc THDC, _left int32, _top int32, _right int32, _bottom int32, _xr1 int32, _yr1 int32, _xr2 int32, _yr2 int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v left=%+v top=%+v right=%+v bottom=%+v xr1=%+v yr1=%+v xr2=%+v yr2=%+v", _hdc, _left, _top, _right, _bottom, _xr1, _yr1, _xr2, _yr2)
		defer func() { trc(`XPie->%+v`, r) }()
	}
	r0, _, _ := procPie.Call(_hdc, uintptr(_left), uintptr(_top), uintptr(_right), uintptr(_bottom), uintptr(_xr1), uintptr(_yr1), uintptr(_xr2), uintptr(_yr2))
	return TWINBOOL(r0)
}

var procPolygon = modgdi32.NewProc("Polygon")

// __attribute__((dllimport)) WINBOOL Polygon(HDC hdc, const POINT *apt,int cpt);
func XPolygon(tls *TLS, _hdc THDC, _apt uintptr, _cpt int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v apt=%+v cpt=%+v", _hdc, _apt, _cpt)
		defer func() { trc(`XPolygon->%+v`, r) }()
	}
	r0, _, _ := procPolygon.Call(_hdc, _apt, uintptr(_cpt))
	return TWINBOOL(r0)
}

var procPolyline = modgdi32.NewProc("Polyline")

// __attribute__((dllimport)) WINBOOL Polyline(HDC hdc, const POINT *apt,int cpt);
func XPolyline(tls *TLS, _hdc THDC, _apt uintptr, _cpt int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v apt=%+v cpt=%+v", _hdc, _apt, _cpt)
		defer func() { trc(`XPolyline->%+v`, r) }()
	}
	r0, _, _ := procPolyline.Call(_hdc, _apt, uintptr(_cpt))
	return TWINBOOL(r0)
}

var procRealizePalette = modgdi32.NewProc("RealizePalette")

// __attribute__((dllimport)) UINT RealizePalette(HDC hdc);
func XRealizePalette(tls *TLS, _hdc THDC) (r TUINT) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XRealizePalette->%+v`, r) }()
	}
	r0, _, _ := procRealizePalette.Call(_hdc)
	return TUINT(r0)
}

var procRectInRegion = modgdi32.NewProc("RectInRegion")

// __attribute__((dllimport)) WINBOOL RectInRegion(HRGN hrgn, const RECT *lprect);
func XRectInRegion(tls *TLS, _hrgn THRGN, _lprect uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hrgn=%+v lprect=%+v", _hrgn, _lprect)
		defer func() { trc(`XRectInRegion->%+v`, r) }()
	}
	r0, _, _ := procRectInRegion.Call(_hrgn, _lprect)
	return TWINBOOL(r0)
}

var procGetWindowLongPtrW = moduser32.NewProc("GetWindowLongPtrW")

// __attribute__((moduser32import)) LONG_PTR GetWindowLongPtrW(HWND hWnd,int nIndex);
func XGetWindowLongPtrW(tls *TLS, _hWnd THWND, _nIndex int32) (r TLONG_PTR) {
	if __ccgo_strace {
		trc("hWnd=%+v nIndex=%+v", _hWnd, _nIndex)
		defer func() { trc(`XGetWindowLongPtrW->%+v`, r) }()
	}
	XSetLastError(tls, 0)
	r0, _, err := procGetWindowLongPtrW.Call(_hWnd, uintptr(_nIndex))
	if r0 == 0 && err.(windows.Errno) != 0 {
		tls.setErrno(err)
	}
	return TLONG_PTR(r0)
}

var procDefWindowProcW = moduser32.NewProc("DefWindowProcW")

// __attribute__((moduser32import)) LRESULT DefWindowProcW (HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
func XDefWindowProcW(tls *TLS, _hWnd THWND, _Msg TUINT, _wParam TWPARAM, _lParam TLPARAM) (r TLRESULT) {
	if __ccgo_strace {
		trc("hWnd=%+v Msg=%+v wParam=%+v lParam=%+v", _hWnd, _Msg, _wParam, _lParam)
		defer func() { trc(`XDefWindowProcW->%+v`, r) }()
	}
	r0, _, _ := procDefWindowProcW.Call(_hWnd, uintptr(_Msg), uintptr(_wParam), uintptr(_lParam))
	return TLRESULT(r0)
}

var procSetWindowLongPtrW = moduser32.NewProc("SetWindowLongPtrW")

// __attribute__((moduser32import)) LONG_PTR SetWindowLongPtrW(HWND hWnd,int nIndex,LONG_PTR dwNewLong);
func XSetWindowLongPtrW(tls *TLS, _hWnd THWND, _nIndex int32, _dwNewLong TLONG_PTR) (r TLONG_PTR) {
	if __ccgo_strace {
		trc("hWnd=%+v nIndex=%+v dwNewLong=%+v", _hWnd, _nIndex, _dwNewLong)
		defer func() { trc(`XSetWindowLongPtrW->%+v`, r) }()
	}
	XSetLastError(tls, 0)
	r0, _, err := procSetWindowLongPtrW.Call(_hWnd, uintptr(_nIndex), uintptr(_dwNewLong))
	if r0 == 0 && err.(windows.Errno) != 0 {
		tls.setErrno(err)
	}
	return TLONG_PTR(r0)
}

var procCreateBitmap = modgdi32.NewProc("CreateBitmap")

// __attribute__((dllimport)) HBITMAP CreateBitmap(int nWidth,int nHeight,UINT nPlanes,UINT nBitCount, const void *lpBits);
func XCreateBitmap(tls *TLS, _nWidth int32, _nHeight int32, _nPlanes TUINT, _nBitCount TUINT, _lpBits uintptr) (r THBITMAP) {
	if __ccgo_strace {
		trc("nWidth=%+v nHeight=%+v nPlanes=%+v nBitCount=%+v lpBits=%+v", _nWidth, _nHeight, _nPlanes, _nBitCount, _lpBits)
		defer func() { trc(`XCreateBitmap->%+v`, r) }()
	}
	r0, _, _ := procCreateBitmap.Call(uintptr(_nWidth), uintptr(_nHeight), uintptr(_nPlanes), uintptr(_nBitCount), _lpBits)
	return THBITMAP(r0)
}

var procCreateCaret = moduser32.NewProc("CreateCaret")

// __attribute__((moduser32import)) WINBOOL CreateCaret(HWND hWnd,HBITMAP hBitmap,int nWidth,int nHeight);
func XCreateCaret(tls *TLS, _hWnd THWND, _hBitmap THBITMAP, _nWidth int32, _nHeight int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v hBitmap=%+v nWidth=%+v nHeight=%+v", _hWnd, _hBitmap, _nWidth, _nHeight)
		defer func() { trc(`XCreateCaret->%+v`, r) }()
	}
	r0, _, err := procCreateCaret.Call(_hWnd, _hBitmap, uintptr(_nWidth), uintptr(_nHeight))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procCreateCompatibleBitmap = modgdi32.NewProc("CreateCompatibleBitmap")

// __attribute__((dllimport)) HBITMAP CreateCompatibleBitmap(HDC hdc,int cx,int cy);
func XCreateCompatibleBitmap(tls *TLS, _hdc THDC, _cx int32, _cy int32) (r THBITMAP) {
	if __ccgo_strace {
		trc("hdc=%+v cx=%+v cy=%+v", _hdc, _cx, _cy)
		defer func() { trc(`XCreateCompatibleBitmap->%+v`, r) }()
	}
	r0, _, _ := procCreateCompatibleBitmap.Call(_hdc, uintptr(_cx), uintptr(_cy))
	return THBITMAP(r0)
}

var procCreateCompatibleDC = modgdi32.NewProc("CreateCompatibleDC")

// __attribute__((dllimport)) HDC CreateCompatibleDC(HDC hdc);
func XCreateCompatibleDC(tls *TLS, _hdc THDC) (r THDC) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XCreateCompatibleDC->%+v`, r) }()
	}
	r0, _, _ := procCreateCompatibleDC.Call(_hdc)
	return THDC(r0)
}

var procCreateDCW = modgdi32.NewProc("CreateDCW")

// __attribute__((dllimport)) HDC CreateDCW(LPCWSTR pwszDriver,LPCWSTR pwszDevice,LPCWSTR pszPort, const DEVMODEW *pdm);
func XCreateDCW(tls *TLS, _pwszDriver TLPCWSTR, _pwszDevice TLPCWSTR, _pszPort TLPCWSTR, _pdm uintptr) (r THDC) {
	if __ccgo_strace {
		trc("pwszDriver=%+v pwszDevice=%+v pszPort=%+v pdm=%+v", _pwszDriver, _pwszDevice, _pszPort, _pdm)
		defer func() { trc(`XCreateDCW->%+v`, r) }()
	}
	r0, _, _ := procCreateDCW.Call(_pwszDriver, _pwszDevice, _pszPort, _pdm)
	return THDC(r0)
}

var procCreateDIBSection = modgdi32.NewProc("CreateDIBSection")

// __attribute__((dllimport)) HBITMAP CreateDIBSection(HDC hdc, const BITMAPINFO *lpbmi,UINT usage, void **ppvBits,HANDLE hSection,DWORD offset);
func XCreateDIBSection(tls *TLS, _hdc THDC, _lpbmi uintptr, _usage TUINT, _ppvBits uintptr, _hSection THANDLE, _offset TDWORD) (r THBITMAP) {
	if __ccgo_strace {
		trc("hdc=%+v lpbmi=%+v usage=%+v ppvBits=%+v hSection=%+v offset=%+v", _hdc, _lpbmi, _usage, _ppvBits, _hSection, _offset)
		defer func() { trc(`XCreateDIBSection->%+v`, r) }()
	}
	r0, _, err := procCreateDIBSection.Call(_hdc, _lpbmi, uintptr(_usage), _ppvBits, _hSection, uintptr(_offset))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THBITMAP(r0)
}

var procCreateDIBitmap = modgdi32.NewProc("CreateDIBitmap")

// __attribute__((dllimport)) HBITMAP CreateDIBitmap(HDC hdc, const BITMAPINFOHEADER *pbmih,DWORD flInit, const void *pjBits, const BITMAPINFO *pbmi,UINT iUsage);
func XCreateDIBitmap(tls *TLS, _hdc THDC, _pbmih uintptr, _flInit TDWORD, _pjBits uintptr, _pbmi uintptr, _iUsage TUINT) (r THBITMAP) {
	if __ccgo_strace {
		trc("hdc=%+v pbmih=%+v flInit=%+v pjBits=%+v pbmi=%+v iUsage=%+v", _hdc, _pbmih, _flInit, _pjBits, _pbmi, _iUsage)
		defer func() { trc(`XCreateDIBitmap->%+v`, r) }()
	}
	r0, _, _ := procCreateDIBitmap.Call(_hdc, _pbmih, uintptr(_flInit), _pjBits, _pbmi, uintptr(_iUsage))
	return THBITMAP(r0)
}

var procEndDialog = moduser32.NewProc("EndDialog")

// __attribute__((moduser32import)) WINBOOL EndDialog(HWND hDlg,INT_PTR nResult);
func XEndDialog(tls *TLS, _hDlg THWND, _nResult TINT_PTR) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hDlg=%+v nResult=%+v", _hDlg, _nResult)
		defer func() { trc(`XEndDialog->%+v`, r) }()
	}
	r0, _, err := procEndDialog.Call(_hDlg, uintptr(_nResult))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

type TINT_PTR = int64

var procGetRgnBox = modgdi32.NewProc("GetRgnBox")

// __attribute__((dllimport)) int GetRgnBox(HRGN hrgn,LPRECT lprc);
func XGetRgnBox(tls *TLS, _hrgn THRGN, _lprc TLPRECT) (r int32) {
	if __ccgo_strace {
		trc("hrgn=%+v lprc=%+v", _hrgn, _lprc)
		defer func() { trc(`XGetRgnBox->%+v`, r) }()
	}
	r0, _, _ := procGetRgnBox.Call(_hrgn, _lprc)
	return int32(r0)
}

var procGetSysColorBrush = moduser32.NewProc("GetSysColorBrush")

// __attribute__((moduser32import)) HBRUSH GetSysColorBrush(int nIndex);
func XGetSysColorBrush(tls *TLS, _nIndex int32) (r THBRUSH) {
	if __ccgo_strace {
		trc("nIndex=%+v", _nIndex)
		defer func() { trc(`XGetSysColorBrush->%+v`, r) }()
	}
	r0, _, _ := procGetSysColorBrush.Call(uintptr(_nIndex))
	return THBRUSH(r0)
}

var procGetSystemMenu = moduser32.NewProc("GetSystemMenu")

// __attribute__((moduser32import)) HMENU GetSystemMenu(HWND hWnd,WINBOOL bRevert);
func XGetSystemMenu(tls *TLS, _hWnd THWND, _bRevert TWINBOOL) (r THMENU) {
	if __ccgo_strace {
		trc("hWnd=%+v bRevert=%+v", _hWnd, _bRevert)
		defer func() { trc(`XGetSystemMenu->%+v`, r) }()
	}
	r0, _, _ := procGetSystemMenu.Call(_hWnd, uintptr(_bRevert))
	return THMENU(r0)
}

var procRectangle = modgdi32.NewProc("Rectangle")

// __attribute__((dllimport)) WINBOOL Rectangle(HDC hdc,int left,int top,int right,int bottom);
func XRectangle(tls *TLS, _hdc THDC, _left int32, _top int32, _right int32, _bottom int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v left=%+v top=%+v right=%+v bottom=%+v", _hdc, _left, _top, _right, _bottom)
		defer func() { trc(`XRectangle->%+v`, r) }()
	}
	r0, _, _ := procRectangle.Call(_hdc, uintptr(_left), uintptr(_top), uintptr(_right), uintptr(_bottom))
	return TWINBOOL(r0)
}

// __attribute__((dllimport)) void SetLastError (DWORD dwErrCode);
func XSetLastError(tls *TLS, _dwErrCode uint32) {
	*(*int32)(unsafe.Pointer(tls.errnop)) = int32(_dwErrCode)
}

var procReleaseCapture = moduser32.NewProc("ReleaseCapture")

// __attribute__((moduser32import)) WINBOOL ReleaseCapture( void);
func XReleaseCapture(tls *TLS) (r TWINBOOL) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XReleaseCapture->%+v`, r) }()
	}
	r0, _, err := procReleaseCapture.Call()
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procRemoveMenu = moduser32.NewProc("RemoveMenu")

// __attribute__((moduser32import)) WINBOOL RemoveMenu(HMENU hMenu,UINT uPosition,UINT uFlags);
func XRemoveMenu(tls *TLS, _hMenu THMENU, _uPosition TUINT, _uFlags TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hMenu=%+v uPosition=%+v uFlags=%+v", _hMenu, _uPosition, _uFlags)
		defer func() { trc(`XRemoveMenu->%+v`, r) }()
	}
	r0, _, err := procRemoveMenu.Call(_hMenu, uintptr(_uPosition), uintptr(_uFlags))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procSHGetFileInfoW = modshell32.NewProc("SHGetFileInfoW")

// __attribute__((dllimport))DWORD_PTR SHGetFileInfoW (LPCWSTR pszPath, DWORD dwFileAttributes, SHFILEINFOW *psfi, UINT cbFileInfo, UINT uFlags);
func XSHGetFileInfoW(tls *TLS, _pszPath TLPCWSTR, _dwFileAttributes TDWORD, _psfi uintptr, _cbFileInfo TUINT, _uFlags TUINT) (r TDWORD_PTR) {
	if __ccgo_strace {
		trc("pszPath=%+v dwFileAttributes=%+v psfi=%+v cbFileInfo=%+v uFlags=%+v", _pszPath, _dwFileAttributes, _psfi, _cbFileInfo, _uFlags)
		defer func() { trc(`XSHGetFileInfoW->%+v`, r) }()
	}
	r0, _, _ := procSHGetFileInfoW.Call(_pszPath, uintptr(_dwFileAttributes), _psfi, uintptr(_cbFileInfo), uintptr(_uFlags))
	return TDWORD_PTR(r0)
}

type TDWORD_PTR = uint64

var procSHGetPathFromIDListW = modshell32.NewProc("SHGetPathFromIDListW")

// __attribute__((dllimport))WINBOOL SHGetPathFromIDListW ( LPCITEMIDLIST pidl, LPWSTR pszPath);
func XSHGetPathFromIDListW(tls *TLS, _pidl uintptr, _pszPath TLPWSTR) (r TWINBOOL) {
	if __ccgo_strace {
		trc("pidl=%+v pszPath=%+v", _pidl, _pszPath)
		defer func() { trc(`XSHGetPathFromIDListW->%+v`, r) }()
	}
	r0, _, _ := procSHGetPathFromIDListW.Call(_pidl, _pszPath)
	return TWINBOOL(r0)
}

var procScreenToClient = moduser32.NewProc("ScreenToClient")

// __attribute__((moduser32import)) WINBOOL ScreenToClient(HWND hWnd,LPPOINT lpPoint);
func XScreenToClient(tls *TLS, _hWnd THWND, _lpPoint TLPPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v lpPoint=%+v", _hWnd, _lpPoint)
		defer func() { trc(`XScreenToClient->%+v`, r) }()
	}
	r0, _, _ := procScreenToClient.Call(_hWnd, _lpPoint)
	return TWINBOOL(r0)
}

var procCombineRgn = modgdi32.NewProc("CombineRgn")

// __attribute__((dllimport)) int CombineRgn(HRGN hrgnDst,HRGN hrgnSrc1,HRGN hrgnSrc2,int iMode);
func XCombineRgn(tls *TLS, _hrgnDst THRGN, _hrgnSrc1 THRGN, _hrgnSrc2 THRGN, _iMode int32) (r int32) {
	if __ccgo_strace {
		trc("hrgnDst=%+v hrgnSrc1=%+v hrgnSrc2=%+v iMode=%+v", _hrgnDst, _hrgnSrc1, _hrgnSrc2, _iMode)
		defer func() { trc(`XCombineRgn->%+v`, r) }()
	}
	r0, _, _ := procCombineRgn.Call(_hrgnDst, _hrgnSrc1, _hrgnSrc2, uintptr(_iMode))
	return int32(r0)
}

var procCommDlgExtendedError = modcomdlg32.NewProc("CommDlgExtendedError")

// __attribute__((dllimport)) DWORD CommDlgExtendedError( void);
func XCommDlgExtendedError(tls *TLS) (r TDWORD) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XCommDlgExtendedError->%+v`, r) }()
	}
	r0, _, _ := procCommDlgExtendedError.Call()
	return TDWORD(r0)
}

var procEndPath = modgdi32.NewProc("EndPath")

// __attribute__((dllimport)) WINBOOL EndPath(HDC hdc);
func XEndPath(tls *TLS, _hdc THDC) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XEndPath->%+v`, r) }()
	}
	r0, _, _ := procEndPath.Call(_hdc)
	return TWINBOOL(r0)
}

var procExtCreatePen = modgdi32.NewProc("ExtCreatePen")

// __attribute__((dllimport)) HPEN ExtCreatePen(DWORD iPenStyle,DWORD cWidth, const LOGBRUSH *plbrush,DWORD cStyle, const DWORD *pstyle);
func XExtCreatePen(tls *TLS, _iPenStyle TDWORD, _cWidth TDWORD, _plbrush uintptr, _cStyle TDWORD, _pstyle uintptr) (r THPEN) {
	if __ccgo_strace {
		trc("iPenStyle=%+v cWidth=%+v plbrush=%+v cStyle=%+v pstyle=%+v", _iPenStyle, _cWidth, _plbrush, _cStyle, _pstyle)
		defer func() { trc(`XExtCreatePen->%+v`, r) }()
	}
	r0, _, _ := procExtCreatePen.Call(uintptr(_iPenStyle), uintptr(_cWidth), _plbrush, uintptr(_cStyle), _pstyle)
	return THPEN(r0)
}

var procExtTextOutW = modgdi32.NewProc("ExtTextOutW")

// __attribute__((dllimport)) WINBOOL ExtTextOutW(HDC hdc,int x,int y,UINT options, const RECT *lprect,LPCWSTR lpString,UINT c, const INT *lpDx);
func XExtTextOutW(tls *TLS, _hdc THDC, _x int32, _y int32, _options TUINT, _lprect uintptr, _lpString TLPCWSTR, _c TUINT, _lpDx uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v options=%+v lprect=%+v lpString=%+v c=%+v lpDx=%+v", _hdc, _x, _y, _options, _lprect, _lpString, _c, _lpDx)
		defer func() { trc(`XExtTextOutW->%+v`, r) }()
	}
	r0, _, _ := procExtTextOutW.Call(_hdc, uintptr(_x), uintptr(_y), uintptr(_options), _lprect, _lpString, uintptr(_c), _lpDx)
	return TWINBOOL(r0)
}

var procFillRect = moduser32.NewProc("FillRect")

// __attribute__((moduser32import)) int FillRect(HDC hDC, const RECT *lprc,HBRUSH hbr);
func XFillRect(tls *TLS, _hDC THDC, _lprc uintptr, _hbr THBRUSH) (r int32) {
	if __ccgo_strace {
		trc("hDC=%+v lprc=%+v hbr=%+v", _hDC, _lprc, _hbr)
		defer func() { trc(`XFillRect->%+v`, r) }()
	}
	r0, _, _ := procFillRect.Call(_hDC, _lprc, _hbr)
	return int32(r0)
}

var procGetAsyncKeyState = moduser32.NewProc("GetAsyncKeyState")

// __attribute__((moduser32import)) SHORT GetAsyncKeyState(int vKey);
func XGetAsyncKeyState(tls *TLS, _vKey int32) (r TSHORT) {
	if __ccgo_strace {
		trc("vKey=%+v", _vKey)
		defer func() { trc(`XGetAsyncKeyState->%+v`, r) }()
	}
	r0, _, _ := procGetAsyncKeyState.Call(uintptr(_vKey))
	return TSHORT(r0)
}

var procGetBkMode = modgdi32.NewProc("GetBkMode")

// __attribute__((dllimport)) int GetBkMode(HDC hdc);
func XGetBkMode(tls *TLS, _hdc THDC) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XGetBkMode->%+v`, r) }()
	}
	r0, _, _ := procGetBkMode.Call(_hdc)
	return int32(r0)
}

var procGetCapture = moduser32.NewProc("GetCapture")

// __attribute__((moduser32import)) HWND GetCapture( void);
func XGetCapture(tls *TLS) (r THWND) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XGetCapture->%+v`, r) }()
	}
	r0, _, _ := procGetCapture.Call()
	return THWND(r0)
}

var procGetParent = moduser32.NewProc("GetParent")

// __attribute__((moduser32import)) HWND GetParent(HWND hWnd);
func XGetParent(tls *TLS, _hWnd THWND) (r THWND) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XGetParent->%+v`, r) }()
	}
	r0, _, err := procGetParent.Call(_hWnd)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THWND(r0)
}

var procGetPixel = modgdi32.NewProc("GetPixel")

// __attribute__((dllimport)) COLORREF GetPixel(HDC hdc,int x,int y);
func XGetPixel(tls *TLS, _hdc THDC, _x int32, _y int32) (r TCOLORREF) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v", _hdc, _x, _y)
		defer func() { trc(`XGetPixel->%+v`, r) }()
	}
	r0, _, _ := procGetPixel.Call(_hdc, uintptr(_x), uintptr(_y))
	return TCOLORREF(r0)
}

var procCoInitialize = modole32.NewProc("CoInitialize")

// extern __attribute__((modole32import)) HRESULT CoInitialize (LPVOID pvReserved);
func XCoInitialize(tls *TLS, _pvReserved TLPVOID) (r THRESULT) {
	if __ccgo_strace {
		trc("pvReserved=%+v", _pvReserved)
		defer func() { trc(`XCoInitialize->%+v`, r) }()
	}
	r0, _, _ := procCoInitialize.Call(_pvReserved)
	return THRESULT(r0)
}

var procCoTaskMemAlloc = modole32.NewProc("CoTaskMemAlloc")

// extern __attribute__((modole32import))LPVOID CoTaskMemAlloc (SIZE_T cb);
func XCoTaskMemAlloc(tls *TLS, _cb TSIZE_T) (r TLPVOID) {
	if __ccgo_strace {
		trc("cb=%+v", _cb)
		defer func() { trc(`XCoTaskMemAlloc->%+v`, r) }()
	}
	r0, _, _ := procCoTaskMemAlloc.Call(uintptr(_cb))
	return TLPVOID(r0)
}

var procCoTaskMemFree = modole32.NewProc("CoTaskMemFree")

// extern __attribute__((modole32import))void CoTaskMemFree (LPVOID pv);
func XCoTaskMemFree(tls *TLS, _pv TLPVOID) {
	if __ccgo_strace {
		trc("pv=%+v", _pv)
	}
	procCoTaskMemFree.Call(_pv)
}

var procGetMessageW = moduser32.NewProc("GetMessageW")

// __attribute__((moduser32import)) WINBOOL GetMessageW(LPMSG lpMsg,HWND hWnd,UINT wMsgFilterMin,UINT wMsgFilterMax);
func XGetMessageW(tls *TLS, _lpMsg TLPMSG, _hWnd THWND, _wMsgFilterMin TUINT, _wMsgFilterMax TUINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lpMsg=%+v hWnd=%+v wMsgFilterMin=%+v wMsgFilterMax=%+v", _lpMsg, _hWnd, _wMsgFilterMin, _wMsgFilterMax)
		defer func() { trc(`XGetMessageW->%+v`, r) }()
	}
	r0, _, err := procGetMessageW.Call(_lpMsg, _hWnd, uintptr(_wMsgFilterMin), uintptr(_wMsgFilterMax))
	if r = TWINBOOL(r0); r == -1 {
		tls.setErrno(err)
	}
	return r
}

var procPostQuitMessage = moduser32.NewProc("PostQuitMessage")

// __attribute__((moduser32import)) void PostQuitMessage (int nExitCode);
func XPostQuitMessage(tls *TLS, _nExitCode int32) {
	if __ccgo_strace {
		trc("nExitCode=%+v", _nExitCode)
	}
	procPostQuitMessage.Call(uintptr(_nExitCode))
}

var procTranslateMessage = moduser32.NewProc("TranslateMessage")

// __attribute__((moduser32import)) WINBOOL TranslateMessage( const MSG *lpMsg);
func XTranslateMessage(tls *TLS, _lpMsg uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lpMsg=%+v", _lpMsg)
		defer func() { trc(`XTranslateMessage->%+v`, r) }()
	}
	r0, _, _ := procTranslateMessage.Call(_lpMsg)
	return TWINBOOL(r0)
}

var procDispatchMessageW = moduser32.NewProc("DispatchMessageW")

// __attribute__((moduser32import)) LRESULT DispatchMessageW( const MSG *lpMsg);
func XDispatchMessageW(tls *TLS, _lpMsg uintptr) (r TLRESULT) {
	if __ccgo_strace {
		trc("lpMsg=%+v", _lpMsg)
		defer func() { trc(`XDispatchMessageW->%+v`, r) }()
	}
	r0, _, _ := procDispatchMessageW.Call(_lpMsg)
	return TLRESULT(r0)
}

var procCallNextHookEx = moduser32.NewProc("CallNextHookEx")

// __attribute__((moduser32import)) LRESULT CallNextHookEx (HHOOK hhk, int nCode, WPARAM wParam, LPARAM lParam);
func XCallNextHookEx(tls *TLS, _hhk THHOOK, _nCode int32, _wParam TWPARAM, _lParam TLPARAM) (r TLRESULT) {
	if __ccgo_strace {
		trc("hhk=%+v nCode=%+v wParam=%+v lParam=%+v", _hhk, _nCode, _wParam, _lParam)
		defer func() { trc(`XCallNextHookEx->%+v`, r) }()
	}
	r0, _, _ := procCallNextHookEx.Call(_hhk, uintptr(_nCode), uintptr(_wParam), uintptr(_lParam))
	return TLRESULT(r0)
}

var procChord = modgdi32.NewProc("Chord")

// __attribute__((dllimport)) WINBOOL Chord(HDC hdc,int x1,int y1,int x2,int y2,int x3,int y3,int x4,int y4);
func XChord(tls *TLS, _hdc THDC, _x1 int32, _y1 int32, _x2 int32, _y2 int32, _x3 int32, _y3 int32, _x4 int32, _y4 int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x1=%+v y1=%+v x2=%+v y2=%+v x3=%+v y3=%+v x4=%+v y4=%+v", _hdc, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4)
		defer func() { trc(`XChord->%+v`, r) }()
	}
	r0, _, _ := procChord.Call(_hdc, uintptr(_x1), uintptr(_y1), uintptr(_x2), uintptr(_y2), uintptr(_x3), uintptr(_y3), uintptr(_x4), uintptr(_y4))
	return TWINBOOL(r0)
}

var procClientToScreen = moduser32.NewProc("ClientToScreen")

// __attribute__((moduser32import)) WINBOOL ClientToScreen(HWND hWnd,LPPOINT lpPoint);
func XClientToScreen(tls *TLS, _hWnd THWND, _lpPoint TLPPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hWnd=%+v lpPoint=%+v", _hWnd, _lpPoint)
		defer func() { trc(`XClientToScreen->%+v`, r) }()
	}
	r0, _, _ := procClientToScreen.Call(_hWnd, _lpPoint)
	return TWINBOOL(r0)
}

var procCloseFigure = modgdi32.NewProc("CloseFigure")

// __attribute__((dllimport)) WINBOOL CloseFigure(HDC hdc);
func XCloseFigure(tls *TLS, _hdc THDC) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XCloseFigure->%+v`, r) }()
	}
	r0, _, _ := procCloseFigure.Call(_hdc)
	return TWINBOOL(r0)
}

var procArc = modgdi32.NewProc("Arc")

// __attribute__((dllimport)) WINBOOL Arc(HDC hdc,int x1,int y1,int x2,int y2,int x3,int y3,int x4,int y4);
func XArc(tls *TLS, _hdc THDC, _x1 int32, _y1 int32, _x2 int32, _y2 int32, _x3 int32, _y3 int32, _x4 int32, _y4 int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x1=%+v y1=%+v x2=%+v y2=%+v x3=%+v y3=%+v x4=%+v y4=%+v", _hdc, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4)
		defer func() { trc(`XArc->%+v`, r) }()
	}
	r0, _, _ := procArc.Call(_hdc, uintptr(_x1), uintptr(_y1), uintptr(_x2), uintptr(_y2), uintptr(_x3), uintptr(_y3), uintptr(_x4), uintptr(_y4))
	return TWINBOOL(r0)
}

var procBeginPath = modgdi32.NewProc("BeginPath")

// __attribute__((dllimport)) WINBOOL BeginPath(HDC hdc);
func XBeginPath(tls *TLS, _hdc THDC) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XBeginPath->%+v`, r) }()
	}
	r0, _, _ := procBeginPath.Call(_hdc)
	return TWINBOOL(r0)
}

type TBOOL = int32

var procBitBlt = modgdi32.NewProc("BitBlt")

// __attribute__((dllimport)) WINBOOL BitBlt(HDC hdc,int x,int y,int cx,int cy,HDC hdcSrc,int x1,int y1,DWORD rop);
func XBitBlt(tls *TLS, _hdc THDC, _x int32, _y int32, _cx int32, _cy int32, _hdcSrc THDC, _x1 int32, _y1 int32, _rop TDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v cx=%+v cy=%+v hdcSrc=%+v x1=%+v y1=%+v rop=%+v", _hdc, _x, _y, _cx, _cy, _hdcSrc, _x1, _y1, _rop)
		defer func() { trc(`XBitBlt->%+v`, r) }()
	}
	r0, _, err := procBitBlt.Call(_hdc, uintptr(_x), uintptr(_y), uintptr(_cx), uintptr(_cy), _hdcSrc, uintptr(_x1), uintptr(_y1), uintptr(_rop))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

// unsigned long long strtoull(const char *nptr, char **endptr, int base);
func Xstrtoull(t *TLS, nptr, endptr uintptr, base int32) uint64 {
	var s uintptr = nptr
	var acc uint64
	var c byte
	var cutoff uint64
	var neg int32
	var any int32
	var cutlim int32

	/*
	 * Skip white space and pick up leading +/- sign if any.
	 * If base is 0, allow 0x for hex and 0 for octal, else
	 * assume decimal; if base is already 16, allow 0x.
	 */
	for {
		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
		var sp = strings.TrimSpace(string(c))
		if len(sp) > 0 {
			break
		}
	}

	if c == '-' {
		neg = 1
		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
	} else if c == '+' {
		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
	}

	sp := *(*byte)(unsafe.Pointer(s))

	if (base == 0 || base == 16) &&
		c == '0' && (sp == 'x' || sp == 'X') {
		PostIncUintptr(&s, 1)
		c = *(*byte)(unsafe.Pointer(s)) //s[1];
		PostIncUintptr(&s, 1)
		base = 16
	}
	if base == 0 {
		if c == '0' {
			base = 0
		} else {
			base = 10
		}
	}

	cutoff = math.MaxUint64 / uint64(base)
	cutlim = int32(math.MaxUint64 % uint64(base))

	acc = 0
	any = 0

	for {
		var cs = string(c)
		if unicode.IsDigit([]rune(cs)[0]) {
			c -= '0'
		} else if unicode.IsLetter([]rune(cs)[0]) {
			if unicode.IsUpper([]rune(cs)[0]) {
				c -= 'A' - 10
			} else {
				c -= 'a' - 10
			}
		} else {
			break
		}

		if int32(c) >= base {
			break
		}
		if any < 0 || acc > cutoff || (acc == cutoff && int32(c) > cutlim) {
			any = -1

		} else {
			any = 1
			acc *= uint64(base)
			acc += uint64(c)
		}

		c = *(*byte)(unsafe.Pointer(s))
		PostIncUintptr(&s, 1)
	}

	if any < 0 {
		acc = math.MaxUint64
		t.setErrno(errno.ERANGE)
	} else if neg == 1 {
		acc = -acc
	}

	if endptr != 0 {
		if any == 1 {
			PostDecUintptr(&s, 1)
			AssignPtrUintptr(endptr, s)
		} else {
			AssignPtrUintptr(endptr, nptr)
		}
	}
	return acc
}

var procGetFileSizeEx = modkernel32.NewProc("GetFileSizeEx")

// __attribute__((dllimport)) WINBOOL GetFileSizeEx (HANDLE hFile, PLARGE_INTEGER lpFileSize);
func XGetFileSizeEx(tls *TLS, _hFile THANDLE, _lpFileSize TPLARGE_INTEGER) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hFile=%+v lpFileSize=%+v", _hFile, _lpFileSize)
		defer func() { trc(`XGetFileSizeEx->%+v`, r) }()
	}
	r0, _, err := procGetFileSizeEx.Call(_hFile, _lpFileSize)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procCopySid = modadvapi32.NewProc("CopySid")

// __attribute__((dllimport)) WINBOOL CopySid (DWORD nDestinationSidLength, PSID pDestinationSid, PSID pSourceSid);
func XCopySid(tls *TLS, _nDestinationSidLength TDWORD, _pDestinationSid TPSID, _pSourceSid TPSID) (r TWINBOOL) {
	if __ccgo_strace {
		trc("nDestinationSidLength=%+v pDestinationSid=%+v pSourceSid=%+v", _nDestinationSidLength, _pDestinationSid, _pSourceSid)
		defer func() { trc(`XCopySid->%+v`, r) }()
	}
	r0, _, err := procCopySid.Call(uintptr(_nDestinationSidLength), _pDestinationSid, _pSourceSid)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procConvertStringSidToSidA = modadvapi32.NewProc("ConvertStringSidToSidA")

// __attribute__((dllimport)) WINBOOL ConvertStringSidToSidA(LPCSTR StringSid,PSID *Sid);
func XConvertStringSidToSidA(tls *TLS, _StringSid TLPCSTR, _Sid uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("StringSid=%+v Sid=%+v", _StringSid, _Sid)
		defer func() { trc(`XConvertStringSidToSidA->%+v`, r) }()
	}
	r0, _, err := procConvertStringSidToSidA.Call(_StringSid, _Sid)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procAddAccessAllowedAce = modadvapi32.NewProc("AddAccessAllowedAce")

// __attribute__((dllimport)) WINBOOL AddAccessAllowedAce (PACL pAcl, DWORD dwAceRevision, DWORD AccessMask, PSID pSid);
func XAddAccessAllowedAce(tls *TLS, _pAcl TPACL, _dwAceRevision TDWORD, _AccessMask TDWORD, _pSid TPSID) (r TWINBOOL) {
	if __ccgo_strace {
		trc("pAcl=%+v dwAceRevision=%+v AccessMask=%+v pSid=%+v", _pAcl, _dwAceRevision, _AccessMask, _pSid)
		defer func() { trc(`XAddAccessAllowedAce->%+v`, r) }()
	}
	r0, _, err := procAddAccessAllowedAce.Call(_pAcl, uintptr(_dwAceRevision), uintptr(_AccessMask), _pSid)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

type TPSID = uintptr

type TPACL = uintptr

var procCreateFileMappingW = modkernel32.NewProc("CreateFileMappingW")

// __attribute__((dllimport)) HANDLE CreateFileMappingW (HANDLE hFile, LPSECURITY_ATTRIBUTES lpFileMappingAttributes, DWORD flProtect, DWORD dwMaximumSizeHigh, DWORD dwMaximumSizeLow, LPCWSTR lpName);
func XCreateFileMappingW(tls *TLS, _hFile THANDLE, _lpFileMappingAttributes TLPSECURITY_ATTRIBUTES, _flProtect TDWORD, _dwMaximumSizeHigh TDWORD, _dwMaximumSizeLow TDWORD, _lpName TLPCWSTR) (r THANDLE) {
	if __ccgo_strace {
		trc("hFile=%+v lpFileMappingAttributes=%+v flProtect=%+v dwMaximumSizeHigh=%+v dwMaximumSizeLow=%+v lpName=%+v", _hFile, _lpFileMappingAttributes, _flProtect, _dwMaximumSizeHigh, _dwMaximumSizeLow, _lpName)
		defer func() { trc(`XCreateFileMappingW->%+v`, r) }()
	}
	r0, _, err := procCreateFileMappingW.Call(_hFile, _lpFileMappingAttributes, uintptr(_flProtect), uintptr(_dwMaximumSizeHigh), uintptr(_dwMaximumSizeLow), _lpName)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THANDLE(r0)
}

var procMapViewOfFile = modkernel32.NewProc("MapViewOfFile")

// __attribute__((dllimport)) LPVOID MapViewOfFile (HANDLE hFileMappingObject, DWORD dwDesiredAccess, DWORD dwFileOffsetHigh, DWORD dwFileOffsetLow, SIZE_T dwNumberOfBytesToMap);
func XMapViewOfFile(tls *TLS, _hFileMappingObject THANDLE, _dwDesiredAccess TDWORD, _dwFileOffsetHigh TDWORD, _dwFileOffsetLow TDWORD, _dwNumberOfBytesToMap TSIZE_T) (r TLPVOID) {
	if __ccgo_strace {
		trc("hFileMappingObject=%+v dwDesiredAccess=%+v dwFileOffsetHigh=%+v dwFileOffsetLow=%+v dwNumberOfBytesToMap=%+v", _hFileMappingObject, _dwDesiredAccess, _dwFileOffsetHigh, _dwFileOffsetLow, _dwNumberOfBytesToMap)
		defer func() { trc(`XMapViewOfFile->%+v`, r) }()
	}
	r0, _, err := procMapViewOfFile.Call(_hFileMappingObject, uintptr(_dwDesiredAccess), uintptr(_dwFileOffsetHigh), uintptr(_dwFileOffsetLow), uintptr(_dwNumberOfBytesToMap))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TLPVOID(r0)
}

var procAcquireSRWLockExclusive = modkernel32.NewProc("AcquireSRWLockExclusive")

// void AcquireSRWLockExclusive (PSRWLOCK SRWLock);
func XAcquireSRWLockExclusive(tls *TLS, _SRWLock TPSRWLOCK) {
	if __ccgo_strace {
		trc("SRWLock=%+v", _SRWLock)
	}
	procAcquireSRWLockExclusive.Call(_SRWLock)
}

var procReleaseSRWLockExclusive = modkernel32.NewProc("ReleaseSRWLockExclusive")

// void ReleaseSRWLockExclusive (PSRWLOCK SRWLock);
func XReleaseSRWLockExclusive(tls *TLS, _SRWLock TPSRWLOCK) {
	if __ccgo_strace {
		trc("SRWLock=%+v", _SRWLock)
	}
	procReleaseSRWLockExclusive.Call(_SRWLock)
}

type TPSRWLOCK = uintptr

type TLPSECURITY_ATTRIBUTES = uintptr

var procAcquireSRWLockShared = modkernel32.NewProc("AcquireSRWLockShared")

// void AcquireSRWLockShared (PSRWLOCK SRWLock);
func XAcquireSRWLockShared(tls *TLS, _SRWLock TPSRWLOCK) {
	if __ccgo_strace {
		trc("SRWLock=%+v", _SRWLock)
	}
	procAcquireSRWLockShared.Call(_SRWLock)
}

var procReleaseSRWLockShared = modkernel32.NewProc("ReleaseSRWLockShared")

// void ReleaseSRWLockShared (PSRWLOCK SRWLock);
func XReleaseSRWLockShared(tls *TLS, _SRWLock TPSRWLOCK) {
	if __ccgo_strace {
		trc("SRWLock=%+v", _SRWLock)
	}
	procReleaseSRWLockShared.Call(_SRWLock)
}

var procWakeConditionVariable = modkernel32.NewProc("WakeConditionVariable")

// __attribute__((dllimport)) void WakeConditionVariable (PCONDITION_VARIABLE ConditionVariable);
func XWakeConditionVariable(tls *TLS, _ConditionVariable TPCONDITION_VARIABLE) {
	if __ccgo_strace {
		trc("ConditionVariable=%+v", _ConditionVariable)
	}
	procWakeConditionVariable.Call(_ConditionVariable)
}

type TPCONDITION_VARIABLE = uintptr

var procCancelSynchronousIo = modkernel32.NewProc("CancelSynchronousIo")

// __attribute__((dllimport)) WINBOOL CancelSynchronousIo (HANDLE hThread);
func XCancelSynchronousIo(tls *TLS, _hThread THANDLE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hThread=%+v", _hThread)
		defer func() { trc(`XCancelSynchronousIo->%+v`, r) }()
	}
	r0, _, err := procCancelSynchronousIo.Call(_hThread)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procSleepConditionVariableSRW = modkernel32.NewProc("SleepConditionVariableSRW")

// __attribute__((dllimport)) WINBOOL SleepConditionVariableSRW (PCONDITION_VARIABLE ConditionVariable, PSRWLOCK SRWLock, DWORD dwMilliseconds, ULONG Flags);
func XSleepConditionVariableSRW(tls *TLS, _ConditionVariable TPCONDITION_VARIABLE, _SRWLock TPSRWLOCK, _dwMilliseconds TDWORD, _Flags TULONG) (r TWINBOOL) {
	if __ccgo_strace {
		trc("ConditionVariable=%+v SRWLock=%+v dwMilliseconds=%+v Flags=%+v", _ConditionVariable, _SRWLock, _dwMilliseconds, _Flags)
		defer func() { trc(`XSleepConditionVariableSRW->%+v`, r) }()
	}
	r0, _, err := procSleepConditionVariableSRW.Call(_ConditionVariable, _SRWLock, uintptr(_dwMilliseconds), uintptr(_Flags))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procWakeAllConditionVariable = modkernel32.NewProc("WakeAllConditionVariable")

// __attribute__((dllimport)) void WakeAllConditionVariable (PCONDITION_VARIABLE ConditionVariable);
func XWakeAllConditionVariable(tls *TLS, _ConditionVariable TPCONDITION_VARIABLE) {
	if __ccgo_strace {
		trc("ConditionVariable=%+v", _ConditionVariable)
	}
	procWakeAllConditionVariable.Call(_ConditionVariable)
}

var procInitializeSRWLock = modkernel32.NewProc("InitializeSRWLock")

// __attribute__((dllimport)) void InitializeSRWLock (PSRWLOCK SRWLock);
func XInitializeSRWLock(tls *TLS, _SRWLock TPSRWLOCK) {
	if __ccgo_strace {
		trc("SRWLock=%+v", _SRWLock)
	}
	procInitializeSRWLock.Call(_SRWLock)
}

var procInitializeConditionVariable = modkernel32.NewProc("InitializeConditionVariable")

// __attribute__((dllimport)) void InitializeConditionVariable (PCONDITION_VARIABLE ConditionVariable);
func XInitializeConditionVariable(tls *TLS, _ConditionVariable TPCONDITION_VARIABLE) {
	if __ccgo_strace {
		trc("ConditionVariable=%+v", _ConditionVariable)
	}
	procInitializeConditionVariable.Call(_ConditionVariable)
}

var procGetConsoleScreenBufferInfo = modkernel32.NewProc("GetConsoleScreenBufferInfo")

// __attribute__((dllimport)) WINBOOL GetConsoleScreenBufferInfo(HANDLE hConsoleOutput,PCONSOLE_SCREEN_BUFFER_INFO lpConsoleScreenBufferInfo);
func XGetConsoleScreenBufferInfo(tls *TLS, _hConsoleOutput THANDLE, _lpConsoleScreenBufferInfo TPCONSOLE_SCREEN_BUFFER_INFO) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hConsoleOutput=%+v lpConsoleScreenBufferInfo=%+v", _hConsoleOutput, _lpConsoleScreenBufferInfo)
		defer func() { trc(`XGetConsoleScreenBufferInfo->%+v`, r) }()
	}
	r0, _, err := procGetConsoleScreenBufferInfo.Call(_hConsoleOutput, _lpConsoleScreenBufferInfo)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

type TPCONSOLE_SCREEN_BUFFER_INFO = uintptr

var procCreateSymbolicLinkW = modkernel32.NewProc("CreateSymbolicLinkW")

// __attribute__((dllimport)) BOOLEAN CreateSymbolicLinkW (LPCWSTR lpSymlinkFileName, LPCWSTR lpTargetFileName, DWORD dwFlags);
func XCreateSymbolicLinkW(tls *TLS, _lpSymlinkFileName TLPCWSTR, _lpTargetFileName TLPCWSTR, _dwFlags TDWORD) (r TBOOLEAN) {
	if __ccgo_strace {
		trc("lpSymlinkFileName=%+v lpTargetFileName=%+v dwFlags=%+v", _lpSymlinkFileName, _lpTargetFileName, _dwFlags)
		defer func() { trc(`XCreateSymbolicLinkW->%+v`, r) }()
	}
	r0, _, err := procCreateSymbolicLinkW.Call(_lpSymlinkFileName, _lpTargetFileName, uintptr(_dwFlags))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TBOOLEAN(r0)
}

type TBOOLEAN = uint8

var procGetUserProfileDirectoryW = moduserenv.NewProc("GetUserProfileDirectoryW")

// __attribute__((dllimport)) WINBOOL GetUserProfileDirectoryW (HANDLE hToken, LPWSTR lpProfileDir, LPDWORD lpcchSize);
func XGetUserProfileDirectoryW(tls *TLS, _hToken THANDLE, _lpProfileDir TLPWSTR, _lpcchSize TLPDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hToken=%+v lpProfileDir=%+v lpcchSize=%+v", _hToken, _lpProfileDir, _lpcchSize)
		defer func() { trc(`XGetUserProfileDirectoryW->%+v`, r) }()
	}
	r0, _, _ := procGetUserProfileDirectoryW.Call(_hToken, _lpProfileDir, _lpcchSize)
	return TWINBOOL(r0)
}

var procTlsAlloc = modkernel32.NewProc("TlsAlloc")

// __attribute__((dllimport)) DWORD TlsAlloc ( void);
func XTlsAlloc(tls *TLS) (r TDWORD) {
	if __ccgo_strace {
		trc("")
		defer func() { trc(`XTlsAlloc->%+v`, r) }()
	}
	r0, _, err := procTlsAlloc.Call()
	if r0 == TLS_OUT_OF_INDEXES {
		tls.setErrno(err)
	}
	return TDWORD(r0)
}

const TLS_OUT_OF_INDEXES = 0xffffffff

var procTlsGetValue = modkernel32.NewProc("TlsGetValue")

// __attribute__((dllimport)) LPVOID TlsGetValue (DWORD dwTlsIndex);
func XTlsGetValue(tls *TLS, _dwTlsIndex TDWORD) (r TLPVOID) {
	if __ccgo_strace {
		trc("dwTlsIndex=%+v", _dwTlsIndex)
		defer func() { trc(`XTlsGetValue->%+v`, r) }()
	}
	r0, _, err := procTlsGetValue.Call(uintptr(_dwTlsIndex))
	if r0 == 0 && err.(windows.Errno) != windows.ERROR_SUCCESS {
		tls.setErrno(err)
	}
	return TLPVOID(r0)
}

var procTlsFree = modkernel32.NewProc("TlsFree")

// __attribute__((dllimport)) WINBOOL TlsFree (DWORD dwTlsIndex);
func XTlsFree(tls *TLS, _dwTlsIndex TDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("dwTlsIndex=%+v", _dwTlsIndex)
		defer func() { trc(`XTlsFree->%+v`, r) }()
	}
	r0, _, err := procTlsFree.Call(uintptr(_dwTlsIndex))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procTlsSetValue = modkernel32.NewProc("TlsSetValue")

// __attribute__((dllimport)) WINBOOL TlsSetValue (DWORD dwTlsIndex, LPVOID lpTlsValue);
func XTlsSetValue(tls *TLS, _dwTlsIndex TDWORD, _lpTlsValue TLPVOID) (r TWINBOOL) {
	if __ccgo_strace {
		trc("dwTlsIndex=%+v lpTlsValue=%+v", _dwTlsIndex, _lpTlsValue)
		defer func() { trc(`XTlsSetValue->%+v`, r) }()
	}
	r0, _, err := procTlsSetValue.Call(uintptr(_dwTlsIndex), _lpTlsValue)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procSendMessageTimeoutW = moduser32.NewProc("SendMessageTimeoutW")

// __attribute__((dllimport)) LRESULT SendMessageTimeoutW(HWND hWnd,UINT Msg,WPARAM wParam,LPARAM lParam,UINT fuFlags,UINT uTimeout,PDWORD_PTR lpdwResult);
func XSendMessageTimeoutW(tls *TLS, _hWnd THWND, _Msg TUINT, _wParam TWPARAM, _lParam TLPARAM, _fuFlags TUINT, _uTimeout TUINT, _lpdwResult TPDWORD_PTR) (r TLRESULT) {
	if __ccgo_strace {
		trc("hWnd=%+v Msg=%+v wParam=%+v lParam=%+v fuFlags=%+v uTimeout=%+v lpdwResult=%+v", _hWnd, _Msg, _wParam, _lParam, _fuFlags, _uTimeout, _lpdwResult)
		defer func() { trc(`XSendMessageTimeoutW->%+v`, r) }()
	}
	XSetLastError(tls, 0)
	r0, _, err := procSendMessageTimeoutW.Call(_hWnd, uintptr(_Msg), uintptr(_wParam), uintptr(_lParam), uintptr(_fuFlags), uintptr(_uTimeout), _lpdwResult)
	if r0 == 0 && err.(windows.Errno) != 0 {
		tls.setErrno(err)
	}
	return TLRESULT(r0)
}

type TPDWORD_PTR = uintptr

var procDisableThreadLibraryCalls = modkernel32.NewProc("DisableThreadLibraryCalls")

// __attribute__((dllimport)) WINBOOL DisableThreadLibraryCalls (HMODULE hLibModule);
func XDisableThreadLibraryCalls(tls *TLS, _hLibModule THMODULE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hLibModule=%+v", _hLibModule)
		defer func() { trc(`XDisableThreadLibraryCalls->%+v`, r) }()
	}
	r0, _, err := procDisableThreadLibraryCalls.Call(_hLibModule)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procLineTo = modgdi32.NewProc("LineTo")

// __attribute__((dllimport)) WINBOOL LineTo(HDC hdc,int x,int y);
func XLineTo(tls *TLS, _hdc THDC, _x int32, _y int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v", _hdc, _x, _y)
		defer func() { trc(`XLineTo->%+v`, r) }()
	}
	r0, _, _ := procLineTo.Call(_hdc, uintptr(_x), uintptr(_y))
	return TWINBOOL(r0)
}

var procMoveToEx = modgdi32.NewProc("MoveToEx")

// __attribute__((dllimport)) WINBOOL MoveToEx(HDC hdc,int x,int y,LPPOINT lppt);
func XMoveToEx(tls *TLS, _hdc THDC, _x int32, _y int32, _lppt TLPPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v lppt=%+v", _hdc, _x, _y, _lppt)
		defer func() { trc(`XMoveToEx->%+v`, r) }()
	}
	r0, _, _ := procMoveToEx.Call(_hdc, uintptr(_x), uintptr(_y), _lppt)
	return TWINBOOL(r0)
}

var procSHCreateItemFromParsingName = modshell32.NewProc("SHCreateItemFromParsingName")

// __attribute__((dllimport)) HRESULT SHCreateItemFromParsingName(PCWSTR pszPath, IBindCtx *pbc, const IID * const riid, void **ppv);
func XSHCreateItemFromParsingName(tls *TLS, pszPath TPCWSTR, pbc uintptr, riid uintptr, ppv uintptr) (r THRESULT) {
	r0, _, _ := procSHCreateItemFromParsingName.Call(pszPath, pbc, riid, ppv)
	return THRESULT(r0)
}

type TPCWSTR = uintptr

var procDrawTextW = moduser32.NewProc("DrawTextW")

// __attribute__((dllimport)) int DrawTextW(HDC hdc,LPCWSTR lpchText,int cchText,LPRECT lprc,UINT format);
func XDrawTextW(tls *TLS, _hdc THDC, _lpchText TLPCWSTR, _cchText int32, _lprc TLPRECT, _format TUINT) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v lpchText=%+v cchText=%+v lprc=%+v format=%+v", _hdc, _lpchText, _cchText, _lprc, _format)
		defer func() { trc(`XDrawTextW->%+v`, r) }()
	}
	r0, _, _ := procDrawTextW.Call(_hdc, _lpchText, uintptr(_cchText), _lprc, uintptr(_format))
	return int32(r0)
}

var procEllipse = modgdi32.NewProc("Ellipse")

// __attribute__((dllimport)) WINBOOL Ellipse(HDC hdc,int left,int top,int right,int bottom);
func XEllipse(tls *TLS, _hdc THDC, _left int32, _top int32, _right int32, _bottom int32) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v left=%+v top=%+v right=%+v bottom=%+v", _hdc, _left, _top, _right, _bottom)
		defer func() { trc(`XEllipse->%+v`, r) }()
	}
	r0, _, _ := procEllipse.Call(_hdc, uintptr(_left), uintptr(_top), uintptr(_right), uintptr(_bottom))
	return TWINBOOL(r0)
}

var procGetCharWidth32W = modgdi32.NewProc("GetCharWidth32W")

// __attribute__((dllimport)) WINBOOL GetCharWidth32W(HDC hdc,UINT iFirst,UINT iLast,LPINT lpBuffer);
func XGetCharWidth32W(tls *TLS, _hdc THDC, _iFirst TUINT, _iLast TUINT, _lpBuffer TLPINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v iFirst=%+v iLast=%+v lpBuffer=%+v", _hdc, _iFirst, _iLast, _lpBuffer)
		defer func() { trc(`XGetCharWidth32W->%+v`, r) }()
	}
	r0, _, _ := procGetCharWidth32W.Call(_hdc, uintptr(_iFirst), uintptr(_iLast), _lpBuffer)
	return TWINBOOL(r0)
}

var procGetViewportExtEx = modgdi32.NewProc("GetViewportExtEx")

// __attribute__((dllimport)) WINBOOL GetViewportExtEx(HDC hdc,LPSIZE lpsize);
func XGetViewportExtEx(tls *TLS, _hdc THDC, _lpsize TLPSIZE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v lpsize=%+v", _hdc, _lpsize)
		defer func() { trc(`XGetViewportExtEx->%+v`, r) }()
	}
	r0, _, _ := procGetViewportExtEx.Call(_hdc, _lpsize)
	return TWINBOOL(r0)
}

var procGetViewportOrgEx = modgdi32.NewProc("GetViewportOrgEx")

// __attribute__((dllimport)) WINBOOL GetViewportOrgEx(HDC hdc,LPPOINT lppoint);
func XGetViewportOrgEx(tls *TLS, _hdc THDC, _lppoint TLPPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v lppoint=%+v", _hdc, _lppoint)
		defer func() { trc(`XGetViewportOrgEx->%+v`, r) }()
	}
	r0, _, _ := procGetViewportOrgEx.Call(_hdc, _lppoint)
	return TWINBOOL(r0)
}

var procGetWindowExtEx = modgdi32.NewProc("GetWindowExtEx")

// __attribute__((dllimport)) WINBOOL GetWindowExtEx(HDC hdc,LPSIZE lpsize);
func XGetWindowExtEx(tls *TLS, _hdc THDC, _lpsize TLPSIZE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v lpsize=%+v", _hdc, _lpsize)
		defer func() { trc(`XGetWindowExtEx->%+v`, r) }()
	}
	r0, _, _ := procGetWindowExtEx.Call(_hdc, _lpsize)
	return TWINBOOL(r0)
}

var procGetWindowOrgEx = modgdi32.NewProc("GetWindowOrgEx")

// __attribute__((dllimport)) WINBOOL GetWindowOrgEx(HDC hdc,LPPOINT lppoint);
func XGetWindowOrgEx(tls *TLS, _hdc THDC, _lppoint TLPPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v lppoint=%+v", _hdc, _lppoint)
		defer func() { trc(`XGetWindowOrgEx->%+v`, r) }()
	}
	r0, _, _ := procGetWindowOrgEx.Call(_hdc, _lppoint)
	return TWINBOOL(r0)
}

var procSetStretchBltMode = modgdi32.NewProc("SetStretchBltMode")

// __attribute__((dllimport)) int SetStretchBltMode(HDC hdc,int mode);
func XSetStretchBltMode(tls *TLS, _hdc THDC, _mode int32) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v mode=%+v", _hdc, _mode)
		defer func() { trc(`XSetStretchBltMode->%+v`, r) }()
	}
	r0, _, _ := procSetStretchBltMode.Call(_hdc, uintptr(_mode))
	return int32(r0)
}

var procChangeWindowMessageFilter = moduser32.NewProc("ChangeWindowMessageFilter")

// __attribute__((dllimport)) WINBOOL ChangeWindowMessageFilter (UINT message, DWORD dwFlag);
func XChangeWindowMessageFilter(tls *TLS, _message TUINT, _dwFlag TDWORD) (r TWINBOOL) {
	if __ccgo_strace {
		trc("message=%+v dwFlag=%+v", _message, _dwFlag)
		defer func() { trc(`XChangeWindowMessageFilter->%+v`, r) }()
	}
	r0, _, err := procChangeWindowMessageFilter.Call(uintptr(_message), uintptr(_dwFlag))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TWINBOOL(r0)
}

var procClosePrinter = modwinspool.NewProc("ClosePrinter")

// WINBOOL ClosePrinter(HANDLE hPrinter);
func XClosePrinter(tls *TLS, _hPrinter THANDLE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hPrinter=%+v", _hPrinter)
		defer func() { trc(`XClosePrinter->%+v`, r) }()
	}
	r0, _, _ := procClosePrinter.Call(_hPrinter)
	return TWINBOOL(r0)
}

var procCoUninitialize = modole32.NewProc("CoUninitialize")

// extern __attribute__((dllimport))void CoUninitialize (void);
func XCoUninitialize(tls *TLS) {
	if __ccgo_strace {
		trc("")
	}
	procCoUninitialize.Call()
}

var procCreateBrushIndirect = modgdi32.NewProc("CreateBrushIndirect")

// __attribute__((dllimport)) HBRUSH CreateBrushIndirect( const LOGBRUSH *plbrush);
func XCreateBrushIndirect(tls *TLS, _plbrush uintptr) (r THBRUSH) {
	if __ccgo_strace {
		trc("plbrush=%+v", _plbrush)
		defer func() { trc(`XCreateBrushIndirect->%+v`, r) }()
	}
	r0, _, _ := procCreateBrushIndirect.Call(_plbrush)
	return THBRUSH(r0)
}

var procCreatePenIndirect = modgdi32.NewProc("CreatePenIndirect")
var _ = procCreatePenIndirect.Addr()

// __attribute__((dllimport)) HPEN CreatePenIndirect( const LOGPEN *plpen);
func XCreatePenIndirect(tls *TLS, _plpen uintptr) (r THPEN) {
	if __ccgo_strace {
		trc("plpen=%+v", _plpen)
		defer func() { trc(`XCreatePenIndirect->%+v`, r) }()
	}
	r0, _, _ := procCreatePenIndirect.Call(_plpen)
	return THPEN(r0)
}

var procCreateWindowExA = moduser32.NewProc("CreateWindowExA")

// __attribute__((dllimport)) HWND CreateWindowExA(DWORD dwExStyle,LPCSTR lpClassName,LPCSTR lpWindowName,DWORD dwStyle,int X,int Y,int nWidth,int nHeight,HWND hWndParent,HMENU hMenu,HINSTANCE hInstance,LPVOID lpParam);
func XCreateWindowExA(tls *TLS, _dwExStyle TDWORD, _lpClassName TLPCSTR, _lpWindowName TLPCSTR, _dwStyle TDWORD, _X int32, _Y int32, _nWidth int32, _nHeight int32, _hWndParent THWND, _hMenu THMENU, _hInstance THINSTANCE, _lpParam TLPVOID) (r THWND) {
	if __ccgo_strace {
		trc("dwExStyle=%+v lpClassName=%+v lpWindowName=%+v dwStyle=%+v X=%+v Y=%+v nWidth=%+v nHeight=%+v hWndParent=%+v hMenu=%+v hInstance=%+v lpParam=%+v", _dwExStyle, _lpClassName, _lpWindowName, _dwStyle, _X, _Y, _nWidth, _nHeight, _hWndParent, _hMenu, _hInstance, _lpParam)
		defer func() { trc(`XCreateWindowExA->%+v`, r) }()
	}
	r0, _, err := procCreateWindowExA.Call(uintptr(_dwExStyle), _lpClassName, _lpWindowName, uintptr(_dwStyle), uintptr(_X), uintptr(_Y), uintptr(_nWidth), uintptr(_nHeight), _hWndParent, _hMenu, _hInstance, _lpParam)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THWND(r0)
}

var procDefWindowProcA = moduser32.NewProc("DefWindowProcA")

// __attribute__((dllimport)) LRESULT DefWindowProcA (HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
func XDefWindowProcA(tls *TLS, _hWnd THWND, _Msg TUINT, _wParam TWPARAM, _lParam TLPARAM) (r TLRESULT) {
	if __ccgo_strace {
		trc("hWnd=%+v Msg=%+v wParam=%+v lParam=%+v", _hWnd, _Msg, _wParam, _lParam)
		defer func() { trc(`XDefWindowProcA->%+v`, r) }()
	}
	r0, _, _ := procDefWindowProcA.Call(_hWnd, uintptr(_Msg), uintptr(_wParam), uintptr(_lParam))
	return TLRESULT(r0)
}

var procEndDoc = modgdi32.NewProc("EndDoc")

// __attribute__((dllimport)) int EndDoc(HDC hdc);
func XEndDoc(tls *TLS, _hdc THDC) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XEndDoc->%+v`, r) }()
	}
	r0, _, _ := procEndDoc.Call(_hdc)
	return int32(r0)
}

var procEndPage = modgdi32.NewProc("EndPage")

// __attribute__((dllimport)) int EndPage(HDC hdc);
func XEndPage(tls *TLS, _hdc THDC) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XEndPage->%+v`, r) }()
	}
	r0, _, _ := procEndPage.Call(_hdc)
	return int32(r0)
}

var procGetObjectW = modgdi32.NewProc("GetObjectW")

// __attribute__((dllimport)) int GetObjectW(HANDLE h,int c,LPVOID pv);
func XGetObjectW(tls *TLS, _h THANDLE, _c int32, _pv TLPVOID) (r int32) {
	if __ccgo_strace {
		trc("h=%+v c=%+v pv=%+v", _h, _c, _pv)
		defer func() { trc(`XGetObjectW->%+v`, r) }()
	}
	r0, _, _ := procGetObjectW.Call(_h, uintptr(_c), _pv)
	return int32(r0)
}

var procGetSystemPaletteEntries = modgdi32.NewProc("GetSystemPaletteEntries")

// __attribute__((dllimport)) UINT GetSystemPaletteEntries(HDC hdc,UINT iStart,UINT cEntries,LPPALETTEENTRY pPalEntries);
func XGetSystemPaletteEntries(tls *TLS, _hdc THDC, _iStart TUINT, _cEntries TUINT, _pPalEntries TLPPALETTEENTRY) (r TUINT) {
	if __ccgo_strace {
		trc("hdc=%+v iStart=%+v cEntries=%+v pPalEntries=%+v", _hdc, _iStart, _cEntries, _pPalEntries)
		defer func() { trc(`XGetSystemPaletteEntries->%+v`, r) }()
	}
	r0, _, _ := procGetSystemPaletteEntries.Call(_hdc, uintptr(_iStart), uintptr(_cEntries), _pPalEntries)
	return TUINT(r0)
}

var procGetWindowDC = moduser32.NewProc("GetWindowDC")

// __attribute__((dllimport)) HDC GetWindowDC(HWND hWnd);
func XGetWindowDC(tls *TLS, _hWnd THWND) (r THDC) {
	if __ccgo_strace {
		trc("hWnd=%+v", _hWnd)
		defer func() { trc(`XGetWindowDC->%+v`, r) }()
	}
	r0, _, _ := procGetWindowDC.Call(_hWnd)
	return THDC(r0)
}

var procGlobalFree = modkernel32.NewProc("GlobalFree")

// __attribute__((dllimport)) HGLOBAL GlobalFree (HGLOBAL hMem);
func XGlobalFree(tls *TLS, _hMem THGLOBAL) (r THGLOBAL) {
	if __ccgo_strace {
		trc("hMem=%+v", _hMem)
		defer func() { trc(`XGlobalFree->%+v`, r) }()
	}
	r0, _, err := procGlobalFree.Call(_hMem)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THGLOBAL(r0)
}

var procGlobalReAlloc = modkernel32.NewProc("GlobalReAlloc")

// __attribute__((dllimport)) HGLOBAL GlobalReAlloc (HGLOBAL hMem, SIZE_T dwBytes, UINT uFlags);
func XGlobalReAlloc(tls *TLS, _hMem THGLOBAL, _dwBytes TSIZE_T, _uFlags TUINT) (r THGLOBAL) {
	if __ccgo_strace {
		trc("hMem=%+v dwBytes=%+v uFlags=%+v", _hMem, _dwBytes, _uFlags)
		defer func() { trc(`XGlobalReAlloc->%+v`, r) }()
	}
	r0, _, err := procGlobalReAlloc.Call(_hMem, uintptr(_dwBytes), uintptr(_uFlags))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THGLOBAL(r0)
}

var procIsRectEmpty = moduser32.NewProc("IsRectEmpty")

// __attribute__((dllimport)) WINBOOL IsRectEmpty( const RECT *lprc);
func XIsRectEmpty(tls *TLS, _lprc uintptr) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lprc=%+v", _lprc)
		defer func() { trc(`XIsRectEmpty->%+v`, r) }()
	}
	r0, _, _ := procIsRectEmpty.Call(_lprc)
	return TWINBOOL(r0)
}

var procLoadIconA = moduser32.NewProc("LoadIconA")

// __attribute__((dllimport)) HICON LoadIconA(HINSTANCE hInstance,LPCSTR lpIconName);
func XLoadIconA(tls *TLS, _hInstance THINSTANCE, _lpIconName TLPCSTR) (r THICON) {
	if __ccgo_strace {
		trc("hInstance=%+v lpIconName=%+v", _hInstance, _lpIconName)
		defer func() { trc(`XLoadIconA->%+v`, r) }()
	}
	r0, _, err := procLoadIconA.Call(_hInstance, _lpIconName)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return THICON(r0)
}

var procOpenPrinterW = modwinspool.NewProc("OpenPrinterW")

// WINBOOL OpenPrinterW(LPWSTR pPrinterName,LPHANDLE phPrinter,LPPRINTER_DEFAULTSW pDefault);
func XOpenPrinterW(tls *TLS, _pPrinterName TLPWSTR, _phPrinter TLPHANDLE, _pDefault TLPPRINTER_DEFAULTSW) (r TWINBOOL) {
	if __ccgo_strace {
		trc("pPrinterName=%+v phPrinter=%+v pDefault=%+v", _pPrinterName, _phPrinter, _pDefault)
		defer func() { trc(`XOpenPrinterW->%+v`, r) }()
	}
	r0, _, _ := procOpenPrinterW.Call(_pPrinterName, _phPrinter, _pDefault)
	return TWINBOOL(r0)
}

type TLPHANDLE = uintptr

type TLPPRINTER_DEFAULTSW = uintptr

var procPtInRect = moduser32.NewProc("PtInRect")

// __attribute__((dllimport)) WINBOOL PtInRect( const RECT *lprc,POINT pt);
func XPtInRect(tls *TLS, _lprc uintptr, _pt TPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("lprc=%+v pt=%+v", _lprc, _pt)
		defer func() { trc(`XPtInRect->%+v`, r) }()
	}
	r0, _, _ := procPtInRect.Call(_lprc, uintptr(*(*int64)(unsafe.Pointer(&_pt))))
	return TWINBOOL(r0)
}

var procRegisterWindowMessageA = moduser32.NewProc("RegisterWindowMessageA")

// __attribute__((dllimport)) UINT RegisterWindowMessageA(LPCSTR lpString);
func XRegisterWindowMessageA(tls *TLS, _lpString TLPCSTR) (r TUINT) {
	if __ccgo_strace {
		trc("lpString=%+v", _lpString)
		defer func() { trc(`XRegisterWindowMessageA->%+v`, r) }()
	}
	r0, _, err := procRegisterWindowMessageA.Call(_lpString)
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TUINT(r0)
}

var procSetViewportExtEx = modgdi32.NewProc("SetViewportExtEx")

// __attribute__((dllimport)) WINBOOL SetViewportExtEx(HDC hdc,int x,int y,LPSIZE lpsz);
func XSetViewportExtEx(tls *TLS, _hdc THDC, _x int32, _y int32, _lpsz TLPSIZE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v lpsz=%+v", _hdc, _x, _y, _lpsz)
		defer func() { trc(`XSetViewportExtEx->%+v`, r) }()
	}
	r0, _, _ := procSetViewportExtEx.Call(_hdc, uintptr(_x), uintptr(_y), _lpsz)
	return TWINBOOL(r0)
}

var procSetViewportOrgEx = modgdi32.NewProc("SetViewportOrgEx")

// __attribute__((dllimport)) WINBOOL SetViewportOrgEx(HDC hdc,int x,int y,LPPOINT lppt);
func XSetViewportOrgEx(tls *TLS, _hdc THDC, _x int32, _y int32, _lppt TLPPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v lppt=%+v", _hdc, _x, _y, _lppt)
		defer func() { trc(`XSetViewportOrgEx->%+v`, r) }()
	}
	r0, _, _ := procSetViewportOrgEx.Call(_hdc, uintptr(_x), uintptr(_y), _lppt)
	return TWINBOOL(r0)
}

var procSetWindowExtEx = modgdi32.NewProc("SetWindowExtEx")

// __attribute__((dllimport)) WINBOOL SetWindowExtEx(HDC hdc,int x,int y,LPSIZE lpsz);
func XSetWindowExtEx(tls *TLS, _hdc THDC, _x int32, _y int32, _lpsz TLPSIZE) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v lpsz=%+v", _hdc, _x, _y, _lpsz)
		defer func() { trc(`XSetWindowExtEx->%+v`, r) }()
	}
	r0, _, _ := procSetWindowExtEx.Call(_hdc, uintptr(_x), uintptr(_y), _lpsz)
	return TWINBOOL(r0)
}

var procSetWindowOrgEx = modgdi32.NewProc("SetWindowOrgEx")

// __attribute__((dllimport)) WINBOOL SetWindowOrgEx(HDC hdc,int x,int y,LPPOINT lppt);
func XSetWindowOrgEx(tls *TLS, _hdc THDC, _x int32, _y int32, _lppt TLPPOINT) (r TWINBOOL) {
	if __ccgo_strace {
		trc("hdc=%+v x=%+v y=%+v lppt=%+v", _hdc, _x, _y, _lppt)
		defer func() { trc(`XSetWindowOrgEx->%+v`, r) }()
	}
	r0, _, _ := procSetWindowOrgEx.Call(_hdc, uintptr(_x), uintptr(_y), _lppt)
	return TWINBOOL(r0)
}

var procShell_NotifyIconW = modshell32.NewProc("Shell_NotifyIconW")

// __attribute__((dllimport))WINBOOL Shell_NotifyIconW (DWORD dwMessage, PNOTIFYICONDATAW lpData);
func XShell_NotifyIconW(tls *TLS, _dwMessage TDWORD, _lpData TPNOTIFYICONDATAW) (r TWINBOOL) {
	if __ccgo_strace {
		trc("dwMessage=%+v lpData=%+v", _dwMessage, _lpData)
		defer func() { trc(`XShell_NotifyIconW->%+v`, r) }()
	}
	r0, _, _ := procShell_NotifyIconW.Call(uintptr(_dwMessage), _lpData)
	return TWINBOOL(r0)
}

type TPNOTIFYICONDATAW = uintptr

var procStartDocW = modgdi32.NewProc("StartDocW")

// __attribute__((dllimport)) int StartDocW(HDC hdc, const DOCINFOW *lpdi);
func XStartDocW(tls *TLS, _hdc THDC, _lpdi uintptr) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v lpdi=%+v", _hdc, _lpdi)
		defer func() { trc(`XStartDocW->%+v`, r) }()
	}
	r0, _, _ := procStartDocW.Call(_hdc, _lpdi)
	return int32(r0)
}

var procStartPage = modgdi32.NewProc("StartPage")

// __attribute__((dllimport)) int StartPage(HDC hdc);
func XStartPage(tls *TLS, _hdc THDC) (r int32) {
	if __ccgo_strace {
		trc("hdc=%+v", _hdc)
		defer func() { trc(`XStartPage->%+v`, r) }()
	}
	r0, _, _ := procStartPage.Call(_hdc)
	return int32(r0)
}

// char *strtok(char *strToken, const char *strDelimit);
func Xstrtok(tls *TLS, strToken, strDelimit uintptr) uintptr {
	die(tls, "")
	panic(todo(""))
}

var procstrtoll = modcrt.NewProc("strtoll")
var _ = procstrtoll.Addr()

// long long __attribute__((__cdecl__)) strtoll(const char * __restrict__, char ** __restrict, int);
func Xstrtoll(tls *TLS, _0 uintptr, _1 uintptr, _2 int32) (r int64) {
	if __ccgo_strace {
		trc("0=%+v 1=%+v 2=%+v", _0, _1, _2)
		defer func() { trc(`Xstrtoll->%+v`, r) }()
	}
	r0, _, _ := procstrtoll.Call(_0, _1, uintptr(_2))
	return int64(r0)
}

var procGetWindowLongPtrA = moduser32.NewProc("GetWindowLongPtrA")

// __attribute__((dllimport)) LONG_PTR GetWindowLongPtrA(HWND hWnd,int nIndex);
func XGetWindowLongPtrA(tls *TLS, _hWnd THWND, _nIndex int32) (r TLONG_PTR) {
	if __ccgo_strace {
		trc("hWnd=%+v nIndex=%+v", _hWnd, _nIndex)
		defer func() { trc(`XGetWindowLongPtrA->%+v`, r) }()
	}
	r0, _, err := procGetWindowLongPtrA.Call(_hWnd, uintptr(_nIndex))
	if r0 == 0 {
		tls.setErrno(err)
	}
	return TLONG_PTR(r0)
}
