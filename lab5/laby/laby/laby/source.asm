.686
.xmm
.model	flat

public _oblicz_potege


.code 
_oblicz_potege PROC
push ebp
mov ebp, esp
finit
mov eax, 23.25
push eax
fld [esp]; wartosc 23.25
pop eax
fild [ebp+8]; wartosc m
movzx eax, byte ptr[ebp+12]
push eax
fild [esp]; wartosc k
pop eax
; stan stosu st(0) = k, st(1) = m, st(2) = 23.25
fld1
fscale
fstp st(1)
fadd 
fadd

pop ebp
ret
_oblicz_potege ENDP
END