bits 64

section	.txt
	global ft_strcpy

ft_strcpy:
	push rbp
	mov rbp, rsp
	mov	rax, 0
	mov	rcx, 0
	cmp rdi, 0
	je end
	cmp rsi, 0
	je end

cpy:
	mov cl, BYTE [rsi + rax]
	mov [rdi + rax], cl
	cmp BYTE cl, 0
	je end
	inc rax;
	jmp cpy

end:
	mov rax, rdi
	leave
	ret
