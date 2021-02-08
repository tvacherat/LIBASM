bits 64

section .text
	global ft_strcmp

ft_strcmp:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rcx, 0
	mov rdx, 0
	
cmp:
	mov dl, BYTE [rsi + rcx]
	cmp BYTE [rdi + rcx], dl
	jne end
	cmp BYTE [rdi + rcx], 0
	je end
	inc rcx
	jmp cmp

end:
	mov al, BYTE [rdi + rcx]
	sub rax, rdx
	leave
	ret
