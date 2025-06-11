// Code generated for linux/amd64 by 'genasm', DO NOT EDIT.

#include "textflag.h"

// func Ya64l(p0 *TLS, p1 uintptr) (ret int64)
TEXT ·Ya64l(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xa64l(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yabort(p0 *TLS)
TEXT ·Yabort(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xabort(SB)
	RET

// func Yabs(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yabs(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xabs(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yaccept(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yaccept(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xaccept(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yaccept4(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 int32) (ret int32)
TEXT ·Yaccept4(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xaccept4(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yaccess(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Yaccess(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xaccess(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yacct(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yacct(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xacct(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yacos(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yacos(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xacos(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yacosf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yacosf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xacosf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yacosh(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yacosh(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xacosh(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yacoshf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yacoshf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xacoshf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yacoshl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yacoshl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xacoshl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yacosl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yacosl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xacosl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yaddmntent(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yaddmntent(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xaddmntent(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yadjtime(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yadjtime(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xadjtime(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yadjtimex(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yadjtimex(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xadjtimex(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yalarm(p0 *TLS, p1 uint32) (ret uint32)
TEXT ·Yalarm(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xalarm(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yalloca(p0 *TLS, p1 Tsize_t) (ret uintptr)
TEXT ·Yalloca(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xalloca(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yalphasort(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yalphasort(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xalphasort(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yarch_prctl(p0 *TLS, p1 int32, p2 uint64) (ret int32)
TEXT ·Yarch_prctl(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xarch_prctl(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yasctime(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yasctime(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xasctime(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yasctime_r(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yasctime_r(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xasctime_r(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yasin(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yasin(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xasin(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yasinf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yasinf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xasinf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yasinh(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yasinh(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xasinh(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yasinhf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yasinhf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xasinhf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yasinhl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yasinhl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xasinhl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yasinl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yasinl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xasinl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yasprintf(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yasprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xasprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yat_quick_exit(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yat_quick_exit(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xat_quick_exit(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yatan(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yatan(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xatan(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yatan2(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yatan2(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xatan2(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yatan2f(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Yatan2f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xatan2f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yatan2l(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yatan2l(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xatan2l(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yatanf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yatanf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xatanf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yatanh(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yatanh(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xatanh(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yatanhf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yatanhf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xatanhf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yatanhl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yatanhl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xatanhl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yatanl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yatanl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xatanl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yatexit(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yatexit(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xatexit(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yatof(p0 *TLS, p1 uintptr) (ret float64)
TEXT ·Yatof(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xatof(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yatoi(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yatoi(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xatoi(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yatol(p0 *TLS, p1 uintptr) (ret int64)
TEXT ·Yatol(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xatol(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yatoll(p0 *TLS, p1 uintptr) (ret int64)
TEXT ·Yatoll(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xatoll(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ybacktrace(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ybacktrace(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xbacktrace(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ybacktrace_symbols_fd(p0 *TLS, p1 uintptr, p2 ,  p3 int32)
TEXT ·Ybacktrace_symbols_fd(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	CALL ·Xbacktrace_symbols_fd(SB)
	RET

// func Ybasename(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ybasename(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xbasename(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ybcmp(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ybcmp(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xbcmp(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ybcopy(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t)
TEXT ·Ybcopy(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xbcopy(SB)
	RET

// func Ybind(p0 *TLS, p1 int32, p2 uintptr, p3 Tsocklen_t) (ret int32)
TEXT ·Ybind(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xbind(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ybind_textdomain_codeset(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ybind_textdomain_codeset(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xbind_textdomain_codeset(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ybindtextdomain(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ybindtextdomain(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xbindtextdomain(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ybrk(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ybrk(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xbrk(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ybsearch(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 Tsize_t, p5 uintptr) (ret uintptr)
TEXT ·Ybsearch(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xbsearch(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ybtowc(p0 *TLS, p1 int32) (ret Twint_t)
TEXT ·Ybtowc(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xbtowc(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ybzero(p0 *TLS, p1 uintptr, p2 Tsize_t)
TEXT ·Ybzero(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xbzero(SB)
	RET

// func Yc16rtomb(p0 *TLS, p1 uintptr, p2 Tchar16_t, p3 uintptr) (ret Tsize_t)
TEXT ·Yc16rtomb(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVW p2+16(FP), AX
	MOVW AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xc16rtomb(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yc32rtomb(p0 *TLS, p1 uintptr, p2 Tchar32_t, p3 uintptr) (ret Tsize_t)
TEXT ·Yc32rtomb(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xc32rtomb(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ycabs(p0 *TLS, p1 complex128) (ret float64)
TEXT ·Ycabs(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcabs(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycabsf(p0 *TLS, p1 complex64) (ret float32)
TEXT ·Ycabsf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcabsf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycabsl(p0 *TLS, p1 complex128) (ret float64)
TEXT ·Ycabsl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcabsl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycacos(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycacos(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcacos(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycacosf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycacosf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcacosf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycacosh(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycacosh(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcacosh(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycacoshf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycacoshf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcacoshf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycacoshl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycacoshl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcacoshl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycacosl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycacosl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcacosl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycalloc(p0 *TLS, p1 Tsize_t, p2 Tsize_t) (ret uintptr)
TEXT ·Ycalloc(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcalloc(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycapget(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ycapget(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcapget(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ycapset(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ycapset(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcapset(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ycarg(p0 *TLS, p1 complex128) (ret float64)
TEXT ·Ycarg(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcarg(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycargf(p0 *TLS, p1 complex64) (ret float32)
TEXT ·Ycargf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcargf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycargl(p0 *TLS, p1 complex128) (ret float64)
TEXT ·Ycargl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcargl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycasin(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycasin(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcasin(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycasinf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycasinf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcasinf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycasinh(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycasinh(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcasinh(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycasinhf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycasinhf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcasinhf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycasinhl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycasinhl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcasinhl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycasinl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycasinl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcasinl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycatan(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycatan(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcatan(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycatanf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycatanf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcatanf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycatanh(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycatanh(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcatanh(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycatanhf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycatanhf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcatanhf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycatanhl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycatanhl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcatanhl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycatanl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycatanl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcatanl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycatclose(p0 *TLS, p1 Tnl_catd) (ret int32)
TEXT ·Ycatclose(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcatclose(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycatgets(p0 *TLS, p1 Tnl_catd, p2 int32, p3 int32, p4 uintptr) (ret uintptr)
TEXT ·Ycatgets(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xcatgets(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ycatopen(p0 *TLS, p1 uintptr, p2 int32) (ret Tnl_catd)
TEXT ·Ycatopen(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xcatopen(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycbrt(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ycbrt(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcbrt(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ycbrtf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ycbrtf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xcbrtf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycbrtl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ycbrtl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcbrtl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yccos(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yccos(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xccos(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yccosf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Yccosf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xccosf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Yccosh(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yccosh(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xccosh(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yccoshf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Yccoshf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xccoshf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Yccoshl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yccoshl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xccoshl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yccosl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yccosl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xccosl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yceil(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yceil(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xceil(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yceilf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yceilf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xceilf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yceill(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yceill(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xceill(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ycexp(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycexp(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcexp(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycexpf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycexpf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcexpf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycexpl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycexpl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcexpl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycfgetispeed(p0 *TLS, p1 uintptr) (ret Tspeed_t)
TEXT ·Ycfgetispeed(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcfgetispeed(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycfgetospeed(p0 *TLS, p1 uintptr) (ret Tspeed_t)
TEXT ·Ycfgetospeed(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcfgetospeed(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycfmakeraw(p0 *TLS, p1 uintptr)
TEXT ·Ycfmakeraw(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcfmakeraw(SB)
	RET

// func Ycfsetispeed(p0 *TLS, p1 uintptr, p2 Tspeed_t) (ret int32)
TEXT ·Ycfsetispeed(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xcfsetispeed(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ycfsetospeed(p0 *TLS, p1 uintptr, p2 Tspeed_t) (ret int32)
TEXT ·Ycfsetospeed(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xcfsetospeed(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ycfsetspeed(p0 *TLS, p1 uintptr, p2 Tspeed_t) (ret int32)
TEXT ·Ycfsetspeed(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xcfsetspeed(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ychdir(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ychdir(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xchdir(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ychmod(p0 *TLS, p1 uintptr, p2 Tmode_t) (ret int32)
TEXT ·Ychmod(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xchmod(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ychown(p0 *TLS, p1 uintptr, p2 Tuid_t, p3 Tgid_t) (ret int32)
TEXT ·Ychown(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	CALL ·Xchown(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ychroot(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ychroot(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xchroot(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycimag(p0 *TLS, p1 complex128) (ret float64)
TEXT ·Ycimag(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcimag(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycimagf(p0 *TLS, p1 complex64) (ret float32)
TEXT ·Ycimagf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcimagf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycimagl(p0 *TLS, p1 complex128) (ret float64)
TEXT ·Ycimagl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcimagl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yclearenv(p0 *TLS) (ret int32)
TEXT ·Yclearenv(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xclearenv(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yclearerr(p0 *TLS, p1 uintptr)
TEXT ·Yclearerr(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xclearerr(SB)
	RET

// func Yclearerr_unlocked(p0 *TLS, p1 uintptr)
TEXT ·Yclearerr_unlocked(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xclearerr_unlocked(SB)
	RET

// func Yclock(p0 *TLS) (ret Tclock_t)
TEXT ·Yclock(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xclock(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Yclock_adjtime(p0 *TLS, p1 Tclockid_t, p2 uintptr) (ret int32)
TEXT ·Yclock_adjtime(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xclock_adjtime(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yclock_getcpuclockid(p0 *TLS, p1 Tpid_t, p2 uintptr) (ret int32)
TEXT ·Yclock_getcpuclockid(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xclock_getcpuclockid(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yclock_getres(p0 *TLS, p1 Tclockid_t, p2 uintptr) (ret int32)
TEXT ·Yclock_getres(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xclock_getres(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yclock_gettime(p0 *TLS, p1 Tclockid_t, p2 uintptr) (ret int32)
TEXT ·Yclock_gettime(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xclock_gettime(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yclock_nanosleep(p0 *TLS, p1 Tclockid_t, p2 int32, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Yclock_nanosleep(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xclock_nanosleep(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yclock_settime(p0 *TLS, p1 Tclockid_t, p2 uintptr) (ret int32)
TEXT ·Yclock_settime(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xclock_settime(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yclog(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yclog(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xclog(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yclogf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Yclogf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xclogf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Yclogl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yclogl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xclogl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yclose(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yclose(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xclose(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yclosedir(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yclosedir(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xclosedir(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycloselog(p0 *TLS)
TEXT ·Ycloselog(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xcloselog(SB)
	RET

// func Yconfstr(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t) (ret Tsize_t)
TEXT ·Yconfstr(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xconfstr(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yconj(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yconj(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xconj(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yconjf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Yconjf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xconjf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Yconjl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yconjl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xconjl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yconnect(p0 *TLS, p1 int32, p2 uintptr, p3 Tsocklen_t) (ret int32)
TEXT ·Yconnect(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xconnect(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ycopy_file_range(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 uintptr, p5 Tsize_t, p6 uint32) (ret Tssize_t)
TEXT ·Ycopy_file_range(SB),$64-64
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVL p6+48(FP), AX
	MOVL AX, 48(SP)
	CALL ·Xcopy_file_range(SB)
	MOVQ 56(SP), AX
	MOVQ AX, ret+56(FP)
	RET

// func Ycopysign(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Ycopysign(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcopysign(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycopysignf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Ycopysignf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcopysignf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycopysignl(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Ycopysignl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcopysignl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycos(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ycos(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcos(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ycosf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ycosf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xcosf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycosh(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ycosh(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcosh(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ycoshf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ycoshf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xcoshf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycoshl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ycoshl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcoshl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ycosl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ycosl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcosl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ycpow(p0 *TLS, p1 complex128, p2 complex128) (ret complex128)
TEXT ·Ycpow(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p2_real+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p2_imag+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xcpow(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret_real+40(FP)
	MOVQ 48(SP), AX
	MOVQ AX, ret_imag+48(FP)
	RET

// func Ycpowf(p0 *TLS, p1 complex64, p2 complex64) (ret complex64)
TEXT ·Ycpowf(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p2_real+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p2_imag+20(FP), AX
	MOVL AX, 20(SP)
	CALL ·Xcpowf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret_real+24(FP)
	MOVL 28(SP), AX
	MOVL AX, ret_imag+28(FP)
	RET

// func Ycpowl(p0 *TLS, p1 complex128, p2 complex128) (ret complex128)
TEXT ·Ycpowl(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p2_real+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p2_imag+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xcpowl(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret_real+40(FP)
	MOVQ 48(SP), AX
	MOVQ AX, ret_imag+48(FP)
	RET

// func Ycproj(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycproj(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcproj(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycprojf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycprojf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcprojf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycprojl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycprojl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcprojl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycreal(p0 *TLS, p1 complex128) (ret float64)
TEXT ·Ycreal(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcreal(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycrealf(p0 *TLS, p1 complex64) (ret float32)
TEXT ·Ycrealf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcrealf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ycreall(p0 *TLS, p1 complex128) (ret float64)
TEXT ·Ycreall(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcreall(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycreat(p0 *TLS, p1 uintptr, p2 Tmode_t) (ret int32)
TEXT ·Ycreat(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xcreat(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ycrypt(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ycrypt(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcrypt(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycrypt_r(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret uintptr)
TEXT ·Ycrypt_r(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xcrypt_r(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ycsin(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycsin(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcsin(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycsinf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycsinf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcsinf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycsinh(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycsinh(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcsinh(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycsinhf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycsinhf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcsinhf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycsinhl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycsinhl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcsinhl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycsinl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycsinl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcsinl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycsqrt(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycsqrt(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcsqrt(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Ycsqrtf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Ycsqrtf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xcsqrtf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Ycsqrtl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Ycsqrtl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xcsqrtl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yctan(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yctan(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xctan(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yctanf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Yctanf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xctanf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Yctanh(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yctanh(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xctanh(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yctanhf(p0 *TLS, p1 complex64) (ret complex64)
TEXT ·Yctanhf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_real+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p1_imag+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xctanhf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_real+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_imag+20(FP)
	RET

// func Yctanhl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yctanhl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xctanhl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yctanl(p0 *TLS, p1 complex128) (ret complex128)
TEXT ·Yctanl(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_real+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_imag+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xctanl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_real+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_imag+32(FP)
	RET

// func Yctermid(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yctermid(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xctermid(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yctime(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yctime(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xctime(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yctime_r(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yctime_r(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xctime_r(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ycuserid(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ycuserid(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xcuserid(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ydcgettext(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret uintptr)
TEXT ·Ydcgettext(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xdcgettext(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ydcngettext(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 uint64, p5 int32) (ret uintptr)
TEXT ·Ydcngettext(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xdcngettext(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ydelete_module(p0 *TLS, p1 uintptr, p2 uint32) (ret int32)
TEXT ·Ydelete_module(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xdelete_module(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ydgettext(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ydgettext(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xdgettext(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ydifftime(p0 *TLS, p1 Ttime_t, p2 Ttime_t) (ret float64)
TEXT ·Ydifftime(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xdifftime(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ydirfd(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ydirfd(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xdirfd(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ydirname(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ydirname(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xdirname(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ydiv(p0 *TLS, p1 int32, p2 int32) (ret Tdiv_t)
TEXT ·Ydiv(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xdiv(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_Fquot+16(FP)
	MOVL 20(SP), AX
	MOVL AX, ret_Frem+20(FP)
	RET

// func Ydlclose(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ydlclose(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xdlclose(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ydlerror(p0 *TLS) (ret uintptr)
TEXT ·Ydlerror(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xdlerror(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ydlopen(p0 *TLS, p1 uintptr, p2 int32) (ret uintptr)
TEXT ·Ydlopen(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xdlopen(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ydlsym(p0 *TLS, p1 ,  p2 uintptr) (ret uintptr)
TEXT ·Ydlsym(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xdlsym(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ydn_comp(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32, p4 uintptr, p5 uintptr) (ret int32)
TEXT ·Ydn_comp(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xdn_comp(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ydn_expand(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 uintptr, p5 int32) (ret int32)
TEXT ·Ydn_expand(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xdn_expand(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ydn_skipname(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ydn_skipname(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xdn_skipname(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ydngettext(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 uint64) (ret uintptr)
TEXT ·Ydngettext(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xdngettext(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ydprintf(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ydprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xdprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ydrand48(p0 *TLS) (ret float64)
TEXT ·Ydrand48(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xdrand48(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ydrem(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Ydrem(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xdrem(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ydremf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Ydremf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xdremf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ydup(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ydup(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xdup(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ydup2(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Ydup2(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xdup2(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ydup3(p0 *TLS, p1 int32, p2 int32, p3 int32) (ret int32)
TEXT ·Ydup3(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xdup3(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yduplocale(p0 *TLS, p1 Tlocale_t) (ret Tlocale_t)
TEXT ·Yduplocale(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xduplocale(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yeaccess(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Yeaccess(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xeaccess(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yecvt(p0 *TLS, p1 float64, p2 int32, p3 uintptr, p4 uintptr) (ret uintptr)
TEXT ·Yecvt(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xecvt(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yencrypt(p0 *TLS, p1 uintptr, p2 int32)
TEXT ·Yencrypt(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xencrypt(SB)
	RET

// func Yendgrent(p0 *TLS)
TEXT ·Yendgrent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendgrent(SB)
	RET

// func Yendhostent(p0 *TLS)
TEXT ·Yendhostent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendhostent(SB)
	RET

// func Yendmntent(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yendmntent(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xendmntent(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yendnetent(p0 *TLS)
TEXT ·Yendnetent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendnetent(SB)
	RET

// func Yendprotoent(p0 *TLS)
TEXT ·Yendprotoent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendprotoent(SB)
	RET

// func Yendpwent(p0 *TLS)
TEXT ·Yendpwent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendpwent(SB)
	RET

// func Yendservent(p0 *TLS)
TEXT ·Yendservent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendservent(SB)
	RET

// func Yendspent(p0 *TLS)
TEXT ·Yendspent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendspent(SB)
	RET

// func Yendusershell(p0 *TLS)
TEXT ·Yendusershell(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendusershell(SB)
	RET

// func Yendutent(p0 *TLS)
TEXT ·Yendutent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendutent(SB)
	RET

// func Yendutxent(p0 *TLS)
TEXT ·Yendutxent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xendutxent(SB)
	RET

// func Yepoll_create(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yepoll_create(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xepoll_create(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yepoll_create1(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yepoll_create1(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xepoll_create1(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yepoll_ctl(p0 *TLS, p1 int32, p2 int32, p3 int32, p4 uintptr) (ret int32)
TEXT ·Yepoll_ctl(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xepoll_ctl(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yepoll_pwait(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 int32, p5 uintptr) (ret int32)
TEXT ·Yepoll_pwait(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	MOVQ p5+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xepoll_pwait(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yepoll_wait(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 int32) (ret int32)
TEXT ·Yepoll_wait(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	CALL ·Xepoll_wait(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yerand48(p0 *TLS, p1 uintptr) (ret float64)
TEXT ·Yerand48(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xerand48(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yerf(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yerf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xerf(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yerfc(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yerfc(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xerfc(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yerfcf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yerfcf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xerfcf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yerfcl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yerfcl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xerfcl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yerff(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yerff(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xerff(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yerfl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yerfl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xerfl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yerr(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr)
TEXT ·Yerr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xerr(SB)
	RET

// func Yerrx(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr)
TEXT ·Yerrx(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xerrx(SB)
	RET

// func Yether_aton(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yether_aton(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xether_aton(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yether_aton_r(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yether_aton_r(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xether_aton_r(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yether_hostton(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yether_hostton(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xether_hostton(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yether_line(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yether_line(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xether_line(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yether_ntoa(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yether_ntoa(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xether_ntoa(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yether_ntoa_r(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yether_ntoa_r(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xether_ntoa_r(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yether_ntohost(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yether_ntohost(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xether_ntohost(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yeuidaccess(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Yeuidaccess(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xeuidaccess(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yeventfd(p0 *TLS, p1 uint32, p2 int32) (ret int32)
TEXT ·Yeventfd(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xeventfd(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yeventfd_read(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yeventfd_read(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xeventfd_read(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yeventfd_write(p0 *TLS, p1 int32, p2 Teventfd_t) (ret int32)
TEXT ·Yeventfd_write(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xeventfd_write(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yexecl(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yexecl(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xexecl(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yexecle(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yexecle(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xexecle(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yexeclp(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yexeclp(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xexeclp(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yexecv(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yexecv(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xexecv(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yexecve(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yexecve(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xexecve(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yexecvp(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yexecvp(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xexecvp(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yexecvpe(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yexecvpe(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xexecvpe(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yexit(p0 *TLS, p1 int32)
TEXT ·Yexit(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xexit(SB)
	RET

// func Yexp(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yexp(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xexp(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yexp10(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yexp10(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xexp10(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yexp10f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yexp10f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xexp10f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yexp10l(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yexp10l(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xexp10l(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yexp2(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yexp2(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xexp2(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yexp2f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yexp2f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xexp2f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yexp2l(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yexp2l(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xexp2l(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yexpf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yexpf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xexpf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yexpl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yexpl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xexpl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yexplicit_bzero(p0 *TLS, p1 uintptr, p2 Tsize_t)
TEXT ·Yexplicit_bzero(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xexplicit_bzero(SB)
	RET

// func Yexpm1(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yexpm1(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xexpm1(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yexpm1f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yexpm1f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xexpm1f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yexpm1l(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yexpm1l(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xexpm1l(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfabs(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yfabs(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfabs(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfabsf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yfabsf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xfabsf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfabsl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yfabsl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfabsl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfaccessat(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 int32) (ret int32)
TEXT ·Yfaccessat(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	CALL ·Xfaccessat(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfallocate(p0 *TLS, p1 int32, p2 int32, p3 Toff_t, p4 Toff_t) (ret int32)
TEXT ·Yfallocate(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfallocate(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfanotify_init(p0 *TLS, p1 uint32, p2 uint32) (ret int32)
TEXT ·Yfanotify_init(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xfanotify_init(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfanotify_mark(p0 *TLS, p1 int32, p2 uint32, p3 uint64, p4 int32, p5 uintptr) (ret int32)
TEXT ·Yfanotify_mark(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p4+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p5+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xfanotify_mark(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yfchdir(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yfchdir(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xfchdir(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfchmod(p0 *TLS, p1 int32, p2 Tmode_t) (ret int32)
TEXT ·Yfchmod(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xfchmod(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfchmodat(p0 *TLS, p1 int32, p2 uintptr, p3 Tmode_t, p4 int32) (ret int32)
TEXT ·Yfchmodat(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	CALL ·Xfchmodat(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfchown(p0 *TLS, p1 int32, p2 Tuid_t, p3 Tgid_t) (ret int32)
TEXT ·Yfchown(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xfchown(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfchownat(p0 *TLS, p1 int32, p2 uintptr, p3 Tuid_t, p4 Tgid_t, p5 int32) (ret int32)
TEXT ·Yfchownat(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	MOVL p5+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xfchownat(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yfclose(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfclose(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfclose(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfcntl(p0 *TLS, p1 int32, p2 int32, p3 uintptr) (ret int32)
TEXT ·Yfcntl(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfcntl(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfcntl64(p0 *TLS, p1 int32, p2 int32, p3 uintptr) (ret int32)
TEXT ·Yfcntl64(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfcntl64(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfcvt(p0 *TLS, p1 float64, p2 int32, p3 uintptr, p4 uintptr) (ret uintptr)
TEXT ·Yfcvt(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xfcvt(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yfdatasync(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yfdatasync(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xfdatasync(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfdim(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yfdim(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfdim(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfdimf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Yfdimf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xfdimf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfdiml(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yfdiml(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfdiml(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfdopen(p0 *TLS, p1 int32, p2 uintptr) (ret uintptr)
TEXT ·Yfdopen(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfdopen(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfdopendir(p0 *TLS, p1 int32) (ret uintptr)
TEXT ·Yfdopendir(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xfdopendir(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfeclearexcept(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yfeclearexcept(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xfeclearexcept(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfegetenv(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfegetenv(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfegetenv(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfegetround(p0 *TLS) (ret int32)
TEXT ·Yfegetround(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xfegetround(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yfeof(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfeof(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfeof(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfeof_unlocked(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfeof_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfeof_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yferaiseexcept(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yferaiseexcept(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xferaiseexcept(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yferror(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yferror(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xferror(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yferror_unlocked(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yferror_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xferror_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfesetenv(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfesetenv(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfesetenv(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfetestexcept(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yfetestexcept(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xfetestexcept(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfexecve(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yfexecve(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfexecve(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfflush(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfflush(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfflush(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfflush_unlocked(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfflush_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfflush_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yffs(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yffs(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xffs(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yffsl(p0 *TLS, p1 int64) (ret int32)
TEXT ·Yffsl(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xffsl(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yffsll(p0 *TLS, p1 int64) (ret int32)
TEXT ·Yffsll(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xffsll(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfgetc(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfgetc(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfgetc(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfgetc_unlocked(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfgetc_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfgetc_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfgetgrent(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yfgetgrent(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfgetgrent(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfgetln(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yfgetln(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfgetln(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfgetpos(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yfgetpos(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfgetpos(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfgetpwent(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yfgetpwent(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfgetpwent(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfgets(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret uintptr)
TEXT ·Yfgets(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfgets(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfgets_unlocked(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret uintptr)
TEXT ·Yfgets_unlocked(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfgets_unlocked(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfgetwc(p0 *TLS, p1 uintptr) (ret Twint_t)
TEXT ·Yfgetwc(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfgetwc(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfgetwc_unlocked(p0 *TLS, p1 uintptr) (ret Twint_t)
TEXT ·Yfgetwc_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfgetwc_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfgetws(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret uintptr)
TEXT ·Yfgetws(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfgetws(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfgetws_unlocked(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret uintptr)
TEXT ·Yfgetws_unlocked(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfgetws_unlocked(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfgetxattr(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 Tsize_t) (ret Tssize_t)
TEXT ·Yfgetxattr(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xfgetxattr(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yfileno(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfileno(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfileno(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfileno_unlocked(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfileno_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfileno_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfinite(p0 *TLS, p1 float64) (ret int32)
TEXT ·Yfinite(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfinite(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfinitef(p0 *TLS, p1 float32) (ret int32)
TEXT ·Yfinitef(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xfinitef(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yflistxattr(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t) (ret Tssize_t)
TEXT ·Yflistxattr(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xflistxattr(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yflock(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Yflock(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xflock(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yflockfile(p0 *TLS, p1 uintptr)
TEXT ·Yflockfile(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xflockfile(SB)
	RET

// func Yfloor(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yfloor(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfloor(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfloorf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yfloorf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xfloorf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfloorl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yfloorl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfloorl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfma(p0 *TLS, p1 float64, p2 float64, p3 float64) (ret float64)
TEXT ·Yfma(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfma(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfmal(p0 *TLS, p1 float64, p2 float64, p3 float64) (ret float64)
TEXT ·Yfmal(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfmal(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfmax(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yfmax(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfmax(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfmaxf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Yfmaxf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xfmaxf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfmaxl(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yfmaxl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfmaxl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfmemopen(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr) (ret uintptr)
TEXT ·Yfmemopen(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfmemopen(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfmin(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yfmin(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfmin(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfminf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Yfminf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xfminf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfminl(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yfminl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfminl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfmod(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yfmod(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfmod(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfmodf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Yfmodf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xfmodf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfmodl(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yfmodl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfmodl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfmtmsg(p0 *TLS, p1 int64, p2 uintptr, p3 int32, p4 uintptr, p5 uintptr, p6 uintptr) (ret int32)
TEXT ·Yfmtmsg(SB),$64-60
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p6+48(FP), AX
	MOVQ AX, 48(SP)
	CALL ·Xfmtmsg(SB)
	MOVL 56(SP), AX
	MOVL AX, ret+56(FP)
	RET

// func Yfnmatch(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret int32)
TEXT ·Yfnmatch(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xfnmatch(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfopen(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yfopen(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfopen(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfopen64(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yfopen64(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfopen64(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfopencookie(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tcookie_io_functions_t) (ret uintptr)
TEXT ·Yfopencookie(SB),$64-64
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3_Fread+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p3_Fwrite+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p3_Fseek+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p3_Fclose1+48(FP), AX
	MOVQ AX, 48(SP)
	CALL ·Xfopencookie(SB)
	MOVQ 56(SP), AX
	MOVQ AX, ret+56(FP)
	RET

// func Yfork(p0 *TLS) (ret int32)
TEXT ·Yfork(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xfork(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yfpathconf(p0 *TLS, p1 int32, p2 int32) (ret int64)
TEXT ·Yfpathconf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xfpathconf(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfprintf(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yfprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfpurge(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfpurge(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfpurge(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfputc(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yfputc(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfputc(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfputc_unlocked(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yfputc_unlocked(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfputc_unlocked(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfputs(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yfputs(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfputs(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfputs_unlocked(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yfputs_unlocked(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfputs_unlocked(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfputwc(p0 *TLS, p1 Twchar_t, p2 uintptr) (ret Twint_t)
TEXT ·Yfputwc(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfputwc(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfputwc_unlocked(p0 *TLS, p1 Twchar_t, p2 uintptr) (ret Twint_t)
TEXT ·Yfputwc_unlocked(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfputwc_unlocked(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfputws(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yfputws(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfputws(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfputws_unlocked(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yfputws_unlocked(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfputws_unlocked(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfread(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 Tsize_t, p4 uintptr) (ret Tsize_t)
TEXT ·Yfread(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xfread(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yfread_unlocked(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 Tsize_t, p4 uintptr) (ret Tsize_t)
TEXT ·Yfread_unlocked(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xfread_unlocked(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yfree(p0 *TLS, p1 uintptr)
TEXT ·Yfree(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfree(SB)
	RET

// func Yfreeaddrinfo(p0 *TLS, p1 uintptr)
TEXT ·Yfreeaddrinfo(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfreeaddrinfo(SB)
	RET

// func Yfreeifaddrs(p0 *TLS, p1 uintptr)
TEXT ·Yfreeifaddrs(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfreeifaddrs(SB)
	RET

// func Yfreelocale(p0 *TLS, p1 Tlocale_t)
TEXT ·Yfreelocale(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfreelocale(SB)
	RET

// func Yfremovexattr(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yfremovexattr(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfremovexattr(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfreopen(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret uintptr)
TEXT ·Yfreopen(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfreopen(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfrexp(p0 *TLS, p1 float64, p2 uintptr) (ret float64)
TEXT ·Yfrexp(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfrexp(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfrexpf(p0 *TLS, p1 float32, p2 uintptr) (ret float32)
TEXT ·Yfrexpf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfrexpf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfrexpl(p0 *TLS, p1 float64, p2 uintptr) (ret float64)
TEXT ·Yfrexpl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfrexpl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yfscanf(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yfscanf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfscanf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfseek(p0 *TLS, p1 uintptr, p2 int64, p3 int32) (ret int32)
TEXT ·Yfseek(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xfseek(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfseeko(p0 *TLS, p1 uintptr, p2 Toff_t, p3 int32) (ret int32)
TEXT ·Yfseeko(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xfseeko(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfsetpos(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yfsetpos(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfsetpos(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfsetxattr(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 int32) (ret int32)
TEXT ·Yfsetxattr(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xfsetxattr(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Yfstat(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yfstat(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfstat(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfstat64(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yfstat64(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfstat64(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfstatat(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 int32) (ret int32)
TEXT ·Yfstatat(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xfstatat(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yfstatfs(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yfstatfs(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfstatfs(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfstatvfs(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yfstatvfs(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfstatvfs(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfsync(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yfsync(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xfsync(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yftell(p0 *TLS, p1 uintptr) (ret int64)
TEXT ·Yftell(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xftell(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yftello(p0 *TLS, p1 uintptr) (ret Toff_t)
TEXT ·Yftello(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xftello(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yftime(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yftime(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xftime(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yftok(p0 *TLS, p1 uintptr, p2 int32) (ret Tkey_t)
TEXT ·Yftok(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xftok(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yftruncate(p0 *TLS, p1 int32, p2 Toff_t) (ret int32)
TEXT ·Yftruncate(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xftruncate(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yftruncate64(p0 *TLS, p1 int32, p2 Toff_t) (ret int32)
TEXT ·Yftruncate64(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xftruncate64(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yftrylockfile(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yftrylockfile(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xftrylockfile(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfts64_close(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfts64_close(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfts64_close(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfts64_open(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret uintptr)
TEXT ·Yfts64_open(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfts64_open(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfts64_read(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yfts64_read(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfts64_read(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yfts_close(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yfts_close(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfts_close(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yfts_open(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret uintptr)
TEXT ·Yfts_open(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfts_open(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yfts_read(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yfts_read(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfts_read(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yftw(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret int32)
TEXT ·Yftw(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xftw(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfunlockfile(p0 *TLS, p1 uintptr)
TEXT ·Yfunlockfile(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xfunlockfile(SB)
	RET

// func Yfutimens(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yfutimens(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfutimens(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfutimes(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yfutimes(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xfutimes(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfutimesat(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yfutimesat(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfutimesat(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfwide(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Yfwide(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xfwide(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yfwprintf(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yfwprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfwprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yfwrite(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 Tsize_t, p4 uintptr) (ret Tsize_t)
TEXT ·Yfwrite(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xfwrite(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yfwrite_unlocked(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 Tsize_t, p4 uintptr) (ret Tsize_t)
TEXT ·Yfwrite_unlocked(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xfwrite_unlocked(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yfwscanf(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yfwscanf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xfwscanf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ygai_strerror(p0 *TLS, p1 int32) (ret uintptr)
TEXT ·Ygai_strerror(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xgai_strerror(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygcvt(p0 *TLS, p1 float64, p2 int32, p3 uintptr) (ret uintptr)
TEXT ·Ygcvt(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xgcvt(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yget_avphys_pages(p0 *TLS) (ret int64)
TEXT ·Yget_avphys_pages(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xget_avphys_pages(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Yget_current_dir_name(p0 *TLS) (ret uintptr)
TEXT ·Yget_current_dir_name(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xget_current_dir_name(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Yget_nprocs(p0 *TLS) (ret int32)
TEXT ·Yget_nprocs(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xget_nprocs(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yget_nprocs_conf(p0 *TLS) (ret int32)
TEXT ·Yget_nprocs_conf(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xget_nprocs_conf(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yget_phys_pages(p0 *TLS) (ret int64)
TEXT ·Yget_phys_pages(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xget_phys_pages(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetaddrinfo(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Ygetaddrinfo(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xgetaddrinfo(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ygetauxval(p0 *TLS, p1 uint64) (ret uint64)
TEXT ·Ygetauxval(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetauxval(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetc(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ygetc(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetc(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ygetc_unlocked(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ygetc_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetc_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ygetchar(p0 *TLS) (ret int32)
TEXT ·Ygetchar(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetchar(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetchar_unlocked(p0 *TLS) (ret int32)
TEXT ·Ygetchar_unlocked(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetchar_unlocked(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetcwd(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret uintptr)
TEXT ·Ygetcwd(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetcwd(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ygetdate(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetdate(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetdate(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetdelim(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32, p4 uintptr) (ret Tssize_t)
TEXT ·Ygetdelim(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xgetdelim(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ygetdents(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ygetdents(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xgetdents(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ygetdomainname(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ygetdomainname(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetdomainname(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygetdtablesize(p0 *TLS) (ret int32)
TEXT ·Ygetdtablesize(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetdtablesize(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetegid(p0 *TLS) (ret Tgid_t)
TEXT ·Ygetegid(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetegid(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetentropy(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ygetentropy(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetentropy(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygetenv(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetenv(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetenv(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygeteuid(p0 *TLS) (ret Tuid_t)
TEXT ·Ygeteuid(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgeteuid(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetgid(p0 *TLS) (ret Tgid_t)
TEXT ·Ygetgid(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetgid(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetgrent(p0 *TLS) (ret uintptr)
TEXT ·Ygetgrent(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetgrent(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetgrgid(p0 *TLS, p1 Tgid_t) (ret uintptr)
TEXT ·Ygetgrgid(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xgetgrgid(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetgrgid_r(p0 *TLS, p1 Tgid_t, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 uintptr) (ret int32)
TEXT ·Ygetgrgid_r(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xgetgrgid_r(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ygetgrnam(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetgrnam(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetgrnam(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetgrnam_r(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 uintptr) (ret int32)
TEXT ·Ygetgrnam_r(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xgetgrnam_r(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ygetgrouplist(p0 *TLS, p1 uintptr, p2 Tgid_t, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Ygetgrouplist(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xgetgrouplist(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ygetgroups(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ygetgroups(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetgroups(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygethostbyaddr(p0 *TLS, p1 uintptr, p2 Tsocklen_t, p3 int32) (ret uintptr)
TEXT ·Ygethostbyaddr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	CALL ·Xgethostbyaddr(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ygethostbyaddr_r(p0 *TLS, p1 uintptr, p2 Tsocklen_t, p3 int32, p4 uintptr, p5 uintptr, p6 Tsize_t, p7 uintptr, p8 uintptr) (ret int32)
TEXT ·Ygethostbyaddr_r(SB),$72-68
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p5+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p6+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p7+48(FP), AX
	MOVQ AX, 48(SP)
	MOVQ p8+56(FP), AX
	MOVQ AX, 56(SP)
	CALL ·Xgethostbyaddr_r(SB)
	MOVL 64(SP), AX
	MOVL AX, ret+64(FP)
	RET

// func Ygethostbyname(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygethostbyname(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgethostbyname(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygethostbyname2(p0 *TLS, p1 uintptr, p2 int32) (ret uintptr)
TEXT ·Ygethostbyname2(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xgethostbyname2(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ygethostbyname2_r(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr, p4 uintptr, p5 Tsize_t, p6 uintptr, p7 uintptr) (ret int32)
TEXT ·Ygethostbyname2_r(SB),$72-68
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p6+48(FP), AX
	MOVQ AX, 48(SP)
	MOVQ p7+56(FP), AX
	MOVQ AX, 56(SP)
	CALL ·Xgethostbyname2_r(SB)
	MOVL 64(SP), AX
	MOVL AX, ret+64(FP)
	RET

// func Ygethostbyname_r(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 uintptr, p6 uintptr) (ret int32)
TEXT ·Ygethostbyname_r(SB),$64-60
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p6+48(FP), AX
	MOVQ AX, 48(SP)
	CALL ·Xgethostbyname_r(SB)
	MOVL 56(SP), AX
	MOVL AX, ret+56(FP)
	RET

// func Ygethostent(p0 *TLS) (ret uintptr)
TEXT ·Ygethostent(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgethostent(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygethostid(p0 *TLS) (ret int64)
TEXT ·Ygethostid(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgethostid(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygethostname(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ygethostname(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgethostname(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygetifaddrs(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ygetifaddrs(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetifaddrs(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ygetitimer(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ygetitimer(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetitimer(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygetline(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret Tssize_t)
TEXT ·Ygetline(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xgetline(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ygetloadavg(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ygetloadavg(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xgetloadavg(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygetlogin(p0 *TLS) (ret uintptr)
TEXT ·Ygetlogin(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetlogin(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetlogin_r(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ygetlogin_r(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetlogin_r(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygetmntent(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetmntent(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetmntent(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetmntent_r(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 int32) (ret uintptr)
TEXT ·Ygetmntent_r(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xgetmntent_r(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ygetnameinfo(p0 *TLS, p1 uintptr, p2 Tsocklen_t, p3 uintptr, p4 Tsocklen_t, p5 uintptr, p6 Tsocklen_t, p7 int32) (ret int32)
TEXT ·Ygetnameinfo(SB),$64-60
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVL p6+48(FP), AX
	MOVL AX, 48(SP)
	MOVL p7+52(FP), AX
	MOVL AX, 52(SP)
	CALL ·Xgetnameinfo(SB)
	MOVL 56(SP), AX
	MOVL AX, ret+56(FP)
	RET

// func Ygetnetbyaddr(p0 *TLS, p1 Tuint32_t, p2 int32) (ret uintptr)
TEXT ·Ygetnetbyaddr(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xgetnetbyaddr(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetnetbyname(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetnetbyname(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetnetbyname(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetnetent(p0 *TLS) (ret uintptr)
TEXT ·Ygetnetent(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetnetent(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetopt(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ygetopt(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xgetopt(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ygetopt_long(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 uintptr, p5 uintptr) (ret int32)
TEXT ·Ygetopt_long(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xgetopt_long(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ygetopt_long_only(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 uintptr, p5 uintptr) (ret int32)
TEXT ·Ygetopt_long_only(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xgetopt_long_only(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ygetpagesize(p0 *TLS) (ret int32)
TEXT ·Ygetpagesize(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetpagesize(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetpass(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetpass(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetpass(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetpeername(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ygetpeername(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xgetpeername(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ygetpgid(p0 *TLS, p1 Tpid_t) (ret Tpid_t)
TEXT ·Ygetpgid(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xgetpgid(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ygetpgrp(p0 *TLS) (ret Tpid_t)
TEXT ·Ygetpgrp(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetpgrp(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetpid(p0 *TLS) (ret Tpid_t)
TEXT ·Ygetpid(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetpid(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetppid(p0 *TLS) (ret Tpid_t)
TEXT ·Ygetppid(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetppid(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetpriority(p0 *TLS, p1 int32, p2 Tid_t) (ret int32)
TEXT ·Ygetpriority(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xgetpriority(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ygetprotobyname(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetprotobyname(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetprotobyname(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetprotobynumber(p0 *TLS, p1 int32) (ret uintptr)
TEXT ·Ygetprotobynumber(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xgetprotobynumber(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetprotoent(p0 *TLS) (ret uintptr)
TEXT ·Ygetprotoent(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetprotoent(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetpwent(p0 *TLS) (ret uintptr)
TEXT ·Ygetpwent(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetpwent(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetpwnam(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetpwnam(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetpwnam(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetpwnam_r(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 uintptr) (ret int32)
TEXT ·Ygetpwnam_r(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xgetpwnam_r(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ygetpwuid(p0 *TLS, p1 Tuid_t) (ret uintptr)
TEXT ·Ygetpwuid(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xgetpwuid(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetpwuid_r(p0 *TLS, p1 Tuid_t, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 uintptr) (ret int32)
TEXT ·Ygetpwuid_r(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xgetpwuid_r(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ygetrandom(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uint32) (ret Tssize_t)
TEXT ·Ygetrandom(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xgetrandom(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ygetresgid(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ygetresgid(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xgetresgid(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ygetresuid(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ygetresuid(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xgetresuid(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ygetrlimit(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ygetrlimit(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetrlimit(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygetrlimit64(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ygetrlimit64(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetrlimit64(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygetrusage(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ygetrusage(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetrusage(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygets(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygets(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgets(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetservbyname(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ygetservbyname(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgetservbyname(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ygetservbyname_r(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 uintptr, p5 Tsize_t, p6 uintptr) (ret int32)
TEXT ·Ygetservbyname_r(SB),$64-60
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p6+48(FP), AX
	MOVQ AX, 48(SP)
	CALL ·Xgetservbyname_r(SB)
	MOVL 56(SP), AX
	MOVL AX, ret+56(FP)
	RET

// func Ygetservent(p0 *TLS) (ret uintptr)
TEXT ·Ygetservent(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetservent(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetsid(p0 *TLS, p1 Tpid_t) (ret Tpid_t)
TEXT ·Ygetsid(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xgetsid(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ygetsockname(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ygetsockname(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xgetsockname(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ygetsockopt(p0 *TLS, p1 int32, p2 int32, p3 int32, p4 uintptr, p5 uintptr) (ret int32)
TEXT ·Ygetsockopt(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p5+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xgetsockopt(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ygetspent(p0 *TLS) (ret uintptr)
TEXT ·Ygetspent(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetspent(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetsubopt(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ygetsubopt(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xgetsubopt(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ygettext(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygettext(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgettext(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygettimeofday(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ygettimeofday(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgettimeofday(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ygetuid(p0 *TLS) (ret Tuid_t)
TEXT ·Ygetuid(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetuid(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetusershell(p0 *TLS) (ret uintptr)
TEXT ·Ygetusershell(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetusershell(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetutent(p0 *TLS) (ret uintptr)
TEXT ·Ygetutent(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetutent(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetutid(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetutid(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetutid(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetutline(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetutline(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetutline(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetutxent(p0 *TLS) (ret uintptr)
TEXT ·Ygetutxent(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetutxent(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ygetutxid(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetutxid(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetutxid(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetutxline(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygetutxline(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetutxline(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygetw(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ygetw(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetw(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ygetwc(p0 *TLS, p1 uintptr) (ret Twint_t)
TEXT ·Ygetwc(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetwc(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ygetwc_unlocked(p0 *TLS, p1 uintptr) (ret Twint_t)
TEXT ·Ygetwc_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgetwc_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ygetwchar(p0 *TLS) (ret Twint_t)
TEXT ·Ygetwchar(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetwchar(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetwchar_unlocked(p0 *TLS) (ret Twint_t)
TEXT ·Ygetwchar_unlocked(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xgetwchar_unlocked(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ygetxattr(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 Tsize_t) (ret Tssize_t)
TEXT ·Ygetxattr(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xgetxattr(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yglob(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Yglob(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xglob(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yglobfree(p0 *TLS, p1 uintptr)
TEXT ·Yglobfree(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xglobfree(SB)
	RET

// func Ygmtime(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ygmtime(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xgmtime(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ygmtime_r(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ygmtime_r(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xgmtime_r(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ygrantpt(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ygrantpt(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xgrantpt(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yhasmntopt(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yhasmntopt(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xhasmntopt(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yhcreate(p0 *TLS, p1 Tsize_t) (ret int32)
TEXT ·Yhcreate(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xhcreate(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yhdestroy(p0 *TLS)
TEXT ·Yhdestroy(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xhdestroy(SB)
	RET

// func Yherror(p0 *TLS, p1 uintptr)
TEXT ·Yherror(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xherror(SB)
	RET

// func Yhsearch(p0 *TLS, p1 TENTRY, p2 TACTION) (ret uintptr)
TEXT ·Yhsearch(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1_Fkey+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p1_Fdata+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p2+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xhsearch(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yhstrerror(p0 *TLS, p1 int32) (ret uintptr)
TEXT ·Yhstrerror(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xhstrerror(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yhtonl(p0 *TLS, p1 Tuint32_t) (ret Tuint32_t)
TEXT ·Yhtonl(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xhtonl(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yhtons(p0 *TLS, p1 Tuint16_t) (ret Tuint16_t)
TEXT ·Yhtons(SB),$24-18
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVW p1+8(FP), AX
	MOVW AX, 8(SP)
	CALL ·Xhtons(SB)
	MOVW 16(SP), AX
	MOVW AX, ret+16(FP)
	RET

// func Yhypot(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yhypot(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xhypot(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yhypotf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Yhypotf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xhypotf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yhypotl(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yhypotl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xhypotl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yiconv(p0 *TLS, p1 Ticonv_t, p2 uintptr, p3 uintptr, p4 uintptr, p5 uintptr) (ret Tsize_t)
TEXT ·Yiconv(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xiconv(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Yiconv_close(p0 *TLS, p1 Ticonv_t) (ret int32)
TEXT ·Yiconv_close(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xiconv_close(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiconv_open(p0 *TLS, p1 uintptr, p2 uintptr) (ret Ticonv_t)
TEXT ·Yiconv_open(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiconv_open(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yif_freenameindex(p0 *TLS, p1 uintptr)
TEXT ·Yif_freenameindex(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xif_freenameindex(SB)
	RET

// func Yif_indextoname(p0 *TLS, p1 uint32, p2 uintptr) (ret uintptr)
TEXT ·Yif_indextoname(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xif_indextoname(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yif_nameindex(p0 *TLS) (ret uintptr)
TEXT ·Yif_nameindex(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xif_nameindex(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Yif_nametoindex(p0 *TLS, p1 uintptr) (ret uint32)
TEXT ·Yif_nametoindex(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xif_nametoindex(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yilogb(p0 *TLS, p1 float64) (ret int32)
TEXT ·Yilogb(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xilogb(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yilogbf(p0 *TLS, p1 float32) (ret int32)
TEXT ·Yilogbf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xilogbf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yilogbl(p0 *TLS, p1 float64) (ret int32)
TEXT ·Yilogbl(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xilogbl(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yimaxabs(p0 *TLS, p1 Tintmax_t) (ret Tintmax_t)
TEXT ·Yimaxabs(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Ximaxabs(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yimaxdiv(p0 *TLS, p1 Tintmax_t, p2 Tintmax_t) (ret Timaxdiv_t)
TEXT ·Yimaxdiv(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Ximaxdiv(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_Fquot+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_Frem+32(FP)
	RET

// func Yindex(p0 *TLS, p1 uintptr, p2 int32) (ret uintptr)
TEXT ·Yindex(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xindex(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yinet_addr(p0 *TLS, p1 uintptr) (ret Tin_addr_t)
TEXT ·Yinet_addr(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xinet_addr(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yinet_aton(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yinet_aton(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xinet_aton(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yinet_lnaof(p0 *TLS, p1 Tin_addr) (ret Tin_addr_t)
TEXT ·Yinet_lnaof(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_Fs_addr+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xinet_lnaof(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yinet_makeaddr(p0 *TLS, p1 Tin_addr_t, p2 Tin_addr_t) (ret Tin_addr)
TEXT ·Yinet_makeaddr(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xinet_makeaddr(SB)
	MOVL 16(SP), AX
	MOVL AX, ret_Fs_addr+16(FP)
	RET

// func Yinet_netof(p0 *TLS, p1 Tin_addr) (ret Tin_addr_t)
TEXT ·Yinet_netof(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_Fs_addr+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xinet_netof(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yinet_network(p0 *TLS, p1 uintptr) (ret Tin_addr_t)
TEXT ·Yinet_network(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xinet_network(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yinet_ntoa(p0 *TLS, p1 Tin_addr) (ret uintptr)
TEXT ·Yinet_ntoa(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1_Fs_addr+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xinet_ntoa(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yinet_ntop(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 Tsocklen_t) (ret uintptr)
TEXT ·Yinet_ntop(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xinet_ntop(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yinet_pton(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yinet_pton(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xinet_pton(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yinit_module(p0 *TLS, p1 uintptr, p2 uint64, p3 uintptr) (ret int32)
TEXT ·Yinit_module(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xinit_module(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yinitstate(p0 *TLS, p1 uint32, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Yinitstate(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xinitstate(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yinitstate_r(p0 *TLS, p1 uint32, p2 uintptr, p3 Tsize_t, p4 uintptr) (ret int32)
TEXT ·Yinitstate_r(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xinitstate_r(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yinotify_add_watch(p0 *TLS, p1 int32, p2 uintptr, p3 Tuint32_t) (ret int32)
TEXT ·Yinotify_add_watch(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xinotify_add_watch(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yinotify_init(p0 *TLS) (ret int32)
TEXT ·Yinotify_init(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xinotify_init(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yinotify_init1(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yinotify_init1(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xinotify_init1(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yinotify_rm_watch(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Yinotify_rm_watch(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xinotify_rm_watch(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yinsque(p0 *TLS, p1 uintptr, p2 uintptr)
TEXT ·Yinsque(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xinsque(SB)
	RET

// func Yioctl(p0 *TLS, p1 int32, p2 int32, p3 uintptr) (ret int32)
TEXT ·Yioctl(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xioctl(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yioperm(p0 *TLS, p1 uint64, p2 uint64, p3 int32) (ret int32)
TEXT ·Yioperm(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xioperm(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yiopl(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yiopl(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiopl(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisalnum(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisalnum(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisalnum(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisalnum_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yisalnum_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xisalnum_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yisalpha(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisalpha(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisalpha(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisalpha_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yisalpha_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xisalpha_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yisascii(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisascii(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisascii(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisastream(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisastream(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisastream(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisatty(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisatty(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisatty(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisblank(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisblank(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisblank(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisblank_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yisblank_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xisblank_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiscntrl(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yiscntrl(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiscntrl(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiscntrl_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yiscntrl_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiscntrl_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yisdigit(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisdigit(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisdigit(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisdigit_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yisdigit_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xisdigit_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yisgraph(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisgraph(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisgraph(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisgraph_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yisgraph_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xisgraph_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yislower(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yislower(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xislower(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yislower_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yislower_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xislower_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yisnan(p0 *TLS, p1 float64) (ret int32)
TEXT ·Yisnan(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xisnan(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisnanf(p0 *TLS, p1 float32) (ret int32)
TEXT ·Yisnanf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisnanf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisnanl(p0 *TLS, p1 float64) (ret int32)
TEXT ·Yisnanl(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xisnanl(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisprint(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisprint(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisprint(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisprint_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yisprint_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xisprint_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yispunct(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yispunct(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xispunct(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yispunct_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yispunct_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xispunct_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yissetugid(p0 *TLS) (ret int32)
TEXT ·Yissetugid(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xissetugid(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yisspace(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisspace(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisspace(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisspace_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yisspace_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xisspace_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yisupper(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisupper(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisupper(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisupper_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yisupper_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xisupper_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswalnum(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswalnum(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswalnum(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswalnum_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswalnum_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswalnum_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswalpha(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswalpha(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswalpha(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswalpha_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswalpha_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswalpha_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswblank(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswblank(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswblank(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswblank_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswblank_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswblank_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswcntrl(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswcntrl(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswcntrl(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswcntrl_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswcntrl_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswcntrl_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswctype(p0 *TLS, p1 Twint_t, p2 Twctype_t) (ret int32)
TEXT ·Yiswctype(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswctype(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswctype_l(p0 *TLS, p1 Twint_t, p2 Twctype_t, p3 Tlocale_t) (ret int32)
TEXT ·Yiswctype_l(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xiswctype_l(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yiswdigit(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswdigit(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswdigit(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswdigit_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswdigit_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswdigit_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswgraph(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswgraph(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswgraph(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswgraph_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswgraph_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswgraph_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswlower(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswlower(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswlower(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswlower_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswlower_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswlower_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswprint(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswprint(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswprint(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswprint_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswprint_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswprint_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswpunct(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswpunct(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswpunct(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswpunct_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswpunct_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswpunct_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswspace(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswspace(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswspace(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswspace_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswspace_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswspace_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswupper(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswupper(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswupper(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswupper_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswupper_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswupper_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yiswxdigit(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Yiswxdigit(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xiswxdigit(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yiswxdigit_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret int32)
TEXT ·Yiswxdigit_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xiswxdigit_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yisxdigit(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yisxdigit(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xisxdigit(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yisxdigit_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Yisxdigit_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xisxdigit_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yj0(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yj0(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xj0(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yj0f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yj0f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xj0f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yj1(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yj1(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xj1(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yj1f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yj1f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xj1f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yjn(p0 *TLS, p1 int32, p2 float64) (ret float64)
TEXT ·Yjn(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xjn(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yjnf(p0 *TLS, p1 int32, p2 float32) (ret float32)
TEXT ·Yjnf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xjnf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yjrand48(p0 *TLS, p1 uintptr) (ret int64)
TEXT ·Yjrand48(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xjrand48(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ykill(p0 *TLS, p1 Tpid_t, p2 int32) (ret int32)
TEXT ·Ykill(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xkill(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ykillpg(p0 *TLS, p1 Tpid_t, p2 int32) (ret int32)
TEXT ·Ykillpg(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xkillpg(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yklogctl(p0 *TLS, p1 int32, p2 uintptr, p3 int32) (ret int32)
TEXT ·Yklogctl(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xklogctl(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yl64a(p0 *TLS, p1 int64) (ret uintptr)
TEXT ·Yl64a(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xl64a(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylabs(p0 *TLS, p1 int64) (ret int64)
TEXT ·Ylabs(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlabs(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylchmod(p0 *TLS, p1 uintptr, p2 Tmode_t) (ret int32)
TEXT ·Ylchmod(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xlchmod(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ylchown(p0 *TLS, p1 uintptr, p2 Tuid_t, p3 Tgid_t) (ret int32)
TEXT ·Ylchown(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	CALL ·Xlchown(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ylckpwdf(p0 *TLS) (ret int32)
TEXT ·Ylckpwdf(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xlckpwdf(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ylcong48(p0 *TLS, p1 uintptr)
TEXT ·Ylcong48(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlcong48(SB)
	RET

// func Yldexp(p0 *TLS, p1 float64, p2 int32) (ret float64)
TEXT ·Yldexp(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xldexp(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yldexpf(p0 *TLS, p1 float32, p2 int32) (ret float32)
TEXT ·Yldexpf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xldexpf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yldexpl(p0 *TLS, p1 float64, p2 int32) (ret float64)
TEXT ·Yldexpl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xldexpl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yldiv(p0 *TLS, p1 int64, p2 int64) (ret Tldiv_t)
TEXT ·Yldiv(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xldiv(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_Fquot+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_Frem+32(FP)
	RET

// func Ylfind(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 uintptr) (ret uintptr)
TEXT ·Ylfind(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xlfind(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ylgamma(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylgamma(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlgamma(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylgamma_r(p0 *TLS, p1 float64, p2 uintptr) (ret float64)
TEXT ·Ylgamma_r(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlgamma_r(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ylgammaf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ylgammaf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xlgammaf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ylgammaf_r(p0 *TLS, p1 float32, p2 uintptr) (ret float32)
TEXT ·Ylgammaf_r(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlgammaf_r(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ylgammal(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylgammal(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlgammal(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylgammal_r(p0 *TLS, p1 float64, p2 uintptr) (ret float64)
TEXT ·Ylgammal_r(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlgammal_r(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ylgetxattr(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 Tsize_t) (ret Tssize_t)
TEXT ·Ylgetxattr(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xlgetxattr(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ylink(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ylink(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlink(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ylinkat(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 uintptr, p5 int32) (ret int32)
TEXT ·Ylinkat(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xlinkat(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ylisten(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Ylisten(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xlisten(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ylistxattr(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret Tssize_t)
TEXT ·Ylistxattr(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xlistxattr(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yllabs(p0 *TLS, p1 int64) (ret int64)
TEXT ·Yllabs(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xllabs(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylldiv(p0 *TLS, p1 int64, p2 int64) (ret Tlldiv_t)
TEXT ·Ylldiv(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlldiv(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret_Fquot+24(FP)
	MOVQ 32(SP), AX
	MOVQ AX, ret_Frem+32(FP)
	RET

// func Yllistxattr(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret Tssize_t)
TEXT ·Yllistxattr(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xllistxattr(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yllrint(p0 *TLS, p1 float64) (ret int64)
TEXT ·Yllrint(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xllrint(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yllrintf(p0 *TLS, p1 float32) (ret int64)
TEXT ·Yllrintf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xllrintf(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yllrintl(p0 *TLS, p1 float64) (ret int64)
TEXT ·Yllrintl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xllrintl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yllround(p0 *TLS, p1 float64) (ret int64)
TEXT ·Yllround(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xllround(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yllroundf(p0 *TLS, p1 float32) (ret int64)
TEXT ·Yllroundf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xllroundf(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yllroundl(p0 *TLS, p1 float64) (ret int64)
TEXT ·Yllroundl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xllroundl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylocaleconv(p0 *TLS) (ret uintptr)
TEXT ·Ylocaleconv(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xlocaleconv(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ylocaltime(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ylocaltime(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlocaltime(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylocaltime_r(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ylocaltime_r(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlocaltime_r(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ylockf(p0 *TLS, p1 int32, p2 int32, p3 Toff_t) (ret int32)
TEXT ·Ylockf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlockf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ylog(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylog(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlog(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylog10(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylog10(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlog10(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylog10f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ylog10f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xlog10f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ylog10l(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylog10l(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlog10l(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylog1p(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylog1p(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlog1p(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylog1pf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ylog1pf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xlog1pf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ylog1pl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylog1pl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlog1pl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylog2(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylog2(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlog2(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylog2f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ylog2f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xlog2f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ylog2l(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylog2l(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlog2l(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylogb(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylogb(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlogb(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylogbf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ylogbf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xlogbf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ylogbl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylogbl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlogbl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylogf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ylogf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xlogf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ylogin_tty(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ylogin_tty(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xlogin_tty(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ylogl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ylogl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlogl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylongjmp(p0 *TLS, p1 uintptr, p2 int32)
TEXT ·Ylongjmp(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xlongjmp(SB)
	RET

// func Ylrand48(p0 *TLS) (ret int64)
TEXT ·Ylrand48(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xlrand48(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ylremovexattr(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ylremovexattr(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlremovexattr(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ylrint(p0 *TLS, p1 float64) (ret int64)
TEXT ·Ylrint(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlrint(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylrintf(p0 *TLS, p1 float32) (ret int64)
TEXT ·Ylrintf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xlrintf(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylrintl(p0 *TLS, p1 float64) (ret int64)
TEXT ·Ylrintl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlrintl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylround(p0 *TLS, p1 float64) (ret int64)
TEXT ·Ylround(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlround(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylroundf(p0 *TLS, p1 float32) (ret int64)
TEXT ·Ylroundf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xlroundf(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylroundl(p0 *TLS, p1 float64) (ret int64)
TEXT ·Ylroundl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xlroundl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ylsearch(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 uintptr) (ret uintptr)
TEXT ·Ylsearch(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xlsearch(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ylseek(p0 *TLS, p1 int32, p2 Toff_t, p3 int32) (ret Toff_t)
TEXT ·Ylseek(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xlseek(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ylseek64(p0 *TLS, p1 int32, p2 Toff_t, p3 int32) (ret Toff_t)
TEXT ·Ylseek64(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xlseek64(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ylsetxattr(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 int32) (ret int32)
TEXT ·Ylsetxattr(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xlsetxattr(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ylstat(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ylstat(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlstat(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ylstat64(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ylstat64(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlstat64(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ylutimes(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ylutimes(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xlutimes(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymadvise(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 int32) (ret int32)
TEXT ·Ymadvise(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xmadvise(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymalloc(p0 *TLS, p1 Tsize_t) (ret uintptr)
TEXT ·Ymalloc(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xmalloc(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ymalloc_usable_size(p0 *TLS, p1 uintptr) (ret Tsize_t)
TEXT ·Ymalloc_usable_size(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xmalloc_usable_size(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ymblen(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ymblen(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xmblen(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymbrlen(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr) (ret Tsize_t)
TEXT ·Ymbrlen(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmbrlen(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ymbrtoc16(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 uintptr) (ret Tsize_t)
TEXT ·Ymbrtoc16(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xmbrtoc16(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ymbrtoc32(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 uintptr) (ret Tsize_t)
TEXT ·Ymbrtoc32(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xmbrtoc32(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ymbrtowc(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 uintptr) (ret Tsize_t)
TEXT ·Ymbrtowc(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xmbrtowc(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ymbsinit(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ymbsinit(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xmbsinit(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ymbsnrtowcs(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 Tsize_t, p5 uintptr) (ret Tsize_t)
TEXT ·Ymbsnrtowcs(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xmbsnrtowcs(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ymbsrtowcs(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 uintptr) (ret Tsize_t)
TEXT ·Ymbsrtowcs(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xmbsrtowcs(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ymbstowcs(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret Tsize_t)
TEXT ·Ymbstowcs(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmbstowcs(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ymbtowc(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ymbtowc(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmbtowc(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymemccpy(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32, p4 Tsize_t) (ret uintptr)
TEXT ·Ymemccpy(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xmemccpy(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ymemchr(p0 *TLS, p1 uintptr, p2 int32, p3 Tsize_t) (ret uintptr)
TEXT ·Ymemchr(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmemchr(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ymemcmp(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ymemcmp(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmemcmp(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymemcpy(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ymemcpy(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmemcpy(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ymemfd_create(p0 *TLS, p1 uintptr, p2 uint32) (ret int32)
TEXT ·Ymemfd_create(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xmemfd_create(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymemmem(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 Tsize_t) (ret uintptr)
TEXT ·Ymemmem(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xmemmem(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ymemmove(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ymemmove(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmemmove(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ymempcpy(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ymempcpy(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmempcpy(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ymemrchr(p0 *TLS, p1 uintptr, p2 int32, p3 Tsize_t) (ret uintptr)
TEXT ·Ymemrchr(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmemrchr(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ymemset(p0 *TLS, p1 uintptr, p2 int32, p3 Tsize_t) (ret uintptr)
TEXT ·Ymemset(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmemset(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ymincore(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr) (ret int32)
TEXT ·Ymincore(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmincore(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymkdir(p0 *TLS, p1 uintptr, p2 Tmode_t) (ret int32)
TEXT ·Ymkdir(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xmkdir(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymkdirat(p0 *TLS, p1 int32, p2 uintptr, p3 Tmode_t) (ret int32)
TEXT ·Ymkdirat(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xmkdirat(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymkdtemp(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ymkdtemp(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xmkdtemp(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ymkfifo(p0 *TLS, p1 uintptr, p2 Tmode_t) (ret int32)
TEXT ·Ymkfifo(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xmkfifo(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymkfifoat(p0 *TLS, p1 int32, p2 uintptr, p3 Tmode_t) (ret int32)
TEXT ·Ymkfifoat(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xmkfifoat(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymknod(p0 *TLS, p1 uintptr, p2 Tmode_t, p3 Tdev_t) (ret int32)
TEXT ·Ymknod(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xmknod(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymknodat(p0 *TLS, p1 int32, p2 uintptr, p3 Tmode_t, p4 Tdev_t) (ret int32)
TEXT ·Ymknodat(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xmknodat(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ymkostemp(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ymkostemp(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xmkostemp(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymkostemps(p0 *TLS, p1 uintptr, p2 int32, p3 int32) (ret int32)
TEXT ·Ymkostemps(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	CALL ·Xmkostemps(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymkstemp(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ymkstemp(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xmkstemp(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ymkstemp64(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ymkstemp64(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xmkstemp64(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ymkstemps(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ymkstemps(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xmkstemps(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymkstemps64(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ymkstemps64(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xmkstemps64(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymktemp(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ymktemp(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xmktemp(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ymktime(p0 *TLS, p1 uintptr) (ret Ttime_t)
TEXT ·Ymktime(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xmktime(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ymlock(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ymlock(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xmlock(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymlock2(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uint32) (ret int32)
TEXT ·Ymlock2(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xmlock2(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymlockall(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ymlockall(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xmlockall(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ymmap(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 int32, p4 int32, p5 int32, p6 Toff_t) (ret uintptr)
TEXT ·Ymmap(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	MOVL p5+32(FP), AX
	MOVL AX, 32(SP)
	MOVQ p6+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xmmap(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ymmap64(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 int32, p4 int32, p5 int32, p6 Toff_t) (ret uintptr)
TEXT ·Ymmap64(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	MOVL p5+32(FP), AX
	MOVL AX, 32(SP)
	MOVQ p6+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xmmap64(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ymodf(p0 *TLS, p1 float64, p2 uintptr) (ret float64)
TEXT ·Ymodf(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xmodf(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ymodff(p0 *TLS, p1 float32, p2 uintptr) (ret float32)
TEXT ·Ymodff(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xmodff(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymodfl(p0 *TLS, p1 float64, p2 uintptr) (ret float64)
TEXT ·Ymodfl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xmodfl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ymount(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 uint64, p5 uintptr) (ret int32)
TEXT ·Ymount(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xmount(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ymprotect(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 int32) (ret int32)
TEXT ·Ymprotect(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xmprotect(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymrand48(p0 *TLS) (ret int64)
TEXT ·Ymrand48(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xmrand48(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ymremap(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 Tsize_t, p4 int32, p5 uintptr) (ret uintptr)
TEXT ·Ymremap(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xmremap(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ymsgctl(p0 *TLS, p1 int32, p2 int32, p3 uintptr) (ret int32)
TEXT ·Ymsgctl(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xmsgctl(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymsgget(p0 *TLS, p1 Tkey_t, p2 int32) (ret int32)
TEXT ·Ymsgget(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xmsgget(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ymsgrcv(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 int64, p5 int32) (ret Tssize_t)
TEXT ·Ymsgrcv(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xmsgrcv(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ymsgsnd(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 int32) (ret int32)
TEXT ·Ymsgsnd(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xmsgsnd(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ymsync(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 int32) (ret int32)
TEXT ·Ymsync(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xmsync(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ymunlock(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ymunlock(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xmunlock(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ymunlockall(p0 *TLS) (ret int32)
TEXT ·Ymunlockall(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xmunlockall(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ymunmap(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ymunmap(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xmunmap(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yname_to_handle_at(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 uintptr, p5 int32) (ret int32)
TEXT ·Yname_to_handle_at(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xname_to_handle_at(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ynan(p0 *TLS, p1 uintptr) (ret float64)
TEXT ·Ynan(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xnan(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ynanf(p0 *TLS, p1 uintptr) (ret float32)
TEXT ·Ynanf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xnanf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ynanl(p0 *TLS, p1 uintptr) (ret float64)
TEXT ·Ynanl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xnanl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ynanosleep(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ynanosleep(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xnanosleep(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ynewlocale(p0 *TLS, p1 int32, p2 uintptr, p3 Tlocale_t) (ret Tlocale_t)
TEXT ·Ynewlocale(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xnewlocale(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ynextafter(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Ynextafter(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xnextafter(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ynextafterf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Ynextafterf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xnextafterf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ynextafterl(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Ynextafterl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xnextafterl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ynexttoward(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Ynexttoward(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xnexttoward(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ynexttowardf(p0 *TLS, p1 float32, p2 float64) (ret float32)
TEXT ·Ynexttowardf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xnexttowardf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ynexttowardl(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Ynexttowardl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xnexttowardl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ynftw(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32, p4 int32) (ret int32)
TEXT ·Ynftw(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	CALL ·Xnftw(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yngettext(p0 *TLS, p1 uintptr, p2 uintptr, p3 uint64) (ret uintptr)
TEXT ·Yngettext(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xngettext(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ynice(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ynice(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xnice(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ynl_langinfo(p0 *TLS, p1 Tnl_item) (ret uintptr)
TEXT ·Ynl_langinfo(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xnl_langinfo(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ynl_langinfo_l(p0 *TLS, p1 Tnl_item, p2 Tlocale_t) (ret uintptr)
TEXT ·Ynl_langinfo_l(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xnl_langinfo_l(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ynrand48(p0 *TLS, p1 uintptr) (ret int64)
TEXT ·Ynrand48(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xnrand48(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yns_get16(p0 *TLS, p1 uintptr) (ret uint32)
TEXT ·Yns_get16(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xns_get16(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yns_get32(p0 *TLS, p1 uintptr) (ret uint64)
TEXT ·Yns_get32(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xns_get32(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yns_initparse(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret int32)
TEXT ·Yns_initparse(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xns_initparse(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yns_name_uncompress(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 uintptr, p5 Tsize_t) (ret int32)
TEXT ·Yns_name_uncompress(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xns_name_uncompress(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Yns_parserr(p0 *TLS, p1 uintptr, p2 Tns_sect, p3 int32, p4 uintptr) (ret int32)
TEXT ·Yns_parserr(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xns_parserr(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yns_put16(p0 *TLS, p1 uint32, p2 uintptr)
TEXT ·Yns_put16(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xns_put16(SB)
	RET

// func Yns_put32(p0 *TLS, p1 uint64, p2 uintptr)
TEXT ·Yns_put32(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xns_put32(SB)
	RET

// func Yns_skiprr(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tns_sect, p4 int32) (ret int32)
TEXT ·Yns_skiprr(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	CALL ·Xns_skiprr(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yntohl(p0 *TLS, p1 Tuint32_t) (ret Tuint32_t)
TEXT ·Yntohl(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xntohl(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yntohs(p0 *TLS, p1 Tuint16_t) (ret Tuint16_t)
TEXT ·Yntohs(SB),$24-18
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVW p1+8(FP), AX
	MOVW AX, 8(SP)
	CALL ·Xntohs(SB)
	MOVW 16(SP), AX
	MOVW AX, ret+16(FP)
	RET

// func Yobstack_free(p0 *TLS, p1 ,  p2 uintptr)
TEXT ·Yobstack_free(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xobstack_free(SB)
	RET

// func Yobstack_vprintf(p0 *TLS, p1 ,  p2 ,  p3 uintptr) (ret int32)
TEXT ·Yobstack_vprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xobstack_vprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yopen(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret int32)
TEXT ·Yopen(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xopen(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yopen64(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret int32)
TEXT ·Yopen64(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xopen64(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yopen_by_handle_at(p0 *TLS, p1 int32, p2 uintptr, p3 int32) (ret int32)
TEXT ·Yopen_by_handle_at(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xopen_by_handle_at(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yopen_memstream(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yopen_memstream(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xopen_memstream(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yopen_wmemstream(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yopen_wmemstream(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xopen_wmemstream(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yopenat(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 uintptr) (ret int32)
TEXT ·Yopenat(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xopenat(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yopendir(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yopendir(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xopendir(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yopenlog(p0 *TLS, p1 uintptr, p2 int32, p3 int32)
TEXT ·Yopenlog(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	CALL ·Xopenlog(SB)
	RET

// func Yopenpty(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 uintptr, p5 uintptr) (ret int32)
TEXT ·Yopenpty(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xopenpty(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ypathconf(p0 *TLS, p1 uintptr, p2 int32) (ret int64)
TEXT ·Ypathconf(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xpathconf(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ypause(p0 *TLS) (ret int32)
TEXT ·Ypause(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xpause(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ypclose(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypclose(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpclose(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yperror(p0 *TLS, p1 uintptr)
TEXT ·Yperror(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xperror(SB)
	RET

// func Ypersonality(p0 *TLS, p1 uint64) (ret int32)
TEXT ·Ypersonality(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpersonality(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypipe(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypipe(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpipe(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypipe2(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ypipe2(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xpipe2(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypivot_root(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ypivot_root(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpivot_root(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypoll(p0 *TLS, p1 uintptr, p2 Tnfds_t, p3 int32) (ret int32)
TEXT ·Ypoll(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xpoll(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ypopen(p0 *TLS, p1 ,  p2 uintptr) (ret uintptr)
TEXT ·Ypopen(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpopen(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yposix_close(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Yposix_close(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xposix_close(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yposix_fadvise(p0 *TLS, p1 int32, p2 Toff_t, p3 Toff_t, p4 int32) (ret int32)
TEXT ·Yposix_fadvise(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xposix_fadvise(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yposix_fallocate(p0 *TLS, p1 int32, p2 Toff_t, p3 Toff_t) (ret int32)
TEXT ·Yposix_fallocate(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xposix_fallocate(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yposix_madvise(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 int32) (ret int32)
TEXT ·Yposix_madvise(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xposix_madvise(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yposix_openpt(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yposix_openpt(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xposix_openpt(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yposix_spawn_file_actions_addchdir_np(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawn_file_actions_addchdir_np(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawn_file_actions_addchdir_np(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawn_file_actions_addclose(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Yposix_spawn_file_actions_addclose(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xposix_spawn_file_actions_addclose(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawn_file_actions_adddup2(p0 *TLS, p1 uintptr, p2 int32, p3 int32) (ret int32)
TEXT ·Yposix_spawn_file_actions_adddup2(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	CALL ·Xposix_spawn_file_actions_adddup2(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawn_file_actions_addfchdir_np(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Yposix_spawn_file_actions_addfchdir_np(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xposix_spawn_file_actions_addfchdir_np(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawn_file_actions_addopen(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr, p4 int32, p5 Tmode_t) (ret int32)
TEXT ·Yposix_spawn_file_actions_addopen(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	MOVL p5+36(FP), AX
	MOVL AX, 36(SP)
	CALL ·Xposix_spawn_file_actions_addopen(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yposix_spawn_file_actions_destroy(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yposix_spawn_file_actions_destroy(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xposix_spawn_file_actions_destroy(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yposix_spawn_file_actions_init(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yposix_spawn_file_actions_init(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xposix_spawn_file_actions_init(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yposix_spawnattr_destroy(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_destroy(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xposix_spawnattr_destroy(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yposix_spawnattr_getflags(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_getflags(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawnattr_getflags(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_getpgroup(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_getpgroup(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawnattr_getpgroup(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_getschedparam(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_getschedparam(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawnattr_getschedparam(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_getschedpolicy(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_getschedpolicy(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawnattr_getschedpolicy(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_getsigdefault(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_getsigdefault(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawnattr_getsigdefault(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_getsigmask(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_getsigmask(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawnattr_getsigmask(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_init(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_init(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xposix_spawnattr_init(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yposix_spawnattr_setflags(p0 *TLS, p1 uintptr, p2 int16) (ret int32)
TEXT ·Yposix_spawnattr_setflags(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVW p2+16(FP), AX
	MOVW AX, 16(SP)
	CALL ·Xposix_spawnattr_setflags(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_setpgroup(p0 *TLS, p1 uintptr, p2 Tpid_t) (ret int32)
TEXT ·Yposix_spawnattr_setpgroup(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xposix_spawnattr_setpgroup(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_setschedparam(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_setschedparam(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawnattr_setschedparam(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_setschedpolicy(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Yposix_spawnattr_setschedpolicy(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xposix_spawnattr_setschedpolicy(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_setsigdefault(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_setsigdefault(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawnattr_setsigdefault(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yposix_spawnattr_setsigmask(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yposix_spawnattr_setsigmask(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xposix_spawnattr_setsigmask(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypow(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Ypow(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpow(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ypow10(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ypow10(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpow10(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ypow10f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ypow10f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xpow10f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypow10l(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ypow10l(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpow10l(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ypowf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Ypowf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xpowf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypowl(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Ypowl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpowl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yppoll(p0 *TLS, p1 uintptr, p2 Tnfds_t, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Yppoll(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xppoll(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yprctl(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yprctl(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xprctl(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypread(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 Toff_t) (ret Tssize_t)
TEXT ·Ypread(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xpread(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ypreadv(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 Toff_t) (ret Tssize_t)
TEXT ·Ypreadv(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xpreadv(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ypreadv2(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 Toff_t, p5 int32) (ret Tssize_t)
TEXT ·Ypreadv2(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xpreadv2(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Yprintf(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yprintf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xprintf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yprlimit(p0 *TLS, p1 Tpid_t, p2 int32, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Yprlimit(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xprlimit(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yprocess_vm_readv(p0 *TLS, p1 Tpid_t, p2 uintptr, p3 uint64, p4 uintptr, p5 uint64, p6 uint64) (ret Tssize_t)
TEXT ·Yprocess_vm_readv(SB),$64-64
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p6+48(FP), AX
	MOVQ AX, 48(SP)
	CALL ·Xprocess_vm_readv(SB)
	MOVQ 56(SP), AX
	MOVQ AX, ret+56(FP)
	RET

// func Yprocess_vm_writev(p0 *TLS, p1 Tpid_t, p2 uintptr, p3 uint64, p4 uintptr, p5 uint64, p6 uint64) (ret Tssize_t)
TEXT ·Yprocess_vm_writev(SB),$64-64
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p6+48(FP), AX
	MOVQ AX, 48(SP)
	CALL ·Xprocess_vm_writev(SB)
	MOVQ 56(SP), AX
	MOVQ AX, ret+56(FP)
	RET

// func Ypselect(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 uintptr, p5 uintptr, p6 uintptr) (ret int32)
TEXT ·Ypselect(SB),$64-60
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p6+48(FP), AX
	MOVQ AX, 48(SP)
	CALL ·Xpselect(SB)
	MOVL 56(SP), AX
	MOVL AX, ret+56(FP)
	RET

// func Ypsiginfo(p0 *TLS, p1 uintptr, p2 uintptr)
TEXT ·Ypsiginfo(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpsiginfo(SB)
	RET

// func Ypsignal(p0 *TLS, p1 int32, p2 uintptr)
TEXT ·Ypsignal(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpsignal(SB)
	RET

// func Ypthread_atfork(p0 *TLS, p1 ,  p2 ,  p3 uintptr) (ret int32)
TEXT ·Ypthread_atfork(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xpthread_atfork(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ypthread_attr_destroy(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_attr_destroy(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_attr_destroy(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_attr_getdetachstate(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ypthread_attr_getdetachstate(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_attr_getdetachstate(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_attr_init(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_attr_init(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_attr_init(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_attr_setdetachstate(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ypthread_attr_setdetachstate(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xpthread_attr_setdetachstate(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_attr_setscope(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ypthread_attr_setscope(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xpthread_attr_setscope(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_attr_setstacksize(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ypthread_attr_setstacksize(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_attr_setstacksize(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_cleanup_pop(p0 *TLS, p1 int32)
TEXT ·Ypthread_cleanup_pop(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xpthread_cleanup_pop(SB)
	RET

// func Ypthread_cleanup_push(p0 *TLS, p1 ,  p2 uintptr)
TEXT ·Ypthread_cleanup_push(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_cleanup_push(SB)
	RET

// func Ypthread_cond_broadcast(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_cond_broadcast(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_cond_broadcast(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_cond_destroy(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_cond_destroy(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_cond_destroy(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_cond_init(p0 *TLS, p1 ,  p2 uintptr) (ret int32)
TEXT ·Ypthread_cond_init(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_cond_init(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_cond_signal(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_cond_signal(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_cond_signal(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_cond_timedwait(p0 *TLS, p1 ,  p2 ,  p3 uintptr) (ret int32)
TEXT ·Ypthread_cond_timedwait(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xpthread_cond_timedwait(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ypthread_cond_wait(p0 *TLS, p1 ,  p2 uintptr) (ret int32)
TEXT ·Ypthread_cond_wait(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_cond_wait(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_create(p0 *TLS, p1 ,  p2 ,  p3 ,  p4 uintptr) (ret int32)
TEXT ·Ypthread_create(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xpthread_create(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ypthread_detach(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_detach(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_detach(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_equal(p0 *TLS, p1 ,  p2 uintptr) (ret int32)
TEXT ·Ypthread_equal(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_equal(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_exit(p0 *TLS, p1 uintptr)
TEXT ·Ypthread_exit(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_exit(SB)
	RET

// func Ypthread_getspecific(p0 *TLS, p1 Tpthread_key_t) (ret uintptr)
TEXT ·Ypthread_getspecific(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xpthread_getspecific(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ypthread_join(p0 *TLS, p1 Tpthread_t, p2 uintptr) (ret int32)
TEXT ·Ypthread_join(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_join(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_key_create(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ypthread_key_create(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_key_create(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_key_delete(p0 *TLS, p1 Tpthread_key_t) (ret int32)
TEXT ·Ypthread_key_delete(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xpthread_key_delete(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_mutex_destroy(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_mutex_destroy(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_mutex_destroy(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_mutex_init(p0 *TLS, p1 ,  p2 uintptr) (ret int32)
TEXT ·Ypthread_mutex_init(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_mutex_init(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_mutex_lock(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_mutex_lock(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_mutex_lock(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_mutex_trylock(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_mutex_trylock(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_mutex_trylock(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_mutex_unlock(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_mutex_unlock(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_mutex_unlock(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_mutexattr_destroy(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_mutexattr_destroy(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_mutexattr_destroy(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_mutexattr_init(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ypthread_mutexattr_init(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpthread_mutexattr_init(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypthread_mutexattr_settype(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ypthread_mutexattr_settype(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xpthread_mutexattr_settype(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_self(p0 *TLS) (ret uintptr)
TEXT ·Ypthread_self(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xpthread_self(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ypthread_setcancelstate(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ypthread_setcancelstate(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_setcancelstate(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_setspecific(p0 *TLS, p1 Tpthread_key_t, p2 uintptr) (ret int32)
TEXT ·Ypthread_setspecific(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xpthread_setspecific(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypthread_sigmask(p0 *TLS, p1 int32, p2 ,  p3 uintptr) (ret int32)
TEXT ·Ypthread_sigmask(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xpthread_sigmask(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yptrace(p0 *TLS, p1 int32, p2 uintptr) (ret int64)
TEXT ·Yptrace(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xptrace(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yptsname(p0 *TLS, p1 int32) (ret uintptr)
TEXT ·Yptsname(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xptsname(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yptsname_r(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Yptsname_r(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xptsname_r(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yputc(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yputc(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xputc(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yputc_unlocked(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yputc_unlocked(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xputc_unlocked(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yputchar(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yputchar(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xputchar(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yputchar_unlocked(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yputchar_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xputchar_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yputenv(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yputenv(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xputenv(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yputgrent(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yputgrent(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xputgrent(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yputpwent(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yputpwent(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xputpwent(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yputs(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yputs(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xputs(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yputspent(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yputspent(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xputspent(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ypututline(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ypututline(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpututline(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ypututxline(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ypututxline(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xpututxline(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yputw(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yputw(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xputw(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yputwc(p0 *TLS, p1 Twchar_t, p2 uintptr) (ret Twint_t)
TEXT ·Yputwc(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xputwc(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yputwc_unlocked(p0 *TLS, p1 Twchar_t, p2 uintptr) (ret Twint_t)
TEXT ·Yputwc_unlocked(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xputwc_unlocked(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yputwchar(p0 *TLS, p1 Twchar_t) (ret Twint_t)
TEXT ·Yputwchar(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xputwchar(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yputwchar_unlocked(p0 *TLS, p1 Twchar_t) (ret Twint_t)
TEXT ·Yputwchar_unlocked(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xputwchar_unlocked(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ypwrite(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 Toff_t) (ret Tssize_t)
TEXT ·Ypwrite(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xpwrite(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ypwritev(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 Toff_t) (ret Tssize_t)
TEXT ·Ypwritev(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xpwritev(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ypwritev2(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 Toff_t, p5 int32) (ret Tssize_t)
TEXT ·Ypwritev2(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xpwritev2(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Yqsort(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 Tsize_t, p4 Tcmpfun)
TEXT ·Yqsort(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xqsort(SB)
	RET

// func Yqsort_r(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 Tsize_t, p4 Tcmpfun, p5 uintptr)
TEXT ·Yqsort_r(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xqsort_r(SB)
	RET

// func Yquick_exit(p0 *TLS, p1 int32)
TEXT ·Yquick_exit(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xquick_exit(SB)
	RET

// func Yquotactl(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 uintptr) (ret int32)
TEXT ·Yquotactl(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xquotactl(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yraise(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yraise(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xraise(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yrand(p0 *TLS) (ret int32)
TEXT ·Yrand(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xrand(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yrand_r(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yrand_r(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xrand_r(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yrandom(p0 *TLS) (ret int64)
TEXT ·Yrandom(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xrandom(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Yrandom_r(p0 *TLS, p1 ,  p2 uintptr) (ret int32)
TEXT ·Yrandom_r(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xrandom_r(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yread(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t) (ret Tssize_t)
TEXT ·Yread(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xread(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yreadahead(p0 *TLS, p1 int32, p2 Toff_t, p3 Tsize_t) (ret Tssize_t)
TEXT ·Yreadahead(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xreadahead(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yreaddir(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yreaddir(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xreaddir(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yreaddir64(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yreaddir64(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xreaddir64(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yreaddir_r(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yreaddir_r(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xreaddir_r(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yreadlink(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret Tssize_t)
TEXT ·Yreadlink(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xreadlink(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yreadlinkat(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 Tsize_t) (ret Tssize_t)
TEXT ·Yreadlinkat(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xreadlinkat(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yreadv(p0 *TLS, p1 int32, p2 uintptr, p3 int32) (ret Tssize_t)
TEXT ·Yreadv(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xreadv(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yrealloc(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret uintptr)
TEXT ·Yrealloc(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xrealloc(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yreallocarray(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 Tsize_t) (ret uintptr)
TEXT ·Yreallocarray(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xreallocarray(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yrealpath(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Yrealpath(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xrealpath(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yreboot(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yreboot(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xreboot(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yrecv(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 int32) (ret Tssize_t)
TEXT ·Yrecv(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xrecv(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yrecvfrom(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 int32, p5 uintptr, p6 uintptr) (ret Tssize_t)
TEXT ·Yrecvfrom(SB),$64-64
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVQ p6+48(FP), AX
	MOVQ AX, 48(SP)
	CALL ·Xrecvfrom(SB)
	MOVQ 56(SP), AX
	MOVQ AX, ret+56(FP)
	RET

// func Yrecvmmsg(p0 *TLS, p1 int32, p2 uintptr, p3 uint32, p4 uint32, p5 uintptr) (ret int32)
TEXT ·Yrecvmmsg(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	MOVQ p5+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xrecvmmsg(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yrecvmsg(p0 *TLS, p1 int32, p2 uintptr, p3 int32) (ret Tssize_t)
TEXT ·Yrecvmsg(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xrecvmsg(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yregcomp(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret int32)
TEXT ·Yregcomp(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xregcomp(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yregerror(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 Tsize_t) (ret Tsize_t)
TEXT ·Yregerror(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xregerror(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yregexec(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 uintptr, p5 int32) (ret int32)
TEXT ·Yregexec(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xregexec(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Yregfree(p0 *TLS, p1 uintptr)
TEXT ·Yregfree(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xregfree(SB)
	RET

// func Yremainder(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yremainder(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xremainder(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yremainderf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Yremainderf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xremainderf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yremainderl(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yremainderl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xremainderl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yremap_file_pages(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 int32, p4 Tsize_t, p5 int32) (ret int32)
TEXT ·Yremap_file_pages(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xremap_file_pages(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Yremove(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yremove(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xremove(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yremovexattr(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yremovexattr(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xremovexattr(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yremque(p0 *TLS, p1 uintptr)
TEXT ·Yremque(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xremque(SB)
	RET

// func Yremquo(p0 *TLS, p1 float64, p2 float64, p3 uintptr) (ret float64)
TEXT ·Yremquo(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xremquo(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yremquof(p0 *TLS, p1 float32, p2 float32, p3 uintptr) (ret float32)
TEXT ·Yremquof(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xremquof(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yremquol(p0 *TLS, p1 float64, p2 float64, p3 uintptr) (ret float64)
TEXT ·Yremquol(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xremquol(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yrename(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yrename(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xrename(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yrenameat(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 uintptr) (ret int32)
TEXT ·Yrenameat(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xrenameat(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yrenameat2(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 uintptr, p5 int32) (ret int32)
TEXT ·Yrenameat2(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xrenameat2(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Yres_init(p0 *TLS) (ret int32)
TEXT ·Yres_init(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xres_init(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yres_mkquery(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 int32, p5 uintptr, p6 int32, p7 uintptr, p8 uintptr, p9 int32) (ret int32)
TEXT ·Yres_mkquery(SB),$80-76
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	MOVQ p5+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p6+40(FP), AX
	MOVL AX, 40(SP)
	MOVQ p7+48(FP), AX
	MOVQ AX, 48(SP)
	MOVQ p8+56(FP), AX
	MOVQ AX, 56(SP)
	MOVL p9+64(FP), AX
	MOVL AX, 64(SP)
	CALL ·Xres_mkquery(SB)
	MOVL 72(SP), AX
	MOVL AX, ret+72(FP)
	RET

// func Yres_send(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr, p4 int32) (ret int32)
TEXT ·Yres_send(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xres_send(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yrewind(p0 *TLS, p1 uintptr)
TEXT ·Yrewind(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xrewind(SB)
	RET

// func Yrewinddir(p0 *TLS, p1 uintptr)
TEXT ·Yrewinddir(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xrewinddir(SB)
	RET

// func Yrindex(p0 *TLS, p1 uintptr, p2 int32) (ret uintptr)
TEXT ·Yrindex(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xrindex(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yrint(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yrint(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xrint(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yrintf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yrintf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xrintf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yrintl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yrintl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xrintl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yrmdir(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yrmdir(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xrmdir(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yround(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yround(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xround(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yroundf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yroundf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xroundf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yroundl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yroundl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xroundl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysbrk(p0 *TLS, p1 Tintptr_t) (ret uintptr)
TEXT ·Ysbrk(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsbrk(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yscalb(p0 *TLS, p1 float64, p2 float64) (ret float64)
TEXT ·Yscalb(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xscalb(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yscalbf(p0 *TLS, p1 float32, p2 float32) (ret float32)
TEXT ·Yscalbf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xscalbf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yscalbln(p0 *TLS, p1 float64, p2 int64) (ret float64)
TEXT ·Yscalbln(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xscalbln(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yscalblnf(p0 *TLS, p1 float32, p2 int64) (ret float32)
TEXT ·Yscalblnf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xscalblnf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yscalblnl(p0 *TLS, p1 float64, p2 int64) (ret float64)
TEXT ·Yscalblnl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xscalblnl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yscalbn(p0 *TLS, p1 float64, p2 int32) (ret float64)
TEXT ·Yscalbn(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xscalbn(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yscalbnf(p0 *TLS, p1 float32, p2 int32) (ret float32)
TEXT ·Yscalbnf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xscalbnf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yscalbnl(p0 *TLS, p1 float64, p2 int32) (ret float64)
TEXT ·Yscalbnl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xscalbnl(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yscandir(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Yscandir(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xscandir(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yscanf(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yscanf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xscanf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysched_yield(p0 *TLS) (ret int32)
TEXT ·Ysched_yield(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsched_yield(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ysecure_getenv(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ysecure_getenv(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsecure_getenv(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yseed48(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Yseed48(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xseed48(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yseekdir(p0 *TLS, p1 uintptr, p2 int64)
TEXT ·Yseekdir(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xseekdir(SB)
	RET

// func Yselect(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 uintptr, p5 uintptr) (ret int32)
TEXT ·Yselect(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xselect(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ysemctl(p0 *TLS, p1 int32, p2 int32, p3 int32, p4 uintptr) (ret int32)
TEXT ·Ysemctl(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsemctl(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysemget(p0 *TLS, p1 Tkey_t, p2 int32, p3 int32) (ret int32)
TEXT ·Ysemget(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xsemget(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysemop(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ysemop(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsemop(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysemtimedop(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 uintptr) (ret int32)
TEXT ·Ysemtimedop(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xsemtimedop(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ysend(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 int32) (ret Tssize_t)
TEXT ·Ysend(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xsend(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ysendfile(p0 *TLS, p1 int32, p2 int32, p3 uintptr, p4 Tsize_t) (ret Tssize_t)
TEXT ·Ysendfile(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsendfile(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ysendmmsg(p0 *TLS, p1 int32, p2 uintptr, p3 uint32, p4 uint32) (ret int32)
TEXT ·Ysendmmsg(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	CALL ·Xsendmmsg(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysendmsg(p0 *TLS, p1 int32, p2 uintptr, p3 int32) (ret Tssize_t)
TEXT ·Ysendmsg(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xsendmsg(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ysendto(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 int32, p5 uintptr, p6 Tsocklen_t) (ret Tssize_t)
TEXT ·Ysendto(SB),$64-64
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVL p6+48(FP), AX
	MOVL AX, 48(SP)
	CALL ·Xsendto(SB)
	MOVQ 56(SP), AX
	MOVQ AX, ret+56(FP)
	RET

// func Ysetbuf(p0 *TLS, p1 uintptr, p2 uintptr)
TEXT ·Ysetbuf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsetbuf(SB)
	RET

// func Ysetbuffer(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t)
TEXT ·Ysetbuffer(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsetbuffer(SB)
	RET

// func Ysetdomainname(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ysetdomainname(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsetdomainname(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysetenv(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret int32)
TEXT ·Ysetenv(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xsetenv(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysetfsgid(p0 *TLS, p1 Tgid_t) (ret int32)
TEXT ·Ysetfsgid(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsetfsgid(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysetfsuid(p0 *TLS, p1 Tuid_t) (ret int32)
TEXT ·Ysetfsuid(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsetfsuid(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysetgid(p0 *TLS, p1 Tgid_t) (ret int32)
TEXT ·Ysetgid(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsetgid(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysetgrent(p0 *TLS)
TEXT ·Ysetgrent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsetgrent(SB)
	RET

// func Ysethostent(p0 *TLS, p1 int32)
TEXT ·Ysethostent(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsethostent(SB)
	RET

// func Ysethostname(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ysethostname(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsethostname(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysetitimer(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ysetitimer(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsetitimer(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysetjmp(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ysetjmp(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsetjmp(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysetkey(p0 *TLS, p1 uintptr)
TEXT ·Ysetkey(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsetkey(SB)
	RET

// func Ysetlinebuf(p0 *TLS, p1 uintptr)
TEXT ·Ysetlinebuf(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsetlinebuf(SB)
	RET

// func Ysetlocale(p0 *TLS, p1 int32, p2 uintptr) (ret uintptr)
TEXT ·Ysetlocale(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsetlocale(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ysetlogmask(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ysetlogmask(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsetlogmask(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysetmntent(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ysetmntent(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsetmntent(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ysetnetent(p0 *TLS, p1 int32)
TEXT ·Ysetnetent(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsetnetent(SB)
	RET

// func Ysetns(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Ysetns(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xsetns(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysetpgid(p0 *TLS, p1 Tpid_t, p2 Tpid_t) (ret int32)
TEXT ·Ysetpgid(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xsetpgid(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysetpgrp(p0 *TLS) (ret Tpid_t)
TEXT ·Ysetpgrp(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsetpgrp(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ysetpriority(p0 *TLS, p1 int32, p2 Tid_t, p3 int32) (ret int32)
TEXT ·Ysetpriority(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xsetpriority(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysetprotoent(p0 *TLS, p1 int32)
TEXT ·Ysetprotoent(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsetprotoent(SB)
	RET

// func Ysetpwent(p0 *TLS)
TEXT ·Ysetpwent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsetpwent(SB)
	RET

// func Ysetrlimit(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ysetrlimit(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsetrlimit(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysetrlimit64(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ysetrlimit64(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsetrlimit64(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysetservent(p0 *TLS, p1 int32)
TEXT ·Ysetservent(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsetservent(SB)
	RET

// func Ysetsid(p0 *TLS) (ret Tpid_t)
TEXT ·Ysetsid(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsetsid(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Ysetsockopt(p0 *TLS, p1 int32, p2 int32, p3 int32, p4 uintptr, p5 Tsocklen_t) (ret int32)
TEXT ·Ysetsockopt(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p5+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xsetsockopt(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ysetspent(p0 *TLS)
TEXT ·Ysetspent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsetspent(SB)
	RET

// func Ysetstate(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ysetstate(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsetstate(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysettimeofday(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ysettimeofday(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsettimeofday(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysetuid(p0 *TLS, p1 Tuid_t) (ret int32)
TEXT ·Ysetuid(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsetuid(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysetusershell(p0 *TLS)
TEXT ·Ysetusershell(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsetusershell(SB)
	RET

// func Ysetutent(p0 *TLS)
TEXT ·Ysetutent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsetutent(SB)
	RET

// func Ysetutxent(p0 *TLS)
TEXT ·Ysetutxent(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsetutxent(SB)
	RET

// func Ysetvbuf(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32, p4 Tsize_t) (ret int32)
TEXT ·Ysetvbuf(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xsetvbuf(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ysetxattr(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr, p4 Tsize_t, p5 int32) (ret int32)
TEXT ·Ysetxattr(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVL p5+40(FP), AX
	MOVL AX, 40(SP)
	CALL ·Xsetxattr(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Yshm_open(p0 *TLS, p1 uintptr, p2 int32, p3 Tmode_t) (ret int32)
TEXT ·Yshm_open(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVL p3+20(FP), AX
	MOVL AX, 20(SP)
	CALL ·Xshm_open(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yshm_unlink(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yshm_unlink(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xshm_unlink(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yshmat(p0 *TLS, p1 int32, p2 uintptr, p3 int32) (ret uintptr)
TEXT ·Yshmat(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xshmat(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yshmctl(p0 *TLS, p1 int32, p2 int32, p3 uintptr) (ret int32)
TEXT ·Yshmctl(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xshmctl(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yshmdt(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yshmdt(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xshmdt(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yshmget(p0 *TLS, p1 Tkey_t, p2 Tsize_t, p3 int32) (ret int32)
TEXT ·Yshmget(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xshmget(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yshutdown(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Yshutdown(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xshutdown(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysigaction(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ysigaction(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsigaction(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysigaddset(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ysigaddset(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xsigaddset(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysigaltstack(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ysigaltstack(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsigaltstack(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysigandset(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ysigandset(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsigandset(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysigdelset(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ysigdelset(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xsigdelset(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysigemptyset(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ysigemptyset(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsigemptyset(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysigfillset(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ysigfillset(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsigfillset(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysigisemptyset(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ysigisemptyset(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsigisemptyset(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysigismember(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ysigismember(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xsigismember(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysignal(p0 *TLS, p1 int32, p2 uintptr) (ret uintptr)
TEXT ·Ysignal(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsignal(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ysignalfd(p0 *TLS, p1 int32, p2 uintptr, p3 int32) (ret int32)
TEXT ·Ysignalfd(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xsignalfd(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysignificand(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ysignificand(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsignificand(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysignificandf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ysignificandf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsignificandf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysigorset(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ysigorset(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsigorset(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysigpending(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ysigpending(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsigpending(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysigprocmask(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ysigprocmask(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsigprocmask(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysigqueue(p0 *TLS, p1 Tpid_t, p2 int32, p3 Tsigval) (ret int32)
TEXT ·Ysigqueue(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3_Fsival_int+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xsigqueue(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysigsuspend(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ysigsuspend(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsigsuspend(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysigtimedwait(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ysigtimedwait(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsigtimedwait(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysigwait(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ysigwait(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsigwait(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysigwaitinfo(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ysigwaitinfo(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsigwaitinfo(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysin(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ysin(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsin(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysincos(p0 *TLS, p1 float64, p2 uintptr, p3 uintptr)
TEXT ·Ysincos(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsincos(SB)
	RET

// func Ysincosf(p0 *TLS, p1 float32, p2 uintptr, p3 uintptr)
TEXT ·Ysincosf(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsincosf(SB)
	RET

// func Ysincosl(p0 *TLS, p1 float64, p2 uintptr, p3 uintptr)
TEXT ·Ysincosl(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsincosl(SB)
	RET

// func Ysinf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ysinf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsinf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysinh(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ysinh(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsinh(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysinhf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ysinhf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsinhf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysinhl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ysinhl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsinhl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysinl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ysinl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsinl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysleep(p0 *TLS, p1 uint32) (ret uint32)
TEXT ·Ysleep(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsleep(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysnprintf(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Ysnprintf(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xsnprintf(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ysockatmark(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ysockatmark(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsockatmark(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysocket(p0 *TLS, p1 int32, p2 int32, p3 int32) (ret int32)
TEXT ·Ysocket(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xsocket(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysocketpair(p0 *TLS, p1 int32, p2 int32, p3 int32, p4 uintptr) (ret int32)
TEXT ·Ysocketpair(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVL p3+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsocketpair(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysplice(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 uintptr, p5 Tsize_t, p6 uint32) (ret Tssize_t)
TEXT ·Ysplice(SB),$64-64
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	MOVL p6+48(FP), AX
	MOVL AX, 48(SP)
	CALL ·Xsplice(SB)
	MOVQ 56(SP), AX
	MOVQ AX, ret+56(FP)
	RET

// func Ysprintf(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ysprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysqrt(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ysqrt(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsqrt(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysqrtf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ysqrtf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsqrtf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysqrtl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ysqrtl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsqrtl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysrand(p0 *TLS, p1 uint32)
TEXT ·Ysrand(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsrand(SB)
	RET

// func Ysrand48(p0 *TLS, p1 int64)
TEXT ·Ysrand48(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsrand48(SB)
	RET

// func Ysrandom(p0 *TLS, p1 uint32)
TEXT ·Ysrandom(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsrandom(SB)
	RET

// func Ysscanf(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Ysscanf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsscanf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ystat(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ystat(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstat(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ystat64(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ystat64(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstat64(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ystatvfs(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ystatvfs(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstatvfs(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ystatx(p0 *TLS, p1 int32, p2 uintptr, p3 int32, p4 uint32, p5 uintptr) (ret int32)
TEXT ·Ystatx(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVL p4+28(FP), AX
	MOVL AX, 28(SP)
	MOVQ p5+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xstatx(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ystime(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ystime(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xstime(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ystpcpy(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ystpcpy(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstpcpy(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystpncpy(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ystpncpy(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstpncpy(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrcasecmp(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ystrcasecmp(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrcasecmp(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ystrcasecmp_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tlocale_t) (ret int32)
TEXT ·Ystrcasecmp_l(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrcasecmp_l(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ystrcasestr(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ystrcasestr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrcasestr(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrcat(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ystrcat(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrcat(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrchr(p0 *TLS, p1 uintptr, p2 int32) (ret uintptr)
TEXT ·Ystrchr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xstrchr(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrchrnul(p0 *TLS, p1 uintptr, p2 int32) (ret uintptr)
TEXT ·Ystrchrnul(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xstrchrnul(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrcmp(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ystrcmp(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrcmp(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ystrcoll(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ystrcoll(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrcoll(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ystrcoll_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tlocale_t) (ret int32)
TEXT ·Ystrcoll_l(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrcoll_l(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ystrcpy(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ystrcpy(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrcpy(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrcspn(p0 *TLS, p1 uintptr, p2 uintptr) (ret Tsize_t)
TEXT ·Ystrcspn(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrcspn(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrdup(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ystrdup(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xstrdup(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ystrerror(p0 *TLS, p1 int32) (ret uintptr)
TEXT ·Ystrerror(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xstrerror(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ystrerror_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret uintptr)
TEXT ·Ystrerror_l(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrerror_l(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrerror_r(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ystrerror_r(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrerror_r(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ystrfmon(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 uintptr) (ret Tssize_t)
TEXT ·Ystrfmon(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xstrfmon(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ystrfmon_l(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 Tlocale_t, p4 uintptr, p5 uintptr) (ret Tssize_t)
TEXT ·Ystrfmon_l(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xstrfmon_l(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ystrftime(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 uintptr) (ret Tsize_t)
TEXT ·Ystrftime(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xstrftime(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ystrftime_l(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 uintptr, p5 Tlocale_t) (ret Tsize_t)
TEXT ·Ystrftime_l(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xstrftime_l(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ystrlcat(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret Tsize_t)
TEXT ·Ystrlcat(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrlcat(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrlcpy(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret Tsize_t)
TEXT ·Ystrlcpy(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrlcpy(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrlen(p0 *TLS, p1 uintptr) (ret Tsize_t)
TEXT ·Ystrlen(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xstrlen(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ystrncasecmp(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ystrncasecmp(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrncasecmp(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ystrncasecmp_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 Tlocale_t) (ret int32)
TEXT ·Ystrncasecmp_l(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xstrncasecmp_l(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ystrncat(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ystrncat(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrncat(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrncmp(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ystrncmp(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrncmp(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ystrncpy(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ystrncpy(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrncpy(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrndup(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret uintptr)
TEXT ·Ystrndup(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrndup(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrnlen(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret Tsize_t)
TEXT ·Ystrnlen(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrnlen(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrpbrk(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ystrpbrk(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrpbrk(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrptime(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret uintptr)
TEXT ·Ystrptime(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrptime(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrrchr(p0 *TLS, p1 uintptr, p2 int32) (ret uintptr)
TEXT ·Ystrrchr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xstrrchr(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrsep(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ystrsep(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrsep(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrsignal(p0 *TLS, p1 int32) (ret uintptr)
TEXT ·Ystrsignal(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xstrsignal(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ystrspn(p0 *TLS, p1 uintptr, p2 uintptr) (ret Tsize_t)
TEXT ·Ystrspn(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrspn(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrstr(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ystrstr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrstr(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrtod(p0 *TLS, p1 uintptr, p2 uintptr) (ret float64)
TEXT ·Ystrtod(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrtod(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrtod_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tlocale_t) (ret float64)
TEXT ·Ystrtod_l(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrtod_l(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrtof(p0 *TLS, p1 uintptr, p2 uintptr) (ret float32)
TEXT ·Ystrtof(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrtof(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ystrtof_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tlocale_t) (ret float32)
TEXT ·Ystrtof_l(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrtof_l(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ystrtoimax(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret Tintmax_t)
TEXT ·Ystrtoimax(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xstrtoimax(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrtok(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ystrtok(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrtok(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrtok_r(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret uintptr)
TEXT ·Ystrtok_r(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrtok_r(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrtol(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret int64)
TEXT ·Ystrtol(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xstrtol(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrtold(p0 *TLS, p1 uintptr, p2 uintptr) (ret float64)
TEXT ·Ystrtold(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrtold(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ystrtold_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tlocale_t) (ret float64)
TEXT ·Ystrtold_l(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrtold_l(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrtoll(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret int64)
TEXT ·Ystrtoll(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xstrtoll(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrtoul(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret uint64)
TEXT ·Ystrtoul(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xstrtoul(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrtoull(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret uint64)
TEXT ·Ystrtoull(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xstrtoull(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrtoumax(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret Tuintmax_t)
TEXT ·Ystrtoumax(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xstrtoumax(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrverscmp(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ystrverscmp(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xstrverscmp(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ystrxfrm(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret Tsize_t)
TEXT ·Ystrxfrm(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xstrxfrm(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ystrxfrm_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 Tlocale_t) (ret Tsize_t)
TEXT ·Ystrxfrm_l(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xstrxfrm_l(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yswab(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tssize_t)
TEXT ·Yswab(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xswab(SB)
	RET

// func Yswapoff(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yswapoff(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xswapoff(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yswapon(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Yswapon(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xswapon(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yswprintf(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Yswprintf(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xswprintf(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yswscanf(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret int32)
TEXT ·Yswscanf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xswscanf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysymlink(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ysymlink(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsymlink(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ysymlinkat(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret int32)
TEXT ·Ysymlinkat(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsymlinkat(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ysync(p0 *TLS)
TEXT ·Ysync(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xsync(SB)
	RET

// func Ysync_file_range(p0 *TLS, p1 int32, p2 Toff_t, p3 Toff_t, p4 uint32) (ret int32)
TEXT ·Ysync_file_range(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xsync_file_range(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ysyncfs(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ysyncfs(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsyncfs(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysyscall(p0 *TLS, p1 int64, p2 uintptr) (ret int64)
TEXT ·Ysyscall(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xsyscall(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ysysconf(p0 *TLS, p1 int32) (ret int64)
TEXT ·Ysysconf(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xsysconf(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ysysctlbyname(p0 *TLS, p1 ,  p2 ,  p3 ,  p4 uintptr, p5 Tsize_t) (ret int32)
TEXT ·Ysysctlbyname(SB),$56-52
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xsysctlbyname(SB)
	MOVL 48(SP), AX
	MOVL AX, ret+48(FP)
	RET

// func Ysysinfo(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ysysinfo(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsysinfo(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ysyslog(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr)
TEXT ·Ysyslog(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xsyslog(SB)
	RET

// func Ysystem(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Ysystem(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xsystem(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytan(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ytan(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtan(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytanf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ytanf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtanf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytanh(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ytanh(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtanh(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytanhf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ytanhf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtanhf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytanhl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ytanhl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtanhl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytanl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ytanl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtanl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytcdrain(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ytcdrain(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtcdrain(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytcflow(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Ytcflow(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xtcflow(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytcflush(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Ytcflush(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xtcflush(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytcgetattr(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ytcgetattr(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtcgetattr(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytcgetpgrp(p0 *TLS, p1 int32) (ret Tpid_t)
TEXT ·Ytcgetpgrp(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtcgetpgrp(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytcgetsid(p0 *TLS, p1 int32) (ret Tpid_t)
TEXT ·Ytcgetsid(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtcgetsid(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytcgetwinsize(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ytcgetwinsize(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtcgetwinsize(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytcsendbreak(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Ytcsendbreak(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xtcsendbreak(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytcsetattr(p0 *TLS, p1 int32, p2 int32, p3 uintptr) (ret int32)
TEXT ·Ytcsetattr(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtcsetattr(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytcsetpgrp(p0 *TLS, p1 int32, p2 Tpid_t) (ret int32)
TEXT ·Ytcsetpgrp(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xtcsetpgrp(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytcsetwinsize(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ytcsetwinsize(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtcsetwinsize(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytdelete(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret uintptr)
TEXT ·Ytdelete(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xtdelete(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ytdestroy(p0 *TLS, p1 uintptr, p2 uintptr)
TEXT ·Ytdestroy(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtdestroy(SB)
	RET

// func Ytee(p0 *TLS, p1 int32, p2 int32, p3 Tsize_t, p4 uint32) (ret Tssize_t)
TEXT ·Ytee(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p4+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xtee(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ytelldir(p0 *TLS, p1 uintptr) (ret int64)
TEXT ·Ytelldir(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtelldir(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytempnam(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ytempnam(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtempnam(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ytextdomain(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ytextdomain(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtextdomain(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytfind(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret uintptr)
TEXT ·Ytfind(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xtfind(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ytgamma(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ytgamma(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtgamma(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytgammaf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ytgammaf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtgammaf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytgammal(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ytgammal(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtgammal(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytime(p0 *TLS, p1 uintptr) (ret Ttime_t)
TEXT ·Ytime(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtime(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytimegm(p0 *TLS, p1 uintptr) (ret Ttime_t)
TEXT ·Ytimegm(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtimegm(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytimer_delete(p0 *TLS, p1 Ttimer_t) (ret int32)
TEXT ·Ytimer_delete(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtimer_delete(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytimer_getoverrun(p0 *TLS, p1 Ttimer_t) (ret int32)
TEXT ·Ytimer_getoverrun(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtimer_getoverrun(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytimer_gettime(p0 *TLS, p1 Ttimer_t, p2 uintptr) (ret int32)
TEXT ·Ytimer_gettime(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtimer_gettime(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytimer_settime(p0 *TLS, p1 Ttimer_t, p2 int32, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Ytimer_settime(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xtimer_settime(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ytimerfd_create(p0 *TLS, p1 int32, p2 int32) (ret int32)
TEXT ·Ytimerfd_create(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xtimerfd_create(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytimerfd_gettime(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Ytimerfd_gettime(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtimerfd_gettime(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytimerfd_settime(p0 *TLS, p1 int32, p2 int32, p3 uintptr, p4 uintptr) (ret int32)
TEXT ·Ytimerfd_settime(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p4+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xtimerfd_settime(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ytimes(p0 *TLS, p1 uintptr) (ret Tclock_t)
TEXT ·Ytimes(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtimes(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytimespec_get(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Ytimespec_get(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xtimespec_get(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytmpfile(p0 *TLS) (ret uintptr)
TEXT ·Ytmpfile(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xtmpfile(SB)
	MOVQ 8(SP), AX
	MOVQ AX, ret+8(FP)
	RET

// func Ytmpnam(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ytmpnam(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtmpnam(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytoascii(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ytoascii(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtoascii(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytolower(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ytolower(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtolower(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytolower_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Ytolower_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtolower_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytoupper(p0 *TLS, p1 int32) (ret int32)
TEXT ·Ytoupper(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtoupper(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytoupper_l(p0 *TLS, p1 int32, p2 Tlocale_t) (ret int32)
TEXT ·Ytoupper_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtoupper_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytowctrans(p0 *TLS, p1 Twint_t, p2 Twctrans_t) (ret Twint_t)
TEXT ·Ytowctrans(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtowctrans(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytowctrans_l(p0 *TLS, p1 Twint_t, p2 Twctrans_t, p3 Tlocale_t) (ret Twint_t)
TEXT ·Ytowctrans_l(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xtowctrans_l(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ytowlower(p0 *TLS, p1 Twint_t) (ret Twint_t)
TEXT ·Ytowlower(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtowlower(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytowlower_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret Twint_t)
TEXT ·Ytowlower_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtowlower_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytowupper(p0 *TLS, p1 Twint_t) (ret Twint_t)
TEXT ·Ytowupper(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtowupper(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytowupper_l(p0 *TLS, p1 Twint_t, p2 Tlocale_t) (ret Twint_t)
TEXT ·Ytowupper_l(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtowupper_l(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytrunc(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ytrunc(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtrunc(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytruncate(p0 *TLS, p1 uintptr, p2 Toff_t) (ret int32)
TEXT ·Ytruncate(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtruncate(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ytruncf(p0 *TLS, p1 float32) (ret float32)
TEXT ·Ytruncf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xtruncf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ytruncl(p0 *TLS, p1 float64) (ret float64)
TEXT ·Ytruncl(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xtruncl(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ytsearch(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret uintptr)
TEXT ·Ytsearch(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xtsearch(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Yttyname(p0 *TLS, p1 int32) (ret uintptr)
TEXT ·Yttyname(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xttyname(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yttyname_r(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Yttyname_r(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xttyname_r(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ytwalk(p0 *TLS, p1 uintptr, p2 uintptr)
TEXT ·Ytwalk(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xtwalk(SB)
	RET

// func Ytzset(p0 *TLS)
TEXT ·Ytzset(SB),$8-8
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xtzset(SB)
	RET

// func Yualarm(p0 *TLS, p1 uint32, p2 uint32) (ret uint32)
TEXT ·Yualarm(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xualarm(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yulckpwdf(p0 *TLS) (ret int32)
TEXT ·Yulckpwdf(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xulckpwdf(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yulimit(p0 *TLS, p1 int32, p2 uintptr) (ret int64)
TEXT ·Yulimit(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xulimit(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yumask(p0 *TLS, p1 Tmode_t) (ret Tmode_t)
TEXT ·Yumask(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xumask(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yumount(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yumount(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xumount(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yumount2(p0 *TLS, p1 uintptr, p2 int32) (ret int32)
TEXT ·Yumount2(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xumount2(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yuname(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yuname(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xuname(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yungetc(p0 *TLS, p1 int32, p2 uintptr) (ret int32)
TEXT ·Yungetc(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xungetc(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yungetwc(p0 *TLS, p1 Twint_t, p2 uintptr) (ret Twint_t)
TEXT ·Yungetwc(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xungetwc(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yunlink(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yunlink(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xunlink(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yunlinkat(p0 *TLS, p1 int32, p2 uintptr, p3 int32) (ret int32)
TEXT ·Yunlinkat(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xunlinkat(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yunlockpt(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yunlockpt(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xunlockpt(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yunsetenv(p0 *TLS, p1 uintptr) (ret int32)
TEXT ·Yunsetenv(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xunsetenv(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yunshare(p0 *TLS, p1 int32) (ret int32)
TEXT ·Yunshare(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xunshare(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yupdwtmp(p0 *TLS, p1 uintptr, p2 uintptr)
TEXT ·Yupdwtmp(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xupdwtmp(SB)
	RET

// func Yupdwtmpx(p0 *TLS, p1 uintptr, p2 uintptr)
TEXT ·Yupdwtmpx(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xupdwtmpx(SB)
	RET

// func Yuselocale(p0 *TLS, p1 Tlocale_t) (ret Tlocale_t)
TEXT ·Yuselocale(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xuselocale(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yusleep(p0 *TLS, p1 uint32) (ret int32)
TEXT ·Yusleep(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xusleep(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yutime(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yutime(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xutime(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yutimensat(p0 *TLS, p1 int32, p2 uintptr, p3 uintptr, p4 int32) (ret int32)
TEXT ·Yutimensat(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xutimensat(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yutimes(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yutimes(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xutimes(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yuuid_copy(p0 *TLS, p1 ,  p2 uintptr)
TEXT ·Yuuid_copy(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xuuid_copy(SB)
	RET

// func Yuuid_generate_random(p0 *TLS, p1 uintptr)
TEXT ·Yuuid_generate_random(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xuuid_generate_random(SB)
	RET

// func Yuuid_parse(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yuuid_parse(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xuuid_parse(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yuuid_unparse(p0 *TLS, p1 ,  p2 uintptr)
TEXT ·Yuuid_unparse(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xuuid_unparse(SB)
	RET

// func Yvasprintf(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tva_list) (ret int32)
TEXT ·Yvasprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xvasprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yvdprintf(p0 *TLS, p1 int32, p2 uintptr, p3 Tva_list) (ret int32)
TEXT ·Yvdprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xvdprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yverr(p0 *TLS, p1 int32, p2 uintptr, p3 Tva_list)
TEXT ·Yverr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xverr(SB)
	RET

// func Yverrx(p0 *TLS, p1 int32, p2 uintptr, p3 Tva_list)
TEXT ·Yverrx(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xverrx(SB)
	RET

// func Yversionsort(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Yversionsort(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xversionsort(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yvfork(p0 *TLS) (ret Tpid_t)
TEXT ·Yvfork(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xvfork(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yvfprintf(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tva_list) (ret int32)
TEXT ·Yvfprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xvfprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yvfscanf(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tva_list) (ret int32)
TEXT ·Yvfscanf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xvfscanf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yvfwprintf(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tva_list) (ret int32)
TEXT ·Yvfwprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xvfwprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yvfwscanf(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tva_list) (ret int32)
TEXT ·Yvfwscanf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xvfwscanf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yvhangup(p0 *TLS) (ret int32)
TEXT ·Yvhangup(SB),$16-12
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	CALL ·Xvhangup(SB)
	MOVL 8(SP), AX
	MOVL AX, ret+8(FP)
	RET

// func Yvmsplice(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t, p4 uint32) (ret Tssize_t)
TEXT ·Yvmsplice(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVL p4+32(FP), AX
	MOVL AX, 32(SP)
	CALL ·Xvmsplice(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Yvprintf(p0 *TLS, p1 uintptr, p2 Tva_list) (ret int32)
TEXT ·Yvprintf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xvprintf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yvscanf(p0 *TLS, p1 uintptr, p2 Tva_list) (ret int32)
TEXT ·Yvscanf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xvscanf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yvsnprintf(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 Tva_list) (ret int32)
TEXT ·Yvsnprintf(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xvsnprintf(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yvsprintf(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tva_list) (ret int32)
TEXT ·Yvsprintf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xvsprintf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yvsscanf(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tva_list) (ret int32)
TEXT ·Yvsscanf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xvsscanf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yvswprintf(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 Tva_list) (ret int32)
TEXT ·Yvswprintf(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xvswprintf(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Yvswscanf(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tva_list) (ret int32)
TEXT ·Yvswscanf(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xvswscanf(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Yvwarn(p0 *TLS, p1 uintptr, p2 Tva_list)
TEXT ·Yvwarn(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xvwarn(SB)
	RET

// func Yvwarnx(p0 *TLS, p1 uintptr, p2 Tva_list)
TEXT ·Yvwarnx(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xvwarnx(SB)
	RET

// func Yvwprintf(p0 *TLS, p1 uintptr, p2 Tva_list) (ret int32)
TEXT ·Yvwprintf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xvwprintf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yvwscanf(p0 *TLS, p1 uintptr, p2 Tva_list) (ret int32)
TEXT ·Yvwscanf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xvwscanf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ywait(p0 *TLS, p1 uintptr) (ret Tpid_t)
TEXT ·Ywait(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xwait(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ywait3(p0 *TLS, p1 uintptr, p2 int32, p3 uintptr) (ret Tpid_t)
TEXT ·Ywait3(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwait3(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ywait4(p0 *TLS, p1 Tpid_t, p2 uintptr, p3 int32, p4 uintptr) (ret Tpid_t)
TEXT ·Ywait4(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xwait4(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ywaitid(p0 *TLS, p1 Tidtype_t, p2 Tid_t, p3 uintptr, p4 int32) (ret int32)
TEXT ·Ywaitid(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	MOVQ p3+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p4+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xwaitid(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ywaitpid(p0 *TLS, p1 Tpid_t, p2 uintptr, p3 int32) (ret Tpid_t)
TEXT ·Ywaitpid(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xwaitpid(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ywarn(p0 *TLS, p1 uintptr, p2 uintptr)
TEXT ·Ywarn(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwarn(SB)
	RET

// func Ywarnx(p0 *TLS, p1 uintptr, p2 uintptr)
TEXT ·Ywarnx(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwarnx(SB)
	RET

// func Ywcpcpy(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ywcpcpy(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcpcpy(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcpncpy(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ywcpncpy(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcpncpy(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcrtomb(p0 *TLS, p1 uintptr, p2 Twchar_t, p3 uintptr) (ret Tsize_t)
TEXT ·Ywcrtomb(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcrtomb(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcscasecmp(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ywcscasecmp(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcscasecmp(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ywcscasecmp_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tlocale_t) (ret int32)
TEXT ·Ywcscasecmp_l(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcscasecmp_l(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ywcscat(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ywcscat(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcscat(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcschr(p0 *TLS, p1 uintptr, p2 Twchar_t) (ret uintptr)
TEXT ·Ywcschr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xwcschr(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcscmp(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ywcscmp(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcscmp(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ywcscoll(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ywcscoll(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcscoll(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ywcscoll_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tlocale_t) (ret int32)
TEXT ·Ywcscoll_l(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcscoll_l(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ywcscpy(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ywcscpy(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcscpy(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcscspn(p0 *TLS, p1 uintptr, p2 uintptr) (ret Tsize_t)
TEXT ·Ywcscspn(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcscspn(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcsdup(p0 *TLS, p1 uintptr) (ret uintptr)
TEXT ·Ywcsdup(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xwcsdup(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ywcsftime(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 uintptr) (ret Tsize_t)
TEXT ·Ywcsftime(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xwcsftime(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ywcsftime_l(p0 *TLS, p1 uintptr, p2 Tsize_t, p3 uintptr, p4 uintptr, p5 Tlocale_t) (ret Tsize_t)
TEXT ·Ywcsftime_l(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xwcsftime_l(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ywcslen(p0 *TLS, p1 uintptr) (ret Tsize_t)
TEXT ·Ywcslen(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xwcslen(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ywcsncasecmp(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ywcsncasecmp(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcsncasecmp(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ywcsncasecmp_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 Tlocale_t) (ret int32)
TEXT ·Ywcsncasecmp_l(SB),$48-44
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xwcsncasecmp_l(SB)
	MOVL 40(SP), AX
	MOVL AX, ret+40(FP)
	RET

// func Ywcsncat(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ywcsncat(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcsncat(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcsncmp(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ywcsncmp(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcsncmp(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ywcsncpy(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ywcsncpy(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcsncpy(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcsnlen(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret Tsize_t)
TEXT ·Ywcsnlen(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcsnlen(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcsnrtombs(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 Tsize_t, p5 uintptr) (ret Tsize_t)
TEXT ·Ywcsnrtombs(SB),$56-56
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	MOVQ p5+40(FP), AX
	MOVQ AX, 40(SP)
	CALL ·Xwcsnrtombs(SB)
	MOVQ 48(SP), AX
	MOVQ AX, ret+48(FP)
	RET

// func Ywcspbrk(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ywcspbrk(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcspbrk(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcsrchr(p0 *TLS, p1 uintptr, p2 Twchar_t) (ret uintptr)
TEXT ·Ywcsrchr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xwcsrchr(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcsrtombs(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 uintptr) (ret Tsize_t)
TEXT ·Ywcsrtombs(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xwcsrtombs(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ywcsspn(p0 *TLS, p1 uintptr, p2 uintptr) (ret Tsize_t)
TEXT ·Ywcsspn(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcsspn(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcsstr(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ywcsstr(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcsstr(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcstod(p0 *TLS, p1 uintptr, p2 uintptr) (ret float64)
TEXT ·Ywcstod(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcstod(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcstof(p0 *TLS, p1 uintptr, p2 uintptr) (ret float32)
TEXT ·Ywcstof(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcstof(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ywcstoimax(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret Tintmax_t)
TEXT ·Ywcstoimax(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xwcstoimax(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcstok(p0 *TLS, p1 uintptr, p2 uintptr, p3 uintptr) (ret uintptr)
TEXT ·Ywcstok(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcstok(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcstol(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret int64)
TEXT ·Ywcstol(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xwcstol(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcstold(p0 *TLS, p1 uintptr, p2 uintptr) (ret float64)
TEXT ·Ywcstold(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcstold(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcstoll(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret int64)
TEXT ·Ywcstoll(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xwcstoll(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcstombs(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret Tsize_t)
TEXT ·Ywcstombs(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcstombs(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcstoul(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret uint64)
TEXT ·Ywcstoul(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xwcstoul(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcstoull(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret uint64)
TEXT ·Ywcstoull(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xwcstoull(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcstoumax(p0 *TLS, p1 uintptr, p2 uintptr, p3 int32) (ret Tuintmax_t)
TEXT ·Ywcstoumax(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xwcstoumax(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcswcs(p0 *TLS, p1 uintptr, p2 uintptr) (ret uintptr)
TEXT ·Ywcswcs(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcswcs(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcswidth(p0 *TLS, p1 uintptr, p2 Tsize_t) (ret int32)
TEXT ·Ywcswidth(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwcswidth(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ywcsxfrm(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret Tsize_t)
TEXT ·Ywcsxfrm(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwcsxfrm(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywcsxfrm_l(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t, p4 Tlocale_t) (ret Tsize_t)
TEXT ·Ywcsxfrm_l(SB),$48-48
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	MOVQ p4+32(FP), AX
	MOVQ AX, 32(SP)
	CALL ·Xwcsxfrm_l(SB)
	MOVQ 40(SP), AX
	MOVQ AX, ret+40(FP)
	RET

// func Ywctob(p0 *TLS, p1 Twint_t) (ret int32)
TEXT ·Ywctob(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xwctob(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ywctomb(p0 *TLS, p1 uintptr, p2 Twchar_t) (ret int32)
TEXT ·Ywctomb(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	CALL ·Xwctomb(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ywctrans(p0 *TLS, p1 uintptr) (ret Twctrans_t)
TEXT ·Ywctrans(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xwctrans(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ywctrans_l(p0 *TLS, p1 uintptr, p2 Tlocale_t) (ret Twctrans_t)
TEXT ·Ywctrans_l(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwctrans_l(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywctype(p0 *TLS, p1 uintptr) (ret Twctype_t)
TEXT ·Ywctype(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xwctype(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Ywctype_l(p0 *TLS, p1 uintptr, p2 Tlocale_t) (ret Twctype_t)
TEXT ·Ywctype_l(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwctype_l(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Ywcwidth(p0 *TLS, p1 Twchar_t) (ret int32)
TEXT ·Ywcwidth(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xwcwidth(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Ywmemchr(p0 *TLS, p1 uintptr, p2 Twchar_t, p3 Tsize_t) (ret uintptr)
TEXT ·Ywmemchr(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwmemchr(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywmemcmp(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret int32)
TEXT ·Ywmemcmp(SB),$40-36
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwmemcmp(SB)
	MOVL 32(SP), AX
	MOVL AX, ret+32(FP)
	RET

// func Ywmemcpy(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ywmemcpy(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwmemcpy(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywmemmove(p0 *TLS, p1 uintptr, p2 uintptr, p3 Tsize_t) (ret uintptr)
TEXT ·Ywmemmove(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwmemmove(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywmemset(p0 *TLS, p1 uintptr, p2 Twchar_t, p3 Tsize_t) (ret uintptr)
TEXT ·Ywmemset(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVL p2+16(FP), AX
	MOVL AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwmemset(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywprintf(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ywprintf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwprintf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Ywrite(p0 *TLS, p1 int32, p2 uintptr, p3 Tsize_t) (ret Tssize_t)
TEXT ·Ywrite(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVQ p3+24(FP), AX
	MOVQ AX, 24(SP)
	CALL ·Xwrite(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywritev(p0 *TLS, p1 int32, p2 uintptr, p3 int32) (ret Tssize_t)
TEXT ·Ywritev(SB),$40-40
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	MOVL p3+24(FP), AX
	MOVL AX, 24(SP)
	CALL ·Xwritev(SB)
	MOVQ 32(SP), AX
	MOVQ AX, ret+32(FP)
	RET

// func Ywscanf(p0 *TLS, p1 uintptr, p2 uintptr) (ret int32)
TEXT ·Ywscanf(SB),$32-28
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xwscanf(SB)
	MOVL 24(SP), AX
	MOVL AX, ret+24(FP)
	RET

// func Yy0(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yy0(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xy0(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yy0f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yy0f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xy0f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yy1(p0 *TLS, p1 float64) (ret float64)
TEXT ·Yy1(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·Xy1(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

// func Yy1f(p0 *TLS, p1 float32) (ret float32)
TEXT ·Yy1f(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	CALL ·Xy1f(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET

// func Yyn(p0 *TLS, p1 int32, p2 float64) (ret float64)
TEXT ·Yyn(SB),$32-32
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVQ p2+16(FP), AX
	MOVQ AX, 16(SP)
	CALL ·Xyn(SB)
	MOVQ 24(SP), AX
	MOVQ AX, ret+24(FP)
	RET

// func Yynf(p0 *TLS, p1 int32, p2 float32) (ret float32)
TEXT ·Yynf(SB),$24-20
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVL p1+8(FP), AX
	MOVL AX, 8(SP)
	MOVL p2+12(FP), AX
	MOVL AX, 12(SP)
	CALL ·Xynf(SB)
	MOVL 16(SP), AX
	MOVL AX, ret+16(FP)
	RET
