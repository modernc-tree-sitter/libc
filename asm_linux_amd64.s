// Code generated for linux/amd64 by 'genasm', DO NOT EDIT.

#include "textflag.h"

// func Ya64l(tls *TLS, s uintptr) (r int64)
TEXT ·Ya64l(SB),$24-40

// func Yabort(tls *TLS)
TEXT ·Yabort(SB),$8-8

// func Yabs(tls *TLS, a int32) (r int32)
TEXT ·Yabs(SB),$24-32

// func Yaccept(tls *TLS, fd int32, addr uintptr, len1 uintptr) (r1 int32)
TEXT ·Yaccept(SB),$40-68

// func Yaccept4(tls *TLS, fd int32, addr uintptr, len1 uintptr, flg int32) (r1 int32)
TEXT ·Yaccept4(SB),$48-80

// func Yaccess(tls *TLS, filename uintptr, amode int32) (r int32)
TEXT ·Yaccess(SB),$32-48

// func Yacct(tls *TLS, filename uintptr) (r int32)
TEXT ·Yacct(SB),$24-36

// func Yacos(tls *TLS, x float64) (r float64)
TEXT ·Yacos(SB),$24-40

// func Yacosf(tls *TLS, x float32) (r float32)
TEXT ·Yacosf(SB),$24-32

// func Yacosh(tls *TLS, x float64) (r float64)
TEXT ·Yacosh(SB),$24-40

// func Yacoshf(tls *TLS, x float32) (r float32)
TEXT ·Yacoshf(SB),$24-32

// func Yacoshl(tls *TLS, x float64) (r float64)
TEXT ·Yacoshl(SB),$24-40

// func Yacosl(tls *TLS, x float64) (r float64)
TEXT ·Yacosl(SB),$24-40

// func Yaddmntent(tls *TLS, f uintptr, mnt uintptr) (r int32)
TEXT ·Yaddmntent(SB),$32-52

// func Yadjtime(tls *TLS, in uintptr, out uintptr) (r int32)
TEXT ·Yadjtime(SB),$32-52

// func Yadjtimex(tls *TLS, tx uintptr) (r int32)
TEXT ·Yadjtimex(SB),$24-36

// func Yalarm(tls *TLS, seconds uint32) (r uint32)
TEXT ·Yalarm(SB),$24-32

// func Yalloca(tls *TLS, size Tsize_t) uintptr
TEXT ·Yalloca(SB),$24-40

// func Yalphasort(tls *TLS, a uintptr, b uintptr) (r int32)
TEXT ·Yalphasort(SB),$32-52

// func Yarch_prctl(tls *TLS, code int32, addr uint64) (r int32)
TEXT ·Yarch_prctl(SB),$32-52

// func Yasctime(tls *TLS, tm uintptr) (r uintptr)
TEXT ·Yasctime(SB),$24-40

// func Yasctime_r(tls *TLS, tm uintptr, buf uintptr) (r uintptr)
TEXT ·Yasctime_r(SB),$32-56

// func Yasin(tls *TLS, x float64) (r1 float64)
TEXT ·Yasin(SB),$24-40

// func Yasinf(tls *TLS, x float32) (r float32)
TEXT ·Yasinf(SB),$24-32

// func Yasinh(tls *TLS, x3 float64) (r float64)
TEXT ·Yasinh(SB),$24-40

// func Yasinhf(tls *TLS, x3 float32) (r float32)
TEXT ·Yasinhf(SB),$24-32

// func Yasinhl(tls *TLS, x float64) (r float64)
TEXT ·Yasinhl(SB),$24-40

// func Yasinl(tls *TLS, x float64) (r float64)
TEXT ·Yasinl(SB),$24-40

// func Yasprintf(tls *TLS, s uintptr, fmt uintptr, va uintptr) (r int32)
TEXT ·Yasprintf(SB),$40-68

// func Yat_quick_exit(tls *TLS, func1 uintptr) (r1 int32)
TEXT ·Yat_quick_exit(SB),$24-36

// func Yatan(tls *TLS, x3 float64) (r float64)
TEXT ·Yatan(SB),$24-40

// func Yatan2(tls *TLS, y float64, x float64) (r float64)
TEXT ·Yatan2(SB),$32-56

// func Yatan2f(tls *TLS, y float32, x float32) (r float32)
TEXT ·Yatan2f(SB),$24-36

// func Yatan2l(tls *TLS, y float64, x float64) (r float64)
TEXT ·Yatan2l(SB),$32-56

// func Yatanf(tls *TLS, x3 float32) (r float32)
TEXT ·Yatanf(SB),$24-32

// func Yatanh(tls *TLS, x3 float64) (r float64)
TEXT ·Yatanh(SB),$24-40

// func Yatanhf(tls *TLS, x3 float32) (r float32)
TEXT ·Yatanhf(SB),$24-32

// func Yatanhl(tls *TLS, x float64) (r float64)
TEXT ·Yatanhl(SB),$24-40

// func Yatanl(tls *TLS, x float64) (r float64)
TEXT ·Yatanl(SB),$24-40

// func Yatexit(tls *TLS, func_ uintptr) (r int32)
TEXT ·Yatexit(SB),$24-36

// func Yatof(tls *TLS, s uintptr) (r float64)
TEXT ·Yatof(SB),$24-40

// func Yatoi(tls *TLS, s uintptr) (r int32)
TEXT ·Yatoi(SB),$24-36

// func Yatol(tls *TLS, s uintptr) (r int64)
TEXT ·Yatol(SB),$24-40

// func Yatoll(tls *TLS, s uintptr) (r int64)
TEXT ·Yatoll(SB),$24-40

// func Ybacktrace(t *TLS, buf uintptr, size int32) int32
TEXT ·Ybacktrace(SB),$32-48

// func Ybacktrace_symbols_fd(t *TLS, buffer uintptr, size, fd int32)
TEXT ·Ybacktrace_symbols_fd(SB),$24-24

// func Ybasename(tls *TLS, s uintptr) (r uintptr)
TEXT ·Ybasename(SB),$24-40

// func Ybcmp(tls *TLS, s1 uintptr, s2 uintptr, n Tsize_t) (r int32)
TEXT ·Ybcmp(SB),$40-68

// func Ybcopy(tls *TLS, s1 uintptr, s2 uintptr, n Tsize_t)
TEXT ·Ybcopy(SB),$32-32

// func Ybind(tls *TLS, fd int32, addr uintptr, len1 Tsocklen_t) (r1 int32)
TEXT ·Ybind(SB),$40-64

// func Ybind_textdomain_codeset(tls *TLS, domainname uintptr, codeset uintptr) (r uintptr)
TEXT ·Ybind_textdomain_codeset(SB),$32-56

// func Ybindtextdomain(tls *TLS, domainname uintptr, dirname uintptr) (r uintptr)
TEXT ·Ybindtextdomain(SB),$32-56

// func Ybrk(tls *TLS, end uintptr) (r int32)
TEXT ·Ybrk(SB),$24-36

// func Ybsearch(tls *TLS, key uintptr, base uintptr, nel Tsize_t, width Tsize_t, cmp uintptr) (r uintptr)
TEXT ·Ybsearch(SB),$56-104

// func Ybtowc(tls *TLS, c int32) (r Twint_t)
TEXT ·Ybtowc(SB),$24-32

// func Ybzero(tls *TLS, s uintptr, n Tsize_t)
TEXT ·Ybzero(SB),$24-24

// func Yc16rtomb(tls *TLS, s uintptr, c16 Tchar16_t, ps uintptr) (r Tsize_t)
TEXT ·Yc16rtomb(SB),$40-72

// func Yc32rtomb(tls *TLS, s uintptr, c32 Tchar32_t, ps uintptr) (r Tsize_t)
TEXT ·Yc32rtomb(SB),$40-72

// func Ycabs(tls *TLS, z complex128) (r float64)
TEXT ·Ycabs(SB),$32-56

// func Ycabsf(tls *TLS, z complex64) (r float32)
TEXT ·Ycabsf(SB),$24-36

// func Ycabsl(tls *TLS, z complex128) (r float64)
TEXT ·Ycabsl(SB),$32-56

// func Ycacos(tls *TLS, z complex128) (r complex128)
TEXT ·Ycacos(SB),$40-64

// func Ycacosf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycacosf(SB),$24-40

// func Ycacosh(tls *TLS, z complex128) (r complex128)
TEXT ·Ycacosh(SB),$40-64

// func Ycacoshf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycacoshf(SB),$24-40

// func Ycacoshl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycacoshl(SB),$40-64

// func Ycacosl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycacosl(SB),$40-64

// func Ycalloc(tls *TLS, m Tsize_t, n Tsize_t) (r uintptr)
TEXT ·Ycalloc(SB),$32-56

// func Ycapget(tls *TLS, a uintptr, b uintptr) (r int32)
TEXT ·Ycapget(SB),$32-52

// func Ycapset(tls *TLS, a uintptr, b uintptr) (r int32)
TEXT ·Ycapset(SB),$32-52

// func Ycarg(tls *TLS, z complex128) (r float64)
TEXT ·Ycarg(SB),$32-56

// func Ycargf(tls *TLS, z complex64) (r float32)
TEXT ·Ycargf(SB),$24-36

// func Ycargl(tls *TLS, z complex128) (r float64)
TEXT ·Ycargl(SB),$32-56

// func Ycasin(tls *TLS, z complex128) (r1 complex128)
TEXT ·Ycasin(SB),$40-64

// func Ycasinf(tls *TLS, z complex64) (r1 complex64)
TEXT ·Ycasinf(SB),$24-40

// func Ycasinh(tls *TLS, z complex128) (r complex128)
TEXT ·Ycasinh(SB),$40-64

// func Ycasinhf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycasinhf(SB),$24-40

// func Ycasinhl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycasinhl(SB),$40-64

// func Ycasinl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycasinl(SB),$40-64

// func Ycatan(tls *TLS, z complex128) (r complex128)
TEXT ·Ycatan(SB),$40-64

// func Ycatanf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycatanf(SB),$24-40

// func Ycatanh(tls *TLS, z complex128) (r complex128)
TEXT ·Ycatanh(SB),$40-64

// func Ycatanhf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycatanhf(SB),$24-40

// func Ycatanhl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycatanhl(SB),$40-64

// func Ycatanl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycatanl(SB),$40-64

// func Ycatclose(tls *TLS, catd Tnl_catd) (r int32)
TEXT ·Ycatclose(SB),$24-36

// func Ycatgets(tls *TLS, catd Tnl_catd, set_id int32, msg_id int32, s uintptr) (r uintptr)
TEXT ·Ycatgets(SB),$40-72

// func Ycatopen(tls *TLS, name uintptr, oflag int32) (r Tnl_catd)
TEXT ·Ycatopen(SB),$32-52

// func Ycbrt(tls *TLS, x float64) (r1 float64)
TEXT ·Ycbrt(SB),$24-40

// func Ycbrtf(tls *TLS, x float32) (r1 float32)
TEXT ·Ycbrtf(SB),$24-32

// func Ycbrtl(tls *TLS, x float64) (r float64)
TEXT ·Ycbrtl(SB),$24-40

// func Yccos(tls *TLS, z complex128) (r complex128)
TEXT ·Yccos(SB),$40-64

// func Yccosf(tls *TLS, z complex64) (r complex64)
TEXT ·Yccosf(SB),$24-40

// func Yccosh(tls *TLS, z complex128) (r complex128)
TEXT ·Yccosh(SB),$40-64

// func Yccoshf(tls *TLS, z complex64) (r complex64)
TEXT ·Yccoshf(SB),$24-40

// func Yccoshl(tls *TLS, z complex128) (r complex128)
TEXT ·Yccoshl(SB),$40-64

// func Yccosl(tls *TLS, z complex128) (r complex128)
TEXT ·Yccosl(SB),$40-64

// func Yceil(tls *TLS, x3 float64) (r float64)
TEXT ·Yceil(SB),$24-40

// func Yceilf(tls *TLS, x3 float32) (r float32)
TEXT ·Yceilf(SB),$24-32

// func Yceill(tls *TLS, x float64) (r float64)
TEXT ·Yceill(SB),$24-40

// func Ycexp(tls *TLS, z complex128) (r complex128)
TEXT ·Ycexp(SB),$40-64

// func Ycexpf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycexpf(SB),$24-40

// func Ycexpl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycexpl(SB),$40-64

// func Ycfgetispeed(tls *TLS, tio uintptr) (r Tspeed_t)
TEXT ·Ycfgetispeed(SB),$24-36

// func Ycfgetospeed(tls *TLS, tio uintptr) (r Tspeed_t)
TEXT ·Ycfgetospeed(SB),$24-36

// func Ycfmakeraw(tls *TLS, t uintptr)
TEXT ·Ycfmakeraw(SB),$16-16

// func Ycfsetispeed(tls *TLS, tio uintptr, speed Tspeed_t) (r int32)
TEXT ·Ycfsetispeed(SB),$32-48

// func Ycfsetospeed(tls *TLS, tio uintptr, speed Tspeed_t) (r int32)
TEXT ·Ycfsetospeed(SB),$32-48

// func Ycfsetspeed(tls *TLS, tio uintptr, speed Tspeed_t) (r int32)
TEXT ·Ycfsetspeed(SB),$32-48

// func Ychdir(tls *TLS, path uintptr) (r int32)
TEXT ·Ychdir(SB),$24-36

// func Ychmod(tls *TLS, path uintptr, mode Tmode_t) (r int32)
TEXT ·Ychmod(SB),$32-48

// func Ychown(tls *TLS, path uintptr, uid Tuid_t, gid Tgid_t) (r int32)
TEXT ·Ychown(SB),$32-52

// func Ychroot(tls *TLS, path uintptr) (r int32)
TEXT ·Ychroot(SB),$24-36

// func Ycimag(tls *TLS, z complex128) (r float64)
TEXT ·Ycimag(SB),$32-56

// func Ycimagf(tls *TLS, z complex64) (r float32)
TEXT ·Ycimagf(SB),$24-36

// func Ycimagl(tls *TLS, z complex128) (r float64)
TEXT ·Ycimagl(SB),$32-56

// func Yclearenv(tls *TLS) (r int32)
TEXT ·Yclearenv(SB),$16-20

// func Yclearerr(tls *TLS, f uintptr)
TEXT ·Yclearerr(SB),$16-16

// func Yclearerr_unlocked(tls *TLS, f uintptr)
TEXT ·Yclearerr_unlocked(SB),$16-16

// func Yclock(tls *TLS) (r Tclock_t)
TEXT ·Yclock(SB),$16-24

// func Yclock_adjtime(tls *TLS, clock_id Tclockid_t, utx uintptr) (r1 int32)
TEXT ·Yclock_adjtime(SB),$32-52

// func Yclock_getcpuclockid(tls *TLS, pid Tpid_t, clk uintptr) (r int32)
TEXT ·Yclock_getcpuclockid(SB),$32-52

// func Yclock_getres(tls *TLS, clk Tclockid_t, ts uintptr) (r int32)
TEXT ·Yclock_getres(SB),$32-52

// func Yclock_gettime(tls *TLS, clk Tclockid_t, ts uintptr) (r int32)
TEXT ·Yclock_gettime(SB),$32-52

// func Yclock_nanosleep(tls *TLS, clk Tclockid_t, flags int32, req uintptr, rem uintptr) (r int32)
TEXT ·Yclock_nanosleep(SB),$40-68

// func Yclock_settime(tls *TLS, clk Tclockid_t, ts uintptr) (r int32)
TEXT ·Yclock_settime(SB),$32-52

// func Yclog(tls *TLS, z complex128) (r1 complex128)
TEXT ·Yclog(SB),$40-64

// func Yclogf(tls *TLS, z complex64) (r1 complex64)
TEXT ·Yclogf(SB),$24-40

// func Yclogl(tls *TLS, z complex128) (r complex128)
TEXT ·Yclogl(SB),$40-64

// func Yclose(tls *TLS, fd int32) (r1 int32)
TEXT ·Yclose(SB),$24-32

// func Yclosedir(tls *TLS, dir uintptr) (r int32)
TEXT ·Yclosedir(SB),$24-36

// func Ycloselog(tls *TLS)
TEXT ·Ycloselog(SB),$8-8

// func Yconfstr(tls *TLS, name int32, buf uintptr, len1 Tsize_t) (r Tsize_t)
TEXT ·Yconfstr(SB),$40-72

// func Yconj(tls *TLS, z complex128) (r complex128)
TEXT ·Yconj(SB),$40-64

// func Yconjf(tls *TLS, z complex64) (r complex64)
TEXT ·Yconjf(SB),$24-40

// func Yconjl(tls *TLS, z complex128) (r complex128)
TEXT ·Yconjl(SB),$40-64

// func Yconnect(tls *TLS, fd int32, addr uintptr, len1 Tsocklen_t) (r1 int32)
TEXT ·Yconnect(SB),$40-64

// func Ycopy_file_range(tls *TLS, fd_in int32, off_in uintptr, fd_out int32, off_out uintptr, len1 Tsize_t, flags uint32) (r Tssize_t)
TEXT ·Ycopy_file_range(SB),$64-116

// func Ycopysign(tls *TLS, x float64, y float64) (r float64)
TEXT ·Ycopysign(SB),$32-56

// func Ycopysignf(tls *TLS, x float32, y float32) (r float32)
TEXT ·Ycopysignf(SB),$24-36

// func Ycopysignl(tls *TLS, x float64, y float64) (r float64)
TEXT ·Ycopysignl(SB),$32-56

// func Ycos(tls *TLS, x3 float64) (r float64)
TEXT ·Ycos(SB),$24-40

// func Ycosf(tls *TLS, x3 float32) (r float32)
TEXT ·Ycosf(SB),$24-32

// func Ycosh(tls *TLS, x3 float64) (r float64)
TEXT ·Ycosh(SB),$24-40

// func Ycoshf(tls *TLS, x3 float32) (r float32)
TEXT ·Ycoshf(SB),$24-32

// func Ycoshl(tls *TLS, x float64) (r float64)
TEXT ·Ycoshl(SB),$24-40

// func Ycosl(tls *TLS, x float64) (r float64)
TEXT ·Ycosl(SB),$24-40

// func Ycpow(tls *TLS, z complex128, c complex128) (r complex128)
TEXT ·Ycpow(SB),$56-96

// func Ycpowf(tls *TLS, z complex64, c complex64) (r complex64)
TEXT ·Ycpowf(SB),$32-56

// func Ycpowl(tls *TLS, z complex128, c complex128) (r complex128)
TEXT ·Ycpowl(SB),$56-96

// func Ycproj(tls *TLS, z complex128) (r complex128)
TEXT ·Ycproj(SB),$40-64

// func Ycprojf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycprojf(SB),$24-40

// func Ycprojl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycprojl(SB),$40-64

// func Ycreal(tls *TLS, z complex128) (r float64)
TEXT ·Ycreal(SB),$32-56

// func Ycrealf(tls *TLS, z complex64) (r float32)
TEXT ·Ycrealf(SB),$24-36

// func Ycreall(tls *TLS, z complex128) (r float64)
TEXT ·Ycreall(SB),$32-56

// func Ycreat(tls *TLS, filename uintptr, mode Tmode_t) (r int32)
TEXT ·Ycreat(SB),$32-48

// func Ycrypt(tls *TLS, key uintptr, salt uintptr) (r uintptr)
TEXT ·Ycrypt(SB),$32-56

// func Ycrypt_r(tls *TLS, key uintptr, salt uintptr, data uintptr) (r uintptr)
TEXT ·Ycrypt_r(SB),$40-72

// func Ycsin(tls *TLS, z complex128) (r complex128)
TEXT ·Ycsin(SB),$40-64

// func Ycsinf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycsinf(SB),$24-40

// func Ycsinh(tls *TLS, z complex128) (r complex128)
TEXT ·Ycsinh(SB),$40-64

// func Ycsinhf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycsinhf(SB),$24-40

// func Ycsinhl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycsinhl(SB),$40-64

// func Ycsinl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycsinl(SB),$40-64

// func Ycsqrt(tls *TLS, z complex128) (r complex128)
TEXT ·Ycsqrt(SB),$40-64

// func Ycsqrtf(tls *TLS, z complex64) (r complex64)
TEXT ·Ycsqrtf(SB),$24-40

// func Ycsqrtl(tls *TLS, z complex128) (r complex128)
TEXT ·Ycsqrtl(SB),$40-64

// func Yctan(tls *TLS, z complex128) (r complex128)
TEXT ·Yctan(SB),$40-64

// func Yctanf(tls *TLS, z complex64) (r complex64)
TEXT ·Yctanf(SB),$24-40

// func Yctanh(tls *TLS, z complex128) (r complex128)
TEXT ·Yctanh(SB),$40-64

// func Yctanhf(tls *TLS, z complex64) (r complex64)
TEXT ·Yctanhf(SB),$24-40

// func Yctanhl(tls *TLS, z complex128) (r complex128)
TEXT ·Yctanhl(SB),$40-64

// func Yctanl(tls *TLS, z complex128) (r complex128)
TEXT ·Yctanl(SB),$40-64

// func Yctermid(tls *TLS, s uintptr) (r uintptr)
TEXT ·Yctermid(SB),$24-40

// func Yctime(tls *TLS, t uintptr) (r uintptr)
TEXT ·Yctime(SB),$24-40

// func Yctime_r(tls *TLS, t uintptr, buf uintptr) (r uintptr)
TEXT ·Yctime_r(SB),$32-56

// func Ycuserid(tls *TLS, buf uintptr) (r uintptr)
TEXT ·Ycuserid(SB),$24-40

// func Ydcgettext(tls *TLS, domainname uintptr, msgid uintptr, category int32) (r uintptr)
TEXT ·Ydcgettext(SB),$40-68

// func Ydcngettext(tls *TLS, domainname uintptr, msgid1 uintptr, msgid2 uintptr, n uint64, category int32) (r1 uintptr)
TEXT ·Ydcngettext(SB),$56-100

// func Ydelete_module(tls *TLS, a uintptr, b uint32) (r int32)
TEXT ·Ydelete_module(SB),$32-48

// func Ydgettext(tls *TLS, domainname uintptr, msgid uintptr) (r uintptr)
TEXT ·Ydgettext(SB),$32-56

