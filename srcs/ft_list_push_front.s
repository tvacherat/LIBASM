bits 64

struc s_list
	.data:	resq 1
	.next:	resq 1
endstruc

section .text
	global ft_list_push_front
	extern malloc

ft_create_elem:
	push rbp
	mov rbp, rsp
	push rdi
	mov rdi, s_list_size
	call malloc
	pop rdi
	cmp rax, 0
	je end
	mov [rax], rdi
	mov QWORD [rax + 8], 0
	jmp end

ft_list_push_front:
	push rbp
	mov rbp, rsp
	push rdi
	mov rdi, rsi
	call ft_create_elem
	pop rdi
	cmp rax, 0
	je end
	cmp QWORD [rdi], 0
	je next
	mov rcx, [rdi]
	mov [rax + 8], rcx
	next:
		mov [rdi], rax
	jmp end
end:
	leave
	ret
