.686
.xmm
.model flat

public _pm_jeden
.data 
jedynki dd  4 dup (1.0)
.code
_pm_jeden PROC
push ebp
mov ebp,esp
push esi

mov esi, [ebp+8]

movups xmm5, [esi]
movups xmm6, jedynki 
addsubps	xmm5, xmm6
movups [esi], xmm5

pop esi
pop ebp
ret
_pm_jeden ENDP
END