// func Ydifftime(tls *TLS, t1 Ttime_t, t0 Ttime_t) (r float64)
TEXT ·Ydifftime(SB),$32-56

// func Ydirfd(tls *TLS, d uintptr) (r int32)
TEXT ·Ydirfd(SB),$24-36

// func Ydirname(tls *TLS, s uintptr) (r uintptr)
TEXT ·Ydirname(SB),$24-40

// func Ydiv(tls *TLS, num int32, den int32) (r Tdiv_t)
TEXT ·Ydiv(SB),$24-40

// func Ydlclose(t *TLS, handle uintptr) int32
TEXT ·Ydlclose(SB),$24-36

// func Ydlerror(t *TLS) uintptr
TEXT ·Ydlerror(SB),$16-24

// func Ydlopen(t *TLS, filename uintptr, flags int32) uintptr
TEXT ·Ydlopen(SB),$32-52

// func Ydlsym(t *TLS, handle, symbol uintptr) uintptr
TEXT ·Ydlsym(SB),$32-56

// func Ydn_comp(tls *TLS, src uintptr, dst uintptr, space int32, dnptrs uintptr, lastdnptr uintptr) (r int32)
TEXT ·Ydn_comp(SB),$56-100

// func Ydn_expand(tls *TLS, base uintptr, end uintptr, src uintptr, dest uintptr, space int32) (r int32)
TEXT ·Ydn_expand(SB),$56-96

// func Ydn_skipname(tls *TLS, s uintptr, end uintptr) (r int32)
TEXT ·Ydn_skipname(SB),$32-52

// func Ydngettext(tls *TLS, domainname uintptr, msgid1 uintptr, msgid2 uintptr, n uint64) (r uintptr)
TEXT ·Ydngettext(SB),$48-88

// func Ydprintf(tls *TLS, fd int32, fmt uintptr, va uintptr) (r int32)
TEXT ·Ydprintf(SB),$40-68

// func Ydrand48(tls *TLS) (r float64)
TEXT ·Ydrand48(SB),$16-24

// func Ydrem(tls *TLS, x float64, y float64) (r float64)
TEXT ·Ydrem(SB),$32-56

// func Ydremf(tls *TLS, x float32, y float32) (r float32)
TEXT ·Ydremf(SB),$24-36

// func Ydup(tls *TLS, fd int32) (r int32)
TEXT ·Ydup(SB),$24-32

// func Ydup2(tls *TLS, old int32, new1 int32) (r1 int32)
TEXT ·Ydup2(SB),$24-36

// func Ydup3(tls *TLS, old int32, new1 int32, flags int32) (r int32)
TEXT ·Ydup3(SB),$32-48

// func Yduplocale(tls *TLS, old Tlocale_t) (r Tlocale_t)
TEXT ·Yduplocale(SB),$24-40

// func Yeaccess(tls *TLS, filename uintptr, amode int32) (r int32)
TEXT ·Yeaccess(SB),$32-48

// func Yecvt(tls *TLS, x float64, n int32, dp uintptr, sign uintptr) (r uintptr)
TEXT ·Yecvt(SB),$48-88

// func Yencrypt(tls *TLS, block uintptr, edflag int32)
TEXT ·Yencrypt(SB),$24-20

// func Yendgrent(tls *TLS)
TEXT ·Yendgrent(SB),$8-8

// func Yendhostent(tls *TLS)
TEXT ·Yendhostent(SB),$8-8

// func Yendmntent(tls *TLS, f uintptr) (r int32)
TEXT ·Yendmntent(SB),$24-36

// func Yendnetent(tls *TLS)
TEXT ·Yendnetent(SB),$8-8

// func Yendprotoent(tls *TLS)
TEXT ·Yendprotoent(SB),$8-8

// func Yendpwent(tls *TLS)
TEXT ·Yendpwent(SB),$8-8

// func Yendservent(tls *TLS)
TEXT ·Yendservent(SB),$8-8

// func Yendspent(tls *TLS)
TEXT ·Yendspent(SB),$8-8

// func Yendusershell(tls *TLS)
TEXT ·Yendusershell(SB),$8-8

// func Yendutent(tls *TLS)
TEXT ·Yendutent(SB),$8-8

// func Yendutxent(tls *TLS)
TEXT ·Yendutxent(SB),$8-8

// func Yepoll_create(tls *TLS, size int32) (r int32)
TEXT ·Yepoll_create(SB),$24-32

// func Yepoll_create1(tls *TLS, flags int32) (r1 int32)
TEXT ·Yepoll_create1(SB),$24-32

// func Yepoll_ctl(tls *TLS, fd int32, op int32, fd2 int32, ev uintptr) (r int32)
TEXT ·Yepoll_ctl(SB),$40-68

// func Yepoll_pwait(tls *TLS, fd int32, ev uintptr, cnt int32, to int32, sigs uintptr) (r1 int32)
TEXT ·Yepoll_pwait(SB),$48-84

// func Yepoll_wait(tls *TLS, fd int32, ev uintptr, cnt int32, to int32) (r int32)
TEXT ·Yepoll_wait(SB),$40-68

// func Yerand48(tls *TLS, s uintptr) (r float64)
TEXT ·Yerand48(SB),$24-40

// func Yerf(tls *TLS, x float64) (r1 float64)
TEXT ·Yerf(SB),$24-40

// func Yerfc(tls *TLS, x float64) (r1 float64)
TEXT ·Yerfc(SB),$24-40

// func Yerfcf(tls *TLS, x float32) (r1 float32)
TEXT ·Yerfcf(SB),$24-32

// func Yerfcl(tls *TLS, x float64) (r float64)
TEXT ·Yerfcl(SB),$24-40

// func Yerff(tls *TLS, x float32) (r1 float32)
TEXT ·Yerff(SB),$24-32

// func Yerfl(tls *TLS, x float64) (r float64)
TEXT ·Yerfl(SB),$24-40

// func Yerr(tls *TLS, status int32, fmt uintptr, va uintptr)
TEXT ·Yerr(SB),$32-32

// func Yerrx(tls *TLS, status int32, fmt uintptr, va uintptr)
TEXT ·Yerrx(SB),$32-32

// func Yether_aton(tls *TLS, x uintptr) (r uintptr)
TEXT ·Yether_aton(SB),$24-40

// func Yether_aton_r(tls *TLS, x uintptr, p_a uintptr) (r uintptr)
TEXT ·Yether_aton_r(SB),$32-56

// func Yether_hostton(tls *TLS, hostname uintptr, e uintptr) (r int32)
TEXT ·Yether_hostton(SB),$32-52

// func Yether_line(tls *TLS, l uintptr, e uintptr, hostname uintptr) (r int32)
TEXT ·Yether_line(SB),$40-68

// func Yether_ntoa(tls *TLS, p_a uintptr) (r uintptr)
TEXT ·Yether_ntoa(SB),$24-40

// func Yether_ntoa_r(tls *TLS, p_a uintptr, x uintptr) (r uintptr)
TEXT ·Yether_ntoa_r(SB),$32-56

// func Yether_ntohost(tls *TLS, hostname uintptr, e uintptr) (r int32)
TEXT ·Yether_ntohost(SB),$32-52

// func Yeuidaccess(tls *TLS, filename uintptr, amode int32) (r int32)
TEXT ·Yeuidaccess(SB),$32-48

// func Yeventfd(tls *TLS, count uint32, flags int32) (r1 int32)
TEXT ·Yeventfd(SB),$24-36

// func Yeventfd_read(tls *TLS, fd int32, value uintptr) (r int32)
TEXT ·Yeventfd_read(SB),$32-52

// func Yeventfd_write(tls *TLS, fd int32, _value Teventfd_t) (r int32)
TEXT ·Yeventfd_write(SB),$32-52

// func Yexecl(tls *TLS, path uintptr, argv0 uintptr, va uintptr) (r int32)
TEXT ·Yexecl(SB),$40-68

// func Yexecle(tls *TLS, path uintptr, argv0 uintptr, va uintptr) (r int32)
TEXT ·Yexecle(SB),$40-68

// func Yexeclp(tls *TLS, file uintptr, argv0 uintptr, va uintptr) (r int32)
TEXT ·Yexeclp(SB),$40-68

// func Yexecv(tls *TLS, path uintptr, argv uintptr) (r int32)
TEXT ·Yexecv(SB),$32-52

// func Yexecve(tls *TLS, path uintptr, argv uintptr, envp uintptr) (r int32)
TEXT ·Yexecve(SB),$40-68

// func Yexecvp(tls *TLS, file uintptr, argv uintptr) (r int32)
TEXT ·Yexecvp(SB),$32-52

// func Yexecvpe(tls *TLS, file uintptr, argv uintptr, envp uintptr) (r int32)
TEXT ·Yexecvpe(SB),$40-68

// func Yexit(tls *TLS, code int32)
TEXT ·Yexit(SB),$16-12

// func Yexp(tls *TLS, x1 float64) (r1 float64)
TEXT ·Yexp(SB),$24-40

// func Yexp10(tls *TLS, x float64) (r float64)
TEXT ·Yexp10(SB),$24-40

// func Yexp10f(tls *TLS, x float32) (r float32)
TEXT ·Yexp10f(SB),$24-32

// func Yexp10l(tls *TLS, x float64) (r float64)
TEXT ·Yexp10l(SB),$24-40

// func Yexp2(tls *TLS, x1 float64) (r1 float64)
TEXT ·Yexp2(SB),$24-40

// func Yexp2f(tls *TLS, x2 float32) (r1 float32)
TEXT ·Yexp2f(SB),$24-32

// func Yexp2l(tls *TLS, x float64) (r float64)
TEXT ·Yexp2l(SB),$24-40

// func Yexpf(tls *TLS, x2 float32) (r1 float32)
TEXT ·Yexpf(SB),$24-32

// func Yexpl(tls *TLS, x float64) (r float64)
TEXT ·Yexpl(SB),$24-40

// func Yexplicit_bzero(tls *TLS, d uintptr, n Tsize_t)
TEXT ·Yexplicit_bzero(SB),$24-24

// func Yexpm1(tls *TLS, x3 float64) (r float64)
TEXT ·Yexpm1(SB),$24-40

// func Yexpm1f(tls *TLS, x3 float32) (r float32)
TEXT ·Yexpm1f(SB),$24-32

// func Yexpm1l(tls *TLS, x float64) (r float64)
TEXT ·Yexpm1l(SB),$24-40

// func Yfabs(tls *TLS, x float64) (r float64)
TEXT ·Yfabs(SB),$24-40

// func Yfabsf(tls *TLS, x float32) (r float32)
TEXT ·Yfabsf(SB),$24-32

// func Yfabsl(tls *TLS, x float64) (r float64)
TEXT ·Yfabsl(SB),$24-40

// func Yfaccessat(tls *TLS, fd int32, filename uintptr, amode int32, flag int32) (r int32)
TEXT ·Yfaccessat(SB),$40-68

// func Yfallocate(tls *TLS, fd int32, mode int32, base Toff_t, len1 Toff_t) (r int32)
TEXT ·Yfallocate(SB),$40-68

// func Yfanotify_init(tls *TLS, flags uint32, event_f_flags uint32) (r int32)
TEXT ·Yfanotify_init(SB),$24-36

// func Yfanotify_mark(tls *TLS, fanotify_fd int32, flags uint32, mask uint64, dfd int32, pathname uintptr) (r int32)
TEXT ·Yfanotify_mark(SB),$48-84

// func Yfchdir(tls *TLS, fd int32) (r int32)
TEXT ·Yfchdir(SB),$24-32

// func Yfchmod(tls *TLS, fd int32, mode Tmode_t) (r int32)
TEXT ·Yfchmod(SB),$24-36

// func Yfchmodat(tls *TLS, fd int32, path uintptr, mode Tmode_t, flag int32) (r int32)
TEXT ·Yfchmodat(SB),$40-68

// func Yfchown(tls *TLS, fd int32, uid Tuid_t, gid Tgid_t) (r int32)
TEXT ·Yfchown(SB),$32-48

// func Yfchownat(tls *TLS, fd int32, path uintptr, uid Tuid_t, gid Tgid_t, flag int32) (r int32)
TEXT ·Yfchownat(SB),$48-80

// func Yfclose(tls *TLS, f uintptr) (r1 int32)
TEXT ·Yfclose(SB),$24-36

// func Yfcntl(tls *TLS, fd int32, cmd int32, va uintptr) (r int32)
TEXT ·Yfcntl(SB),$32-52

// func Yfcntl64(tls *TLS, fd int32, cmd int32, va uintptr) (r int32)
TEXT ·Yfcntl64(SB),$32-52

// func Yfcvt(tls *TLS, x float64, n int32, dp uintptr, sign uintptr) (r uintptr)
TEXT ·Yfcvt(SB),$48-88

// func Yfdatasync(tls *TLS, fd int32) (r int32)
TEXT ·Yfdatasync(SB),$24-32

// func Yfdim(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yfdim(SB),$32-56

// func Yfdimf(tls *TLS, x float32, y float32) (r float32)
TEXT ·Yfdimf(SB),$24-36

// func Yfdiml(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yfdiml(SB),$32-56

// func Yfdopen(tls *TLS, fd int32, mode uintptr) (r uintptr)
TEXT ·Yfdopen(SB),$32-56

// func Yfdopendir(tls *TLS, fd int32) (r uintptr)
TEXT ·Yfdopendir(SB),$24-36

// func Yfeclearexcept(tls *TLS, mask int32) (r int32)
TEXT ·Yfeclearexcept(SB),$24-32

// func Yfegetenv(tls *TLS, envp uintptr) (r int32)
TEXT ·Yfegetenv(SB),$24-36

// func Yfegetround(tls *TLS) (r int32)
TEXT ·Yfegetround(SB),$16-20

// func Yfeof(tls *TLS, f uintptr) (r int32)
TEXT ·Yfeof(SB),$24-36

// func Yfeof_unlocked(tls *TLS, f uintptr) (r int32)
TEXT ·Yfeof_unlocked(SB),$24-36

// func Yferaiseexcept(tls *TLS, mask int32) (r int32)
TEXT ·Yferaiseexcept(SB),$24-32

// func Yferror(tls *TLS, f uintptr) (r int32)
TEXT ·Yferror(SB),$24-36

// func Yferror_unlocked(tls *TLS, f uintptr) (r int32)
TEXT ·Yferror_unlocked(SB),$24-36

// func Yfesetenv(tls *TLS, envp uintptr) (r int32)
TEXT ·Yfesetenv(SB),$24-36

// func Yfetestexcept(tls *TLS, mask int32) (r int32)
TEXT ·Yfetestexcept(SB),$24-32

// func Yfexecve(tls *TLS, fd int32, argv uintptr, envp uintptr) (r1 int32)
TEXT ·Yfexecve(SB),$40-68

// func Yfflush(tls *TLS, f uintptr) (r1 int32)
TEXT ·Yfflush(SB),$24-36

// func Yfflush_unlocked(tls *TLS, f uintptr) (r int32)
TEXT ·Yfflush_unlocked(SB),$24-36

// func Yffs(tls *TLS, i int32) (r int32)
TEXT ·Yffs(SB),$24-32

// func Yffsl(tls *TLS, i int64) (r int32)
TEXT ·Yffsl(SB),$24-36

// func Yffsll(tls *TLS, i int64) (r int32)
TEXT ·Yffsll(SB),$24-36

// func Yfgetc(tls *TLS, f1 uintptr) (r int32)
TEXT ·Yfgetc(SB),$24-36

// func Yfgetc_unlocked(tls *TLS, f uintptr) (r int32)
TEXT ·Yfgetc_unlocked(SB),$24-36

// func Yfgetgrent(tls *TLS, f uintptr) (r uintptr)
TEXT ·Yfgetgrent(SB),$24-40

// func Yfgetln(tls *TLS, f uintptr, plen uintptr) (r uintptr)
TEXT ·Yfgetln(SB),$32-56

// func Yfgetpos(tls *TLS, f uintptr, pos uintptr) (r int32)
TEXT ·Yfgetpos(SB),$32-52

// func Yfgetpwent(tls *TLS, f uintptr) (r uintptr)
TEXT ·Yfgetpwent(SB),$24-40

// func Yfgets(tls *TLS, s uintptr, n int32, f uintptr) (r uintptr)
TEXT ·Yfgets(SB),$40-72

// func Yfgets_unlocked(tls *TLS, s uintptr, n int32, f uintptr) (r uintptr)
TEXT ·Yfgets_unlocked(SB),$40-72

// func Yfgetwc(tls *TLS, f uintptr) (r Twint_t)
TEXT ·Yfgetwc(SB),$24-36

// func Yfgetwc_unlocked(tls *TLS, f uintptr) (r Twint_t)
TEXT ·Yfgetwc_unlocked(SB),$24-36

// func Yfgetws(tls *TLS, s uintptr, n int32, f uintptr) (r uintptr)
TEXT ·Yfgetws(SB),$40-72

// func Yfgetws_unlocked(tls *TLS, s uintptr, n int32, f uintptr) (r uintptr)
TEXT ·Yfgetws_unlocked(SB),$40-72

// func Yfgetxattr(tls *TLS, filedes int32, name uintptr, value uintptr, size Tsize_t) (r Tssize_t)
TEXT ·Yfgetxattr(SB),$48-88

// func Yfileno(tls *TLS, f uintptr) (r int32)
TEXT ·Yfileno(SB),$24-36

// func Yfileno_unlocked(tls *TLS, f uintptr) (r int32)
TEXT ·Yfileno_unlocked(SB),$24-36

// func Yfinite(tls *TLS, x float64) (r int32)
TEXT ·Yfinite(SB),$24-36

// func Yfinitef(tls *TLS, x float32) (r int32)
TEXT ·Yfinitef(SB),$24-32

// func Yflistxattr(tls *TLS, filedes int32, list uintptr, size Tsize_t) (r Tssize_t)
TEXT ·Yflistxattr(SB),$40-72

// func Yflock(tls *TLS, fd int32, op int32) (r int32)
TEXT ·Yflock(SB),$24-36

// func Yflockfile(tls *TLS, f uintptr)
TEXT ·Yflockfile(SB),$16-16

// func Yfloor(tls *TLS, x3 float64) (r float64)
TEXT ·Yfloor(SB),$24-40

// func Yfloorf(tls *TLS, x3 float32) (r float32)
TEXT ·Yfloorf(SB),$24-32

// func Yfloorl(tls *TLS, x float64) (r float64)
TEXT ·Yfloorl(SB),$24-40

// func Yfma(tls *TLS, x1 float64, y float64, z float64) (r1 float64)
TEXT ·Yfma(SB),$40-72

// func Yfmal(tls *TLS, x float64, y float64, z float64) (r float64)
TEXT ·Yfmal(SB),$40-72

// func Yfmax(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yfmax(SB),$32-56

// func Yfmaxf(tls *TLS, x float32, y float32) (r float32)
TEXT ·Yfmaxf(SB),$24-36

// func Yfmaxl(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yfmaxl(SB),$32-56

// func Yfmemopen(tls *TLS, buf uintptr, size Tsize_t, mode uintptr) (r uintptr)
TEXT ·Yfmemopen(SB),$40-72

// func Yfmin(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yfmin(SB),$32-56

// func Yfminf(tls *TLS, x float32, y float32) (r float32)
TEXT ·Yfminf(SB),$24-36

// func Yfminl(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yfminl(SB),$32-56

// func Yfmod(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yfmod(SB),$32-56

// func Yfmodf(tls *TLS, x float32, y float32) (r float32)
TEXT ·Yfmodf(SB),$24-36

// func Yfmodl(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yfmodl(SB),$32-56

// func Yfmtmsg(tls *TLS, classification int64, label uintptr, severity int32, text uintptr, action uintptr, tag uintptr) (r int32)
TEXT ·Yfmtmsg(SB),$64-116

// func Yfnmatch(tls *TLS, pat uintptr, str uintptr, flags int32) (r int32)
TEXT ·Yfnmatch(SB),$40-64

// func Yfopen(tls *TLS, filename uintptr, mode uintptr) (r uintptr)
TEXT ·Yfopen(SB),$32-56

// func Yfopen64(tls *TLS, filename uintptr, mode uintptr) (r uintptr)
TEXT ·Yfopen64(SB),$32-56

// func Yfopencookie(tls *TLS, cookie uintptr, mode uintptr, iofuncs Tcookie_io_functions_t) (r uintptr)
TEXT ·Yfopencookie(SB),$64-120

// func Yfork(t *TLS) int32
TEXT ·Yfork(SB),$16-20

// func Yfpathconf(tls *TLS, fd int32, name int32) (r int64)
TEXT ·Yfpathconf(SB),$24-40

// func Yfprintf(tls *TLS, f uintptr, fmt uintptr, va uintptr) (r int32)
TEXT ·Yfprintf(SB),$40-68

// func Yfpurge(tls *TLS, f uintptr) (r int32)
TEXT ·Yfpurge(SB),$24-36

// func Yfputc(tls *TLS, c1 int32, f1 uintptr) (r int32)
TEXT ·Yfputc(SB),$32-52

// func Yfputc_unlocked(tls *TLS, c int32, f uintptr) (r int32)
TEXT ·Yfputc_unlocked(SB),$32-52

// func Yfputs(tls *TLS, s uintptr, f uintptr) (r int32)
TEXT ·Yfputs(SB),$32-52

// func Yfputs_unlocked(tls *TLS, s uintptr, f uintptr) (r int32)
TEXT ·Yfputs_unlocked(SB),$32-52

// func Yfputwc(tls *TLS, c Twchar_t, f uintptr) (r Twint_t)
TEXT ·Yfputwc(SB),$32-52

// func Yfputwc_unlocked(tls *TLS, c Twchar_t, f uintptr) (r Twint_t)
TEXT ·Yfputwc_unlocked(SB),$32-52

// func Yfputws(tls *TLS, _ws uintptr, f uintptr) (r int32)
TEXT ·Yfputws(SB),$32-52

// func Yfputws_unlocked(tls *TLS, _ws uintptr, f uintptr) (r int32)
TEXT ·Yfputws_unlocked(SB),$32-52

// func Yfread(tls *TLS, destv uintptr, size Tsize_t, nmemb Tsize_t, f uintptr) (r Tsize_t)
TEXT ·Yfread(SB),$48-88

// func Yfread_unlocked(tls *TLS, destv uintptr, size Tsize_t, nmemb Tsize_t, f uintptr) (r Tsize_t)
TEXT ·Yfread_unlocked(SB),$48-88

