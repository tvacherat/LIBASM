bits 64

section .text
	global ft_strdup
	extern malloc
	extern ft_strlen
	extern ft_strcpy

ft_strdup:
	push rbp
	mov rbp, rsp
	push rdi
	call ft_strlen
	mov rdi, rax
	inc rdi
	call malloc
	cmp rax, 0
	je err
	mov rdi, rax
	pop rsi
	call ft_strcpy

end:
	leave
	ret

err:
	pop rdi
	jmp end
