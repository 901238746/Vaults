	.file	"crypter.c"
	.text
	.globl	register1
	.data
	.align 8
	.type	register1, @object
	.size	register1, 8
register1:
	.long	0
	.long	1
	.globl	register2
	.align 8
	.type	register2, @object
	.size	register2, 8
register2:
	.long	0
	.long	1
	.globl	register3
	.align 8
	.type	register3, @object
	.size	register3, 8
register3:
	.long	0
	.long	1
	.globl	register4
	.align 8
	.type	register4, @object
	.size	register4, 8
register4:
	.long	0
	.long	1
	.globl	register5
	.align 8
	.type	register5, @object
	.size	register5, 8
register5:
	.long	0
	.long	1
	.globl	register6
	.align 8
	.type	register6, @object
	.size	register6, 8
register6:
	.long	0
	.long	1
	.globl	register7
	.align 8
	.type	register7, @object
	.size	register7, 8
register7:
	.long	0
	.long	1
	.globl	register8
	.align 8
	.type	register8, @object
	.size	register8, 8
register8:
	.long	0
	.long	1
	.globl	register9
	.align 8
	.type	register9, @object
	.size	register9, 8
register9:
	.long	0
	.long	1
	.globl	register10
	.align 8
	.type	register10, @object
	.size	register10, 8
register10:
	.long	0
	.long	1
	.globl	register11
	.align 8
	.type	register11, @object
	.size	register11, 8
register11:
	.long	0
	.long	1
	.globl	register12
	.align 8
	.type	register12, @object
	.size	register12, 8
register12:
	.long	0
	.long	1
	.globl	register13
	.align 8
	.type	register13, @object
	.size	register13, 8
register13:
	.long	0
	.long	1
	.globl	register14
	.align 8
	.type	register14, @object
	.size	register14, 8
register14:
	.long	0
	.long	1
	.globl	register15
	.align 8
	.type	register15, @object
	.size	register15, 8
register15:
	.long	0
	.long	1
	.globl	register16
	.align 8
	.type	register16, @object
	.size	register16, 8
register16:
	.long	0
	.long	1
	.text
	.globl	findSubstring
	.type	findSubstring, @function