// func Yfree(tls *TLS, p uintptr)
TEXT ·Yfree(SB),$16-16

// func Yfreeaddrinfo(tls *TLS, p uintptr)
TEXT ·Yfreeaddrinfo(SB),$16-16

// func Yfreeifaddrs(tls *TLS, ifp uintptr)
TEXT ·Yfreeifaddrs(SB),$16-16

// func Yfreelocale(tls *TLS, l Tlocale_t)
TEXT ·Yfreelocale(SB),$16-16

// func Yfremovexattr(tls *TLS, fd int32, name uintptr) (r int32)
TEXT ·Yfremovexattr(SB),$32-52

// func Yfreopen(tls *TLS, filename uintptr, mode uintptr, f uintptr) (r uintptr)
TEXT ·Yfreopen(SB),$40-72

// func Yfrexp(tls *TLS, x float64, e uintptr) (r float64)
TEXT ·Yfrexp(SB),$32-56

// func Yfrexpf(tls *TLS, x float32, e uintptr) (r float32)
TEXT ·Yfrexpf(SB),$32-52

// func Yfrexpl(tls *TLS, x float64, e uintptr) (r float64)
TEXT ·Yfrexpl(SB),$32-56

// func Yfscanf(tls *TLS, f uintptr, fmt uintptr, va uintptr) (r int32)
TEXT ·Yfscanf(SB),$40-68

// func Yfseek(tls *TLS, f uintptr, off int64, whence int32) (r int32)
TEXT ·Yfseek(SB),$40-64

// func Yfseeko(tls *TLS, f uintptr, off Toff_t, whence int32) (r int32)
TEXT ·Yfseeko(SB),$40-64

// func Yfsetpos(tls *TLS, f uintptr, pos uintptr) (r int32)
TEXT ·Yfsetpos(SB),$32-52

// func Yfsetxattr(tls *TLS, filedes int32, name uintptr, value uintptr, size Tsize_t, flags int32) (r int32)
TEXT ·Yfsetxattr(SB),$56-96

// func Yfstat(tls *TLS, fd int32, st uintptr) (r int32)
TEXT ·Yfstat(SB),$32-52

// func Yfstat64(tls *TLS, fd int32, st uintptr) (r int32)
TEXT ·Yfstat64(SB),$32-52

// func Yfstatat(tls *TLS, fd int32, path uintptr, st uintptr, flag int32) (r int32)
TEXT ·Yfstatat(SB),$48-80

// func Yfstatfs(tls *TLS, fd int32, buf uintptr) (r int32)
TEXT ·Yfstatfs(SB),$32-52

// func Yfstatvfs(tls *TLS, fd int32, buf uintptr) (r int32)
TEXT ·Yfstatvfs(SB),$32-52

// func Yfsync(tls *TLS, fd int32) (r int32)
TEXT ·Yfsync(SB),$24-32

// func Yftell(tls *TLS, f uintptr) (r int64)
TEXT ·Yftell(SB),$24-40

// func Yftello(tls *TLS, f uintptr) (r Toff_t)
TEXT ·Yftello(SB),$24-40

// func Yftime(tls *TLS, tp uintptr) (r int32)
TEXT ·Yftime(SB),$24-36

// func Yftok(tls *TLS, path uintptr, id int32) (r Tkey_t)
TEXT ·Yftok(SB),$32-48

// func Yftruncate(tls *TLS, fd int32, length Toff_t) (r int32)
TEXT ·Yftruncate(SB),$32-52

// func Yftruncate64(tls *TLS, fd int32, length Toff_t) (r int32)
TEXT ·Yftruncate64(SB),$32-52

// func Yftrylockfile(tls *TLS, f uintptr) (r int32)
TEXT ·Yftrylockfile(SB),$24-36

// func Yfts64_close(t *TLS, ftsp uintptr) int32
TEXT ·Yfts64_close(SB),$24-36

// func Yfts64_open(t *TLS, path_argv uintptr, options int32, compar uintptr) uintptr
TEXT ·Yfts64_open(SB),$40-72

// func Yfts64_read(t *TLS, ftsp uintptr) uintptr
TEXT ·Yfts64_read(SB),$24-40

// func Yfts_close(t *TLS, ftsp uintptr) int32
TEXT ·Yfts_close(SB),$24-36

// func Yfts_open(t *TLS, path_argv uintptr, options int32, compar uintptr) uintptr
TEXT ·Yfts_open(SB),$40-72

// func Yfts_read(t *TLS, ftsp uintptr) uintptr
TEXT ·Yfts_read(SB),$24-40

// func Yftw(tls *TLS, path uintptr, fn uintptr, fd_limit int32) (r int32)
TEXT ·Yftw(SB),$40-64

// func Yfunlockfile(tls *TLS, f uintptr)
TEXT ·Yfunlockfile(SB),$16-16

// func Yfutimens(tls *TLS, fd int32, times uintptr) (r int32)
TEXT ·Yfutimens(SB),$32-52

// func Yfutimes(tls *TLS, fd int32, tv uintptr) (r int32)
TEXT ·Yfutimes(SB),$32-52

// func Yfutimesat(tls *TLS, dirfd int32, pathname uintptr, times uintptr) (r int32)
TEXT ·Yfutimesat(SB),$40-68

// func Yfwide(tls *TLS, f uintptr, mode int32) (r int32)
TEXT ·Yfwide(SB),$32-48

// func Yfwprintf(tls *TLS, f uintptr, fmt uintptr, va uintptr) (r int32)
TEXT ·Yfwprintf(SB),$40-68

// func Yfwrite(tls *TLS, src uintptr, size Tsize_t, nmemb Tsize_t, f uintptr) (r Tsize_t)
TEXT ·Yfwrite(SB),$48-88

// func Yfwrite_unlocked(tls *TLS, src uintptr, size Tsize_t, nmemb Tsize_t, f uintptr) (r Tsize_t)
TEXT ·Yfwrite_unlocked(SB),$48-88

// func Yfwscanf(tls *TLS, f uintptr, fmt uintptr, va uintptr) (r int32)
TEXT ·Yfwscanf(SB),$40-68

// func Ygai_strerror(tls *TLS, ecode int32) (r uintptr)
TEXT ·Ygai_strerror(SB),$24-36

// func Ygcvt(tls *TLS, x float64, n int32, b uintptr) (r uintptr)
TEXT ·Ygcvt(SB),$40-72

// func Yget_avphys_pages(tls *TLS) (r int64)
TEXT ·Yget_avphys_pages(SB),$16-24

// func Yget_current_dir_name(tls *TLS) (r uintptr)
TEXT ·Yget_current_dir_name(SB),$16-24

// func Yget_nprocs(tls *TLS) (r int32)
TEXT ·Yget_nprocs(SB),$16-20

// func Yget_nprocs_conf(tls *TLS) (r int32)
TEXT ·Yget_nprocs_conf(SB),$16-20

// func Yget_phys_pages(tls *TLS) (r int64)
TEXT ·Yget_phys_pages(SB),$16-24

// func Ygetaddrinfo(tls *TLS, host uintptr, serv uintptr, hint uintptr, res uintptr) (r1 int32)
TEXT ·Ygetaddrinfo(SB),$48-84

// func Ygetauxval(tls *TLS, item uint64) (r uint64)
TEXT ·Ygetauxval(SB),$24-40

// func Ygetc(tls *TLS, f1 uintptr) (r int32)
TEXT ·Ygetc(SB),$24-36

// func Ygetc_unlocked(tls *TLS, f uintptr) (r int32)
TEXT ·Ygetc_unlocked(SB),$24-36

// func Ygetchar(tls *TLS) (r int32)
TEXT ·Ygetchar(SB),$16-20

// func Ygetchar_unlocked(tls *TLS) (r int32)
TEXT ·Ygetchar_unlocked(SB),$16-20

// func Ygetcwd(tls *TLS, buf uintptr, size Tsize_t) (r uintptr)
TEXT ·Ygetcwd(SB),$32-56

// func Ygetdate(tls *TLS, s uintptr) (r uintptr)
TEXT ·Ygetdate(SB),$24-40

// func Ygetdelim(tls *TLS, s uintptr, n uintptr, delim int32, f uintptr) (r Tssize_t)
TEXT ·Ygetdelim(SB),$48-88

// func Ygetdents(tls *TLS, fd int32, buf uintptr, len1 Tsize_t) (r int32)
TEXT ·Ygetdents(SB),$40-68

// func Ygetdomainname(tls *TLS, name uintptr, len1 Tsize_t) (r int32)
TEXT ·Ygetdomainname(SB),$32-52

// func Ygetdtablesize(tls *TLS) (r int32)
TEXT ·Ygetdtablesize(SB),$16-20

// func Ygetegid(tls *TLS) (r Tgid_t)
TEXT ·Ygetegid(SB),$16-20

// func Ygetentropy(tls *TLS, buffer uintptr, len1 Tsize_t) (r int32)
TEXT ·Ygetentropy(SB),$32-52

// func Ygetenv(tls *TLS, name uintptr) (r uintptr)
TEXT ·Ygetenv(SB),$24-40

// func Ygeteuid(tls *TLS) (r Tuid_t)
TEXT ·Ygeteuid(SB),$16-20

// func Ygetgid(tls *TLS) (r Tgid_t)
TEXT ·Ygetgid(SB),$16-20

// func Ygetgrent(tls *TLS) (r uintptr)
TEXT ·Ygetgrent(SB),$16-24

// func Ygetgrgid(tls *TLS, gid Tgid_t) (r uintptr)
TEXT ·Ygetgrgid(SB),$24-36

// func Ygetgrgid_r(tls *TLS, gid Tgid_t, gr uintptr, buf uintptr, size Tsize_t, res uintptr) (r int32)
TEXT ·Ygetgrgid_r(SB),$56-100

// func Ygetgrnam(tls *TLS, name uintptr) (r uintptr)
TEXT ·Ygetgrnam(SB),$24-40

// func Ygetgrnam_r(tls *TLS, name uintptr, gr uintptr, buf uintptr, size Tsize_t, res uintptr) (r int32)
TEXT ·Ygetgrnam_r(SB),$56-100

// func Ygetgrouplist(tls *TLS, user uintptr, gid Tgid_t, groups uintptr, ngroups uintptr) (r int32)
TEXT ·Ygetgrouplist(SB),$48-84

// func Ygetgroups(tls *TLS, count int32, list uintptr) (r int32)
TEXT ·Ygetgroups(SB),$32-52

// func Ygethostbyaddr(tls *TLS, a uintptr, l Tsocklen_t, af int32) (r uintptr)
TEXT ·Ygethostbyaddr(SB),$32-56

// func Ygethostbyaddr_r(tls *TLS, a uintptr, l Tsocklen_t, af int32, h uintptr, buf uintptr, buflen Tsize_t, res uintptr, err uintptr) (r int32)
TEXT ·Ygethostbyaddr_r(SB),$72-132

// func Ygethostbyname(tls *TLS, name uintptr) (r uintptr)
TEXT ·Ygethostbyname(SB),$24-40

// func Ygethostbyname2(tls *TLS, name uintptr, af int32) (r uintptr)
TEXT ·Ygethostbyname2(SB),$32-52

// func Ygethostbyname2_r(tls *TLS, name uintptr, af int32, h uintptr, buf uintptr, buflen Tsize_t, res uintptr, err uintptr) (r int32)
TEXT ·Ygethostbyname2_r(SB),$72-132

// func Ygethostbyname_r(tls *TLS, name uintptr, h uintptr, buf uintptr, buflen Tsize_t, res uintptr, err uintptr) (r int32)
TEXT ·Ygethostbyname_r(SB),$64-116

// func Ygethostent(tls *TLS) (r uintptr)
TEXT ·Ygethostent(SB),$16-24

// func Ygethostid(tls *TLS) (r int64)
TEXT ·Ygethostid(SB),$16-24

// func Ygethostname(tls *TLS, name uintptr, len1 Tsize_t) (r int32)
TEXT ·Ygethostname(SB),$32-52

// func Ygetifaddrs(tls *TLS, ifap uintptr) (r1 int32)
TEXT ·Ygetifaddrs(SB),$24-36

// func Ygetitimer(tls *TLS, which int32, old uintptr) (r1 int32)
TEXT ·Ygetitimer(SB),$32-52

// func Ygetline(tls *TLS, s uintptr, n uintptr, f uintptr) (r Tssize_t)
TEXT ·Ygetline(SB),$40-72

// func Ygetloadavg(tls *TLS, a uintptr, n int32) (r int32)
TEXT ·Ygetloadavg(SB),$32-48

// func Ygetlogin(tls *TLS) (r uintptr)
TEXT ·Ygetlogin(SB),$16-24

// func Ygetlogin_r(tls *TLS, name uintptr, size Tsize_t) (r int32)
TEXT ·Ygetlogin_r(SB),$32-52

// func Ygetmntent(tls *TLS, f uintptr) (r uintptr)
TEXT ·Ygetmntent(SB),$24-40

// func Ygetmntent_r(tls *TLS, f uintptr, mnt uintptr, linebuf uintptr, buflen int32) (r uintptr)
TEXT ·Ygetmntent_r(SB),$48-84

// func Ygetnameinfo(tls *TLS, sa uintptr, sl Tsocklen_t, node uintptr, nodelen Tsocklen_t, serv uintptr, servlen Tsocklen_t, flags int32) (r int32)
TEXT ·Ygetnameinfo(SB),$64-116

// func Ygetnetbyaddr(tls *TLS, net Tuint32_t, type1 int32) (r uintptr)
TEXT ·Ygetnetbyaddr(SB),$24-40

// func Ygetnetbyname(tls *TLS, name uintptr) (r uintptr)
TEXT ·Ygetnetbyname(SB),$24-40

// func Ygetnetent(tls *TLS) (r uintptr)
TEXT ·Ygetnetent(SB),$16-24

// func Ygetopt(tls *TLS, argc int32, argv uintptr, optstring uintptr) (r int32)
TEXT ·Ygetopt(SB),$40-68

// func Ygetopt_long(tls *TLS, argc int32, argv uintptr, optstring uintptr, longopts uintptr, idx uintptr) (r int32)
TEXT ·Ygetopt_long(SB),$56-100

// func Ygetopt_long_only(tls *TLS, argc int32, argv uintptr, optstring uintptr, longopts uintptr, idx uintptr) (r int32)
TEXT ·Ygetopt_long_only(SB),$56-100

// func Ygetpagesize(tls *TLS) (r int32)
TEXT ·Ygetpagesize(SB),$16-20

// func Ygetpass(tls *TLS, prompt uintptr) (r uintptr)
TEXT ·Ygetpass(SB),$24-40

// func Ygetpeername(tls *TLS, fd int32, addr uintptr, len1 uintptr) (r1 int32)
TEXT ·Ygetpeername(SB),$40-68

// func Ygetpgid(tls *TLS, pid Tpid_t) (r Tpid_t)
TEXT ·Ygetpgid(SB),$24-32

// func Ygetpgrp(tls *TLS) (r Tpid_t)
TEXT ·Ygetpgrp(SB),$16-20

// func Ygetpid(tls *TLS) (r Tpid_t)
TEXT ·Ygetpid(SB),$16-20

// func Ygetppid(tls *TLS) (r Tpid_t)
TEXT ·Ygetppid(SB),$16-20

// func Ygetpriority(tls *TLS, which int32, who Tid_t) (r int32)
TEXT ·Ygetpriority(SB),$24-36

// func Ygetprotobyname(tls *TLS, name uintptr) (r uintptr)
TEXT ·Ygetprotobyname(SB),$24-40

// func Ygetprotobynumber(tls *TLS, num int32) (r uintptr)
TEXT ·Ygetprotobynumber(SB),$24-36

// func Ygetprotoent(tls *TLS) (r uintptr)
TEXT ·Ygetprotoent(SB),$16-24

// func Ygetpwent(tls *TLS) (r uintptr)
TEXT ·Ygetpwent(SB),$16-24

// func Ygetpwnam(tls *TLS, name uintptr) (r uintptr)
TEXT ·Ygetpwnam(SB),$24-40

// func Ygetpwnam_r(tls *TLS, name uintptr, pw uintptr, buf uintptr, size Tsize_t, res uintptr) (r int32)
TEXT ·Ygetpwnam_r(SB),$56-100

// func Ygetpwuid(tls *TLS, uid Tuid_t) (r uintptr)
TEXT ·Ygetpwuid(SB),$24-36

// func Ygetpwuid_r(tls *TLS, uid Tuid_t, pw uintptr, buf uintptr, size Tsize_t, res uintptr) (r int32)
TEXT ·Ygetpwuid_r(SB),$56-100

// func Ygetrandom(tls *TLS, buf uintptr, buflen Tsize_t, flags uint32) (r Tssize_t)
TEXT ·Ygetrandom(SB),$40-68

// func Ygetresgid(tls *TLS, rgid uintptr, egid uintptr, sgid uintptr) (r int32)
TEXT ·Ygetresgid(SB),$40-68

// func Ygetresuid(tls *TLS, ruid uintptr, euid uintptr, suid uintptr) (r int32)
TEXT ·Ygetresuid(SB),$40-68

// func Ygetrlimit(tls *TLS, resource int32, rlim uintptr) (r int32)
TEXT ·Ygetrlimit(SB),$32-52

// func Ygetrlimit64(tls *TLS, resource int32, rlim uintptr) (r int32)
TEXT ·Ygetrlimit64(SB),$32-52

// func Ygetrusage(tls *TLS, who int32, ru uintptr) (r1 int32)
TEXT ·Ygetrusage(SB),$32-52

// func Ygets(tls *TLS, s uintptr) (r uintptr)
TEXT ·Ygets(SB),$24-40

// func Ygetservbyname(tls *TLS, name uintptr, prots uintptr) (r uintptr)
TEXT ·Ygetservbyname(SB),$32-56

// func Ygetservbyname_r(tls *TLS, name uintptr, prots uintptr, se uintptr, buf uintptr, buflen Tsize_t, res uintptr) (r int32)
TEXT ·Ygetservbyname_r(SB),$64-116

// func Ygetservent(tls *TLS) (r uintptr)
TEXT ·Ygetservent(SB),$16-24

// func Ygetsid(tls *TLS, pid Tpid_t) (r Tpid_t)
TEXT ·Ygetsid(SB),$24-32

// func Ygetsockname(tls *TLS, fd int32, addr uintptr, len1 uintptr) (r1 int32)
TEXT ·Ygetsockname(SB),$40-68

// func Ygetsockopt(tls *TLS, fd int32, level int32, optname int32, optval uintptr, optlen uintptr) (r2 int32)
TEXT ·Ygetsockopt(SB),$48-84

// func Ygetspent(tls *TLS) (r uintptr)
TEXT ·Ygetspent(SB),$16-24

// func Ygetsubopt(tls *TLS, opt uintptr, keys uintptr, val uintptr) (r int32)
TEXT ·Ygetsubopt(SB),$40-68

// func Ygettext(tls *TLS, msgid uintptr) (r uintptr)
TEXT ·Ygettext(SB),$24-40

// func Ygettimeofday(tls *TLS, tv uintptr, tz uintptr) (r int32)
TEXT ·Ygettimeofday(SB),$32-52

// func Ygetuid(tls *TLS) (r Tuid_t)
TEXT ·Ygetuid(SB),$16-20

// func Ygetusershell(tls *TLS) (r uintptr)
TEXT ·Ygetusershell(SB),$16-24

// func Ygetutent(tls *TLS) (r uintptr)
TEXT ·Ygetutent(SB),$16-24

// func Ygetutid(tls *TLS, ut uintptr) (r uintptr)
TEXT ·Ygetutid(SB),$24-40

// func Ygetutline(tls *TLS, ut uintptr) (r uintptr)
TEXT ·Ygetutline(SB),$24-40

// func Ygetutxent(tls *TLS) (r uintptr)
TEXT ·Ygetutxent(SB),$16-24

// func Ygetutxid(tls *TLS, ut uintptr) (r uintptr)
TEXT ·Ygetutxid(SB),$24-40

// func Ygetutxline(tls *TLS, ut uintptr) (r uintptr)
TEXT ·Ygetutxline(SB),$24-40

// func Ygetw(tls *TLS, f uintptr) (r int32)
TEXT ·Ygetw(SB),$24-36

// func Ygetwc(tls *TLS, f uintptr) (r Twint_t)
TEXT ·Ygetwc(SB),$24-36

// func Ygetwc_unlocked(tls *TLS, f uintptr) (r Twint_t)
TEXT ·Ygetwc_unlocked(SB),$24-36

// func Ygetwchar(tls *TLS) (r Twint_t)
TEXT ·Ygetwchar(SB),$16-20

// func Ygetwchar_unlocked(tls *TLS) (r Twint_t)
TEXT ·Ygetwchar_unlocked(SB),$16-20

// func Ygetxattr(tls *TLS, path uintptr, name uintptr, value uintptr, size Tsize_t) (r Tssize_t)
TEXT ·Ygetxattr(SB),$48-88

// func Yglob(tls *TLS, pat uintptr, flags int32, errfunc uintptr, g uintptr) (r int32)
TEXT ·Yglob(SB),$48-84

// func Yglobfree(tls *TLS, g uintptr)
TEXT ·Yglobfree(SB),$16-16

// func Ygmtime(tls *TLS, t uintptr) (r uintptr)
TEXT ·Ygmtime(SB),$24-40

// func Ygmtime_r(tls *TLS, t uintptr, tm uintptr) (r uintptr)
TEXT ·Ygmtime_r(SB),$32-56

// func Ygrantpt(tls *TLS, fd int32) (r int32)
TEXT ·Ygrantpt(SB),$24-32

// func Yhasmntopt(tls *TLS, mnt uintptr, opt uintptr) (r uintptr)
TEXT ·Yhasmntopt(SB),$32-56

// func Yhcreate(tls *TLS, nel Tsize_t) (r int32)
TEXT ·Yhcreate(SB),$24-36

// func Yhdestroy(tls *TLS)
TEXT ·Yhdestroy(SB),$8-8

// func Yherror(tls *TLS, msg uintptr)
TEXT ·Yherror(SB),$16-16

// func Yhsearch(tls *TLS, item TENTRY, action TACTION) (r uintptr)
TEXT ·Yhsearch(SB),$40-68

