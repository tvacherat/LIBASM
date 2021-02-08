bits 64

section .data
	neg: dd 1

section .bss
	base_x: resd 1

section .text
	global ft_atoi_base

is_in_base:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rcx, 0
	mov rdx, 0
	find_in_base:
		mov dl, BYTE [rsi + rcx]
		cmp dl, 0
		je end
		cmp BYTE [rdi], dl
		je in_base_ok
		inc rcx
		jmp find_in_base
	in_base_ok:
		mov rax, 1
		jmp end

check_nbr:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rcx, 0
	skip_space_test:
		cmp BYTE [rdi + rcx], 0
		je end
		cmp BYTE [rdi + rcx], 8
		jle end
		cmp BYTE [rdi + rcx], 32
		je skip_space_next
		cmp BYTE [rdi + rcx], 14
		jge get_sign
	skip_space_next:
		inc rcx
		jmp skip_space_test
	get_sign:
		cmp BYTE [rdi + rcx], 45
		je inv_sign
		cmp BYTE [rdi + rcx], 43
		je pos_sign
		jmp in_base
	inv_sign:
		mov r9d, DWORD [neg]
		imul r9d, -1
		mov [neg], r9d
		inc rcx
		jmp get_sign
	pos_sign:
		inc rcx
		jmp get_sign
	in_base:
		add rdi, rcx
		push rdi
		call is_in_base
		cmp rax, 0
		je end
		pop rax
		jmp end

check_base:
	push rbp
	mov rbp, rsp
	mov rcx, 0
	check_base_test:
		cmp BYTE [rsi + rcx], 33
		jl wrong_base
		cmp BYTE [rsi + rcx], 43
		je wrong_base
		cmp BYTE [rsi + rcx], 45
		je wrong_base
		cmp BYTE [rsi + rcx], 126
		jg wrong_base
	check_base_next:
		push rdi
		push rsi
		mov rdi, rsi
		add rdi, rcx
		inc rcx
		add rsi, rcx
		push rcx
		call is_in_base
		pop rcx
		pop rsi
		pop rdi
		cmp rax, 1
		je wrong_base
		cmp BYTE [rsi + rcx], 0
		jne check_base_test
		mov dword [base_x], ecx
		cmp rcx, 2
		jl wrong_base
		mov rax, 1
		jmp end
	wrong_base:
		mov rax, 0
		jmp end

get_nbr_len:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rcx, 0
	nbr_len_test:
		cmp BYTE [rdi + rcx], 0
		je end_nbr_len
		push rdi
		add rdi, rcx
		push rcx
		call is_in_base
		pop rcx
		pop rdi
		cmp rax, 0
		je end_nbr_len
		inc rcx
		jmp nbr_len_test
	end_nbr_len:
		mov rax, rcx
		jmp end

ft_atoi_base:
	push rbp
	mov rbp, rsp
	mov rax, 0
	cmp rdi, 0
	je end
	cmp rsi, 0
	je end
	call check_nbr
	cmp rax, 0
	je end
	mov rdi, rax
	call check_base	
	cmp rax, 0
	je end
	call get_nbr_len
	mov r8, rax
	dec r8
	mov r9, 1
	mov rax, 0
	mov rdx, 0
	convert:
		mov rcx, 0
		test1:
			mov dl, BYTE [rsi + rcx]
			cmp BYTE [rdi + r8], dl
			je next
			inc rcx
			jmp test1
		next:
			imul rcx, r9
			add rax, rcx
			imul r9d, [base_x]
			dec r8
			cmp r8, 0
			jge convert
		imul eax, [neg]
end:
	leave
	ret
