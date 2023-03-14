.686
.model flat

public _nowy_exp
.data
jeden dd 1.0

.code
_nowy_exp PROC

push ebp
mov ebp, esp
mov ecx, 20
push edi
push esi
mov edi, 1
finit
fld dword ptr jeden ;suma 
fld dword ptr jeden ;dzielnik
fld dword ptr [ebp+8]
;st0=x st1=dzielnik st2=suma
mov esi, 1
ptl:
push edi
mov edi, 1

fld st(0) ;st0=x st1=x st2=dziel st3=suma
ptl1:
push edi

fmul st(0), st(1); st0=x^2 st1=x st2=dziel st3=suma
fxch st(2)
fimul dword ptr [esp]
fxch st(2)
pop edi
inc edi
cmp edi, esi
jbe ptl1
fdiv st(0), st(1)
fdiv st(0), st(2)
fadd	st(0), st(3)
fxch st(3)
fstp st(0)
fld dword ptr jeden 
fxch st(2)
fstp st(0)

pop edi
inc edi
inc esi
loop ptl

fstp st(0)
fstp st(0)

pop esi
pop edi
pop ebp

ret

_nowy_exp ENDP
END