// func Yhstrerror(tls *TLS, ecode int32) (r uintptr)
TEXT ·Yhstrerror(SB),$24-36

// func Yhtonl(tls *TLS, n Tuint32_t) (r Tuint32_t)
TEXT ·Yhtonl(SB),$24-32

// func Yhtons(tls *TLS, n Tuint16_t) (r Tuint16_t)
TEXT ·Yhtons(SB),$24-28

// func Yhypot(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yhypot(SB),$32-56

// func Yhypotf(tls *TLS, x float32, y float32) (r float32)
TEXT ·Yhypotf(SB),$24-36

// func Yhypotl(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yhypotl(SB),$32-56

// func Yiconv(tls *TLS, cd Ticonv_t, in uintptr, inb uintptr, out uintptr, outb uintptr) (r Tsize_t)
TEXT ·Yiconv(SB),$56-104

// func Yiconv_close(tls *TLS, cd Ticonv_t) (r int32)
TEXT ·Yiconv_close(SB),$24-36

// func Yiconv_open(tls *TLS, to uintptr, from uintptr) (r Ticonv_t)
TEXT ·Yiconv_open(SB),$32-56

// func Yif_freenameindex(tls *TLS, idx uintptr)
TEXT ·Yif_freenameindex(SB),$16-16

// func Yif_indextoname(tls *TLS, index uint32, name uintptr) (r1 uintptr)
TEXT ·Yif_indextoname(SB),$32-56

// func Yif_nameindex(tls *TLS) (r uintptr)
TEXT ·Yif_nameindex(SB),$16-24

// func Yif_nametoindex(tls *TLS, name uintptr) (r1 uint32)
TEXT ·Yif_nametoindex(SB),$24-36

// func Yilogb(tls *TLS, x3 float64) (r int32)
TEXT ·Yilogb(SB),$24-36

// func Yilogbf(tls *TLS, x3 float32) (r int32)
TEXT ·Yilogbf(SB),$24-32

// func Yilogbl(tls *TLS, x float64) (r int32)
TEXT ·Yilogbl(SB),$24-36

// func Yimaxabs(tls *TLS, a Tintmax_t) (r Tintmax_t)
TEXT ·Yimaxabs(SB),$24-40

// func Yimaxdiv(tls *TLS, num Tintmax_t, den Tintmax_t) (r Timaxdiv_t)
TEXT ·Yimaxdiv(SB),$40-64

// func Yindex(tls *TLS, s uintptr, c int32) (r uintptr)
TEXT ·Yindex(SB),$32-52

// func Yinet_addr(tls *TLS, p uintptr) (r Tin_addr_t)
TEXT ·Yinet_addr(SB),$24-36

// func Yinet_aton(tls *TLS, s0 uintptr, dest uintptr) (r int32)
TEXT ·Yinet_aton(SB),$32-52

// func Yinet_lnaof(tls *TLS, in Tin_addr) (r Tin_addr_t)
TEXT ·Yinet_lnaof(SB),$24-32

// func Yinet_makeaddr(tls *TLS, n Tin_addr_t, h Tin_addr_t) (r Tin_addr)
TEXT ·Yinet_makeaddr(SB),$24-36

// func Yinet_netof(tls *TLS, in Tin_addr) (r Tin_addr_t)
TEXT ·Yinet_netof(SB),$24-32

// func Yinet_network(tls *TLS, p uintptr) (r Tin_addr_t)
TEXT ·Yinet_network(SB),$24-36

// func Yinet_ntoa(tls *TLS, _in Tin_addr) (r uintptr)
TEXT ·Yinet_ntoa(SB),$24-36

// func Yinet_ntop(tls *TLS, af int32, a0 uintptr, s uintptr, l Tsocklen_t) (r uintptr)
TEXT ·Yinet_ntop(SB),$48-84

// func Yinet_pton(tls *TLS, af int32, s uintptr, a0 uintptr) (r int32)
TEXT ·Yinet_pton(SB),$40-68

// func Yinit_module(tls *TLS, a uintptr, b uint64, c uintptr) (r int32)
TEXT ·Yinit_module(SB),$40-68

// func Yinitstate(tls *TLS, seed uint32, state uintptr, size Tsize_t) (r uintptr)
TEXT ·Yinitstate(SB),$40-72

// func Yinitstate_r(t *TLS, seed uint32, statebuf uintptr, statelen Tsize_t, buf uintptr) int32
TEXT ·Yinitstate_r(SB),$48-84

// func Yinotify_add_watch(tls *TLS, fd int32, pathname uintptr, mask Tuint32_t) (r int32)
TEXT ·Yinotify_add_watch(SB),$40-64

// func Yinotify_init(tls *TLS) (r int32)
TEXT ·Yinotify_init(SB),$16-20

// func Yinotify_init1(tls *TLS, flags int32) (r1 int32)
TEXT ·Yinotify_init1(SB),$24-32

// func Yinotify_rm_watch(tls *TLS, fd int32, wd int32) (r int32)
TEXT ·Yinotify_rm_watch(SB),$24-36

// func Yinsque(tls *TLS, element uintptr, pred uintptr)
TEXT ·Yinsque(SB),$24-24

// func Yioctl(tls *TLS, fd int32, req int32, va uintptr) (r1 int32)
TEXT ·Yioctl(SB),$32-52

// func Yioperm(tls *TLS, from uint64, num uint64, turn_on int32) (r int32)
TEXT ·Yioperm(SB),$40-64

// func Yiopl(tls *TLS, level int32) (r int32)
TEXT ·Yiopl(SB),$24-32

// func Yisalnum(tls *TLS, c int32) (r int32)
TEXT ·Yisalnum(SB),$24-32

// func Yisalnum_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yisalnum_l(SB),$32-52

// func Yisalpha(tls *TLS, c int32) (r int32)
TEXT ·Yisalpha(SB),$24-32

// func Yisalpha_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yisalpha_l(SB),$32-52

// func Yisascii(tls *TLS, c int32) (r int32)
TEXT ·Yisascii(SB),$24-32

// func Yisastream(tls *TLS, fd int32) (r int32)
TEXT ·Yisastream(SB),$24-32

// func Yisatty(tls *TLS, fd int32) (r1 int32)
TEXT ·Yisatty(SB),$24-32

// func Yisblank(tls *TLS, c int32) (r int32)
TEXT ·Yisblank(SB),$24-32

// func Yisblank_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yisblank_l(SB),$32-52

// func Yiscntrl(tls *TLS, c int32) (r int32)
TEXT ·Yiscntrl(SB),$24-32

// func Yiscntrl_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yiscntrl_l(SB),$32-52

// func Yisdigit(tls *TLS, c int32) (r int32)
TEXT ·Yisdigit(SB),$24-32

// func Yisdigit_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yisdigit_l(SB),$32-52

// func Yisgraph(tls *TLS, c int32) (r int32)
TEXT ·Yisgraph(SB),$24-32

// func Yisgraph_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yisgraph_l(SB),$32-52

// func Yislower(tls *TLS, c int32) (r int32)
TEXT ·Yislower(SB),$24-32

// func Yislower_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yislower_l(SB),$32-52

// func Yisnan(t *TLS, x float64) int32
TEXT ·Yisnan(SB),$24-36

// func Yisnanf(t *TLS, arg float32) int32
TEXT ·Yisnanf(SB),$24-32

// func Yisnanl(t *TLS, arg float64) int32
TEXT ·Yisnanl(SB),$24-36

// func Yisprint(tls *TLS, c int32) (r int32)
TEXT ·Yisprint(SB),$24-32

// func Yisprint_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yisprint_l(SB),$32-52

// func Yispunct(tls *TLS, c int32) (r int32)
TEXT ·Yispunct(SB),$24-32

// func Yispunct_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yispunct_l(SB),$32-52

// func Yissetugid(tls *TLS) (r int32)
TEXT ·Yissetugid(SB),$16-20

// func Yisspace(tls *TLS, c int32) (r int32)
TEXT ·Yisspace(SB),$24-32

// func Yisspace_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yisspace_l(SB),$32-52

// func Yisupper(tls *TLS, c int32) (r int32)
TEXT ·Yisupper(SB),$24-32

// func Yisupper_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yisupper_l(SB),$32-52

// func Yiswalnum(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswalnum(SB),$24-32

// func Yiswalnum_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswalnum_l(SB),$32-52

// func Yiswalpha(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswalpha(SB),$24-32

// func Yiswalpha_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswalpha_l(SB),$32-52

// func Yiswblank(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswblank(SB),$24-32

// func Yiswblank_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswblank_l(SB),$32-52

// func Yiswcntrl(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswcntrl(SB),$24-32

// func Yiswcntrl_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswcntrl_l(SB),$32-52

// func Yiswctype(tls *TLS, wc Twint_t, type1 Twctype_t) (r int32)
TEXT ·Yiswctype(SB),$32-52

// func Yiswctype_l(tls *TLS, c Twint_t, t Twctype_t, l Tlocale_t) (r int32)
TEXT ·Yiswctype_l(SB),$40-68

// func Yiswdigit(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswdigit(SB),$24-32

// func Yiswdigit_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswdigit_l(SB),$32-52

// func Yiswgraph(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswgraph(SB),$24-32

// func Yiswgraph_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswgraph_l(SB),$32-52

// func Yiswlower(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswlower(SB),$24-32

// func Yiswlower_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswlower_l(SB),$32-52

// func Yiswprint(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswprint(SB),$24-32

// func Yiswprint_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswprint_l(SB),$32-52

// func Yiswpunct(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswpunct(SB),$24-32

// func Yiswpunct_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswpunct_l(SB),$32-52

// func Yiswspace(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswspace(SB),$24-32

// func Yiswspace_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswspace_l(SB),$32-52

// func Yiswupper(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswupper(SB),$24-32

// func Yiswupper_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswupper_l(SB),$32-52

// func Yiswxdigit(tls *TLS, wc Twint_t) (r int32)
TEXT ·Yiswxdigit(SB),$24-32

// func Yiswxdigit_l(tls *TLS, c Twint_t, l Tlocale_t) (r int32)
TEXT ·Yiswxdigit_l(SB),$32-52

// func Yisxdigit(tls *TLS, c int32) (r int32)
TEXT ·Yisxdigit(SB),$24-32

// func Yisxdigit_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Yisxdigit_l(SB),$32-52

// func Yj0(tls *TLS, x float64) (r1 float64)
TEXT ·Yj0(SB),$24-40

// func Yj0f(tls *TLS, x float32) (r1 float32)
TEXT ·Yj0f(SB),$24-32

// func Yj1(tls *TLS, x float64) (r1 float64)
TEXT ·Yj1(SB),$24-40

// func Yj1f(tls *TLS, x float32) (r1 float32)
TEXT ·Yj1f(SB),$24-32

// func Yjn(tls *TLS, n int32, x float64) (r float64)
TEXT ·Yjn(SB),$32-56

// func Yjnf(tls *TLS, n int32, x float32) (r float32)
TEXT ·Yjnf(SB),$24-36

// func Yjrand48(tls *TLS, s uintptr) (r int64)
TEXT ·Yjrand48(SB),$24-40

// func Ykill(tls *TLS, pid Tpid_t, sig int32) (r int32)
TEXT ·Ykill(SB),$24-36

// func Ykillpg(tls *TLS, pgid Tpid_t, sig int32) (r int32)
TEXT ·Ykillpg(SB),$24-36

// func Yklogctl(tls *TLS, type1 int32, buf uintptr, len1 int32) (r int32)
TEXT ·Yklogctl(SB),$40-64

// func Yl64a(tls *TLS, x0 int64) (r uintptr)
TEXT ·Yl64a(SB),$24-40

// func Ylabs(tls *TLS, a int64) (r int64)
TEXT ·Ylabs(SB),$24-40

// func Ylchmod(tls *TLS, path uintptr, mode Tmode_t) (r int32)
TEXT ·Ylchmod(SB),$32-48

// func Ylchown(tls *TLS, path uintptr, uid Tuid_t, gid Tgid_t) (r int32)
TEXT ·Ylchown(SB),$32-52

// func Ylckpwdf(tls *TLS) (r int32)
TEXT ·Ylckpwdf(SB),$16-20

// func Ylcong48(tls *TLS, p uintptr)
TEXT ·Ylcong48(SB),$16-16

// func Yldexp(tls *TLS, x float64, n int32) (r float64)
TEXT ·Yldexp(SB),$32-52

// func Yldexpf(tls *TLS, x float32, n int32) (r float32)
TEXT ·Yldexpf(SB),$24-36

// func Yldexpl(tls *TLS, x float64, n int32) (r float64)
TEXT ·Yldexpl(SB),$32-52

// func Yldiv(tls *TLS, num int64, den int64) (r Tldiv_t)
TEXT ·Yldiv(SB),$40-64

// func Ylfind(tls *TLS, key uintptr, base uintptr, nelp uintptr, width Tsize_t, compar uintptr) (r uintptr)
TEXT ·Ylfind(SB),$56-104

// func Ylgamma(tls *TLS, x float64) (r float64)
TEXT ·Ylgamma(SB),$24-40

// func Ylgamma_r(tls *TLS, x float64, signgamp uintptr) (r float64)
TEXT ·Ylgamma_r(SB),$32-56

// func Ylgammaf(tls *TLS, x float32) (r float32)
TEXT ·Ylgammaf(SB),$24-32

// func Ylgammaf_r(tls *TLS, x float32, signgamp uintptr) (r float32)
TEXT ·Ylgammaf_r(SB),$32-52

// func Ylgammal(tls *TLS, x float64) (r float64)
TEXT ·Ylgammal(SB),$24-40

// func Ylgammal_r(tls *TLS, x float64, sg uintptr) (r float64)
TEXT ·Ylgammal_r(SB),$32-56

// func Ylgetxattr(tls *TLS, path uintptr, name uintptr, value uintptr, size Tsize_t) (r Tssize_t)
TEXT ·Ylgetxattr(SB),$48-88

// func Ylink(tls *TLS, existing uintptr, new1 uintptr) (r int32)
TEXT ·Ylink(SB),$32-52

// func Ylinkat(tls *TLS, fd1 int32, existing uintptr, fd2 int32, new1 uintptr, flag int32) (r int32)
TEXT ·Ylinkat(SB),$56-96

// func Ylisten(tls *TLS, fd int32, backlog int32) (r1 int32)
TEXT ·Ylisten(SB),$24-36

// func Ylistxattr(tls *TLS, path uintptr, list uintptr, size Tsize_t) (r Tssize_t)
TEXT ·Ylistxattr(SB),$40-72

// func Yllabs(tls *TLS, a int64) (r int64)
TEXT ·Yllabs(SB),$24-40

// func Ylldiv(tls *TLS, num int64, den int64) (r Tlldiv_t)
TEXT ·Ylldiv(SB),$40-64

// func Yllistxattr(tls *TLS, path uintptr, list uintptr, size Tsize_t) (r Tssize_t)
TEXT ·Yllistxattr(SB),$40-72

// func Yllrint(tls *TLS, x float64) (r int64)
TEXT ·Yllrint(SB),$24-40

// func Yllrintf(tls *TLS, x float32) (r int64)
TEXT ·Yllrintf(SB),$24-36

// func Yllrintl(tls *TLS, x float64) (r int64)
TEXT ·Yllrintl(SB),$24-40

// func Yllround(tls *TLS, x float64) (r int64)
TEXT ·Yllround(SB),$24-40

// func Yllroundf(tls *TLS, x float32) (r int64)
TEXT ·Yllroundf(SB),$24-36

// func Yllroundl(tls *TLS, x float64) (r int64)
TEXT ·Yllroundl(SB),$24-40

// func Ylocaleconv(tls *TLS) (r uintptr)
TEXT ·Ylocaleconv(SB),$16-24

// func Ylocaltime(tls *TLS, t uintptr) (r uintptr)
TEXT ·Ylocaltime(SB),$24-40

// func Ylocaltime_r(tls *TLS, t uintptr, tm uintptr) (r uintptr)
TEXT ·Ylocaltime_r(SB),$32-56

// func Ylockf(tls *TLS, fd int32, op int32, size Toff_t) (r int32)
TEXT ·Ylockf(SB),$32-52

// func Ylog(tls *TLS, x1 float64) (r1 float64)
TEXT ·Ylog(SB),$24-40

// func Ylog10(tls *TLS, x float64) (r float64)
TEXT ·Ylog10(SB),$24-40

// func Ylog10f(tls *TLS, x float32) (r float32)
TEXT ·Ylog10f(SB),$24-32

// func Ylog10l(tls *TLS, x float64) (r float64)
TEXT ·Ylog10l(SB),$24-40

// func Ylog1p(tls *TLS, x3 float64) (r float64)
TEXT ·Ylog1p(SB),$24-40

// func Ylog1pf(tls *TLS, x3 float32) (r float32)
TEXT ·Ylog1pf(SB),$24-32

// func Ylog1pl(tls *TLS, x float64) (r float64)
TEXT ·Ylog1pl(SB),$24-40

// func Ylog2(tls *TLS, x1 float64) (r1 float64)
TEXT ·Ylog2(SB),$24-40

// func Ylog2f(tls *TLS, x1 float32) (r1 float32)
TEXT ·Ylog2f(SB),$24-32

// func Ylog2l(tls *TLS, x float64) (r float64)
TEXT ·Ylog2l(SB),$24-40

// func Ylogb(tls *TLS, x float64) (r float64)
TEXT ·Ylogb(SB),$24-40

// func Ylogbf(tls *TLS, x float32) (r float32)
TEXT ·Ylogbf(SB),$24-32

// func Ylogbl(tls *TLS, x float64) (r float64)
TEXT ·Ylogbl(SB),$24-40

// func Ylogf(tls *TLS, x1 float32) (r1 float32)
TEXT ·Ylogf(SB),$24-32

// func Ylogin_tty(tls *TLS, fd int32) (r int32)
TEXT ·Ylogin_tty(SB),$24-32

// func Ylogl(tls *TLS, x float64) (r float64)
TEXT ·Ylogl(SB),$24-40

// func Ylongjmp(t *TLS, env uintptr, val int32)
TEXT ·Ylongjmp(SB),$24-20

// func Ylrand48(tls *TLS) (r int64)
TEXT ·Ylrand48(SB),$16-24

// func Ylremovexattr(tls *TLS, path uintptr, name uintptr) (r int32)
TEXT ·Ylremovexattr(SB),$32-52

// func Ylrint(tls *TLS, x float64) (r int64)
TEXT ·Ylrint(SB),$24-40

// func Ylrintf(tls *TLS, x float32) (r int64)
TEXT ·Ylrintf(SB),$24-36

// func Ylrintl(tls *TLS, x float64) (r int64)
TEXT ·Ylrintl(SB),$24-40

// func Ylround(tls *TLS, x float64) (r int64)
TEXT ·Ylround(SB),$24-40

// func Ylroundf(tls *TLS, x float32) (r int64)
TEXT ·Ylroundf(SB),$24-36

// func Ylroundl(tls *TLS, x float64) (r int64)
TEXT ·Ylroundl(SB),$24-40

// func Ylsearch(tls *TLS, key uintptr, base uintptr, nelp uintptr, width Tsize_t, compar uintptr) (r uintptr)
TEXT ·Ylsearch(SB),$56-104

// func Ylseek(tls *TLS, fd int32, offset Toff_t, whence int32) (r Toff_t)
TEXT ·Ylseek(SB),$40-68

// func Ylseek64(tls *TLS, fd int32, offset Toff_t, whence int32) (r Toff_t)
TEXT ·Ylseek64(SB),$40-68

// func Ylsetxattr(tls *TLS, path uintptr, name uintptr, value uintptr, size Tsize_t, flags int32) (r int32)
TEXT ·Ylsetxattr(SB),$56-96

// func Ylstat(tls *TLS, path uintptr, buf uintptr) (r int32)
TEXT ·Ylstat(SB),$32-52

// func Ylstat64(tls *TLS, path uintptr, buf uintptr) (r int32)
TEXT ·Ylstat64(SB),$32-52

// func Ylutimes(tls *TLS, filename uintptr, tv uintptr) (r int32)
TEXT ·Ylutimes(SB),$32-52

// func Ymadvise(tls *TLS, addr uintptr, len1 Tsize_t, advice int32) (r int32)
TEXT ·Ymadvise(SB),$40-64

// func Ymalloc(tls *TLS, n Tsize_t) (r uintptr)
TEXT ·Ymalloc(SB),$24-40

// func Ymalloc_usable_size(tls *TLS, p uintptr) (r Tsize_t)
TEXT ·Ymalloc_usable_size(SB),$24-40

// func Ymblen(tls *TLS, s uintptr, n Tsize_t) (r int32)
TEXT ·Ymblen(SB),$32-52

// func Ymbrlen(tls *TLS, s uintptr, n Tsize_t, st uintptr) (r Tsize_t)
TEXT ·Ymbrlen(SB),$40-72

// func Ymbrtoc16(tls *TLS, pc16 uintptr, s uintptr, n Tsize_t, ps uintptr) (r Tsize_t)
TEXT ·Ymbrtoc16(SB),$48-88

// func Ymbrtoc32(tls *TLS, pc32 uintptr, s uintptr, n Tsize_t, ps uintptr) (r Tsize_t)
TEXT ·Ymbrtoc32(SB),$48-88

// func Ymbrtowc(tls *TLS, wc uintptr, src uintptr, n Tsize_t, st uintptr) (r Tsize_t)
TEXT ·Ymbrtowc(SB),$48-88

// func Ymbsinit(tls *TLS, st uintptr) (r int32)
TEXT ·Ymbsinit(SB),$24-36

// func Ymbsnrtowcs(tls *TLS, wcs uintptr, src uintptr, n Tsize_t, wn Tsize_t, st uintptr) (r Tsize_t)
TEXT ·Ymbsnrtowcs(SB),$56-104

// func Ymbsrtowcs(tls *TLS, ws uintptr, src uintptr, wn Tsize_t, st uintptr) (r Tsize_t)
TEXT ·Ymbsrtowcs(SB),$48-88

// func Ymbstowcs(tls *TLS, ws uintptr, _s uintptr, wn Tsize_t) (r Tsize_t)
TEXT ·Ymbstowcs(SB),$40-72

// func Ymbtowc(tls *TLS, wc uintptr, src uintptr, n Tsize_t) (r int32)
TEXT ·Ymbtowc(SB),$40-68

