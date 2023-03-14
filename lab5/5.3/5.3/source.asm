.686
.xmm	
.model flat

public _liczby

.code
_liczby PROC
	push ebp
	mov ebp,esp
	push ebx
	push esi

	mov esi, [ebp+8]
	mov ebx, [ebp+12]
	mov eax, [ebp+16]
	movdqu	xmm5, [esi]
	movdqu	xmm6, [ebx]
	paddsb	xmm6, xmm5
	movdqu 	[eax], xmm6
	pop esi
	pop ebx
	pop ebp
	ret

_liczby ENDP
END