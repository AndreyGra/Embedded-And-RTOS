	.cpu arm926ej-s
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"t2.c"
	.comm	g,4,4
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	ldr	r3, .L3
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L3
	ldr	r3, [r3]
	str	r3, [fp, #-28]
	str	r3, [fp, #-24]
	str	r3, [fp, #-20]
	str	r3, [fp, #-16]
	str	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	ldr	ip, [fp, #-16]
	ldr	lr, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, lr
	mov	r2, ip
	bl	sum
	mov	r2, r0
	ldr	r3, .L3
	str	r2, [r3]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L4:
	.align	2
.L3:
	.word	g
	.size	main, .-main
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
