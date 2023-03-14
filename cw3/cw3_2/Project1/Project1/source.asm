.686
.model flat

extern __write			:	PROC

public _wyswietl32

.data

.code

_wyswietl32 PROC
push	ebp
mov		ebp, esp

mov		eax, [ebp+8] ; przeskakujemy ebp(które zosta³o w³o¿one wy¿ej^) i œlad funkcji main
mov		ebx, [ebp+12]


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
_wyswietl32 ENDP
END