.686
.model flat

extern __write			:	PROC

public _wyswietl64

.data

.code

_wyswietl64 PROC
push	ebp
mov		ebp, esp

mov		eax, [ebp+8] ; przeskakujemy ebp(które zosta³o w³o¿one wy¿ej^) i œlad funkcji main
mov		edx, [ebp+12]


sub		esp, 21

mov		byte PTR [ebp - 1], 10
mov		byte PTR [ebp - 21], 10

mov		ebx, 10
mov		ecx, 19

dzielenie:
mov		edi,eax	
mov		eax,edx
mov		edx, 0
div		ebx ; reszta w edx, iloraz w eax
xchg	eax, edi ; rekonstrukcja m³odszej czêsci, w1 w edi
div		ebx
; w0 w eax, r0 w edx
add		dl, 30H ; konwersja do ascii
mov		[ebp+ecx-21],dl
dec		ecx
jz		zakoncz

mov		edx, edi
mov		esi, eax


or		esi, edi
jnz		dzielenie


wypelnij_spac:
mov		byte PTR [ebp+ecx-21], 20H
dec		ecx
jnz		wypelnij_spac
zakoncz:
lea		eax, [ebp-21]

push	dword PTR 21
push	eax
push	dword PTR 1
call	 __write
add		esp, 12

add esp, 21
pop ebp
ret
_wyswietl64 ENDP
END