// func Ymemccpy(tls *TLS, dest uintptr, src uintptr, c int32, n Tsize_t) (r uintptr)
TEXT ·Ymemccpy(SB),$48-88

// func Ymemchr(tls *TLS, src uintptr, c int32, n Tsize_t) (r uintptr)
TEXT ·Ymemchr(SB),$40-72

// func Ymemcmp(tls *TLS, vl uintptr, vr uintptr, n Tsize_t) (r1 int32)
TEXT ·Ymemcmp(SB),$40-68

// func Ymemcpy(tls *TLS, dest uintptr, src uintptr, n Tsize_t) (r uintptr)
TEXT ·Ymemcpy(SB),$40-72

// func Ymemfd_create(tls *TLS, name uintptr, flags uint32) (r int32)
TEXT ·Ymemfd_create(SB),$32-48

// func Ymemmem(tls *TLS, h0 uintptr, k Tsize_t, n0 uintptr, l Tsize_t) (r uintptr)
TEXT ·Ymemmem(SB),$48-88

// func Ymemmove(tls *TLS, dest uintptr, src uintptr, n Tsize_t) (r uintptr)
TEXT ·Ymemmove(SB),$40-72

// func Ymempcpy(tls *TLS, dest uintptr, src uintptr, n Tsize_t) (r uintptr)
TEXT ·Ymempcpy(SB),$40-72

// func Ymemrchr(tls *TLS, m uintptr, c int32, n Tsize_t) (r uintptr)
TEXT ·Ymemrchr(SB),$40-72

// func Ymemset(tls *TLS, dest uintptr, c int32, n Tsize_t) (r uintptr)
TEXT ·Ymemset(SB),$40-72

// func Ymincore(tls *TLS, addr uintptr, len1 Tsize_t, vec uintptr) (r int32)
TEXT ·Ymincore(SB),$40-68

// func Ymkdir(tls *TLS, path uintptr, mode Tmode_t) (r int32)
TEXT ·Ymkdir(SB),$32-48

// func Ymkdirat(tls *TLS, fd int32, path uintptr, mode Tmode_t) (r int32)
TEXT ·Ymkdirat(SB),$40-64

// func Ymkdtemp(tls *TLS, template uintptr) (r uintptr)
TEXT ·Ymkdtemp(SB),$24-40

// func Ymkfifo(tls *TLS, path uintptr, mode Tmode_t) (r int32)
TEXT ·Ymkfifo(SB),$32-48

// func Ymkfifoat(tls *TLS, fd int32, path uintptr, mode Tmode_t) (r int32)
TEXT ·Ymkfifoat(SB),$40-64

// func Ymknod(tls *TLS, path uintptr, mode Tmode_t, dev Tdev_t) (r int32)
TEXT ·Ymknod(SB),$40-68

// func Ymknodat(tls *TLS, fd int32, path uintptr, mode Tmode_t, dev Tdev_t) (r int32)
TEXT ·Ymknodat(SB),$48-84

// func Ymkostemp(tls *TLS, template uintptr, flags int32) (r int32)
TEXT ·Ymkostemp(SB),$32-48

// func Ymkostemps(tls *TLS, template uintptr, len1 int32, flags int32) (r int32)
TEXT ·Ymkostemps(SB),$32-52

// func Ymkstemp(tls *TLS, template uintptr) (r int32)
TEXT ·Ymkstemp(SB),$24-36

// func Ymkstemp64(tls *TLS, template uintptr) (r int32)
TEXT ·Ymkstemp64(SB),$24-36

// func Ymkstemps(tls *TLS, template uintptr, len1 int32) (r int32)
TEXT ·Ymkstemps(SB),$32-48

// func Ymkstemps64(tls *TLS, template uintptr, len1 int32) (r int32)
TEXT ·Ymkstemps64(SB),$32-48

// func Ymktemp(tls *TLS, template uintptr) (r uintptr)
TEXT ·Ymktemp(SB),$24-40

// func Ymktime(tls *TLS, tm uintptr) (r Ttime_t)
TEXT ·Ymktime(SB),$24-40

// func Ymlock(tls *TLS, addr uintptr, len1 Tsize_t) (r int32)
TEXT ·Ymlock(SB),$32-52

// func Ymlock2(tls *TLS, addr uintptr, len1 Tsize_t, flags uint32) (r int32)
TEXT ·Ymlock2(SB),$40-64

// func Ymlockall(tls *TLS, flags int32) (r int32)
TEXT ·Ymlockall(SB),$24-32

// func Ymmap(tls *TLS, start uintptr, len1 Tsize_t, prot int32, flags int32, fd int32, off Toff_t) (r uintptr)
TEXT ·Ymmap(SB),$56-104

// func Ymmap64(tls *TLS, start uintptr, len1 Tsize_t, prot int32, flags int32, fd int32, off Toff_t) (r uintptr)
TEXT ·Ymmap64(SB),$56-104

// func Ymodf(tls *TLS, x float64, iptr uintptr) (r float64)
TEXT ·Ymodf(SB),$32-56

// func Ymodff(tls *TLS, x float32, iptr uintptr) (r float32)
TEXT ·Ymodff(SB),$32-52

// func Ymodfl(tls *TLS, x float64, iptr uintptr) (r1 float64)
TEXT ·Ymodfl(SB),$32-56

// func Ymount(tls *TLS, special uintptr, dir uintptr, fstype uintptr, flags uint64, data uintptr) (r int32)
TEXT ·Ymount(SB),$56-100

// func Ymprotect(tls *TLS, addr uintptr, len1 Tsize_t, prot int32) (r int32)
TEXT ·Ymprotect(SB),$40-64

// func Ymrand48(tls *TLS) (r int64)
TEXT ·Ymrand48(SB),$16-24

// func Ymremap(tls *TLS, old_addr uintptr, old_len Tsize_t, new_len Tsize_t, flags int32, va uintptr) (r uintptr)
TEXT ·Ymremap(SB),$56-104

// func Ymsgctl(tls *TLS, q int32, cmd int32, buf uintptr) (r1 int32)
TEXT ·Ymsgctl(SB),$32-52

// func Ymsgget(tls *TLS, k Tkey_t, flag int32) (r int32)
TEXT ·Ymsgget(SB),$24-36

// func Ymsgrcv(tls *TLS, q int32, m uintptr, len1 Tsize_t, type1 int64, flag int32) (r Tssize_t)
TEXT ·Ymsgrcv(SB),$56-100

// func Ymsgsnd(tls *TLS, q int32, m uintptr, len1 Tsize_t, flag int32) (r int32)
TEXT ·Ymsgsnd(SB),$48-80

// func Ymsync(tls *TLS, start uintptr, len1 Tsize_t, flags int32) (r int32)
TEXT ·Ymsync(SB),$40-64

// func Ymunlock(tls *TLS, addr uintptr, len1 Tsize_t) (r int32)
TEXT ·Ymunlock(SB),$32-52

// func Ymunlockall(tls *TLS) (r int32)
TEXT ·Ymunlockall(SB),$16-20

// func Ymunmap(tls *TLS, start uintptr, len1 Tsize_t) (r int32)
TEXT ·Ymunmap(SB),$32-52

// func Yname_to_handle_at(tls *TLS, dirfd int32, pathname uintptr, handle uintptr, mount_id uintptr, flags int32) (r int32)
TEXT ·Yname_to_handle_at(SB),$56-96

// func Ynan(tls *TLS, s uintptr) (r float64)
TEXT ·Ynan(SB),$24-40

// func Ynanf(tls *TLS, s uintptr) (r float32)
TEXT ·Ynanf(SB),$24-36

// func Ynanl(tls *TLS, s uintptr) (r float64)
TEXT ·Ynanl(SB),$24-40

// func Ynanosleep(tls *TLS, req uintptr, rem uintptr) (r int32)
TEXT ·Ynanosleep(SB),$32-52

// func Ynewlocale(tls *TLS, mask int32, name uintptr, loc Tlocale_t) (r Tlocale_t)
TEXT ·Ynewlocale(SB),$40-72

// func Ynextafter(tls *TLS, x3 float64, y3 float64) (r float64)
TEXT ·Ynextafter(SB),$32-56

// func Ynextafterf(tls *TLS, x3 float32, y3 float32) (r float32)
TEXT ·Ynextafterf(SB),$24-36

// func Ynextafterl(tls *TLS, x float64, y float64) (r float64)
TEXT ·Ynextafterl(SB),$32-56

// func Ynexttoward(tls *TLS, x float64, y float64) (r float64)
TEXT ·Ynexttoward(SB),$32-56

// func Ynexttowardf(tls *TLS, x3 float32, y3 float64) (r float32)
TEXT ·Ynexttowardf(SB),$32-52

// func Ynexttowardl(tls *TLS, x float64, y float64) (r float64)
TEXT ·Ynexttowardl(SB),$32-56

// func Ynftw(tls *TLS, path uintptr, fn uintptr, fd_limit int32, flags int32) (r1 int32)
TEXT ·Ynftw(SB),$40-68

// func Yngettext(tls *TLS, msgid1 uintptr, msgid2 uintptr, n uint64) (r uintptr)
TEXT ·Yngettext(SB),$40-72

// func Ynice(tls *TLS, inc int32) (r int32)
TEXT ·Ynice(SB),$24-32

// func Ynl_langinfo(tls *TLS, item Tnl_item) (r uintptr)
TEXT ·Ynl_langinfo(SB),$24-36

// func Ynl_langinfo_l(tls *TLS, item Tnl_item, loc Tlocale_t) (r uintptr)
TEXT ·Ynl_langinfo_l(SB),$32-56

// func Ynrand48(tls *TLS, s uintptr) (r int64)
TEXT ·Ynrand48(SB),$24-40

// func Yns_get16(tls *TLS, cp uintptr) (r uint32)
TEXT ·Yns_get16(SB),$24-36

// func Yns_get32(tls *TLS, cp uintptr) (r uint64)
TEXT ·Yns_get32(SB),$24-40

// func Yns_initparse(tls *TLS, msg uintptr, msglen int32, handle uintptr) (r1 int32)
TEXT ·Yns_initparse(SB),$40-68

// func Yns_name_uncompress(tls *TLS, msg uintptr, eom uintptr, src uintptr, dst uintptr, dstsiz Tsize_t) (r1 int32)
TEXT ·Yns_name_uncompress(SB),$56-100

// func Yns_parserr(tls *TLS, handle uintptr, section Tns_sect, rrnum int32, rr uintptr) (r1 int32)
TEXT ·Yns_parserr(SB),$40-68

// func Yns_put16(tls *TLS, s uint32, cp uintptr)
TEXT ·Yns_put16(SB),$24-24

// func Yns_put32(tls *TLS, l uint64, cp uintptr)
TEXT ·Yns_put32(SB),$24-24

// func Yns_skiprr(tls *TLS, ptr uintptr, eom uintptr, section Tns_sect, count int32) (r1 int32)
TEXT ·Yns_skiprr(SB),$40-68

// func Yntohl(tls *TLS, n Tuint32_t) (r Tuint32_t)
TEXT ·Yntohl(SB),$24-32

// func Yntohs(tls *TLS, n Tuint16_t) (r Tuint16_t)
TEXT ·Yntohs(SB),$24-28

// func Yobstack_free(t *TLS, obstack, obj uintptr)
TEXT ·Yobstack_free(SB),$24-24

// func Yobstack_vprintf(t *TLS, obstack, template, va uintptr) int32
TEXT ·Yobstack_vprintf(SB),$40-68

// func Yopen(tls *TLS, filename uintptr, flags int32, va uintptr) (r int32)
TEXT ·Yopen(SB),$40-68

// func Yopen64(tls *TLS, filename uintptr, flags int32, va uintptr) (r int32)
TEXT ·Yopen64(SB),$40-68

// func Yopen_by_handle_at(tls *TLS, mount_fd int32, handle uintptr, flags int32) (r int32)
TEXT ·Yopen_by_handle_at(SB),$40-64

// func Yopen_memstream(tls *TLS, bufp uintptr, sizep uintptr) (r uintptr)
TEXT ·Yopen_memstream(SB),$32-56

// func Yopen_wmemstream(tls *TLS, bufp uintptr, sizep uintptr) (r uintptr)
TEXT ·Yopen_wmemstream(SB),$32-56

// func Yopenat(tls *TLS, fd int32, filename uintptr, flags int32, va uintptr) (r int32)
TEXT ·Yopenat(SB),$48-84

// func Yopendir(tls *TLS, name uintptr) (r uintptr)
TEXT ·Yopendir(SB),$24-40

// func Yopenlog(tls *TLS, ident uintptr, opt int32, facility int32)
TEXT ·Yopenlog(SB),$24-24

// func Yopenpty(tls *TLS, pm uintptr, ps uintptr, name uintptr, tio uintptr, ws uintptr) (r int32)
TEXT ·Yopenpty(SB),$56-100

// func Ypathconf(tls *TLS, path uintptr, name int32) (r int64)
TEXT ·Ypathconf(SB),$32-52

// func Ypause(tls *TLS) (r int32)
TEXT ·Ypause(SB),$16-20

// func Ypclose(tls *TLS, f uintptr) (r1 int32)
TEXT ·Ypclose(SB),$24-36

// func Yperror(tls *TLS, msg uintptr)
TEXT ·Yperror(SB),$16-16

// func Ypersonality(tls *TLS, persona uint64) (r int32)
TEXT ·Ypersonality(SB),$24-36

// func Ypipe(tls *TLS, fd uintptr) (r int32)
TEXT ·Ypipe(SB),$24-36

// func Ypipe2(tls *TLS, fd uintptr, flag int32) (r int32)
TEXT ·Ypipe2(SB),$32-48

// func Ypivot_root(tls *TLS, new1 uintptr, old uintptr) (r int32)
TEXT ·Ypivot_root(SB),$32-52

// func Ypoll(tls *TLS, fds uintptr, n Tnfds_t, timeout int32) (r int32)
TEXT ·Ypoll(SB),$40-64

// func Ypopen(t *TLS, command, type1 uintptr) uintptr
TEXT ·Ypopen(SB),$32-56

// func Yposix_close(tls *TLS, fd int32, flags int32) (r int32)
TEXT ·Yposix_close(SB),$24-36

// func Yposix_fadvise(tls *TLS, fd int32, base Toff_t, len1 Toff_t, advice int32) (r int32)
TEXT ·Yposix_fadvise(SB),$48-80

// func Yposix_fallocate(tls *TLS, fd int32, base Toff_t, len1 Toff_t) (r int32)
TEXT ·Yposix_fallocate(SB),$40-68

// func Yposix_madvise(tls *TLS, addr uintptr, len1 Tsize_t, advice int32) (r int32)
TEXT ·Yposix_madvise(SB),$40-64

// func Yposix_openpt(tls *TLS, flags int32) (r1 int32)
TEXT ·Yposix_openpt(SB),$24-32

// func Yposix_spawn_file_actions_addchdir_np(tls *TLS, fa uintptr, path uintptr) (r int32)
TEXT ·Yposix_spawn_file_actions_addchdir_np(SB),$32-52

// func Yposix_spawn_file_actions_addclose(tls *TLS, fa uintptr, fd int32) (r int32)
TEXT ·Yposix_spawn_file_actions_addclose(SB),$32-48

// func Yposix_spawn_file_actions_adddup2(tls *TLS, fa uintptr, srcfd int32, fd int32) (r int32)
TEXT ·Yposix_spawn_file_actions_adddup2(SB),$32-52

// func Yposix_spawn_file_actions_addfchdir_np(tls *TLS, fa uintptr, fd int32) (r int32)
TEXT ·Yposix_spawn_file_actions_addfchdir_np(SB),$32-48

// func Yposix_spawn_file_actions_addopen(tls *TLS, fa uintptr, fd int32, path uintptr, flags int32, mode Tmode_t) (r int32)
TEXT ·Yposix_spawn_file_actions_addopen(SB),$48-84

// func Yposix_spawn_file_actions_destroy(tls *TLS, fa uintptr) (r int32)
TEXT ·Yposix_spawn_file_actions_destroy(SB),$24-36

// func Yposix_spawn_file_actions_init(tls *TLS, fa uintptr) (r int32)
TEXT ·Yposix_spawn_file_actions_init(SB),$24-36

// func Yposix_spawnattr_destroy(tls *TLS, attr uintptr) (r int32)
TEXT ·Yposix_spawnattr_destroy(SB),$24-36

// func Yposix_spawnattr_getflags(tls *TLS, attr uintptr, flags uintptr) (r int32)
TEXT ·Yposix_spawnattr_getflags(SB),$32-52

// func Yposix_spawnattr_getpgroup(tls *TLS, attr uintptr, pgrp uintptr) (r int32)
TEXT ·Yposix_spawnattr_getpgroup(SB),$32-52

// func Yposix_spawnattr_getschedparam(tls *TLS, attr uintptr, schedparam uintptr) (r int32)
TEXT ·Yposix_spawnattr_getschedparam(SB),$32-52

// func Yposix_spawnattr_getschedpolicy(tls *TLS, attr uintptr, policy uintptr) (r int32)
TEXT ·Yposix_spawnattr_getschedpolicy(SB),$32-52

// func Yposix_spawnattr_getsigdefault(tls *TLS, attr uintptr, def uintptr) (r int32)
TEXT ·Yposix_spawnattr_getsigdefault(SB),$32-52

// func Yposix_spawnattr_getsigmask(tls *TLS, attr uintptr, mask uintptr) (r int32)
TEXT ·Yposix_spawnattr_getsigmask(SB),$32-52

// func Yposix_spawnattr_init(tls *TLS, attr uintptr) (r int32)
TEXT ·Yposix_spawnattr_init(SB),$24-36

// func Yposix_spawnattr_setflags(tls *TLS, attr uintptr, flags int16) (r int32)
TEXT ·Yposix_spawnattr_setflags(SB),$32-46

// func Yposix_spawnattr_setpgroup(tls *TLS, attr uintptr, pgrp Tpid_t) (r int32)
TEXT ·Yposix_spawnattr_setpgroup(SB),$32-48

// func Yposix_spawnattr_setschedparam(tls *TLS, attr uintptr, schedparam uintptr) (r int32)
TEXT ·Yposix_spawnattr_setschedparam(SB),$32-52

// func Yposix_spawnattr_setschedpolicy(tls *TLS, attr uintptr, policy int32) (r int32)
TEXT ·Yposix_spawnattr_setschedpolicy(SB),$32-48

// func Yposix_spawnattr_setsigdefault(tls *TLS, attr uintptr, def uintptr) (r int32)
TEXT ·Yposix_spawnattr_setsigdefault(SB),$32-52

// func Yposix_spawnattr_setsigmask(tls *TLS, attr uintptr, mask uintptr) (r int32)
TEXT ·Yposix_spawnattr_setsigmask(SB),$32-52

// func Ypow(tls *TLS, x1 float64, y1 float64) (r float64)
TEXT ·Ypow(SB),$32-56

// func Ypow10(tls *TLS, x float64) (r float64)
TEXT ·Ypow10(SB),$24-40

// func Ypow10f(tls *TLS, x float32) (r float32)
TEXT ·Ypow10f(SB),$24-32

// func Ypow10l(tls *TLS, x float64) (r float64)
TEXT ·Ypow10l(SB),$24-40

// func Ypowf(tls *TLS, x1 float32, y1 float32) (r float32)
TEXT ·Ypowf(SB),$24-36

// func Ypowl(tls *TLS, x float64, y float64) (r float64)
TEXT ·Ypowl(SB),$32-56

// func Yppoll(tls *TLS, fds uintptr, n Tnfds_t, to uintptr, mask uintptr) (r int32)
TEXT ·Yppoll(SB),$48-84

// func Yprctl(tls *TLS, op int32, va uintptr) (r int32)
TEXT ·Yprctl(SB),$32-52

// func Ypread(tls *TLS, fd int32, buf uintptr, size Tsize_t, ofs Toff_t) (r Tssize_t)
TEXT ·Ypread(SB),$48-88

// func Ypreadv(tls *TLS, fd int32, iov uintptr, count int32, ofs Toff_t) (r Tssize_t)
TEXT ·Ypreadv(SB),$48-88

// func Ypreadv2(tls *TLS, fd int32, iov uintptr, count int32, ofs Toff_t, flags int32) (r Tssize_t)
TEXT ·Ypreadv2(SB),$56-100

// func Yprintf(tls *TLS, fmt uintptr, va uintptr) (r int32)
TEXT ·Yprintf(SB),$32-52

// func Yprlimit(tls *TLS, pid Tpid_t, resource int32, new_limit uintptr, old_limit uintptr) (r1 int32)
TEXT ·Yprlimit(SB),$40-68

// func Yprocess_vm_readv(tls *TLS, pid Tpid_t, lvec uintptr, liovcnt uint64, rvec uintptr, riovcnt uint64, flags uint64) (r Tssize_t)
TEXT ·Yprocess_vm_readv(SB),$64-120

// func Yprocess_vm_writev(tls *TLS, pid Tpid_t, lvec uintptr, liovcnt uint64, rvec uintptr, riovcnt uint64, flags uint64) (r Tssize_t)
TEXT ·Yprocess_vm_writev(SB),$64-120

// func Ypselect(tls *TLS, n int32, rfds uintptr, wfds uintptr, efds uintptr, ts uintptr, mask uintptr) (r int32)
TEXT ·Ypselect(SB),$64-116

// func Ypsiginfo(tls *TLS, si uintptr, msg uintptr)
TEXT ·Ypsiginfo(SB),$24-24

// func Ypsignal(tls *TLS, sig int32, msg uintptr)
TEXT ·Ypsignal(SB),$24-24

// func Ypthread_atfork(tls *TLS, prepare, parent, child uintptr) int32
TEXT ·Ypthread_atfork(SB),$40-68

// func Ypthread_attr_destroy(tls *TLS, a uintptr) int32
TEXT ·Ypthread_attr_destroy(SB),$24-36

// func Ypthread_attr_getdetachstate(tls *TLS, a uintptr, state uintptr) int32
TEXT ·Ypthread_attr_getdetachstate(SB),$32-52

// func Ypthread_attr_init(tls *TLS, a uintptr) int32
TEXT ·Ypthread_attr_init(SB),$24-36

// func Ypthread_attr_setdetachstate(tls *TLS, a uintptr, state int32) (r int32)
TEXT ·Ypthread_attr_setdetachstate(SB),$32-48

