.686
.model flat

extern __read	:	PROC
extern __write	:	PROC
extern _ExitProcess@4		:	PROC
public	_main
.data
wejscie db 3 dup (?)
wyjscie db 7 dup (?)
tysiac dd 1000
system dd 12

.code

zczytaj_liczbe PROC
push dword ptr 3
push dword ptr offset wejscie
push dword ptr 0
call __read
add esp, 12

mov edx, 0
mov eax, 0
mov ecx, 0

mov edi, 0

cmp [wejscie+2], 10
jnz skip_zczyt

cmp_edi:
cmp [wejscie+edi], 'A'
jb cmp_num
cmp [wejscie+edi], 'B'
ja cmp_num

mov al, [wejscie+edi]
sub al, 'A'
add al, 10
jmp skip_num

cmp_num:
cmp [wejscie+edi], '0'
jb skip_zczyt
cmp [wejscie+edi], '9'
ja skip_zczyt

mov al, [wejscie+edi]
sub al, '0'

skip_num:
inc ecx
cmp ecx, 1
jz pierwsza_cyfra
jmp druga_cyfra

pierwsza_cyfra:
mul system
push eax
inc edi
jmp cmp_edi

druga_cyfra:
mov edx, eax
pop eax
add eax, edx

skip_zczyt:
ret

zczytaj_liczbe ENDP 



_main PROC

call zczytaj_liczbe 
push eax
call zczytaj_liczbe	
mov ebx, eax
pop eax
mov edx, 0
mul tysiac
div ebx
mov ecx, 3
mov ebx, 10
mov edi, offset wyjscie
add edi, 6
ptl:
mov edx, 0
div ebx

add dl, '0'
mov [edi], dl

dec edi

loop ptl
mov cl, '.'
mov [edi], cl
dec edi
mov ecx, 3

ptl1:
mov edx, 0
div ebx 
add dl, '0'
mov [edi], dl
dec edi

loop ptl1

mov edi, 0
mov ecx,2
ptl2:

cmp [wyjscie+edi], '0'
jne skip_ptl2

mov [wyjscie+edi], 20H
inc edi
loop ptl2

skip_ptl2:mov edi, 6
mov ecx, 3

ptl3:
cmp [wyjscie+edi], '0'
jne skip_ptl3
mov [wyjscie+edi], 20H
dec edi
loop ptl3

skip_ptl3:

push dword ptr 7
push offset wyjscie
push dword ptr 1
call __write
add esp, 12
push 0 
call _ExitProcess@4
_main ENDP
END