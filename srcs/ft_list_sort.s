bits 64

section .text
	global ft_list_sort

ft_list_sort:
	push rbp
	mov rbp, rsp
	mov r9, [rdi]
	main_loop:
		cmp r9, 0
		je end
		mov r10, [rdi]
		sort_loop:
			mov r11, [r10 + 8]
			cmp r11, 0
			je next
			push rdi
			push rsi
			mov r12, rsi
			mov rdi, [r10]
			mov rsi, [r11]
			call r12
			pop rsi
			pop rdi
			cmp rax, 0
			jle next_sort_loop
			mov r13, [r10]
			mov r12, [r11]
			mov [r10], r12
			mov [r11], r13
			next_sort_loop:
				mov r10, [r10 + 8]
				jmp sort_loop
		next:
			mov r9, [r9 + 8]
			jmp main_loop
	end:
		leave
		ret
