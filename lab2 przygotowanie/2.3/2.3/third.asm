; Przyk³ad wywo³ywania funkcji MessageBoxA i MessageBoxW
.686
.model flat
extern _ExitProcess@4 : PROC
extern _MessageBoxW@16 : PROC
public _main
.data
tytul_Unicode	dw 'Z', 'n', 'a', 'k', 'i', 0
tekst_Unicode	dw 'T','o', ' ', 'j', 'e','s', 't', ' ', 'p', 'i','e','s', 0D83DH, 0DC15H, ' ', 'i', ' ', 'k','o','t', 0D83DH, 0DC08H, 0

.code
_main PROC
 push 0 ; stala MB_OK
; adres obszaru zawieraj¹cego tytu³
 push OFFSET tytul_Unicode
; adres obszaru zawieraj¹cego tekst
 push OFFSET tekst_Unicode
 push 0 ; NULL
 call _MessageBoxW@16
 push 0 ; kod powrotu programu
 call _ExitProcess@4
_main ENDP
END
