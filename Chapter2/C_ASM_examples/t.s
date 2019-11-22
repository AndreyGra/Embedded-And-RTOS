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
	.file	"t.c"
	.text
	.align	2
	.global	func
	.syntax unified
	.arm
	.fpu softvfp
	.type	func, %function
func:
	@ args = 8, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	
	//establish stack frame
	push	{fp, lr}
	add	fp, sp, #4

	//Shift Stack Pointer downward 8 4 byte slots for locals and temps
	sub	sp, sp, #32

	//Save r0-r3 in stack at -offsets(fp)
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]

	//Execute assignment statements and show their location on the stack
	mov	r3, #1
	str	r3, [fp, #-8]		//x = 1 at -8(fp)
	mov	r3, #2
	str	r3, [fp, #-12]		//y = 2 at -12(fp)
	mov	r3, #3
	str	r3, [fp, #-16]		//z = 3 at -16(fp)

	//Prepare to call g(x,y)
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	g

	//Compute a+e as return value in r0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #4]
	add	r3, r2, r3
	mov	r0, r3

	//Return to caller
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	func, .-func
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2017-q4-major) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