findSubstring:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -4(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L2
.L9:
	movl	$0, -12(%rbp)
	jmp	.L3
.L6:
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L10
	addl	$1, -12(%rbp)
.L3:
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L6
	jmp	.L5
.L10:
	nop
.L5:
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jne	.L7
	movl	-16(%rbp), %eax
	jmp	.L8
.L7:
	addl	$1, -16(%rbp)
.L2:
	movl	-8(%rbp), %eax
	subl	-4(%rbp), %eax
	cmpl	%eax, -16(%rbp)
	jle	.L9
	movl	$-1, %eax
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	findSubstring, .-findSubstring
	.comm	stack,1024,32
	.comm	out,4096,32
	.section	.rodata
.LC0:
	.string	"\342\206\222"
	.text
	.globl	getfromstack
	.type	getfromstack, @function
getfromstack:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	findSubstring
	cmpl	$-1, %eax
	jne	.L12
	movq	-24(%rbp), %rax
	jmp	.L13
.L12:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movl	$-30, %edx
	cmpb	%dl, %al
	je	.L17
	addl	$1, -4(%rbp)
	addl	$1, -8(%rbp)
	jmp	.L12
.L17:
	nop
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	out(%rip), %rdi
	call	strncpy@PLT
	leaq	out(%rip), %rax
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	getfromstack, .-getfromstack
	.globl	appendtostack
	.type	appendtostack, @function
appendtostack:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	$-1, %rcx
	movq	%rax, %rdx
	movl	$0, %eax
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	$9602786, (%rax)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	appendtostack, .-appendtostack
	.section	.rodata
.LC1:
	.string	""
	.text
	.globl	removefromstack
	.type	removefromstack, @function
removefromstack:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	findSubstring
	addl	$3, %eax
	movl	%eax, -4(%rbp)
	cmpl	$2, -4(%rbp)
	jne	.L21
	leaq	.LC1(%rip), %rax
	jmp	.L22
.L21:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	%rdx, %rax
	leaq	1(%rax), %rdx
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	-24(%rbp), %rax
	addq	%rax, %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove@PLT
	movq	-24(%rbp), %rax
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	removefromstack, .-removefromstack
	.globl	power
	.type	power, @function
power:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$1, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L24
.L25:
	movl	-8(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
.L24:
	movl	-4(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L25
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	power, .-power
	.globl	bintodecimal
	.type	bintodecimal, @function
bintodecimal:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -12(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L28
.L30:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L29
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %esi
	movl	$2, %edi
	call	power
	addl	%eax, -12(%rbp)
.L29:
	addl	$1, -8(%rbp)
.L28:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L30
	movl	-12(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	bintodecimal, .-bintodecimal
	.globl	decimaltobinary
	.type	decimaltobinary, @function
decimaltobinary:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	$33, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L33
	movl	$0, %eax
	jmp	.L34
.L33:
	movl	$0, -20(%rbp)
	cmpl	$0, -36(%rbp)
	jne	.L37
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
	jmp	.L36
.L40:
	movl	-36(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L38
	movl	$49, %ecx
	jmp	.L39
.L38:
	movl	$48, %ecx
.L39:
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	%cl, (%rax)
	movl	-36(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -36(%rbp)
.L37:
	cmpl	$0, -36(%rbp)
	jg	.L40
.L36:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	$0, -16(%rbp)
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L41
.L42:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -21(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rcx
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-21(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -16(%rbp)
	subl	$1, -12(%rbp)
.L41:
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L42
	movq	-8(%rbp), %rax
.L34:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	decimaltobinary, .-decimaltobinary
	.globl	flipbit
	.type	flipbit, @function
flipbit:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -12(%rbp)
	cmpl	$0, -20(%rbp)
	jle	.L44
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.L45
.L44:
	movl	$0, %eax
	jmp	.L46
.L45:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L47
	movl	$0, %eax
	jmp	.L46
.L47:
	movq	-32(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	-20(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L48
	movl	$48, %ecx
	jmp	.L49
.L48:
	movl	$49, %ecx
.L49:
	movl	-20(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	%cl, (%rax)
	movq	-8(%rbp), %rax
.L46:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	flipbit, .-flipbit
	.globl	printLetterList
	.type	printLetterList, @function
printLetterList:
.LFB14:
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
	jle	.L55
	cmpb	$90, -20(%rbp)
	jg	.L55
	movzbl	-20(%rbp), %eax
	movb	%al, -1(%rbp)
	jmp	.L52
.L53:
	movzbl	-1(%rbp), %eax
	addl	$1, %eax
	movb	%al, -1(%rbp)
.L52:
	cmpb	$90, -1(%rbp)
	jle	.L53
	jmp	.L50
.L55:
	nop
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	printLetterList, .-printLetterList
	.globl	getFirstLetter
	.type	getFirstLetter, @function
getFirstLetter:
.LFB15:
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
	jle	.L57
	cmpb	$90, -4(%rbp)
	jg	.L57
	movzbl	-4(%rbp), %eax
	jmp	.L58
.L57:
	movl	$0, %eax
.L58:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	getFirstLetter, .-getFirstLetter
	.section	.rodata
.LC2:
	.string	"List of first letters: ["
.LC3:
	.string	"'%c'"
.LC4:
	.string	", "
.LC5:
	.string	"]"
	.text
	.globl	processString
	.type	processString, @function
processString:
.LFB16:
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
	jmp	.L60
.L62:
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
	je	.L61
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
.L61:
	addq	$1, -152(%rbp)
.L60:
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L62
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -132(%rbp)
	jmp	.L63
.L65:
	movl	-132(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-136(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -132(%rbp)
	je	.L64
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L64:
	addl	$1, -132(%rbp)
.L63:
	movl	-132(%rbp), %eax
	cmpl	-136(%rbp), %eax
	jl	.L65
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L66
	call	__stack_chk_fail@PLT
.L66:
	addq	$152, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	processString, .-processString
	.section	.rodata
.LC6:
	.string	"Processing string: %s\n"
	.text
	.globl	Listify
	.type	Listify, @function
Listify:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	processString
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	Listify, .-Listify
	.globl	ListifyToStack
	.type	ListifyToStack, @function
ListifyToStack:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	ListifyToStack, .-ListifyToStack
	.section	.rodata
.LC7:
	.string	"DEF"
	.text
	.globl	main
	.type	main, @function
main:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC7(%rip), %rdi
	call	Listify
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
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
