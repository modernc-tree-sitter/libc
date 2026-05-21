# Bug review findings

The following are bugs/issues found in the hand-written (non-generated) code. The generated `ccgo_linux_*.go` / `musl_*.go` files were skipped — any bugs there are ccgo bugs and would have to be fixed elsewhere. Severity is a judgment of how likely the bug is to be hit in real use.

## High severity — wrong behavior on common paths

~~**1. `pthread_musl.go:190` — `Xpthread_join` reads the *caller's* result, not the joined thread's**~~

```go
*(*uintptr)(unsafe.Pointer(res)) = (*t__pthread)(unsafe.Pointer(tls.pthread)).Fresult
```
Should be `unsafe.Pointer(t)` (the `t` parameter is the joinee). As written, `pthread_join` always returns the *current* thread's result via `res`. The bug only stays hidden because the test suite/sqlite barely use pthread_join.

**2. `pthread_musl.go:466` — `Xpthread_detach` detaches the *caller*, not the target thread, and panics on the common case**

```go
func Xpthread_detach(tls *TLS, t uintptr) int32 {
    state := atomic.SwapInt32((*int32)(unsafe.Pointer(tls.pthread+unsafe.Offsetof(...Fdetach_state))), _DT_DETACHED)
    switch state {
    case _DT_EXITED, _DT_DETACHED:
        return 0
    default:
        panic(todo("", tls.ID, state))
    }
}
```
Two bugs: (a) swaps `tls.pthread` (caller) instead of `t`; (b) `_DT_JOINABLE` is the *normal* old state when detaching a fresh thread, so this panics on the common path. The switch is missing `_DT_JOINABLE`.

**3. `mem_brk_musl.go:187` — `Xrealloc` panics on OOM and silently frees caller's data**

```go
r = malloc0(tls, pc, n, false)
copy(unsafe.Slice((*byte)(unsafe.Pointer(r)), usable), unsafe.Slice((*byte)(unsafe.Pointer(p)), usable))
Xfree(tls, p)
return r
```
If `malloc0` returns 0, `unsafe.Slice(nil, usable>0)` panics. Even if it didn't, the old `p` would be freed, violating POSIX's "on failure, the original pointer is still valid".

~~**4. Five platforms — `Xfread`/`Xfwrite` divide by zero on `size==0`**~~

`libc_darwin.go:1597,1629`, `libc_freebsd.go:1379,1397`, `libc_netbsd.go:1375,1393`, `libc_openbsd.go:1431,1450`, `libc_windows.go:1887,1918` all end with `return types.Size_t(m) / size` without checking `size`. C allows `fread(buf, 0, n, f)` (returns 0). Here it panics.

`libc_windows.go:Xfread` additionally lacks the `size==0` early-return that `Xfwrite` has on line 1896 — inconsistent.

**5. `libc.go:2440` — `Xfgets` buffer overflow**

```go
for ; size > 0; size-- {
    ...
    b = append(b, byte(c))
}
b = append(b, 0)
copy((*RawMem)(unsafe.Pointer(s))[:len(b):len(b)], b)
```
C `fgets(buf, size, …)` must write at most `size-1` chars + a null, total `size` bytes. This writes up to `size` chars + a null = `size+1` bytes. Loop condition should be `size > 1`. Affects all non-musl platforms.

**6. `libc_musl.go:489` — atexit handlers called in registration order**

```go
for _, v := range atExitHandlers {
    (...)(tls)
}
```
POSIX requires reverse order. Anything that relies on cleanup ordering (logging, file flushing) is wrong here.

**7. `atomic.go:46-64` — `AtomicAddFloat32` and `AtomicAddFloat64` are not atomic**

```go
func AtomicAddFloat32(addr *float32, delta float32) (new float32) {
    v := AtomicLoadFloat32(addr) + delta
    AtomicStoreFloat32(addr, v)
    return v
}
```
Load-modify-store with no CAS — concurrent callers lose updates. Should be a CAS loop on the bit-pattern.

## Medium severity — overflow / consistency

**8. Calloc multiplication overflow inconsistent across paths**

`mem_musl.go:52` (default linux/musl) and `mem_brk_musl.go:139` use `bits.Mul` and check overflow correctly. The other four allocators don't:

- `mem.go:50` — `rq := int(n * size)`
- `mem_brk.go:64` — `Xmalloc(t, n*size)`
- `memgrind.go:120` — `rq := int(n * size)`
- `memgrind_musl.go:120` — `rq := int(n * size)`

On 32-bit, `calloc(0x10000, 0x10000)` wraps to 0, then bumps to 1; on 64-bit large counts wrap similarly. Should match the `bits.Mul` pattern in `mem_musl.go`.

**9. `memgrind.go:182-184` / `memgrind_musl.go:182-184` — `Xrealloc` un-tracks the pointer *before* the allocator runs**

