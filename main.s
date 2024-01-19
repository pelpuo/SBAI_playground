	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"elem is%d\n"
.LC2:
	.string	"\nComplete"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], 3
	cmp	DWORD PTR -4[rbp], 0
	jle	.L2
	mov	eax, DWORD PTR -4[rbp]
	mov	DWORD PTR -12[rbp], eax
	jmp	.L3
.L4:
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	sub	DWORD PTR -12[rbp], 1
.L3:
	cmp	DWORD PTR -12[rbp], 0
	jg	.L4
	jmp	.L5
.L2:
	cmp	DWORD PTR -4[rbp], 0
	jne	.L6
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L5
.L6:
	mov	eax, DWORD PTR -4[rbp]
	neg	eax
	mov	DWORD PTR -8[rbp], eax
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	sub	DWORD PTR -8[rbp], 1
.L7:
	cmp	DWORD PTR -8[rbp], 0
	jg	.L8
.L5:
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
