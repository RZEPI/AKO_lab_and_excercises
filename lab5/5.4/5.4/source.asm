.686
.xmm
.model flat

public _int2float

.code
_int2float PROC
	push ebp
	mov ebp, esp
	push esi
	push edi
	mov edi,  [ebp+12]
	mov esi, [ebp+8]

	cvtpi2ps xmm5, qword PTR [esi]
	movups [edi], xmm5

	pop edi
	pop esi	
	pop ebp
	ret
_int2float ENDP
END