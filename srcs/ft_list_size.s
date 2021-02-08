bits 64

section .text
	global ft_list_size

ft_list_size:
	push rbp
	mov rbp, rsp
	mov rax, 0
	size_loop:
		cmp rdi, 0
		je end
		mov rdi, [rdi + 8]
		inc rax
		jmp size_loop
end:
	leave
	ret
