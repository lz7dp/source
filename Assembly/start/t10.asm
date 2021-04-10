global _start

section .text
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, 6 
	mov edx, 6
label:
	dec ecx
	dec edx
	cmp ecx, 0
	int 0x80
	jg label

	mov eax, 1
	mov ebx, 0
	int 0x80

