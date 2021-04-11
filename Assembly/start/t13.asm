global _start

_start:
	call func
	mov eax, 1
	mov ebx, 42
	int 0x80

func:
	push ebp
	mov ebp, esp
	mov ebx, 42
	mov esp, ebp
	pop ebp 
	ret

