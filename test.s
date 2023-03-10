	.file	"test.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	mv	a5,a0
	sd	a1,-32(s0)
	sw	a5,-20(s0)
	call	foo
	mv	a5,a0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.align	1
	.globl	bar
	.type	bar, @function
bar:
	.long   0x8301C013	#10000011000000011100000000010011 LPCLL immed9 3 
	#.long  0x8680C013 	#10000110100000001100000000010011 LPCML immed8 1
	#.long	0x87814013	#10000111100000010100000000010011 LPCUL immed8 2
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	bar, .-bar
	.align	1
	.globl	foo
	.type	foo, @function
foo:
	.long   0x8201C013	#10000010000000011100000000010011  LPSLL immed9 3
   	#.long   0x8600C013	#10000110000000001100000000010011  LPSML immed8 1
	#.long   0x87014013	#10000111000000010100000000010011  LPSUL immed8 2
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	lui	a5,%hi(bar)
	addi	a5,a5,%lo(bar)
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	li	a0,4
	jalr	a5
	mv	a5,a0
	sw	a5,-28(s0)
	lw	a5,-28(s0)
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	foo, .-foo
	.ident	"GCC: (SiFive GCC 8.3.0-2020.04.0) 8.3.0"
