.686

.model flat

PUBLIC _szukaj4_min

.code

_szukaj4_min PROC 
push ebp
mov ebp, esp

mov eax, [ebp+8];a

cmp eax, [ebp+12];a i b
jg b_mniejsze

cmp eax, [ebp+16] ; a i c
jg c_mniejsze

cmp_d:cmp eax, [ebp+20] ; a i d
jl zakoncz

mov eax, [ebp+20]

zakoncz:
pop ebp
ret
b_mniejsze:
mov eax, [ebp+12]
cmp eax, [ebp+16]; b i c
jl cmp_d
c_mniejsze:
mov eax, [ebp+16]
jmp cmp_d

_szukaj4_min ENDP 
END