bits 64

section .text
	global ft_strlen

ft_strlen:
	push rbp
	mov rbp, rsp
	mov	rax, 0
	cmp rdi, 0
	je end

get_len:
	cmp BYTE [rdi + rax], 0
	je end
	inc rax
	jmp get_len

end:
	leave
	ret
