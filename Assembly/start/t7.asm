
global _start

_start:
	mov ecx, 101
	mov eax, 1
	mov ebx, 42
	cmp ecx, 100
	jl skip
	mov ebx, 13

skip:
	int 0x80

;	je a,b  ;j if =
;	jne a,b ;j if !=
;	jg a,b  ;j if >
;	jge a,b ;j if >=
;	jl a,b  ;j if <
;	jle a,b ;j if <=



