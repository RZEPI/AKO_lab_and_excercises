; wczytywanie i wy�wietlanie tekstu wielkimi literami
; (inne znaki si� nie zmieniaj�)
.686
.model flat
extern _ExitProcess@4 : PROC
extern __write : PROC ; (dwa znaki podkre�lenia)
extern __read : PROC ; (dwa znaki podkre�lenia)
extern _MessageBoxA@16	:	PROC
public _main
.data
tekst_pocz db 10, 'Prosz', 0A9H, ' napisa� jaki� tekst '
db 'i nacisnac Enter', 10
koniec_t db ?
magazyn db 80 dup (?)
tekst_wysw db 80 dup (?)
tytul db 'Zmieniony komunikat', 0
nowa_linia db 10
liczba_znakow dd ?
.code
_main PROC
; wy�wietlenie tekstu informacyjnego
; liczba znak�w tekstu
 mov ecx,(OFFSET koniec_t) - (OFFSET tekst_pocz)
 push ecx
 push OFFSET tekst_pocz ; adres tekstu
 push 1 ; nr urz�dzenia (tu: ekran - nr 1)
 call __write ; wy�wietlenie tekstu pocz�tkowego
 add esp, 12 ; usuniecie parametr�w ze stosu
; czytanie wiersza z klawiatury
 push 80 ; maksymalna liczba znak�w
 push OFFSET magazyn
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
 mov ebx, 0 ; indeks pocz�tkowy
 mov esi, 0


ptl: mov dl, magazyn[ebx] ; pobranie kolejnego znaku

jmp skip
for_a: mov dl, 0B9H
inc ebx
jmp zapisz
for_a_d: mov dl, 0A5H
inc ebx
jmp zapisz
for_c: mov dl, 0E6H
inc ebx
jmp zapisz
for_c_d: mov dl, 0C6H
inc ebx
jmp zapisz
for_s: mov dl, 9CH
inc ebx
jmp zapisz
for_s_d: mov dl, 8CH
inc ebx
jmp zapisz
for_n: mov dl, 0F1H
inc ebx
jmp zapisz
for_n_d: mov dl, 0D1H
inc ebx
jmp zapisz
for_e: mov dl, 0EAH
inc ebx
jmp zapisz
for_e_d: mov dl, 0CAH
inc ebx
jmp zapisz
for_l: mov dl, 0B3H
inc ebx
jmp zapisz
for_l_d: mov dl, 0A3H
inc ebx
jmp zapisz
for_o: mov dl, 0F3H
inc ebx
jmp zapisz
for_o_d: mov dl, 0D3H
inc ebx
jmp zapisz
for_z: mov dl, 9FH
inc ebx
jmp zapisz
for_z_d: mov dl, 0AFH
inc ebx
jmp zapisz

skip:cmp dl, '/'
jne zapisz

mov dh, magazyn[ebx+1]

cmp dh, 'z'
jz for_z
cmp dh, 'Z'
jz for_z_d
cmp dh, 'l'
jz for_l
cmp dh, 'L'
jz for_l_d
cmp dh, 'a'
jz for_a
cmp dh, 'A'
jz for_a_d
cmp dh, 'e'
jz for_e
cmp dh, 'E'
jz for_e_d
cmp dh, 'c'
jz for_c
cmp dh, 'C'
jz for_c_d
cmp dh, 'n'
jz for_n
cmp dh, 'N'
jz for_n_d
cmp dh, 'z'
jz for_z
cmp dh, 'Z'
jz for_z_d
cmp dh, 'o'
jz for_o
cmp dh, 'O'
jz for_o_d
cmp dh, 's'
jz for_s
cmp dh, 'S'
jz for_s_d


; odes�anie znaku do pami�ci
 zapisz: mov tekst_wysw[esi], dl
dalej: inc ebx ; inkrementacja indeksu
inc esi
dec ecx
jnz ptl ; sterowanie p�tl�
; wy�wietlenie przekszta�conego tekstu
 push 0 ; MESS_OK
 push OFFSET tytul
 push OFFSET tekst_wysw
 push 0
 call _MessageBoxA@16
 push 0
 call _ExitProcess@4 ; zako�czenie programu
_main ENDP
END
