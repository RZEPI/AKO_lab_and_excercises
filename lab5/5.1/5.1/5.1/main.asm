.686
.model flat 

public _srednia_harm

.data 
jeden dd 1
zero dd 0
.code
_srednia_harm PROC
finit
push ebp
mov ebp, esp
mov ebx, [ebp+8]
mov ecx, [ebp+12]

fld dword ptr [ebp+12]; st0
push esi
push edi
mov edi, 0
fld dword ptr zero; st0 = 0 st1 = 5
ptl:
fld dword ptr [ebx+edi];st0 = 1. st1=0 st2=5
fld dword ptr jeden; st0=1 st1= 1.3 st2=0 st3=5

fdiv	st(0), st(1);st0=1/1.3 st1=1.3 st2=0 st3=5

fadd	st(2), st(0);st0=1/1.3 st1=1.3 st2=0 st3=5

fstp	st(0)

fstp	st(0);st0=1.3 st1= 1/1.3 st2=5
add edi, 4;st0 = 1/1.3 st1=5
loop ptl

fdiv st(1),st(0);st0=suma st1=5
fstp st(0)
pop edi
pop esi
pop ebp

ret

_srednia_harm ENDP
END