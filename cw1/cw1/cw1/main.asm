.686 ;	kod kompadybilny z procesorami z grupy x86
.model flat	;	model p�aski pami�ci

extern _ExitProcess@4	:	PROC
extern _MessageBoxA@16	:	PROC
extern _MessageBeep@4	:	PROC

public _main

.data ;	zminne

title_msg		db	"Tytul Okienka", 0	; �a�cuch znak�w musi zako�czy� si� zerem jak w C '\0'
content_msg		db	"Czy odtworzyc sygnal dzwiekowy?", 0

.code
_main PROC	;	kod
	
	push	24H
	push	OFFSET title_msg
	push	OFFSET content_msg
	push	0

	call	_MessageBoxA@16

	cmp		eax, 6		;	instrukcja por�wniania, za ni� powinna znajdowa� si� istrukcja skoku 
	jne		koniec		;	jump if not equals -> skacze do etykiety "koniec"

	push	0
	call	_MessageBeep@4

koniec:		
	push	0
	call	_ExitProcess@4

_main ENDP
END

