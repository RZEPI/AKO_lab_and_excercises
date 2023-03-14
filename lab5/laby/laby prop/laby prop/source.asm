.686
.xmm
.model	flat

public _oblicz_potege


.code 
_oblicz_potege PROC
push ebp
mov ebp, esp
finit
mov eax, 93
push eax
fild dword ptr[esp]; wartosc 93
pop eax
mov eax, 4
push eax
fild dword ptr[esp]; wartosc 4
pop eax
fdivp 
;st(0) = 23,25
fild dword ptr[ebp+12]; wartosc m
fild dword ptr[ebp+8]
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