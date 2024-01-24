# Included from original
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
# Included from original

main:
    addi	sp,sp,-32
    sd	ra,24(sp)
    sd	s0,16(sp)
    addi	s0,sp,32
    li	a5,3
    sw	a5,-28(s0)
    lw	a5,-28(s0)
    sext.w	a5,a5
    blez	a5,0x60+main
    lw	a5,-28(s0)
    sw	a5,-20(s0)
    j	0x50+main
    # L4
    lw	a5,-28(s0)
    mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0) # 10690 <__libc_csu_fini+0x8>
    call printf
    lw	a5,-20(s0)
    addiw	a5,a5,-1
    sw	a5,-20(s0)
    # L3
    lw	a5,-20(s0)
    sext.w	a5,a5
    bgtz	a5,0x30+main
    j	0xc0+main
    # L2
    lw	a5,-28(s0)
    sext.w	a5,a5
    bnez	a5,0x84+main
    lw	a5,-28(s0)
    mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1) # 10698 <__libc_csu_fini+0x10>
    call printf
    j	0xc0+main
    # L6
    lw	a5,-28(s0)
    negw	a5,a5
    sw	a5,-24(s0)
    j	0xb4+main
    # L8
    lw	a5,-28(s0)
    mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)# 10690 <__libc_csu_fini+0x8>
    call printf
    lw	a5,-24(s0)
    addiw	a5,a5,-1
    sw	a5,-24(s0)
    # L7
    lw	a5,-24(s0)
    sext.w	a5,a5
    bgtz	a5,0x94+main
    # L5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2) # 106a8 <__libc_csu_fini+0x20>
    call puts
    li	a5,0
    mv	a0,a5
    ld	ra,24(sp)
    ld	s0,16(sp)
    addi	sp,sp,32
    ret

	.size	main, .-main
	.ident	"GCC: (GNU) 9.2.0"
	.section	.note.GNU-stack,"",@progbits