```go
delete(allocs, ptr)
delete(allocsMore, ptr)
frees[ptr] = pc
...
p, err := allocator.UintptrRealloc(ptr, int(size))
if err != nil {
    t.setErrno(ENOMEM)
    return 0
}
```
On OOM the original `ptr` is still valid per POSIX, but it's been removed from the audit's allocs map. Any subsequent `free(ptr)` then panics with "free of unallocated memory" — but it's a real allocation. Move the bookkeeping into the success branch.

**10. `mem_brk.go:95` — `UsableSize(0)` dereferences invalid memory**

```go
func UsableSize(p uintptr) types.Size_t {
    return types.Size_t(*(*uintptr)(unsafe.Pointer(p - uintptrSize)))
}
```
No nil check (`mem.go`'s `Xmalloc_usable_size` has one). Reachable via `Xrealloc` which calls `UsableSize(ptr)` without checking `ptr`.

**11. `libc_unix.go:46-90` — `Xsignal` leaks goroutines and resets errno**

Each call with a non-default handler spawns `go func() { for { <-c; ... } }()` with no cancellation channel. Setting a new handler does not stop the previous goroutine, so both fire on the next signal. Additionally, the handler is called with a fresh `NewTLS()` per signal — errno/sigprocmask state visible to C code is wrong.

**12. `pthread.go:707-720` — `Xpthread_join` / `Xpthread_detach` nil-deref on unknown thread id**

```go
tls := threads[int32(thread)]
delete(threads, int32(thread))
threadsMu.Unlock()
<-tls.done   // nil deref if not in map
```
Same in `Xpthread_detach` line 654. Should validate the lookup.

**13. `stdatomic.go` — int32/int64 atomic CAS/exchange use a global mutex instead of CPU atomics**

For 8/16-bit there's no choice in Go, but `X__atomic_compare_exchangeInt32`, `X__atomic_fetch_addInt32`, `X__atomic_fetch_addInt64` etc. all do:

```go
int32Mu.Lock()
defer int32Mu.Unlock()
*p = ...
```

Go has `atomic.CompareAndSwapInt32` and friends for these. The current code:
- Serializes every atomic-32 op in the *whole program* through one mutex (perf cliff under contention).
- Doesn't synchronize with the lock-free `X__c11_atomic_exchangeInt32` (line 673) which *does* use `atomic.SwapInt32` on the same memory — so they don't interlock correctly.

## Low severity — narrow / debug-only / minor

**14. `pthread_musl.go:285` — recursive mutex `count++` is a plain (non-atomic) increment**, even though other writes to `count` use `atomic.AddInt32`. Only the owning thread mutates it so it's race-free in practice, but `-race` may flag it.

**15. `pthread_musl.go:144-181` — `Xpthread_exit` for a joinable thread that was *later* detached leaves `__ccgo_join_mutex` locked forever** (the unlock is gated on `state == _DT_JOINABLE`, but a detach via `pthread_detach` swaps it to `_DT_DETACHED`).

**16. `etc.go:154,164` (non-musl) — `getObject` / `removeObject` panic while holding `objectMu`**. `todo()` ends in `os.Exit(1)` so this only matters if anything ever recovers.

**17. `pthread.go:351-401` (non-musl) — `Xpthread_cond_timedwait` has a benign race where a signal sent just before timeout fires can leave a token in `t.wait`'s buffered channel that spuriously wakes the *next* `cond_wait` on that TLS.

**18. `libc_windows.go:1884,1916` — `dmesg` format string has 6 verbs (`%v %d %#x %#x %#x %s`) but 5 args. `%s` prints `!s(MISSING)`. Only triggered with `libc.dmesg`.

**19. `libc_openbsd.go:1418` — Xfread strace dump reads `nmemb` bytes of the *output* buffer (uninitialized at that point) and treats `stream` as `*int32`. Garbage logged. Should be `nmemb*size`, and `stream` is an opaque `FILE*`.

**20. `libc_musl.go:1073` — unreachable code after `panic`**:
```go
default:
    panic(todo(""))
    t.setErrno(ENOENT)
    return -1
```
Defensive code that can never run; either remove the panic or remove the unreachable lines.

## Observations, not bugs

- `etc.go:418-453` (non-musl `VaList`) and `rtl.go:52` (musl) use `(*[2]uintptr)(unsafe.Pointer(&v))[1]` to extract an interface's data word. Brittle across Go runtime changes; works today.
- `libc_unix.go:131` and many others still use the deprecated `reflect.StringHeader`/`SliceHeader`. Compiles, but `go vet` of newer Go versions will warn.
- `pthread_musl.go:497-543` — barrier implementation uses `sync.Cond` correctly; nice.

## Suggested fix order

The pthread bugs (#1, #2) and the fread/fwrite div-by-zero (#4) are the ones to fix first — they're real, easy to fix, and the kind of thing a curious user will trip over. The atexit ordering (#6) and AtomicAddFloat (#7) are also unambiguous correctness issues.
