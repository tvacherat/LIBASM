bits 64

extern __errno_location

section .text
	global ft_read

ft_read:
	push rbp
	mov rbp, rsp
	mov rax, 0
	syscall
	cmp rax, 0
	jl err
	jmp end

err:
	mov rdx, rax
	neg rdx
	call __errno_location
	mov [rax], rdx
	mov rax, -1

end:
	leave
	ret
