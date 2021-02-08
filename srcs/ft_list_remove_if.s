bits 64

section .text
	global ft_list_remove_if
	extern free

ft_list_remove_if:
	push rbp
	mov rbp, rsp
	loop1:
		cmp QWORD [rdi], 0
		je next
		push rdi
		push rsi
		push rdx
		push rcx
		mov rdi, [rdi]
		mov rdi, [rdi]
		call rdx
		pop rcx
		pop rdx
		pop rsi
		pop rdi
		cmp rax, 0
		jne next
		mov r9, [rdi]
		mov r10, [r9 + 8]
		mov [rdi], r10
		push rdi
		push rsi
		push rdx
		push rcx
		mov rdi, [r9]
		call rcx
		mov rdi, r9
		call free
		pop rcx
		pop rdx
		pop rsi
		pop rdi
		jmp loop1
	next:
		mov r9, [rdi]
	loop2:
		cmp r9, 0
		je end
		cmp QWORD [r9 + 8], 0
		je end
		if:
			mov r10, [r9 + 8]
			mov rdi, [r10]
			push rsi
			push rdx
			push rcx
			push r9
			call rdx
			pop r9
			pop rcx
			pop rdx
			pop rsi
			cmp rax, 0
			jne next2
			mov r10, [r9 + 8]
			mov r11, [r10 + 8]
			mov [r9 + 8], r11
			mov rdi, [r10]
			push rsi
			push rdx
			push rcx
			push r9
			call rcx
			mov rdi, r10
			call free
			pop r9
			pop rcx
			pop rdx
			pop rsi
			jmp loop2
		next2:
			mov r9, [r9 + 8]
			jmp loop2
end:
	leave
	ret