// func Ypthread_attr_setscope(tls *TLS, a uintptr, scope int32) int32
TEXT ·Ypthread_attr_setscope(SB),$32-48

// func Ypthread_attr_setstacksize(tls *TLS, a uintptr, stacksite Tsize_t) int32
TEXT ·Ypthread_attr_setstacksize(SB),$32-52

// func Ypthread_cleanup_pop(tls *TLS, run int32)
TEXT ·Ypthread_cleanup_pop(SB),$16-12

// func Ypthread_cleanup_push(tls *TLS, f, x uintptr)
TEXT ·Ypthread_cleanup_push(SB),$24-24

// func Ypthread_cond_broadcast(tls *TLS, c uintptr) int32
TEXT ·Ypthread_cond_broadcast(SB),$24-36

// func Ypthread_cond_destroy(tls *TLS, c uintptr) int32
TEXT ·Ypthread_cond_destroy(SB),$24-36

// func Ypthread_cond_init(tls *TLS, c, a uintptr) int32
TEXT ·Ypthread_cond_init(SB),$32-52

// func Ypthread_cond_signal(tls *TLS, c uintptr) int32
TEXT ·Ypthread_cond_signal(SB),$24-36

// func Ypthread_cond_timedwait(tls *TLS, c, m, ts uintptr) (r int32)
TEXT ·Ypthread_cond_timedwait(SB),$40-68

// func Ypthread_cond_wait(tls *TLS, c, m uintptr) int32
TEXT ·Ypthread_cond_wait(SB),$32-52

// func Ypthread_create(tls *TLS, res, attrp, entry, arg uintptr) int32
TEXT ·Ypthread_create(SB),$48-84

// func Ypthread_detach(tls *TLS, t uintptr) int32
TEXT ·Ypthread_detach(SB),$24-36

// func Ypthread_equal(tls *TLS, t, u uintptr) int32
TEXT ·Ypthread_equal(SB),$32-52

// func Ypthread_exit(tls *TLS, result uintptr)
TEXT ·Ypthread_exit(SB),$16-16

// func Ypthread_getspecific(tls *TLS, k Tpthread_key_t) uintptr
TEXT ·Ypthread_getspecific(SB),$24-36

// func Ypthread_join(tls *TLS, t Tpthread_t, res uintptr) (r int32)
TEXT ·Ypthread_join(SB),$32-52

// func Ypthread_key_create(tls *TLS, k uintptr, dtor uintptr) int32
TEXT ·Ypthread_key_create(SB),$32-52

// func Ypthread_key_delete(tls *TLS, k Tpthread_key_t) int32
TEXT ·Ypthread_key_delete(SB),$24-32

// func Ypthread_mutex_destroy(tls *TLS, m uintptr) int32
TEXT ·Ypthread_mutex_destroy(SB),$24-36

// func Ypthread_mutex_init(tls *TLS, m, a uintptr) int32
TEXT ·Ypthread_mutex_init(SB),$32-52

// func Ypthread_mutex_lock(tls *TLS, m uintptr) int32
TEXT ·Ypthread_mutex_lock(SB),$24-36

// func Ypthread_mutex_trylock(tls *TLS, m uintptr) int32
TEXT ·Ypthread_mutex_trylock(SB),$24-36

// func Ypthread_mutex_unlock(tls *TLS, m uintptr) int32
TEXT ·Ypthread_mutex_unlock(SB),$24-36

// func Ypthread_mutexattr_destroy(tls *TLS, a uintptr) int32
TEXT ·Ypthread_mutexattr_destroy(SB),$24-36

// func Ypthread_mutexattr_init(tls *TLS, a uintptr) int32
TEXT ·Ypthread_mutexattr_init(SB),$24-36

// func Ypthread_mutexattr_settype(tls *TLS, a uintptr, typ int32) int32
TEXT ·Ypthread_mutexattr_settype(SB),$32-48

// func Ypthread_self(tls *TLS) uintptr
TEXT ·Ypthread_self(SB),$16-24

// func Ypthread_setcancelstate(tls *TLS, new int32, old uintptr) int32
TEXT ·Ypthread_setcancelstate(SB),$32-52

// func Ypthread_setspecific(tls *TLS, k Tpthread_key_t, x uintptr) int32
TEXT ·Ypthread_setspecific(SB),$32-52

// func Ypthread_sigmask(tls *TLS, now int32, set, old uintptr) int32
TEXT ·Ypthread_sigmask(SB),$40-68

// func Yptrace(tls *TLS, req int32, va uintptr) (r int64)
TEXT ·Yptrace(SB),$32-56

// func Yptsname(tls *TLS, fd int32) (r uintptr)
TEXT ·Yptsname(SB),$24-36

// func Yptsname_r(tls *TLS, fd int32, buf uintptr, len1 Tsize_t) (r int32)
TEXT ·Yptsname_r(SB),$40-68

// func Yputc(tls *TLS, c1 int32, f1 uintptr) (r int32)
TEXT ·Yputc(SB),$32-52

// func Yputc_unlocked(tls *TLS, c int32, f uintptr) (r int32)
TEXT ·Yputc_unlocked(SB),$32-52

// func Yputchar(tls *TLS, c1 int32) (r int32)
TEXT ·Yputchar(SB),$24-32

// func Yputchar_unlocked(tls *TLS, c int32) (r int32)
TEXT ·Yputchar_unlocked(SB),$24-32

// func Yputenv(tls *TLS, s uintptr) (r int32)
TEXT ·Yputenv(SB),$24-36

// func Yputgrent(tls *TLS, gr uintptr, f uintptr) (r1 int32)
TEXT ·Yputgrent(SB),$32-52

// func Yputpwent(tls *TLS, pw uintptr, f uintptr) (r int32)
TEXT ·Yputpwent(SB),$32-52

// func Yputs(tls *TLS, s uintptr) (r1 int32)
TEXT ·Yputs(SB),$24-36

// func Yputspent(tls *TLS, sp uintptr, f uintptr) (r int32)
TEXT ·Yputspent(SB),$32-52

// func Ypututline(tls *TLS, ut uintptr) (r uintptr)
TEXT ·Ypututline(SB),$24-40

// func Ypututxline(tls *TLS, ut uintptr) (r uintptr)
TEXT ·Ypututxline(SB),$24-40

// func Yputw(tls *TLS, _x int32, f uintptr) (r int32)
TEXT ·Yputw(SB),$32-52

// func Yputwc(tls *TLS, c Twchar_t, f uintptr) (r Twint_t)
TEXT ·Yputwc(SB),$32-52

// func Yputwc_unlocked(tls *TLS, c Twchar_t, f uintptr) (r Twint_t)
TEXT ·Yputwc_unlocked(SB),$32-52

// func Yputwchar(tls *TLS, c Twchar_t) (r Twint_t)
TEXT ·Yputwchar(SB),$24-32

// func Yputwchar_unlocked(tls *TLS, c Twchar_t) (r Twint_t)
TEXT ·Yputwchar_unlocked(SB),$24-32

// func Ypwrite(tls *TLS, fd int32, buf uintptr, size Tsize_t, ofs Toff_t) (r Tssize_t)
TEXT ·Ypwrite(SB),$48-88

// func Ypwritev(tls *TLS, fd int32, iov uintptr, count int32, ofs Toff_t) (r Tssize_t)
TEXT ·Ypwritev(SB),$48-88

// func Ypwritev2(tls *TLS, fd int32, iov uintptr, count int32, ofs Toff_t, flags int32) (r Tssize_t)
TEXT ·Ypwritev2(SB),$56-100

// func Yqsort(tls *TLS, base uintptr, nel Tsize_t, width Tsize_t, cmp Tcmpfun)
TEXT ·Yqsort(SB),$40-40

// func Yqsort_r(tls *TLS, base uintptr, nel Tsize_t, width Tsize_t, cmp Tcmpfun, arg uintptr)
TEXT ·Yqsort_r(SB),$48-48

// func Yquick_exit(tls *TLS, code int32)
TEXT ·Yquick_exit(SB),$16-12

// func Yquotactl(tls *TLS, cmd int32, special uintptr, id int32, addr uintptr) (r int32)
TEXT ·Yquotactl(SB),$48-84

// func Yraise(tls *TLS, sig int32) (r int32)
TEXT ·Yraise(SB),$24-32

// func Yrand(tls *TLS) (r int32)
TEXT ·Yrand(SB),$16-20

// func Yrand_r(tls *TLS, seed uintptr) (r int32)
TEXT ·Yrand_r(SB),$24-36

// func Yrandom(tls *TLS) (r int64)
TEXT ·Yrandom(SB),$16-24

// func Yrandom_r(t *TLS, buf, result uintptr) int32
TEXT ·Yrandom_r(SB),$32-52

// func Yread(tls *TLS, fd int32, buf uintptr, count Tsize_t) (r Tssize_t)
TEXT ·Yread(SB),$40-72

// func Yreadahead(tls *TLS, fd int32, pos Toff_t, len1 Tsize_t) (r Tssize_t)
TEXT ·Yreadahead(SB),$40-72

// func Yreaddir(tls *TLS, dir uintptr) (r uintptr)
TEXT ·Yreaddir(SB),$24-40

// func Yreaddir64(tls *TLS, dir uintptr) (r uintptr)
TEXT ·Yreaddir64(SB),$24-40

// func Yreaddir_r(tls *TLS, dir uintptr, buf uintptr, result uintptr) (r int32)
TEXT ·Yreaddir_r(SB),$40-68

// func Yreadlink(tls *TLS, path uintptr, buf uintptr, bufsize Tsize_t) (r1 Tssize_t)
TEXT ·Yreadlink(SB),$40-72

// func Yreadlinkat(tls *TLS, fd int32, path uintptr, buf uintptr, bufsize Tsize_t) (r1 Tssize_t)
TEXT ·Yreadlinkat(SB),$48-88

// func Yreadv(tls *TLS, fd int32, iov uintptr, count int32) (r Tssize_t)
TEXT ·Yreadv(SB),$40-68

// func Yrealloc(tls *TLS, p uintptr, n Tsize_t) (r uintptr)
TEXT ·Yrealloc(SB),$32-56

// func Yreallocarray(tls *TLS, ptr uintptr, m Tsize_t, n Tsize_t) (r uintptr)
TEXT ·Yreallocarray(SB),$40-72

// func Yrealpath(tls *TLS, filename uintptr, resolved uintptr) (r uintptr)
TEXT ·Yrealpath(SB),$32-56

// func Yreboot(tls *TLS, type1 int32) (r int32)
TEXT ·Yreboot(SB),$24-32

// func Yrecv(tls *TLS, fd int32, buf uintptr, len1 Tsize_t, flags int32) (r Tssize_t)
TEXT ·Yrecv(SB),$48-84

// func Yrecvfrom(tls *TLS, fd int32, buf uintptr, len1 Tsize_t, flags int32, addr uintptr, alen uintptr) (r1 Tssize_t)
TEXT ·Yrecvfrom(SB),$64-120

// func Yrecvmmsg(tls *TLS, fd int32, msgvec uintptr, vlen uint32, flags uint32, timeout uintptr) (r int32)
TEXT ·Yrecvmmsg(SB),$48-84

// func Yrecvmsg(tls *TLS, fd int32, msg uintptr, flags int32) (r2 Tssize_t)
TEXT ·Yrecvmsg(SB),$40-68

// func Yregcomp(tls *TLS, preg uintptr, regex uintptr, cflags int32) (r int32)
TEXT ·Yregcomp(SB),$40-64

// func Yregerror(tls *TLS, e int32, preg uintptr, buf uintptr, size Tsize_t) (r Tsize_t)
TEXT ·Yregerror(SB),$48-88

// func Yregexec(tls *TLS, preg uintptr, string1 uintptr, nmatch Tsize_t, pmatch uintptr, eflags int32) (r int32)
TEXT ·Yregexec(SB),$56-96

// func Yregfree(tls *TLS, preg uintptr)
TEXT ·Yregfree(SB),$16-16

// func Yremainder(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yremainder(SB),$32-56

// func Yremainderf(tls *TLS, x float32, y float32) (r float32)
TEXT ·Yremainderf(SB),$24-36

// func Yremainderl(tls *TLS, x float64, y float64) (r float64)
TEXT ·Yremainderl(SB),$32-56

// func Yremap_file_pages(tls *TLS, addr uintptr, size Tsize_t, prot int32, pgoff Tsize_t, flags int32) (r int32)
TEXT ·Yremap_file_pages(SB),$56-96

// func Yremove(tls *TLS, path uintptr) (r1 int32)
TEXT ·Yremove(SB),$24-36

// func Yremovexattr(tls *TLS, path uintptr, name uintptr) (r int32)
TEXT ·Yremovexattr(SB),$32-52

// func Yremque(tls *TLS, element uintptr)
TEXT ·Yremque(SB),$16-16

// func Yremquo(tls *TLS, x float64, y float64, quo uintptr) (r float64)
TEXT ·Yremquo(SB),$40-72

// func Yremquof(tls *TLS, x float32, y float32, quo uintptr) (r float32)
TEXT ·Yremquof(SB),$32-52

// func Yremquol(tls *TLS, x float64, y float64, quo uintptr) (r float64)
TEXT ·Yremquol(SB),$40-72

// func Yrename(tls *TLS, old uintptr, new1 uintptr) (r int32)
TEXT ·Yrename(SB),$32-52

// func Yrenameat(tls *TLS, oldfd int32, old uintptr, newfd int32, new1 uintptr) (r int32)
TEXT ·Yrenameat(SB),$48-84

// func Yrenameat2(t *TLS, olddirfd int32, oldpath uintptr, newdirfd int32, newpath uintptr, flags int32) int32
TEXT ·Yrenameat2(SB),$56-96

// func Yres_init(tls *TLS) (r int32)
TEXT ·Yres_init(SB),$16-20

// func Yres_mkquery(tls *TLS, op int32, dname uintptr, class int32, type1 int32, data uintptr, datalen int32, newrr uintptr, buf uintptr, buflen int32) (r int32)
TEXT ·Yres_mkquery(SB),$80-144

// func Yres_send(tls *TLS, _msg uintptr, _msglen int32, _answer uintptr, _anslen int32) (r int32)
TEXT ·Yres_send(SB),$48-80

// func Yrewind(tls *TLS, f uintptr)
TEXT ·Yrewind(SB),$16-16

// func Yrewinddir(tls *TLS, dir uintptr)
TEXT ·Yrewinddir(SB),$16-16

// func Yrindex(tls *TLS, s uintptr, c int32) (r uintptr)
TEXT ·Yrindex(SB),$32-52

// func Yrint(tls *TLS, x float64) (r float64)
TEXT ·Yrint(SB),$24-40

// func Yrintf(tls *TLS, x float32) (r float32)
TEXT ·Yrintf(SB),$24-32

// func Yrintl(tls *TLS, x float64) (r float64)
TEXT ·Yrintl(SB),$24-40

// func Yrmdir(tls *TLS, path uintptr) (r int32)
TEXT ·Yrmdir(SB),$24-36

// func Yround(tls *TLS, x3 float64) (r float64)
TEXT ·Yround(SB),$24-40

// func Yroundf(tls *TLS, x3 float32) (r float32)
TEXT ·Yroundf(SB),$24-32

// func Yroundl(tls *TLS, x float64) (r float64)
TEXT ·Yroundl(SB),$24-40

// func Ysbrk(tls *TLS, inc Tintptr_t) (r uintptr)
TEXT ·Ysbrk(SB),$24-40

// func Yscalb(tls *TLS, x float64, fn float64) (r float64)
TEXT ·Yscalb(SB),$32-56

// func Yscalbf(tls *TLS, x float32, fn float32) (r float32)
TEXT ·Yscalbf(SB),$24-36

// func Yscalbln(tls *TLS, x float64, n int64) (r float64)
TEXT ·Yscalbln(SB),$32-56

// func Yscalblnf(tls *TLS, x float32, n int64) (r float32)
TEXT ·Yscalblnf(SB),$32-52

// func Yscalblnl(tls *TLS, x float64, n int64) (r float64)
TEXT ·Yscalblnl(SB),$32-56

// func Yscalbn(tls *TLS, x float64, n int32) (r float64)
TEXT ·Yscalbn(SB),$32-52

// func Yscalbnf(tls *TLS, x float32, n int32) (r float32)
TEXT ·Yscalbnf(SB),$24-36

// func Yscalbnl(tls *TLS, x float64, n int32) (r float64)
TEXT ·Yscalbnl(SB),$32-52

// func Yscandir(tls *TLS, path uintptr, res uintptr, sel uintptr, cmp uintptr) (r int32)
TEXT ·Yscandir(SB),$48-84

// func Yscanf(tls *TLS, fmt uintptr, va uintptr) (r int32)
TEXT ·Yscanf(SB),$32-52

// func Ysched_yield(tls *TLS) int32
TEXT ·Ysched_yield(SB),$16-20

// func Ysecure_getenv(tls *TLS, name uintptr) (r uintptr)
TEXT ·Ysecure_getenv(SB),$24-40

// func Yseed48(tls *TLS, s uintptr) (r uintptr)
TEXT ·Yseed48(SB),$24-40

// func Yseekdir(tls *TLS, dir uintptr, off int64)
TEXT ·Yseekdir(SB),$24-24

// func Yselect(tls *TLS, n int32, rfds uintptr, wfds uintptr, efds uintptr, tv uintptr) (r int32)
TEXT ·Yselect(SB),$56-100

// func Ysemctl(tls *TLS, id int32, num int32, cmd int32, va uintptr) (r1 int32)
TEXT ·Ysemctl(SB),$40-68

// func Ysemget(tls *TLS, key Tkey_t, n int32, fl int32) (r int32)
TEXT ·Ysemget(SB),$32-48

// func Ysemop(tls *TLS, id int32, buf uintptr, n Tsize_t) (r int32)
TEXT ·Ysemop(SB),$40-68

// func Ysemtimedop(tls *TLS, id int32, buf uintptr, n Tsize_t, ts uintptr) (r int32)
TEXT ·Ysemtimedop(SB),$48-84

// func Ysend(tls *TLS, fd int32, buf uintptr, len1 Tsize_t, flags int32) (r Tssize_t)
TEXT ·Ysend(SB),$48-84

// func Ysendfile(tls *TLS, out_fd int32, in_fd int32, ofs uintptr, count Tsize_t) (r Tssize_t)
TEXT ·Ysendfile(SB),$40-72

// func Ysendmmsg(tls *TLS, fd int32, msgvec uintptr, vlen uint32, flags uint32) (r1 int32)
TEXT ·Ysendmmsg(SB),$40-68

// func Ysendmsg(tls *TLS, fd int32, msg uintptr, flags int32) (r1 Tssize_t)
TEXT ·Ysendmsg(SB),$40-68

// func Ysendto(tls *TLS, fd int32, buf uintptr, len1 Tsize_t, flags int32, addr uintptr, alen Tsocklen_t) (r1 Tssize_t)
TEXT ·Ysendto(SB),$64-116

// func Ysetbuf(tls *TLS, f uintptr, buf uintptr)
TEXT ·Ysetbuf(SB),$24-24

// func Ysetbuffer(tls *TLS, f uintptr, buf uintptr, size Tsize_t)
TEXT ·Ysetbuffer(SB),$32-32

// func Ysetdomainname(tls *TLS, name uintptr, len1 Tsize_t) (r int32)
TEXT ·Ysetdomainname(SB),$32-52

// func Ysetenv(tls *TLS, var1 uintptr, value uintptr, overwrite int32) (r int32)
TEXT ·Ysetenv(SB),$40-64

// func Ysetfsgid(tls *TLS, gid Tgid_t) (r int32)
TEXT ·Ysetfsgid(SB),$24-32

// func Ysetfsuid(tls *TLS, uid Tuid_t) (r int32)
TEXT ·Ysetfsuid(SB),$24-32

// func Ysetgid(tls *TLS, gid Tgid_t) (r int32)
TEXT ·Ysetgid(SB),$24-32

// func Ysetgrent(tls *TLS)
TEXT ·Ysetgrent(SB),$8-8

// func Ysethostent(tls *TLS, x int32)
TEXT ·Ysethostent(SB),$16-12

// func Ysethostname(tls *TLS, name uintptr, len1 Tsize_t) (r int32)
TEXT ·Ysethostname(SB),$32-52

// func Ysetitimer(tls *TLS, which int32, new1 uintptr, old uintptr) (r1 int32)
TEXT ·Ysetitimer(SB),$40-68

// func Ysetjmp(t *TLS, env uintptr) int32
TEXT ·Ysetjmp(SB),$24-36

// func Ysetkey(tls *TLS, key uintptr)
TEXT ·Ysetkey(SB),$16-16

// func Ysetlinebuf(tls *TLS, f uintptr)
TEXT ·Ysetlinebuf(SB),$16-16

// func Ysetlocale(tls *TLS, cat int32, name uintptr) (r uintptr)
TEXT ·Ysetlocale(SB),$32-56

// func Ysetlogmask(tls *TLS, maskpri int32) (r int32)
TEXT ·Ysetlogmask(SB),$24-32

// func Ysetmntent(tls *TLS, name uintptr, mode uintptr) (r uintptr)
TEXT ·Ysetmntent(SB),$32-56

// func Ysetnetent(tls *TLS, x int32)
TEXT ·Ysetnetent(SB),$16-12

// func Ysetns(tls *TLS, fd int32, nstype int32) (r int32)
TEXT ·Ysetns(SB),$24-36

// func Ysetpgid(tls *TLS, pid Tpid_t, pgid Tpid_t) (r int32)
TEXT ·Ysetpgid(SB),$24-36

// func Ysetpgrp(tls *TLS) (r Tpid_t)
TEXT ·Ysetpgrp(SB),$16-20

// func Ysetpriority(tls *TLS, which int32, who Tid_t, prio int32) (r int32)
TEXT ·Ysetpriority(SB),$32-48

// func Ysetprotoent(tls *TLS, stayopen int32)
TEXT ·Ysetprotoent(SB),$16-12

// func Ysetpwent(tls *TLS)
TEXT ·Ysetpwent(SB),$8-8

// func Ysetrlimit(tls *TLS, resource int32, rlim uintptr) (r int32)
TEXT ·Ysetrlimit(SB),$32-52

