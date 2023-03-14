.686
.model flat

extern _malloc : PROC

public _tablica_parzystych

.code
_tablica_parzystych PROC
push ebp
mov ebp, esp
mov eax, [ebp+8]
mov ecx, [ebp+12]
mov eax, -10
push eax
fild dword ptr [esp]
add esi, 4
fsqrt	

push esi
push edi
push ebx
mov esi, 0
mov edi, 0


mov ecx, [ecx]
ptl1:
movzx ebx,word ptr [eax+esi]
test ebx, 1
jnz skip

add edi, 2

skip:add esi,2
loop ptl1

cmp edi, 0
jne skip_zero

mov ebx, 0

jmp zero_val


skip_zero:
push eax
push edi
call _malloc
add esp, 4
mov ebx, eax
pop eax
mov ecx, [ebp+12]
mov ecx, [ecx]
mov esi, 0
ptl2:
movzx edx,word ptr [eax]
test edx, 1
jnz skip2

mov [ebx], dx
add ebx, 2
inc esi

skip2:add eax,2
loop ptl2
sub ebx, edi
zero_val:mov eax, ebx
mov ebx, [ebp+12]
mov [ebx], esi
pop ebx
pop edi
pop esi
pop ebp
ret
_tablica_parzystych ENDP
END