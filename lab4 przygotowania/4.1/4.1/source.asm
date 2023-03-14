.686
.model flat
public _szukaj4_max
.code
_szukaj4_max PROC
push ebp ; zapisanie zawartoœci EBP na stosie
mov ebp, esp ; kopiowanie zawartoœci ESP do EBP
mov eax, [ebp+8] ; liczba x
cmp eax, [ebp+12] ; porownanie liczb x i y
jge x_wieksza ; skok, gdy x >= y
; przypadek x < y
mov eax, [ebp+12] ; liczba y
cmp eax, [ebp+16] ; porownanie liczb y i z
jge y_wieksza ; skok, gdy y >= z
; przypadek y < z
; zatem z jest liczb¹ najwieksz¹
wpisz_z: mov eax, [ebp+16] ; liczba z
spr_z_a:cmp eax, [ebp+20]
jge zakoncz

mov eax, [ebp+20]
zakoncz:
pop ebp
ret

y_wieksza:mov eax, [ebp+12]
x_wieksza:
cmp eax, [ebp+16] ; porownanie x i z
jl wpisz_z
jmp spr_z_a

_szukaj4_max ENDP
END