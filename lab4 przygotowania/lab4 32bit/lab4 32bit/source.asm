.686
.model flat

extern	_malloc

public _tablica_parzystych

.code
_tablica_parzystych PROC
push ebp
push esi
push edi
push ebx
mov ebp, esp
mov eax, [ebp+4]
mov ecx, [ebp+8]
mov esi, 0

ptl1:
test [eax+esi], 0
jnz skip
add edi, 4
skip:inc esi
loop ptl1

push eax
push edi
call _malloc
add esp, 4
mov eax, ebx
pop eax


pop ebx
pop edi
pop esi
pop ebp
_tablica_parzystych ENDP
END