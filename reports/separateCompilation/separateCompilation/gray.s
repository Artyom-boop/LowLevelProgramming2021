	.file	"gray.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	gray
	.type	gray, @function
gray:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	addi	s0,sp,48
	li	s6,1
	sll	s6,s6,a0
	li	a5,4
	sll	a5,a5,a0
	addi	a5,a5,15
	andi	a5,a5,-16
	sub	sp,sp,a5
	beq	s6,zero,.L1
	mv	s4,sp
	mv	s5,a0
	li	s3,0
	li	s7,8
	sub	s7,s7,a0
	mv	s2,a0
	j	.L6
.L3:
	li	a0,10
	call	putchar
	addi	s3,s3,1
	addi	s4,s4,4
	beq	s6,s3,.L1
.L6:
	srai	s1,s3,1
	xor	s1,s1,s3
	sw	s1,0(s4)
	andi	s1,s1,255
	sll	s1,s1,s7
	andi	s1,s1,0xff
	beq	s5,zero,.L3
	li	s8,0
.L5:
	srli	a0,s1,7
	addi	a0,a0,48
	call	putchar
	slli	s1,s1,1
	andi	s1,s1,0xff
	addi	s8,s8,1
	bne	s8,s2,.L5
	j	.L3
.L1:
	addi	sp,s0,-48
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	gray, .-gray
	.ident	"GCC: (SiFive GCC 8.3.0-2020.04.1) 8.3.0"
