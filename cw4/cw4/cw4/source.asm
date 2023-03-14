.686	
.model flat

public _dodaj_jeden

.code
_dodaj_jeden PROC
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp+8]
	mov ebx, eax

	rol ebx, 9 ; bl  mamy wyk³adnik

	cmp bl, 150; zbyt duza liczba
	ja koniec


	and eax,7FFFFFH
	or eax, 800000H ; przywrócenie niejawnej jedynki

	cmp bl, 127
	jae jedynka_w_lewo

	; przypadek liczby mniejszej od 1

	cmp bl, 103
	jae przesun_mantyse_w_prawo

	; zwroc jeden 
	mov eax, 3F800000H
	jmp koniec

przesun_mantyse_w_prawo:
	mov cl, 127
	sub cl, bl
	shr eax, cl
	mov bl, 127
	jmp dalej
	
jedynka_w_lewo:
	mov edx, 1
	mov cl, 150
	sub cl, bl ; w cl numer bitu dla jedynki
	shl edx, cl
	add eax, edx
	;sprawdzenie czy w wyniku dodawanaia mantysa > 2
	bt eax, 24
	jnc dalej

	shr eax, 1
	adc eax, 0 ;zokraglenie 
	inc bl

dalej:
	and eax, 7FFFFFH
	and ebx, 0FFH
	ror ebx, 9
	or eax, ebx

koniec: 
	push eax
	fld dword PTR [esp]
	add esp, 4 

	pop ebx
	pop ebp
	ret
_dodaj_jeden ENDP
END