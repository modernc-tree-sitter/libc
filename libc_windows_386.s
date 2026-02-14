#include "textflag.h"

// func callStrtod(fn uintptr, s uintptr, p uintptr) float64
TEXT ·callStrtod(SB), NOSPLIT, $0
	// 1. Load arguments from Go stack
	MOVL	fn+0(FP), AX	// Function pointer
	MOVL	s+4(FP), CX	// String pointer
	MOVL	p+8(FP), DX	// Endptr pointer

	// 2. Setup C stack for __cdecl
	// We push 8 bytes (2 args).
	SUBL	$8, SP
	MOVL	DX, 4(SP)	// Push endptr (2nd arg)
	MOVL	CX, 0(SP)	// Push str (1st arg)

	// 3. Call the C function
	CALL	AX

	// 4. Clean up stack (__cdecl requires caller to clean)
	ADDL	$8, SP

	// 5. Store FPU result (ST0) into Go return slot
	// FMOVD with destination memory implies FSTP (store and pop)
	FMOVD	F0, ret+12(FP)
	
	RET
