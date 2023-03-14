.686	
.model flat

extern _ExitProcess@4 :	PROC
extern	_MessageBoxW@16	:	PROC

public _main

.data
tab		dw	'T', 'a', 'b', 'e', 'l', 'e', 0
bufor	db	50H,6FH,0C5H, 82H,0C4H, 85H, 63H, 7AH, 65H, 6EH, 69H,61H, 20H
		db	0F0H,9FH, 9AH, 82H ; parowóz
		db	20H, 20H, 6BH, 6FH, 6CH,65H,6AH,6FH,77H,6FH,20H
		db	0E2H, 80H, 93H ; polpauza 
		db	20H, 61H, 75H,74H,6FH,62H,75H,73H,6FH, 77H,65H,20H,20H
		db	0F0H, 9FH, 9AH,8CH ; autobus

wynik	db 96 dup (?)

.code
_main PROC
	mov		ecx, 48
	mov		esi, offset bufor ; esi -> source index
	mov		edi, offset wynik	; edi -> destination index

przetwarzanie:
	mov		edx, 0
	mov		al, [esi]
	test	al, 10000000B
	jnz		znak_wielobajtowy

	;przypadek 1-bajtowy
	mov		dl, al
	sub		ecx, 1
	add		esi, 1
	mov		[edi], dx
	add		edi, 2
	or		ecx, ecx
	jz		gotowe

	jmp przetwarzanie

znak_wielobajtowy:
	test	al, 00100000B
	jz	znak_2_bajtowy

	test al, 00010000B
	jz znak_3_bajtowy

	jmp znak_4_bajtowy

znak_2_bajtowy:
	and		al, 00011111B ; maskowanie, jak jest w utf-8 110xxxxx to bêdziemy mieli same x
	mov		dl, al
	shl		dx, 6 ; przesuwamy bity w lewo o 6 pozycji

	mov		al, [esi+1]
	and		al, 00111111B
	or		dl, al ; wk³adamy do dl resztê bitów ze znaku

	add		esi, 2
	sub		ecx, 2
	
	mov		[edi], dx
	add		edi, 2

	or		ecx, ecx
	jnz		przetwarzanie

	or		ecx, ecx
	jz		gotowe

znak_3_bajtowy:
	and		al, 00001111B 
	mov		dl, al
	shl		dx, 6 ; przesuniecie o 6, bo zaraz znowu przesuwamy

	mov		al, [esi+1]
	and		al, 00111111B
	or		dl, al
	shl		dx, 6

	mov		al, [esi+2]

	and		al, 00111111B
	or		dl, al		

	sub		ecx, 3
	add		esi, 3
	mov		[edi], edx
	add		edi, 2
	or		ecx, ecx
	jnz		przetwarzanie 

	or		ecx, ecx
	jz		gotowe

znak_4_bajtowy:
	mov		edx, 0
	and		al, 00000111B
	mov		dl, al
	shl		edx, 6

	mov		al, [esi+1]
	and		al, 00111111B
	or		dl, al
	shl		edx, 6

	mov		al, [esi+2]
	and		al, 00111111B
	or		dl,al
	shl		edx, 6

	mov		al, [esi+3]
	and		al, 00111111B
	or		dl,al

	; w edx jest punkt kodowy

	sub		edx, 10000H

	mov		ebx, edx
	and		edx, 00000000000011111111110000000000B
	shr		edx, 10
	or		dx, 1101100000000000B
	mov		eax, ebx
	and		eax, 00000000000000000000001111111111B
	or		ax, 1101110000000000B

	add		esi,4
	sub		ecx, 4
	mov		[edi], dx
	mov		[edi+2], ax
	add		edi, 4

	or		ecx, ecx
	jnz		przetwarzanie


gotowe:
	
	
	push 0
	push offset tab
	push offset wynik
	push 0
	call _MessageBoxW@16

	push 0
	call _ExitProcess@4
_main ENDP

END 