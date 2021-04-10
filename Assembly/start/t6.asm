
global _start

_start:
	mov eax,1
	mov ebx,42
	sub ebx,29
	jmp skip
	mov ebx,1

skip:
	int 0x80


