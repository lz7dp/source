
global _start

_start:
	mov eax,1
	mov ebx,42
	sub ebx,29
	mov ebx,123
	mov eax,ebx
	mov ecx,1
	add ebx,ecx
	mov edx,1
	sub ebx,edx
	mul ebx
	div edx
	mov ebx,edx
	int 0x80


