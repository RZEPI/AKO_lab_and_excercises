extern MessageBoxA : PROC

public wyswietl128

.data
tytul db 'moj tytul'
.code

wyswietl128 PROC
push	rbp
mov		rbp, rsp
push	rbx
;argument jest w xmm0
sub		rsp, 16
movups [rsp],xmm0
mov		rax, [rsp]
mov		rdx, [rsp+8]
add     rsp, 16

sub		rsp, 40

mov		rbx, 10
mov		rcx, 40

dzielenie:
mov		rdi,rax	
mov		rax,rdx
mov		rdx, 0
div		rbx ; reszta w rdx, iloraz w rax
xchg	rax, rdi ; rekonstrukcja m³odszej czêsci, w1 w rdi
div		rbx
; w0 w rax, r0 w rdx
add		dl, 30H ; konwersja do ascii
mov		[rbp+rcx+40],dl
dec		rcx
jz		zakoncz

mov		rdx, rdi
mov		rsi, rax


or		rsi, rdi
jnz		dzielenie

zakoncz:
sub		rsp,8
lea		rdx, [rbp+rcx-40]
mov		rcx, 0
mov		r8, offset tytul
mov		r9, 0
sub		rsp, 32
call	MessageBoxA
add		rsp,8

add rsp, 40
pop rbx	
pop rbp
ret
wyswietl128 ENDP
END