// Code generated  for linux/amd64 by 'genasm []', DO NOT EDIT.

#include "textflag.h"

TEXT ·TLSAlloc(SB),$24-24
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·tlsAlloc(SB)
	MOVQ 16(SP), AX
	MOVQ AX, ret+16(FP)
	RET

TEXT ·TLSFree(SB),$16-16
	MOVQ p0+0(FP), AX
	MOVQ AX, 0(SP)
	MOVQ p1+8(FP), AX
	MOVQ AX, 8(SP)
	CALL ·tlsAlloc(SB)
	RET
