bits 64

extern __errno_location

section .text
	global ft_write

ft_write:
	push rbp
	mov rbp, rsp
	mov rax, 1
	syscall
	cmp rax, 0
	jge end

err:
	mov rdx, rax
	neg rdx
	call __errno_location
	mov [rax], rdx
	mov rax, -1

end:
	leave
	ret
