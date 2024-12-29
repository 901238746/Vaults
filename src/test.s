	.file	"test.c"
	.text
	.section	.rodata
.LC0:
	.string	"'%c'"
.LC1:
	.string	", "
.LC2:
	.string	"]"
.LC3:
	.string	"[Invalid Letter]"
	.text
	.globl	printLetterList
	.type	printLetterList, @function
printLetterList:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, %eax
	movb	%al, -20(%rbp)
	movsbl	-20(%rbp), %eax
	movl	%eax, %edi
	call	toupper@PLT
	movb	%al, -20(%rbp)
	cmpb	$64, -20(%rbp)
	jle	.L2
	cmpb	$90, -20(%rbp)
	jg	.L2
	movl	$91, %edi
	call	putchar@PLT
	movzbl	-20(%rbp), %eax
	movb	%al, -1(%rbp)
	jmp	.L3
.L5:
	movsbl	-1(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpb	$90, -1(%rbp)
	je	.L4
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L4:
	movzbl	-1(%rbp), %eax
	addl	$1, %eax
	movb	%al, -1(%rbp)
.L3:
	cmpb	$90, -1(%rbp)
	jle	.L5
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L6
.L2:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	nop
.L6:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	printLetterList, .-printLetterList
	.globl	getFirstLetter
	.type	getFirstLetter, @function
getFirstLetter:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	movl	%eax, %edi
	call	toupper@PLT
	movb	%al, -4(%rbp)
	cmpb	$64, -4(%rbp)
	jle	.L8
	cmpb	$90, -4(%rbp)
	jg	.L8
	movzbl	-4(%rbp), %eax
	jmp	.L9
.L8:
	movl	$0, %eax
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	getFirstLetter, .-getFirstLetter
	.section	.rodata
.LC4:
	.string	"List of first letters: ["
	.text
	.globl	processString
	.type	processString, @function
processString:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -152(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -136(%rbp)
	jmp	.L11
.L13:
	call	__ctype_b_loc@PLT
	movq	(%rax), %rdx
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$1024, %eax
	testl	%eax, %eax
	je	.L12
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	printLetterList
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	-136(%rbp), %ebx
	leal	1(%rbx), %edx
	movl	%edx, -136(%rbp)
	movl	%eax, %edi
	call	getFirstLetter
	movslq	%ebx, %rdx
	movb	%al, -128(%rbp,%rdx)
.L12:
	addq	$1, -152(%rbp)
.L11:
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L13
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -132(%rbp)
	jmp	.L14
.L16:
	movl	-132(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -132(%rbp)
	je	.L15
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L15:
	addl	$1, -132(%rbp)
.L14:
	movl	-132(%rbp), %eax
	cmpl	-136(%rbp), %eax
	jl	.L16
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	processString, .-processString
	.section	.rodata
.LC5:
	.string	"Processing string: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$4407873, -12(%rbp)
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rdi
	call	processString
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
