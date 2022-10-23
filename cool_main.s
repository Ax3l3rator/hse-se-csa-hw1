	.intel_syntax noprefix
	.text
	.globl	ans
	.type	ans, @function
ans:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi # из rdi берем указатель на массив а и кладем на стек
	mov	QWORD PTR -32[rbp], rsi # из rsi берем указатель на массив b и кладем на стек
	mov	DWORD PTR -36[rbp], edx # из edx берем количество элементов
	mov DWORD PTR -4[rbp], 0      # i
     jmp .L2
.L6:
     mov eax, DWORD PTR -4[rbp]
     cdqe
     lea rdx, 0[0+rax*4]
     mov rax, QWORD PTR -24[rbp]
     add rax, rdx
     mov eax, DWORD PTR [rax]
     cmp eax, 5 # if (a[i] > 5)
     jle .L3
     mov eax, DWORD PTR -4[rbp]
     cdqe
     lea rdx, 0[0+rax*4]
     mov rax, QWORD PTR -24[rbp]
     add rax, rdx
     mov edx, DWORD PTR [rax]
     mov eax, DWORD PTR -4[rbp]
     cdqe
     lea rcx, 0[0+rax*4]
     mov rax, QWORD PTR -32[rbp]
     add rax, rcx  # rax - адрес b[i]
     add edx, 5 # edx = a[i] + 5
     mov DWORD PTR [rax], edx # b[i] = a[i] + 5
     jmp .L4
.L3:
     mov eax, DWORD PTR -4[rbp]
     cdqe
     lea rdx, 0[0+rax*4]
     mov rax, QWORD PTR -24[rbp]
     add rax, rdx
     mov eax, DWORD PTR [rax]
     cmp eax, -5 # if (a[i] < -5)
     jge .L5
     mov eax, DWORD PTR -4[rbp]
     cdqe
     lea rdx, 0[0+rax*4]
     mov rax, QWORD PTR -24[rbp]
     add rax, rdx
     mov edx, DWORD PTR [rax]
     mov eax, DWORD PTR -4[rbp]
     cdqe
     lea rcx, 0[0+rax*4]
     mov rax, QWORD PTR -32[rbp]
     add rax, rcx # rax - адрес b[i]
     sub edx, 5 # edx = a[i] - 5
     mov DWORD PTR [rax], edx # b[i] = a[i] - 5
     jmp .L4
.L5:
     mov eax, DWORD PTR -4[rbp]
     cdqe
     lea rdx, 0[0+rax*4]
     mov rax, QWORD PTR -32[rbp]
     add rax, rdx # rax - адрес b[i]
     mov DWORD PTR [rax], 0 # b[i] = 0
.L4:
     add DWORD PTR -4[rbp], 1 # i++
.L2:
     mov eax, DWORD PTR -4[rbp]
     cmp eax, DWORD PTR -36[rbp]
     jl .L6
     pop rbp
     ret
	.size	ans, .-ans
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	rsi, -40[rbp] # передаем второй аргумент - указатель на n
	lea	rdi, .LC0[rip] # первый аргумент - форматная строка
	mov	eax, 0
	call	__isoc99_scanf@PLT # считываем n - количество вводимых элементов
	mov	edi, DWORD PTR -40[rbp] 
	#cdqe
	sal	edi, 2 # умножаем количество элементов в массиве на 4 (размер int) получая размер в байтах
	call	malloc@PLT 
	mov	QWORD PTR -24[rbp], rax # сохраняем полученный указатель на выделенную память под массив a
	mov	edi, DWORD PTR -40[rbp]
	#cdqe
	sal	rdi, 2 # умножаем количество элементов в массиве на 4 (размер int) получая размер в байтах
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax # сохраняем полученный указатель на выделенную память под массив b
	mov	DWORD PTR -36[rbp], 0 # счетчик цикла - i
	jmp	.L9
.L10:
	mov	eax, DWORD PTR -36[rbp]
	#cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax # в rsi - 2 аргумент, указатель на нужный аргумент
	lea	rdi, .LC0[rip] # в rdi кладем форматную строку - 1 аргумент
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -36[rbp], 1 # инкрементируем i
.L9:
	mov	eax, DWORD PTR -40[rbp]
	cmp	DWORD PTR -36[rbp], eax
	jl	.L10
	mov	edx, DWORD PTR -40[rbp] # 3 аргумент ans - количество элементов
	mov	rsi, QWORD PTR -16[rbp]# 2 аргумент ans - массив b
	mov	rdi, QWORD PTR -24[rbp] # 1 аргумент ans - массив a
	call	ans
	mov	DWORD PTR -32[rbp], 0 # счетчик цикла i
	jmp	.L11
.L12:
	mov	eax, DWORD PTR -32[rbp]
	#cdqe
	lea	rdx, 0[0+rax*4] 
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax # 2 аргумент - значение выводимого scanf элемента
	lea	rdi, .LC1[rip] # 1 аргумент - форматная строка
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -32[rbp], 1 # инкрементируем счетчик i
.L11:
	mov	eax, DWORD PTR -32[rbp]
	cmp	eax, DWORD PTR -40[rbp]
	jl	.L12
	mov	rdi, QWORD PTR -24[rbp] # аргумент free - указатель на блок памяти
	call	free@PLT# освобождаем память выделенную под массив a
	mov	rdi, QWORD PTR -16[rbp] # аргумент free - указатель на блок памяти
	call	free@PLT# освобождаем память выделенную под массив b
	mov	eax, 0
	leave
	ret
	.size	main, .-main
