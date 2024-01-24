	.file	"main.c"
	.option nopic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d"
	.align	3
.LC1:
	.string	"elem is%d\n"
	.align	3
.LC2:
	.string	"\nComplete"
	.text
	.align	2
	
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,3
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	sext.w	a5,a5
	ble	a5,zero,.L2
	lw	a5,-28(s0)
	sw	a5,-20(s0)
	j	.L3
.L4:
	lw	a5,-28(s0)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
.L3:
	lw	a5,-20(s0)
	sext.w	a5,a5
	bgt	a5,zero,.L4
	j	.L5
.L2:
	lw	a5,-28(s0)
	sext.w	a5,a5
	bne	a5,zero,.L6
	lw	a5,-28(s0)
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	j	.L5
.L6:
	lw	a5,-28(s0)
	negw	a5,a5
	sw	a5,-24(s0)
	j	.L7
.L8:
	lw	a5,-28(s0)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	lw	a5,-24(s0)
	addiw	a5,a5,-1
	sw	a5,-24(s0)
.L7:
	lw	a5,-24(s0)
	sext.w	a5,a5
	bgt	a5,zero,.L8
.L5:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 9.2.0"
	.section	.note.GNU-stack,"",@progbits