// func Ysetrlimit64(tls *TLS, resource int32, rlim uintptr) (r int32)
TEXT ·Ysetrlimit64(SB),$32-52

// func Ysetservent(tls *TLS, stayopen int32)
TEXT ·Ysetservent(SB),$16-12

// func Ysetsid(tls *TLS) (r Tpid_t)
TEXT ·Ysetsid(SB),$16-20

// func Ysetsockopt(tls *TLS, fd int32, level int32, optname int32, optval uintptr, optlen Tsocklen_t) (r2 int32)
TEXT ·Ysetsockopt(SB),$48-80

// func Ysetspent(tls *TLS)
TEXT ·Ysetspent(SB),$8-8

// func Ysetstate(tls *TLS, state uintptr) (r uintptr)
TEXT ·Ysetstate(SB),$24-40

// func Ysettimeofday(tls *TLS, tv uintptr, tz uintptr) (r int32)
TEXT ·Ysettimeofday(SB),$32-52

// func Ysetuid(tls *TLS, uid Tuid_t) (r int32)
TEXT ·Ysetuid(SB),$24-32

// func Ysetusershell(tls *TLS)
TEXT ·Ysetusershell(SB),$8-8

// func Ysetutent(tls *TLS)
TEXT ·Ysetutent(SB),$8-8

// func Ysetutxent(tls *TLS)
TEXT ·Ysetutxent(SB),$8-8

// func Ysetvbuf(tls *TLS, f uintptr, buf uintptr, type1 int32, size Tsize_t) (r int32)
TEXT ·Ysetvbuf(SB),$48-84

// func Ysetxattr(tls *TLS, path uintptr, name uintptr, value uintptr, size Tsize_t, flags int32) (r int32)
TEXT ·Ysetxattr(SB),$56-96

// func Yshm_open(tls *TLS, name uintptr, flag int32, mode Tmode_t) (r int32)
TEXT ·Yshm_open(SB),$32-52

// func Yshm_unlink(tls *TLS, name uintptr) (r int32)
TEXT ·Yshm_unlink(SB),$24-36

// func Yshmat(tls *TLS, id int32, addr uintptr, flag int32) (r uintptr)
TEXT ·Yshmat(SB),$40-68

// func Yshmctl(tls *TLS, id int32, cmd int32, buf uintptr) (r1 int32)
TEXT ·Yshmctl(SB),$32-52

// func Yshmdt(tls *TLS, addr uintptr) (r int32)
TEXT ·Yshmdt(SB),$24-36

// func Yshmget(tls *TLS, key Tkey_t, size Tsize_t, flag int32) (r int32)
TEXT ·Yshmget(SB),$40-64

// func Yshutdown(tls *TLS, fd int32, how int32) (r1 int32)
TEXT ·Yshutdown(SB),$24-36

// func Ysigaction(tls *TLS, sig int32, sa uintptr, old uintptr) (r int32)
TEXT ·Ysigaction(SB),$40-68

// func Ysigaddset(tls *TLS, set uintptr, sig int32) (r int32)
TEXT ·Ysigaddset(SB),$32-48

// func Ysigaltstack(tls *TLS, ss uintptr, old uintptr) (r int32)
TEXT ·Ysigaltstack(SB),$32-52

// func Ysigandset(tls *TLS, dest uintptr, left uintptr, right uintptr) (r1 int32)
TEXT ·Ysigandset(SB),$40-68

// func Ysigdelset(tls *TLS, set uintptr, sig int32) (r int32)
TEXT ·Ysigdelset(SB),$32-48

// func Ysigemptyset(tls *TLS, set uintptr) (r int32)
TEXT ·Ysigemptyset(SB),$24-36

// func Ysigfillset(tls *TLS, set uintptr) (r int32)
TEXT ·Ysigfillset(SB),$24-36

// func Ysigisemptyset(tls *TLS, set uintptr) (r int32)
TEXT ·Ysigisemptyset(SB),$24-36

// func Ysigismember(tls *TLS, set uintptr, sig int32) (r int32)
TEXT ·Ysigismember(SB),$32-48

// func Ysignal(tls *TLS, signum int32, handler uintptr) (r uintptr)
TEXT ·Ysignal(SB),$32-56

// func Ysignalfd(tls *TLS, fd int32, sigs uintptr, flags int32) (r int32)
TEXT ·Ysignalfd(SB),$40-64

// func Ysignificand(tls *TLS, x float64) (r float64)
TEXT ·Ysignificand(SB),$24-40

// func Ysignificandf(tls *TLS, x float32) (r float32)
TEXT ·Ysignificandf(SB),$24-32

// func Ysigorset(tls *TLS, dest uintptr, left uintptr, right uintptr) (r1 int32)
TEXT ·Ysigorset(SB),$40-68

// func Ysigpending(tls *TLS, set uintptr) (r int32)
TEXT ·Ysigpending(SB),$24-36

// func Ysigprocmask(tls *TLS, how int32, set uintptr, old uintptr) (r1 int32)
TEXT ·Ysigprocmask(SB),$40-68

// func Ysigqueue(tls *TLS, pid Tpid_t, sig int32, value Tsigval) (r1 int32)
TEXT ·Ysigqueue(SB),$32-52

// func Ysigsuspend(tls *TLS, mask uintptr) (r int32)
TEXT ·Ysigsuspend(SB),$24-36

// func Ysigtimedwait(tls *TLS, mask uintptr, si uintptr, timeout uintptr) (r int32)
TEXT ·Ysigtimedwait(SB),$40-68

// func Ysigwait(tls *TLS, mask uintptr, sig uintptr) (r int32)
TEXT ·Ysigwait(SB),$32-52

// func Ysigwaitinfo(tls *TLS, mask uintptr, si uintptr) (r int32)
TEXT ·Ysigwaitinfo(SB),$32-52

// func Ysin(tls *TLS, x3 float64) (r float64)
TEXT ·Ysin(SB),$24-40

// func Ysincos(tls *TLS, x3 float64, sin uintptr, cos uintptr)
TEXT ·Ysincos(SB),$32-32

// func Ysincosf(tls *TLS, x3 float32, sin uintptr, cos uintptr)
TEXT ·Ysincosf(SB),$32-32

// func Ysincosl(tls *TLS, x float64, sin uintptr, cos uintptr)
TEXT ·Ysincosl(SB),$32-32

// func Ysinf(tls *TLS, x3 float32) (r float32)
TEXT ·Ysinf(SB),$24-32

// func Ysinh(tls *TLS, x float64) (r float64)
TEXT ·Ysinh(SB),$24-40

// func Ysinhf(tls *TLS, x float32) (r float32)
TEXT ·Ysinhf(SB),$24-32

// func Ysinhl(tls *TLS, x float64) (r float64)
TEXT ·Ysinhl(SB),$24-40

// func Ysinl(tls *TLS, x float64) (r float64)
TEXT ·Ysinl(SB),$24-40

// func Ysleep(tls *TLS, seconds uint32) (r uint32)
TEXT ·Ysleep(SB),$24-32

// func Ysnprintf(tls *TLS, s uintptr, n Tsize_t, fmt uintptr, va uintptr) (r int32)
TEXT ·Ysnprintf(SB),$48-84

// func Ysockatmark(tls *TLS, s int32) (r int32)
TEXT ·Ysockatmark(SB),$24-32

// func Ysocket(tls *TLS, domain int32, type1 int32, protocol int32) (r1 int32)
TEXT ·Ysocket(SB),$32-48

// func Ysocketpair(tls *TLS, domain int32, type1 int32, protocol int32, fd uintptr) (r2 int32)
TEXT ·Ysocketpair(SB),$40-68

// func Ysplice(tls *TLS, fd_in int32, off_in uintptr, fd_out int32, off_out uintptr, len1 Tsize_t, flags uint32) (r Tssize_t)
TEXT ·Ysplice(SB),$64-116

// func Ysprintf(tls *TLS, s uintptr, fmt uintptr, va uintptr) (r int32)
TEXT ·Ysprintf(SB),$40-68

// func Ysqrt(tls *TLS, x1 float64) (r1 float64)
TEXT ·Ysqrt(SB),$24-40

// func Ysqrtf(tls *TLS, x1 float32) (r1 float32)
TEXT ·Ysqrtf(SB),$24-32

// func Ysqrtl(tls *TLS, x float64) (r float64)
TEXT ·Ysqrtl(SB),$24-40

// func Ysrand(tls *TLS, s uint32)
TEXT ·Ysrand(SB),$16-12

// func Ysrand48(tls *TLS, seed int64)
TEXT ·Ysrand48(SB),$16-16

// func Ysrandom(tls *TLS, seed uint32)
TEXT ·Ysrandom(SB),$16-12

// func Ysscanf(tls *TLS, s uintptr, fmt uintptr, va uintptr) (r int32)
TEXT ·Ysscanf(SB),$40-68

// func Ystat(tls *TLS, path uintptr, buf uintptr) (r int32)
TEXT ·Ystat(SB),$32-52

// func Ystat64(tls *TLS, path uintptr, buf uintptr) (r int32)
TEXT ·Ystat64(SB),$32-52

// func Ystatvfs(tls *TLS, path uintptr, buf uintptr) (r int32)
TEXT ·Ystatvfs(SB),$32-52

// func Ystatx(tls *TLS, dirfd int32, path uintptr, flags int32, mask uint32, stx uintptr) (r int32)
TEXT ·Ystatx(SB),$48-84

// func Ystime(tls *TLS, t uintptr) (r int32)
TEXT ·Ystime(SB),$24-36

// func Ystpcpy(tls *TLS, d uintptr, s uintptr) (r uintptr)
TEXT ·Ystpcpy(SB),$32-56

// func Ystpncpy(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r uintptr)
TEXT ·Ystpncpy(SB),$40-72

// func Ystrcasecmp(tls *TLS, _l uintptr, _r uintptr) (r1 int32)
TEXT ·Ystrcasecmp(SB),$32-52

// func Ystrcasecmp_l(tls *TLS, l uintptr, r uintptr, loc Tlocale_t) (r1 int32)
TEXT ·Ystrcasecmp_l(SB),$40-68

// func Ystrcasestr(tls *TLS, h uintptr, n uintptr) (r uintptr)
TEXT ·Ystrcasestr(SB),$32-56

// func Ystrcat(tls *TLS, dest uintptr, src uintptr) (r uintptr)
TEXT ·Ystrcat(SB),$32-56

// func Ystrchr(tls *TLS, s uintptr, c int32) (r1 uintptr)
TEXT ·Ystrchr(SB),$32-52

// func Ystrchrnul(tls *TLS, s uintptr, c int32) (r uintptr)
TEXT ·Ystrchrnul(SB),$32-52

// func Ystrcmp(tls *TLS, l uintptr, r uintptr) (r1 int32)
TEXT ·Ystrcmp(SB),$32-52

// func Ystrcoll(tls *TLS, l uintptr, r uintptr) (r1 int32)
TEXT ·Ystrcoll(SB),$32-52

// func Ystrcoll_l(tls *TLS, l uintptr, r uintptr, loc Tlocale_t) (r1 int32)
TEXT ·Ystrcoll_l(SB),$40-68

// func Ystrcpy(tls *TLS, dest uintptr, src uintptr) (r uintptr)
TEXT ·Ystrcpy(SB),$32-56

// func Ystrcspn(tls *TLS, s uintptr, c uintptr) (r Tsize_t)
TEXT ·Ystrcspn(SB),$32-56

// func Ystrdup(tls *TLS, s uintptr) (r uintptr)
TEXT ·Ystrdup(SB),$24-40

// func Ystrerror(tls *TLS, e int32) (r uintptr)
TEXT ·Ystrerror(SB),$24-36

// func Ystrerror_l(tls *TLS, e int32, loc Tlocale_t) (r uintptr)
TEXT ·Ystrerror_l(SB),$32-56

// func Ystrerror_r(tls *TLS, err int32, buf uintptr, buflen Tsize_t) (r int32)
TEXT ·Ystrerror_r(SB),$40-68

// func Ystrfmon(tls *TLS, s uintptr, n Tsize_t, fmt uintptr, va uintptr) (r Tssize_t)
TEXT ·Ystrfmon(SB),$48-88

// func Ystrfmon_l(tls *TLS, s uintptr, n Tsize_t, loc Tlocale_t, fmt uintptr, va uintptr) (r Tssize_t)
TEXT ·Ystrfmon_l(SB),$56-104

// func Ystrftime(tls *TLS, s uintptr, n Tsize_t, f uintptr, tm uintptr) (r Tsize_t)
TEXT ·Ystrftime(SB),$48-88

// func Ystrftime_l(tls *TLS, s uintptr, n Tsize_t, f uintptr, tm uintptr, loc Tlocale_t) (r Tsize_t)
TEXT ·Ystrftime_l(SB),$56-104

// func Ystrlcat(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r Tsize_t)
TEXT ·Ystrlcat(SB),$40-72

// func Ystrlcpy(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r Tsize_t)
TEXT ·Ystrlcpy(SB),$40-72

// func Ystrlen(tls *TLS, s uintptr) (r Tsize_t)
TEXT ·Ystrlen(SB),$24-40

// func Ystrncasecmp(tls *TLS, _l uintptr, _r uintptr, n Tsize_t) (r1 int32)
TEXT ·Ystrncasecmp(SB),$40-68

// func Ystrncasecmp_l(tls *TLS, l uintptr, r uintptr, n Tsize_t, loc Tlocale_t) (r1 int32)
TEXT ·Ystrncasecmp_l(SB),$48-84

// func Ystrncat(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r uintptr)
TEXT ·Ystrncat(SB),$40-72

// func Ystrncmp(tls *TLS, _l uintptr, _r uintptr, n Tsize_t) (r1 int32)
TEXT ·Ystrncmp(SB),$40-68

// func Ystrncpy(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r uintptr)
TEXT ·Ystrncpy(SB),$40-72

// func Ystrndup(tls *TLS, s uintptr, n Tsize_t) (r uintptr)
TEXT ·Ystrndup(SB),$32-56

// func Ystrnlen(tls *TLS, s uintptr, n Tsize_t) (r Tsize_t)
TEXT ·Ystrnlen(SB),$32-56

// func Ystrpbrk(tls *TLS, s uintptr, b uintptr) (r uintptr)
TEXT ·Ystrpbrk(SB),$32-56

// func Ystrptime(tls *TLS, s uintptr, f uintptr, tm uintptr) (r uintptr)
TEXT ·Ystrptime(SB),$40-72

// func Ystrrchr(tls *TLS, s uintptr, c int32) (r uintptr)
TEXT ·Ystrrchr(SB),$32-52

// func Ystrsep(tls *TLS, str uintptr, sep uintptr) (r uintptr)
TEXT ·Ystrsep(SB),$32-56

// func Ystrsignal(tls *TLS, signum int32) (r uintptr)
TEXT ·Ystrsignal(SB),$24-36

// func Ystrspn(tls *TLS, s uintptr, c uintptr) (r Tsize_t)
TEXT ·Ystrspn(SB),$32-56

// func Ystrstr(tls *TLS, h uintptr, n uintptr) (r uintptr)
TEXT ·Ystrstr(SB),$32-56

// func Ystrtod(tls *TLS, s uintptr, p uintptr) (r float64)
TEXT ·Ystrtod(SB),$32-56

// func Ystrtod_l(tls *TLS, s uintptr, p uintptr, l Tlocale_t) (r float64)
TEXT ·Ystrtod_l(SB),$40-72

// func Ystrtof(tls *TLS, s uintptr, p uintptr) (r float32)
TEXT ·Ystrtof(SB),$32-52

// func Ystrtof_l(tls *TLS, s uintptr, p uintptr, l Tlocale_t) (r float32)
TEXT ·Ystrtof_l(SB),$40-68

// func Ystrtoimax(tls *TLS, s uintptr, p uintptr, base int32) (r Tintmax_t)
TEXT ·Ystrtoimax(SB),$40-68

// func Ystrtok(tls *TLS, s uintptr, sep uintptr) (r uintptr)
TEXT ·Ystrtok(SB),$32-56

// func Ystrtok_r(tls *TLS, s uintptr, sep uintptr, p uintptr) (r uintptr)
TEXT ·Ystrtok_r(SB),$40-72

// func Ystrtol(tls *TLS, s uintptr, p uintptr, base int32) (r int64)
TEXT ·Ystrtol(SB),$40-68

// func Ystrtold(tls *TLS, s uintptr, p uintptr) (r float64)
TEXT ·Ystrtold(SB),$32-56

// func Ystrtold_l(tls *TLS, s uintptr, p uintptr, l Tlocale_t) (r float64)
TEXT ·Ystrtold_l(SB),$40-72

// func Ystrtoll(tls *TLS, s uintptr, p uintptr, base int32) (r int64)
TEXT ·Ystrtoll(SB),$40-68

// func Ystrtoul(tls *TLS, s uintptr, p uintptr, base int32) (r uint64)
TEXT ·Ystrtoul(SB),$40-68

// func Ystrtoull(tls *TLS, s uintptr, p uintptr, base int32) (r uint64)
TEXT ·Ystrtoull(SB),$40-68

// func Ystrtoumax(tls *TLS, s uintptr, p uintptr, base int32) (r Tuintmax_t)
TEXT ·Ystrtoumax(SB),$40-68

// func Ystrverscmp(tls *TLS, l0 uintptr, r0 uintptr) (r1 int32)
TEXT ·Ystrverscmp(SB),$32-52

// func Ystrxfrm(tls *TLS, dest uintptr, src uintptr, n Tsize_t) (r Tsize_t)
TEXT ·Ystrxfrm(SB),$40-72

// func Ystrxfrm_l(tls *TLS, dest uintptr, src uintptr, n Tsize_t, loc Tlocale_t) (r Tsize_t)
TEXT ·Ystrxfrm_l(SB),$48-88

// func Yswab(tls *TLS, _src uintptr, _dest uintptr, n Tssize_t)
TEXT ·Yswab(SB),$32-32

// func Yswapoff(tls *TLS, path uintptr) (r int32)
TEXT ·Yswapoff(SB),$24-36

// func Yswapon(tls *TLS, path uintptr, flags int32) (r int32)
TEXT ·Yswapon(SB),$32-48

// func Yswprintf(tls *TLS, s uintptr, n Tsize_t, fmt uintptr, va uintptr) (r int32)
TEXT ·Yswprintf(SB),$48-84

// func Yswscanf(tls *TLS, s uintptr, fmt uintptr, va uintptr) (r int32)
TEXT ·Yswscanf(SB),$40-68

// func Ysymlink(tls *TLS, existing uintptr, new1 uintptr) (r int32)
TEXT ·Ysymlink(SB),$32-52

// func Ysymlinkat(tls *TLS, existing uintptr, fd int32, new1 uintptr) (r int32)
TEXT ·Ysymlinkat(SB),$40-68

// func Ysync(tls *TLS)
TEXT ·Ysync(SB),$8-8

// func Ysync_file_range(tls *TLS, fd int32, pos Toff_t, len1 Toff_t, flags uint32) (r int32)
TEXT ·Ysync_file_range(SB),$48-80

// func Ysyncfs(tls *TLS, fd int32) (r int32)
TEXT ·Ysyncfs(SB),$24-32

// func Ysyscall(tls *TLS, n int64, va uintptr) (r int64)
TEXT ·Ysyscall(SB),$32-56

// func Ysysconf(tls *TLS, name int32) (r int64)
TEXT ·Ysysconf(SB),$24-36

// func Ysysctlbyname(t *TLS, name, oldp, oldlenp, newp uintptr, newlen Tsize_t) int32
TEXT ·Ysysctlbyname(SB),$56-100

// func Ysysinfo(tls *TLS, info uintptr) (r int32)
TEXT ·Ysysinfo(SB),$24-36

// func Ysyslog(tls *TLS, priority int32, message uintptr, va uintptr)
TEXT ·Ysyslog(SB),$32-32

// func Ysystem(t *TLS, command uintptr) int32
TEXT ·Ysystem(SB),$24-36

// func Ytan(tls *TLS, x3 float64) (r float64)
TEXT ·Ytan(SB),$24-40

// func Ytanf(tls *TLS, x3 float32) (r float32)
TEXT ·Ytanf(SB),$24-32

// func Ytanh(tls *TLS, x3 float64) (r float64)
TEXT ·Ytanh(SB),$24-40

// func Ytanhf(tls *TLS, x3 float32) (r float32)
TEXT ·Ytanhf(SB),$24-32

// func Ytanhl(tls *TLS, x float64) (r float64)
TEXT ·Ytanhl(SB),$24-40

// func Ytanl(tls *TLS, x float64) (r float64)
TEXT ·Ytanl(SB),$24-40

// func Ytcdrain(tls *TLS, fd int32) (r int32)
TEXT ·Ytcdrain(SB),$24-32

// func Ytcflow(tls *TLS, fd int32, action int32) (r int32)
TEXT ·Ytcflow(SB),$24-36

// func Ytcflush(tls *TLS, fd int32, queue int32) (r int32)
TEXT ·Ytcflush(SB),$24-36

// func Ytcgetattr(tls *TLS, fd int32, tio uintptr) (r int32)
TEXT ·Ytcgetattr(SB),$32-52

// func Ytcgetpgrp(tls *TLS, fd int32) (r Tpid_t)
TEXT ·Ytcgetpgrp(SB),$24-32

// func Ytcgetsid(tls *TLS, fd int32) (r Tpid_t)
TEXT ·Ytcgetsid(SB),$24-32

// func Ytcgetwinsize(tls *TLS, fd int32, wsz uintptr) (r int32)
TEXT ·Ytcgetwinsize(SB),$32-52

// func Ytcsendbreak(tls *TLS, fd int32, dur int32) (r int32)
TEXT ·Ytcsendbreak(SB),$24-36

// func Ytcsetattr(tls *TLS, fd int32, act int32, tio uintptr) (r int32)
TEXT ·Ytcsetattr(SB),$32-52

// func Ytcsetpgrp(tls *TLS, fd int32, pgrp Tpid_t) (r int32)
TEXT ·Ytcsetpgrp(SB),$24-36

// func Ytcsetwinsize(tls *TLS, fd int32, wsz uintptr) (r int32)
TEXT ·Ytcsetwinsize(SB),$32-52

// func Ytdelete(tls *TLS, key uintptr, rootp uintptr, cmp uintptr) (r uintptr)
TEXT ·Ytdelete(SB),$40-72

