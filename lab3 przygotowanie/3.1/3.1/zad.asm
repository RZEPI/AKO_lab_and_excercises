.686
.model flat
extern __write : PROC
extern _ExitProcess@4 : PROC
public _main
.data
znaki db 6 dup (?)
.code
wyswietl_EAX PROC
	pusha

		mov eax, 1
		mov esi, 0
		
		
petla:	
		mov edx, 0
		add eax, esi
		inc esi
		mov ecx, 10
		cmp eax, 10
		jb mniejsze_10

		cmp eax, 100
		jb mniejsze_100

		cmp eax, 1000
		jb mniejsze_1000

		cmp eax, 10000
		jb mniejsze_10000

mniejsze_10:
		mov ebx, eax
		mov edx, eax
		add edx, 30H
		mov znaki[0], dl
		mov znaki[1], ','
		mov znaki[2], 20H

		push dword PTR 3
		push dword PTR OFFSET znaki
		push dword PTR 1
		call __write
		add esp, 12

		jmp kontynuuj

mniejsze_100:
		mov ebx, eax
		mov edx, 0
		div ecx
		add dl, 30H
		mov znaki[1], dl
		mov edx, eax
		add dl, 30H
		mov znaki[0], dl
		mov znaki[2], ','
		mov znaki[3], 20H

		push dword PTR 4
		push dword PTR OFFSET znaki
		push dword PTR 1
		call __write
		add esp, 12
		jmp kontynuuj

mniejsze_1000:
		mov ebx, eax
		mov edx, 0
		div ecx
		add dl, 30H
		mov znaki[2], dl
		mov edx, 0
		div ecx
		add dl, 30H
		mov znaki[1], dl
		mov edx, eax
		add dl, 30H
		mov znaki[0], dl
		mov znaki[3], ','
		mov znaki[4], 20H
		push dword PTR 5
		push dword PTR OFFSET znaki
		push dword PTR 1
		call __write
		add esp, 12
		jmp kontynuuj

mniejsze_10000:
		mov ebx, eax
		mov edx, 0
		div ecx
		add dl, 30H
		mov znaki[3], dl
		mov edx, 0
		div ecx
		add dl, 30H
		mov znaki[2], dl
		mov edx, 0
		div ecx
		add dl, 30H
		mov znaki[1], dl
		mov edx, eax
		add dl, 30H
		mov znaki[0], dl
		mov znaki[4], ','
		mov znaki[5], 20H
		push dword PTR 6
		push dword PTR OFFSET znaki
		push dword PTR 1
		call __write
		add esp, 12

kontynuuj:
		mov eax, ebx
		cmp esi, 50
		jne petla


	popa
	ret
wyswietl_EAX ENDP
_main PROC
	call wyswietl_EAX
push 0
call _ExitProcess@4
_main ENDP
END