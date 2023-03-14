.686
.model flat

extern _ExitProcess@4	:	PROC
extern __write			:	PROC

public _main

.data

.code

wyswietl_EAX PROC
push	ebp
mov		ebp, esp
sub		esp, 12

mov		byte PTR [ebp - 1], 10
mov		byte PTR [ebp - 12], 10

mov		ebx, 10
mov		ecx, 10

dzielenie:
mov		edx, 0
div		ebx ; reszta w edx, iloraz w eax
add		dl, 30H
mov		[ebp+ecx-12],dl
dec		ecx
jz		zakoncz

cmp		eax, 0
jnz		dzielenie

wypelnij_spac:
mov		byte PTR [ebp+ecx-12], 20H
dec		ecx
jnz		wypelnij_spac
zakoncz:
lea		eax, [ebp-12]

push	dword PTR 12
push	eax
push	dword PTR 1
call	 __write
add		esp, 12

add esp, 12
pop ebp
ret
wyswietl_EAX ENDP

_main PROC

alfa:
mov eax, offset alfa
mov edx, offset $-5

mov		eax, 123
call	wyswietl_EAX
mov		eax, 0FFFFFFFFH ; max int 
call	wyswietl_EAX
mov		eax, 0
call	wyswietl_EAX

push 0
call _ExitProcess@4
_main ENDP
END