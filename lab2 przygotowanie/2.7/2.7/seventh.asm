; wczytywanie i wy�wietlanie tekstu wielkimi literami
; (inne znaki si� nie zmieniaj�)
.686
.model flat
extern _ExitProcess@4 : PROC
extern __write : PROC ; (dwa znaki podkre�lenia)
extern __read : PROC ; (dwa znaki podkre�lenia)
extern _MessageBoxW@16 : PROC


public _main
.data
tytul dw 'Z','n','a', 'k', 'i', 0
tekst_pocz db 10, 'Prosz� napisa� jaki� tekst '
db 'i nacisnac Enter', 10


koniec_t db ?
magazyn db 1024 dup (?)
magazyn_odb db 1024 dup (?)
nowa_linia db 10
liczba_znakow dd ?
.code
_main PROC
; wy�wietlenie tekstu informacyjnego
; liczba znak�w tekstu

mov ebx, 0
sub ebx, -1
lea ebx, [ebx-8*ebx]

 mov ecx,(OFFSET koniec_t) - (OFFSET tekst_pocz)
 push ecx
 push OFFSET tekst_pocz ; adres tekstu
 push 1 ; nr urz�dzenia (tu: ekran - nr 1)
 call __write ; wy�wietlenie tekstu pocz�tkowego
 add esp, 12 ; usuniecie parametr�w ze stosu
; czytanie wiersza z klawiatury
 push 80 ; maksymalna liczba znak�w
 push OFFSET magazyn_odb
 push 0 ; nr urz�dzenia (tu: klawiatura - nr 0)
 call __read ; czytanie znak�w z klawiatury
 add esp, 12 ; usuniecie parametr�w ze stosu
; kody ASCII napisanego tekstu zosta�y wprowadzone
; do obszaru 'magazyn'
; funkcja read wpisuje do rejestru EAX liczb�
; wprowadzonych znak�w
 mov liczba_znakow, eax
; rejestr ECX pe�ni rol� licznika obieg�w p�tli
 mov ecx, eax
 mov eax, 2
 mul ecx
 mov ebx, 0 ; indeks pocz�tkowy
 mov esi, 0
ptl: mov dl, magazyn_odb[esi] ; pobranie kolejnego znaku
cmp dl, 20H
je space
mov dh, 00H
jmp skip
for_l:mov dl, 41H
mov dh, 01H
jmp save
for_a:mov dl, 04H
mov dh, 01H
jmp save
for_e: mov dl, 18H
mov dh, 01H
jmp save
for_n: mov dl, 43H
mov dh, 01H
jmp save
for_s: mov dl, 5AH
mov dh, 01H
jmp save
for_c: mov dl, 06H
mov dh, 01H
jmp save
for_z: mov dl, 7BH
mov dh, 01H
jmp save
for_zi: mov dl, 79H
mov dh, 01H
jmp save
for_o: mov dl, 0D3H
mov dh, 00H
jmp save

space:mov dx, ' '
jmp save
 skip:	cmp dl, 88H
	jz for_l
	cmp dl, 0A5H
	jz for_a
	cmp dl, 0A9H
	jz for_e
	cmp dl, 0E4H
	jz for_n
	cmp dl, 98H
	jz for_s
	cmp dl, 86H

	jz for_c
	cmp dl, 0BEH
	jz for_z
	cmp dl, 0ABH
	jz for_zi
	cmp dl, 0A2H
	jz for_o

 cmp dl, 'a'
 jb dalej ; skok, gdy znak nie wymaga zamiany
 cmp dl, 'z'
 ja dalej ; skok, gdy znak nie wymaga zamiany
 sub dl, 20H ; zamiana na wielkie litery
  
; odes�anie znaku do pami�ci
 save: mov magazyn[ebx], dl
 mov magazyn[ebx+1], dh
 
dalej: inc ebx ; inkrementacja indeksu
inc ebx
inc esi
dec ecx
jnz ptl ; sterowanie p�tl�
; wy�wietlenie przekszta�conego tekstu


push 0
push OFFSET tytul
push OffSET magazyn
push 0
call _MessageBoxW@16


 add esp, 12 ; usuniecie parametr�w ze stosu
 push 0
 call _ExitProcess@4 ; zako�czenie programu
_main ENDP
END