// func Ytdestroy(tls *TLS, root uintptr, freekey uintptr)
TEXT ·Ytdestroy(SB),$24-24

// func Ytee(tls *TLS, src int32, dest int32, len1 Tsize_t, flags uint32) (r Tssize_t)
TEXT ·Ytee(SB),$40-68

// func Ytelldir(tls *TLS, dir uintptr) (r int64)
TEXT ·Ytelldir(SB),$24-40

// func Ytempnam(tls *TLS, dir uintptr, pfx uintptr) (r1 uintptr)
TEXT ·Ytempnam(SB),$32-56

// func Ytextdomain(tls *TLS, domainname uintptr) (r uintptr)
TEXT ·Ytextdomain(SB),$24-40

// func Ytfind(tls *TLS, key uintptr, rootp uintptr, cmp uintptr) (r uintptr)
TEXT ·Ytfind(SB),$40-72

// func Ytgamma(tls *TLS, x3 float64) (r1 float64)
TEXT ·Ytgamma(SB),$24-40

// func Ytgammaf(tls *TLS, x float32) (r float32)
TEXT ·Ytgammaf(SB),$24-32

// func Ytgammal(tls *TLS, x float64) (r float64)
TEXT ·Ytgammal(SB),$24-40

// func Ytime(tls *TLS, t uintptr) (r Ttime_t)
TEXT ·Ytime(SB),$24-40

// func Ytimegm(tls *TLS, tm uintptr) (r Ttime_t)
TEXT ·Ytimegm(SB),$24-40

// func Ytimer_delete(tls *TLS, t Ttimer_t) (r int32)
TEXT ·Ytimer_delete(SB),$24-36

// func Ytimer_getoverrun(tls *TLS, t Ttimer_t) (r int32)
TEXT ·Ytimer_getoverrun(SB),$24-36

// func Ytimer_gettime(tls *TLS, t Ttimer_t, val uintptr) (r int32)
TEXT ·Ytimer_gettime(SB),$32-52

// func Ytimer_settime(tls *TLS, t Ttimer_t, flags int32, val uintptr, old uintptr) (r int32)
TEXT ·Ytimer_settime(SB),$48-84

// func Ytimerfd_create(tls *TLS, clockid int32, flags int32) (r int32)
TEXT ·Ytimerfd_create(SB),$24-36

// func Ytimerfd_gettime(tls *TLS, fd int32, cur uintptr) (r int32)
TEXT ·Ytimerfd_gettime(SB),$32-52

// func Ytimerfd_settime(tls *TLS, fd int32, flags int32, new1 uintptr, old uintptr) (r int32)
TEXT ·Ytimerfd_settime(SB),$40-68

// func Ytimes(tls *TLS, tms uintptr) (r Tclock_t)
TEXT ·Ytimes(SB),$24-40

// func Ytimespec_get(tls *TLS, ts uintptr, base int32) (r int32)
TEXT ·Ytimespec_get(SB),$32-48

// func Ytmpfile(tls *TLS) (r uintptr)
TEXT ·Ytmpfile(SB),$16-24

// func Ytmpnam(tls *TLS, buf uintptr) (r1 uintptr)
TEXT ·Ytmpnam(SB),$24-40

// func Ytoascii(tls *TLS, c int32) (r int32)
TEXT ·Ytoascii(SB),$24-32

// func Ytolower(tls *TLS, c int32) (r int32)
TEXT ·Ytolower(SB),$24-32

// func Ytolower_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Ytolower_l(SB),$32-52

// func Ytoupper(tls *TLS, c int32) (r int32)
TEXT ·Ytoupper(SB),$24-32

// func Ytoupper_l(tls *TLS, c int32, l Tlocale_t) (r int32)
TEXT ·Ytoupper_l(SB),$32-52

// func Ytowctrans(tls *TLS, wc Twint_t, trans Twctrans_t) (r Twint_t)
TEXT ·Ytowctrans(SB),$32-52

// func Ytowctrans_l(tls *TLS, c Twint_t, t Twctrans_t, l Tlocale_t) (r Twint_t)
TEXT ·Ytowctrans_l(SB),$40-68

// func Ytowlower(tls *TLS, wc Twint_t) (r Twint_t)
TEXT ·Ytowlower(SB),$24-32

// func Ytowlower_l(tls *TLS, c Twint_t, l Tlocale_t) (r Twint_t)
TEXT ·Ytowlower_l(SB),$32-52

// func Ytowupper(tls *TLS, wc Twint_t) (r Twint_t)
TEXT ·Ytowupper(SB),$24-32

// func Ytowupper_l(tls *TLS, c Twint_t, l Tlocale_t) (r Twint_t)
TEXT ·Ytowupper_l(SB),$32-52

// func Ytrunc(tls *TLS, x3 float64) (r float64)
TEXT ·Ytrunc(SB),$24-40

// func Ytruncate(tls *TLS, path uintptr, length Toff_t) (r int32)
TEXT ·Ytruncate(SB),$32-52

// func Ytruncf(tls *TLS, x3 float32) (r float32)
TEXT ·Ytruncf(SB),$24-32

// func Ytruncl(tls *TLS, x float64) (r float64)
TEXT ·Ytruncl(SB),$24-40

// func Ytsearch(tls *TLS, key uintptr, rootp uintptr, cmp uintptr) (r1 uintptr)
TEXT ·Ytsearch(SB),$40-72

// func Yttyname(tls *TLS, fd int32) (r uintptr)
TEXT ·Yttyname(SB),$24-36

// func Yttyname_r(tls *TLS, fd int32, name uintptr, size Tsize_t) (r int32)
TEXT ·Yttyname_r(SB),$40-68

// func Ytwalk(tls *TLS, root uintptr, action uintptr)
TEXT ·Ytwalk(SB),$24-24

// func Ytzset(tls *TLS)
TEXT ·Ytzset(SB),$8-8

// func Yualarm(tls *TLS, value uint32, interval uint32) (r uint32)
TEXT ·Yualarm(SB),$24-36

// func Yulckpwdf(tls *TLS) (r int32)
TEXT ·Yulckpwdf(SB),$16-20

// func Yulimit(tls *TLS, cmd int32, va uintptr) (r int64)
TEXT ·Yulimit(SB),$32-56

// func Yumask(tls *TLS, mode Tmode_t) (r Tmode_t)
TEXT ·Yumask(SB),$24-32

// func Yumount(tls *TLS, special uintptr) (r int32)
TEXT ·Yumount(SB),$24-36

// func Yumount2(tls *TLS, special uintptr, flags int32) (r int32)
TEXT ·Yumount2(SB),$32-48

// func Yuname(tls *TLS, uts uintptr) (r int32)
TEXT ·Yuname(SB),$24-36

// func Yungetc(tls *TLS, c int32, f uintptr) (r int32)
TEXT ·Yungetc(SB),$32-52

// func Yungetwc(tls *TLS, c Twint_t, f uintptr) (r Twint_t)
TEXT ·Yungetwc(SB),$32-52

// func Yunlink(tls *TLS, path uintptr) (r int32)
TEXT ·Yunlink(SB),$24-36

// func Yunlinkat(tls *TLS, fd int32, path uintptr, flag int32) (r int32)
TEXT ·Yunlinkat(SB),$40-64

// func Yunlockpt(tls *TLS, fd int32) (r int32)
TEXT ·Yunlockpt(SB),$24-32

// func Yunsetenv(tls *TLS, name uintptr) (r int32)
TEXT ·Yunsetenv(SB),$24-36

// func Yunshare(tls *TLS, flags int32) (r int32)
TEXT ·Yunshare(SB),$24-32

// func Yupdwtmp(tls *TLS, f uintptr, u uintptr)
TEXT ·Yupdwtmp(SB),$24-24

// func Yupdwtmpx(tls *TLS, f uintptr, u uintptr)
TEXT ·Yupdwtmpx(SB),$24-24

// func Yuselocale(tls *TLS, new1 Tlocale_t) (r Tlocale_t)
TEXT ·Yuselocale(SB),$24-40

// func Yusleep(tls *TLS, useconds uint32) (r int32)
TEXT ·Yusleep(SB),$24-32

// func Yutime(tls *TLS, path uintptr, times uintptr) (r int32)
TEXT ·Yutime(SB),$32-52

// func Yutimensat(tls *TLS, fd int32, path uintptr, times uintptr, flags int32) (r1 int32)
TEXT ·Yutimensat(SB),$48-80

// func Yutimes(tls *TLS, path uintptr, times uintptr) (r int32)
TEXT ·Yutimes(SB),$32-52

// func Yuuid_copy(t *TLS, dst, src uintptr)
TEXT ·Yuuid_copy(SB),$24-24

// func Yuuid_generate_random(t *TLS, out uintptr)
TEXT ·Yuuid_generate_random(SB),$16-16

// func Yuuid_parse(t *TLS, in uintptr, uu uintptr) int32
TEXT ·Yuuid_parse(SB),$32-52

// func Yuuid_unparse(t *TLS, uu, out uintptr)
TEXT ·Yuuid_unparse(SB),$24-24

// func Yvasprintf(tls *TLS, s uintptr, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvasprintf(SB),$40-68

// func Yvdprintf(tls *TLS, fd int32, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvdprintf(SB),$40-68

// func Yverr(tls *TLS, status int32, fmt uintptr, ap Tva_list)
TEXT ·Yverr(SB),$32-32

// func Yverrx(tls *TLS, status int32, fmt uintptr, ap Tva_list)
TEXT ·Yverrx(SB),$32-32

// func Yversionsort(tls *TLS, a uintptr, b uintptr) (r int32)
TEXT ·Yversionsort(SB),$32-52

// func Yvfork(tls *TLS) (r Tpid_t)
TEXT ·Yvfork(SB),$16-20

// func Yvfprintf(tls *TLS, f uintptr, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvfprintf(SB),$40-68

// func Yvfscanf(tls *TLS, f uintptr, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvfscanf(SB),$40-68

// func Yvfwprintf(tls *TLS, f uintptr, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvfwprintf(SB),$40-68

// func Yvfwscanf(tls *TLS, f uintptr, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvfwscanf(SB),$40-68

// func Yvhangup(tls *TLS) (r int32)
TEXT ·Yvhangup(SB),$16-20

// func Yvmsplice(tls *TLS, fd int32, iov uintptr, cnt Tsize_t, flags uint32) (r Tssize_t)
TEXT ·Yvmsplice(SB),$48-84

// func Yvprintf(tls *TLS, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvprintf(SB),$32-52

// func Yvscanf(tls *TLS, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvscanf(SB),$32-52

// func Yvsnprintf(tls *TLS, s uintptr, n Tsize_t, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvsnprintf(SB),$48-84

// func Yvsprintf(tls *TLS, s uintptr, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvsprintf(SB),$40-68

// func Yvsscanf(tls *TLS, s uintptr, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvsscanf(SB),$40-68

// func Yvswprintf(tls *TLS, s uintptr, n Tsize_t, fmt uintptr, ap Tva_list) (r1 int32)
TEXT ·Yvswprintf(SB),$48-84

// func Yvswscanf(tls *TLS, s uintptr, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvswscanf(SB),$40-68

// func Yvwarn(tls *TLS, fmt uintptr, ap Tva_list)
TEXT ·Yvwarn(SB),$24-24

// func Yvwarnx(tls *TLS, fmt uintptr, ap Tva_list)
TEXT ·Yvwarnx(SB),$24-24

// func Yvwprintf(tls *TLS, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvwprintf(SB),$32-52

// func Yvwscanf(tls *TLS, fmt uintptr, ap Tva_list) (r int32)
TEXT ·Yvwscanf(SB),$32-52

// func Ywait(tls *TLS, status uintptr) (r Tpid_t)
TEXT ·Ywait(SB),$24-36

// func Ywait3(tls *TLS, status uintptr, options int32, usage uintptr) (r Tpid_t)
TEXT ·Ywait3(SB),$40-68

// func Ywait4(tls *TLS, pid Tpid_t, status uintptr, options int32, ru uintptr) (r1 Tpid_t)
TEXT ·Ywait4(SB),$48-84

// func Ywaitid(tls *TLS, type1 Tidtype_t, id Tid_t, info uintptr, options int32) (r int32)
TEXT ·Ywaitid(SB),$40-64

// func Ywaitpid(tls *TLS, pid Tpid_t, status uintptr, options int32) (r Tpid_t)
TEXT ·Ywaitpid(SB),$40-64

// func Ywarn(tls *TLS, fmt uintptr, va uintptr)
TEXT ·Ywarn(SB),$24-24

// func Ywarnx(tls *TLS, fmt uintptr, va uintptr)
TEXT ·Ywarnx(SB),$24-24

// func Ywcpcpy(tls *TLS, d uintptr, s uintptr) (r uintptr)
TEXT ·Ywcpcpy(SB),$32-56

// func Ywcpncpy(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r uintptr)
TEXT ·Ywcpncpy(SB),$40-72

// func Ywcrtomb(tls *TLS, s uintptr, wc Twchar_t, st uintptr) (r Tsize_t)
TEXT ·Ywcrtomb(SB),$40-72

// func Ywcscasecmp(tls *TLS, l uintptr, r uintptr) (r1 int32)
TEXT ·Ywcscasecmp(SB),$32-52

// func Ywcscasecmp_l(tls *TLS, l uintptr, r uintptr, locale Tlocale_t) (r1 int32)
TEXT ·Ywcscasecmp_l(SB),$40-68

// func Ywcscat(tls *TLS, dest uintptr, src uintptr) (r uintptr)
TEXT ·Ywcscat(SB),$32-56

// func Ywcschr(tls *TLS, s uintptr, c Twchar_t) (r uintptr)
TEXT ·Ywcschr(SB),$32-52

// func Ywcscmp(tls *TLS, l uintptr, r uintptr) (r1 int32)
TEXT ·Ywcscmp(SB),$32-52

// func Ywcscoll(tls *TLS, l uintptr, r uintptr) (r1 int32)
TEXT ·Ywcscoll(SB),$32-52

// func Ywcscoll_l(tls *TLS, l uintptr, r uintptr, locale Tlocale_t) (r1 int32)
TEXT ·Ywcscoll_l(SB),$40-68

// func Ywcscpy(tls *TLS, d uintptr, s uintptr) (r uintptr)
TEXT ·Ywcscpy(SB),$32-56

// func Ywcscspn(tls *TLS, s uintptr, c uintptr) (r Tsize_t)
TEXT ·Ywcscspn(SB),$32-56

// func Ywcsdup(tls *TLS, s uintptr) (r uintptr)
TEXT ·Ywcsdup(SB),$24-40

// func Ywcsftime(tls *TLS, wcs uintptr, n Tsize_t, f uintptr, tm uintptr) (r Tsize_t)
TEXT ·Ywcsftime(SB),$48-88

// func Ywcsftime_l(tls *TLS, s uintptr, n Tsize_t, f uintptr, tm uintptr, loc Tlocale_t) (r Tsize_t)
TEXT ·Ywcsftime_l(SB),$56-104

// func Ywcslen(tls *TLS, s uintptr) (r Tsize_t)
TEXT ·Ywcslen(SB),$24-40

// func Ywcsncasecmp(tls *TLS, l uintptr, r uintptr, n Tsize_t) (r1 int32)
TEXT ·Ywcsncasecmp(SB),$40-68

// func Ywcsncasecmp_l(tls *TLS, l uintptr, r uintptr, n Tsize_t, locale Tlocale_t) (r1 int32)
TEXT ·Ywcsncasecmp_l(SB),$48-84

// func Ywcsncat(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r uintptr)
TEXT ·Ywcsncat(SB),$40-72

// func Ywcsncmp(tls *TLS, l uintptr, r uintptr, n Tsize_t) (r1 int32)
TEXT ·Ywcsncmp(SB),$40-68

// func Ywcsncpy(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r uintptr)
TEXT ·Ywcsncpy(SB),$40-72

// func Ywcsnlen(tls *TLS, s uintptr, n Tsize_t) (r Tsize_t)
TEXT ·Ywcsnlen(SB),$32-56

// func Ywcsnrtombs(tls *TLS, dst uintptr, wcs uintptr, wn Tsize_t, n Tsize_t, st uintptr) (r Tsize_t)
TEXT ·Ywcsnrtombs(SB),$56-104

// func Ywcspbrk(tls *TLS, s uintptr, b uintptr) (r uintptr)
TEXT ·Ywcspbrk(SB),$32-56

// func Ywcsrchr(tls *TLS, s uintptr, c Twchar_t) (r uintptr)
TEXT ·Ywcsrchr(SB),$32-52

// func Ywcsrtombs(tls *TLS, s uintptr, ws uintptr, n Tsize_t, st uintptr) (r Tsize_t)
TEXT ·Ywcsrtombs(SB),$48-88

// func Ywcsspn(tls *TLS, s uintptr, c uintptr) (r Tsize_t)
TEXT ·Ywcsspn(SB),$32-56

// func Ywcsstr(tls *TLS, h uintptr, n uintptr) (r uintptr)
TEXT ·Ywcsstr(SB),$32-56

// func Ywcstod(tls *TLS, s uintptr, p uintptr) (r float64)
TEXT ·Ywcstod(SB),$32-56

// func Ywcstof(tls *TLS, s uintptr, p uintptr) (r float32)
TEXT ·Ywcstof(SB),$32-52

// func Ywcstoimax(tls *TLS, s uintptr, p uintptr, base int32) (r Tintmax_t)
TEXT ·Ywcstoimax(SB),$40-68

// func Ywcstok(tls *TLS, s uintptr, sep uintptr, p uintptr) (r uintptr)
TEXT ·Ywcstok(SB),$40-72

// func Ywcstol(tls *TLS, s uintptr, p uintptr, base int32) (r int64)
TEXT ·Ywcstol(SB),$40-68

// func Ywcstold(tls *TLS, s uintptr, p uintptr) (r float64)
TEXT ·Ywcstold(SB),$32-56

// func Ywcstoll(tls *TLS, s uintptr, p uintptr, base int32) (r int64)
TEXT ·Ywcstoll(SB),$40-68

// func Ywcstombs(tls *TLS, s uintptr, ws uintptr, n Tsize_t) (r Tsize_t)
TEXT ·Ywcstombs(SB),$40-72

// func Ywcstoul(tls *TLS, s uintptr, p uintptr, base int32) (r uint64)
TEXT ·Ywcstoul(SB),$40-68

// func Ywcstoull(tls *TLS, s uintptr, p uintptr, base int32) (r uint64)
TEXT ·Ywcstoull(SB),$40-68

// func Ywcstoumax(tls *TLS, s uintptr, p uintptr, base int32) (r Tuintmax_t)
TEXT ·Ywcstoumax(SB),$40-68

// func Ywcswcs(tls *TLS, haystack uintptr, needle uintptr) (r uintptr)
TEXT ·Ywcswcs(SB),$32-56

// func Ywcswidth(tls *TLS, wcs uintptr, n Tsize_t) (r int32)
TEXT ·Ywcswidth(SB),$32-52

// func Ywcsxfrm(tls *TLS, dest uintptr, src uintptr, n Tsize_t) (r Tsize_t)
TEXT ·Ywcsxfrm(SB),$40-72

// func Ywcsxfrm_l(tls *TLS, dest uintptr, src uintptr, n Tsize_t, loc Tlocale_t) (r Tsize_t)
TEXT ·Ywcsxfrm_l(SB),$48-88

// func Ywctob(tls *TLS, c Twint_t) (r int32)
TEXT ·Ywctob(SB),$24-32

// func Ywctomb(tls *TLS, s uintptr, wc Twchar_t) (r int32)
TEXT ·Ywctomb(SB),$32-48

// func Ywctrans(tls *TLS, class uintptr) (r Twctrans_t)
TEXT ·Ywctrans(SB),$24-40

// func Ywctrans_l(tls *TLS, s uintptr, l Tlocale_t) (r Twctrans_t)
TEXT ·Ywctrans_l(SB),$32-56

// func Ywctype(tls *TLS, s uintptr) (r Twctype_t)
TEXT ·Ywctype(SB),$24-40

// func Ywctype_l(tls *TLS, s uintptr, l Tlocale_t) (r Twctype_t)
TEXT ·Ywctype_l(SB),$32-56

// func Ywcwidth(tls *TLS, wc Twchar_t) (r int32)
TEXT ·Ywcwidth(SB),$24-32

// func Ywmemchr(tls *TLS, s uintptr, c Twchar_t, n Tsize_t) (r uintptr)
TEXT ·Ywmemchr(SB),$40-72

// func Ywmemcmp(tls *TLS, l uintptr, r uintptr, n Tsize_t) (r1 int32)
TEXT ·Ywmemcmp(SB),$40-68

// func Ywmemcpy(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r uintptr)
TEXT ·Ywmemcpy(SB),$40-72

// func Ywmemmove(tls *TLS, d uintptr, s uintptr, n Tsize_t) (r uintptr)
TEXT ·Ywmemmove(SB),$40-72

// func Ywmemset(tls *TLS, d uintptr, c Twchar_t, n Tsize_t) (r uintptr)
TEXT ·Ywmemset(SB),$40-72

// func Ywprintf(tls *TLS, fmt uintptr, va uintptr) (r int32)
TEXT ·Ywprintf(SB),$32-52

// func Ywrite(tls *TLS, fd int32, buf uintptr, count Tsize_t) (r Tssize_t)
TEXT ·Ywrite(SB),$40-72

// func Ywritev(tls *TLS, fd int32, iov uintptr, count int32) (r Tssize_t)
TEXT ·Ywritev(SB),$40-68

// func Ywscanf(tls *TLS, fmt uintptr, va uintptr) (r int32)
TEXT ·Ywscanf(SB),$32-52

// func Yy0(tls *TLS, x float64) (r float64)
TEXT ·Yy0(SB),$24-40

// func Yy0f(tls *TLS, x float32) (r float32)
TEXT ·Yy0f(SB),$24-32

// func Yy1(tls *TLS, x float64) (r float64)
TEXT ·Yy1(SB),$24-40

// func Yy1f(tls *TLS, x float32) (r float32)
TEXT ·Yy1f(SB),$24-32

// func Yyn(tls *TLS, n int32, x float64) (r float64)
TEXT ·Yyn(SB),$32-56

// func Yynf(tls *TLS, n int32, x float32) (r float32)
TEXT ·Yynf(SB),$24-36
