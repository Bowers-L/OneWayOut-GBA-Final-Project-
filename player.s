	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"player.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipCurrentItem.part.0, %function
equipCurrentItem.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	ldr	r3, [r3, #112]
	ldr	r2, .L3+4
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	strh	r2, [r3, #12]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.word	429
	.size	equipCurrentItem.part.0, .-equipCurrentItem.part.0
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.align	2
	.global	showPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	showPlayer, %function
showPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L15
	ldr	r8, [r4, #124]
	ldr	r6, .L15+4
	add	r2, r8, #90
	smull	r1, r3, r6, r2
	asr	r1, r2, #31
	add	r3, r3, r2
	rsb	r3, r1, r3, asr #8
	ldr	r1, .L15+8
	add	r3, r3, r3, lsl #1
	ldm	r1, {r0, r1}
	ldr	lr, [r4, #8]
	ldr	r7, [r4, #12]
	ldr	r10, [r4, #116]
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #3
	ldr	r9, .L15+12
	lsl	r5, r3, #1
	sub	lr, lr, r0
	sub	r7, r7, r1
	cmp	r10, #0
	ldrsh	fp, [r9, r5]
	str	lr, [r4]
	str	r7, [r4, #4]
	ldr	r2, [r4, #28]
	sub	sp, sp, #12
	beq	.L13
.L6:
	rsb	r2, r2, #0
	cmp	lr, #2544
	cmple	r2, lr
	movgt	ip, #1
	ble	.L14
.L7:
	ldr	r3, [r4, #44]
	ldr	r1, [r4, #52]
	mov	r0, r3
	stm	sp, {r1, r3}
	ldr	r2, .L15+16
	str	ip, [r4, #60]
	lsr	r6, lr, #4
	mov	lr, pc
	bx	r2
	lsl	r7, r7, #19
	lsl	r0, r0, #16
	cmp	r10, #0
	ldrb	r2, [r4, #36]	@ zero_extendqisi2
	ldm	sp, {r1, r3}
	and	r6, r6, #255
	lsr	r7, r7, #23
	lsr	r0, r0, #16
	beq	.L8
	ldr	ip, .L15+20
	add	r2, r2, #3
	add	r2, r2, r0, lsl #5
	orr	r6, r6, #1024
	strh	r2, [ip, #4]	@ movhi
	strh	r6, [ip]	@ movhi
	strh	r7, [ip, #2]	@ movhi
.L9:
	ldr	r0, .L15+4
	smull	r2, r0, r8, r0
	ldr	ip, .L15+24
	add	r0, r0, r8
	asr	r2, r8, #31
	rsb	r2, r2, r0, asr #8
	add	r2, r2, r2, lsl #1
	ldr	r0, [ip]
	rsb	r2, r2, r2, lsl #4
	strh	fp, [r0, #6]	@ movhi
	sub	r2, r8, r2, lsl #3
	lsl	r2, r2, #1
	ldrsh	ip, [r9, r2]
	rsb	ip, ip, #0
	strh	ip, [r0, #14]	@ movhi
	ldrsh	r2, [r9, r2]
	strh	r2, [r0, #22]	@ movhi
	ldr	ip, [r4, #56]
	ldrsh	r2, [r9, r5]
	cmp	ip, #0
	strh	r2, [r0, #30]	@ movhi
	bne	.L5
	ldr	r2, [r4, #48]
	add	r0, r3, #1
	mul	r1, r2, r1
	ldr	r3, .L15+28
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L5:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L8:
	ldr	ip, .L15+20
	orr	r6, r6, #34560
	add	r2, r2, r0, lsl #6
	strh	r6, [ip]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	b	.L9
.L13:
	add	r2, r2, r2, lsr #31
	ldr	r5, .L15+32
	asr	r2, r2, #1
	mov	r0, fp
	mul	fp, r2, fp
	mov	lr, pc
	bx	r5
	mul	r0, fp, r0
	cmp	r0, #0
	add	fp, r0, #255
	movge	fp, r0
	ldr	r2, [r4, #124]
	smull	r3, r1, r6, r2
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #8
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #3
	ldr	r0, [r4, #24]
	lsl	r3, r3, #1
	ldrsh	r2, [r9, r3]
	ldr	r3, [r4]
	add	r7, r0, r0, lsr #31
	sub	fp, r3, fp, asr #8
	mov	r0, r2
	asr	r7, r7, #1
	mul	r7, r2, r7
	str	fp, [r4]
	mov	lr, pc
	bx	r5
	mul	r0, r7, r0
	cmp	r0, #0
	add	r3, r0, #255
	movlt	r0, r3
	ldr	r3, [r4, #124]
	add	r3, r3, #90
	smull	r2, r1, r6, r3
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #8
	add	r2, r2, r2, lsl #1
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #3
	lsl	r2, r3, #1
	ldr	r3, [r4, #24]
	ldrsh	ip, [r9, r2]
	ldr	r1, [r4]
	add	r3, r3, r3, lsr #31
	sub	r2, r1, r0, asr #8
	asr	r7, r3, #1
	mov	r0, ip
	mul	r7, ip, r7
	str	r2, [r4]
	mov	lr, pc
	bx	r5
	mul	r0, r7, r0
	add	r3, r0, #255
	cmp	r0, #0
	movlt	r0, r3
	ldr	r2, [r4, #124]
	smull	r3, r1, r6, r2
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #8
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #3
	lsl	r2, r3, #1
	ldr	r3, [r4, #28]
	ldrsh	ip, [r9, r2]
	ldr	r1, [r4, #4]
	add	r3, r3, r3, lsr #31
	sub	r2, r1, r0, asr #8
	asr	r7, r3, #1
	mov	r0, ip
	mul	r7, ip, r7
	str	r2, [r4, #4]
	mov	lr, pc
	bx	r5
	mul	r7, r0, r7
	add	r0, r7, #255
	cmp	r7, #0
	movlt	r7, r0
	ldr	r8, [r4, #124]
	add	r2, r8, #90
	smull	r3, r6, r2, r6
	asr	r3, r2, #31
	add	r6, r6, r2
	rsb	r3, r3, r6, asr #8
	add	r3, r3, r3, lsl #1
	ldr	r0, [r4, #4]
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #3
	sub	r7, r0, r7, asr #8
	lsl	r5, r3, #1
	str	r7, [r4, #4]
	ldrsh	fp, [r9, r5]
	ldr	lr, [r4]
	ldr	r2, [r4, #28]
	ldr	r10, [r4, #116]
	b	.L6
.L14:
	ldr	ip, [r4, #24]
	rsb	ip, ip, #0
	cmp	r7, #3824
	cmple	ip, r7
	movgt	ip, #1
	movle	ip, #0
	b	.L7
.L16:
	.align	2
.L15:
	.word	player
	.word	-1240768329
	.word	camera
	.word	sinLut
	.word	__aeabi_idiv
	.word	shadowOAM
	.word	shadowOAMAffine
	.word	__aeabi_idivmod
	.word	signOf
	.size	showPlayer, .-showPlayer
	.align	2
	.global	collisionLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionLeft, %function
collisionLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L22
	ldr	r3, [r1, #12]
	cmp	r3, #0
	blt	.L20
	ldr	r2, [r1, #8]
	rsb	r0, r0, r3, asr #4
	asr	r3, r2, #4
	ldr	ip, .L22+4
	add	r3, r0, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L21
.L20:
	mov	r0, #1
	bx	lr
.L21:
	ldr	r3, [r1, #28]
	add	r2, r2, r3
	asr	r2, r2, #4
	sub	r2, r2, #1
	add	r0, r0, r2, lsl #10
	lsl	r0, r0, #1
	ldrh	r0, [ip, r0]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.word	mapCollisionBitmap
	.size	collisionLeft, .-collisionLeft
	.align	2
	.global	collisionRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionRight, %function
collisionRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L29
	ldr	r3, [r2, #12]
	ldr	r1, [r2, #24]
	add	r3, r3, r1
	cmp	r3, #16384
	bge	.L27
	ldr	r1, [r2, #8]
	add	r0, r0, r3, asr #4
	asr	r3, r1, #4
	ldr	ip, .L29+4
	add	r3, r0, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L28
.L27:
	mov	r0, #1
	bx	lr
.L28:
	ldr	r3, [r2, #28]
	add	r1, r1, r3
	asr	r1, r1, #4
	sub	r1, r1, #1
	add	r0, r0, r1, lsl #10
	lsl	r0, r0, #1
	ldrh	r0, [ip, r0]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.word	mapCollisionBitmap
	.size	collisionRight, .-collisionRight
	.align	2
	.global	collisionAbove
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionAbove, %function
collisionAbove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L34
	ldr	r3, [ip, #8]
	ldr	r1, [ip, #12]
	rsb	r0, r0, r3, asr #4
	asr	r3, r1, #4
	add	r3, r3, r0, lsl #10
	ldr	r2, .L34+4
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	lsl	r0, r0, #10
	bne	.L33
	ldr	r3, [ip, #24]
	add	r1, r1, r3
	add	r0, r0, r1, asr #4
	add	r0, r2, r0, lsl #1
	ldrh	r0, [r0, #-2]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L33:
	mov	r0, #1
	bx	lr
.L35:
	.align	2
.L34:
	.word	player
	.word	mapCollisionBitmap
	.size	collisionAbove, .-collisionAbove
	.align	2
	.global	collisionBelow
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionBelow, %function
collisionBelow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L41
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #28]
	add	r3, r3, r1
	cmp	r3, #16384
	bge	.L39
	ldr	ip, [r2, #12]
	asr	r3, r3, #4
	sub	r3, r3, #1
	add	r0, r3, r0
	asr	r3, ip, #4
	add	r3, r3, r0, lsl #10
	ldr	r1, .L41+4
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	lsl	r0, r0, #10
	beq	.L40
.L39:
	mov	r0, #1
	bx	lr
.L40:
	ldr	r3, [r2, #24]
	add	ip, ip, r3
	add	r0, r0, ip, asr #4
	add	r0, r1, r0, lsl #1
	ldrh	r0, [r0, #-2]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L42:
	.align	2
.L41:
	.word	player
	.word	mapCollisionBitmap
	.size	collisionBelow, .-collisionBelow
	.align	2
	.global	touchingGround
	.syntax unified
	.arm
	.fpu softvfp
	.type	touchingGround, %function
touchingGround:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L46
	ldr	r2, [r1, #28]
	ldr	r3, [r1, #8]
	ldr	ip, [r1, #12]
	add	r3, r3, r2
	asr	r3, r3, #4
	asr	r2, ip, #4
	add	r2, r2, r3, lsl #10
	ldr	r0, .L46+4
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	lsl	r3, r3, #10
	bne	.L45
	ldr	r2, [r1, #24]
	add	ip, ip, r2
	add	r3, r3, ip, asr #4
	add	r3, r0, r3, lsl #1
	ldrh	r0, [r3, #-2]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L45:
	mov	r0, #1
	bx	lr
.L47:
	.align	2
.L46:
	.word	player
	.word	mapCollisionBitmap
	.size	touchingGround, .-touchingGround
	.align	2
	.global	handlePlayerInput
	.syntax unified
	.arm
	.fpu softvfp
	.type	handlePlayerInput, %function
handlePlayerInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L117
	ldrh	r2, [r3, #48]
	tst	r2, #32
	push	{r4, r5, r6, lr}
	beq	.L49
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L110
.L49:
	ldr	r3, .L117
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L54
	mvn	r3, #0
	ldr	r4, .L117+4
	ldr	r2, [r4, #12]
	cmp	r2, #0
	str	r3, [r4, #108]
	ldrgt	r3, [r4, #72]
	rsbgt	r3, r3, #0
	strgt	r3, [r4, #68]
	bl	touchingGround
	cmp	r0, #0
	movne	r2, #0
	movne	r3, #2
	strne	r2, [r4, #56]
	strbne	r3, [r4, #36]
.L54:
	ldr	r3, .L117
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L111
.L52:
	ldr	r6, .L117+8
	ldrh	r5, [r6]
	tst	r5, #1
	beq	.L60
	ldr	r3, .L117+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L60
	bl	touchingGround
	cmp	r0, #0
	ldr	r4, .L117+4
	bne	.L61
	ldr	r3, [r4, #120]
	cmp	r3, #0
	beq	.L60
	mov	r0, #2
	bl	collisionLeft
	cmp	r0, #0
	beq	.L112
.L61:
	mov	r2, #1
	mov	r1, #0
	ldr	r3, .L117
	ldrh	r3, [r3, #48]
	tst	r3, #1
	ldr	r3, [r4, #100]
	rsb	r3, r3, #0
	str	r3, [r4, #16]
	str	r2, [r4, #88]
	str	r2, [r4, #56]
	str	r1, [r4, #44]
	bne	.L62
.L63:
	tst	r5, #2
	beq	.L65
	ldr	r3, .L117+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L113
.L65:
	tst	r5, #512
	beq	.L66
	ldr	r3, .L117+12
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L114
.L66:
	tst	r5, #256
	beq	.L48
	ldr	r3, .L117+12
	ldrh	r3, [r3]
	tst	r3, #256
	bne	.L48
	ldr	r2, .L117+4
	ldr	r3, [r2, #112]
	cmp	r3, #8
	bgt	.L48
	ldr	r1, .L117+16
	add	r3, r3, #1
	ldrb	r1, [r1, r3]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L115
.L48:
	pop	{r4, r5, r6, lr}
	bx	lr
.L112:
	mov	r0, #2
	bl	collisionRight
	cmp	r0, #0
	bne	.L61
.L60:
	ldr	r3, .L117
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L63
	ldr	r4, .L117+4
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L63
.L62:
	mov	r3, #0
	str	r3, [r4, #16]
	str	r3, [r4, #88]
	b	.L63
.L111:
	mov	r2, #1
	ldr	r4, .L117+4
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #12]
	rsb	r3, r3, #16384
	cmp	r1, r3
	ldrlt	r3, [r4, #72]
	str	r2, [r4, #108]
	strlt	r3, [r4, #68]
	bl	touchingGround
	cmp	r0, #0
	movne	r2, #0
	movne	r3, #1
	strne	r2, [r4, #56]
	strbne	r3, [r4, #36]
	b	.L52
.L114:
	ldr	r2, .L117+4
	ldr	r3, [r2, #112]
	cmp	r3, #0
	ble	.L66
	ldr	r1, .L117+16
	sub	r3, r3, #1
	ldrb	r1, [r1, r3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L66
	ldr	r1, .L117+20
	str	r3, [r2, #112]
	mov	lr, pc
	bx	r1
	ldrh	r5, [r6]
	b	.L66
.L113:
	ldr	r3, .L117+4
	ldr	r1, .L117+16
	ldr	r2, [r3, #112]
	ldr	r3, .L117+24
	ldrb	r0, [r1, r2]	@ zero_extendqisi2
	mov	lr, pc
	bx	r3
	ldrh	r5, [r6]
	b	.L65
.L110:
	ldr	r4, .L117+4
	ldr	r6, .L117+28
	ldr	r0, [r4, #108]
	mov	lr, pc
	bx	r6
	mov	r5, r0
	ldr	r0, [r4, #20]
	mov	lr, pc
	bx	r6
	cmp	r5, r0
	movne	r3, #0
	strne	r3, [r4, #20]
	strne	r3, [r4, #68]
	beq	.L116
.L51:
	mov	r3, #0
	strb	r3, [r4, #36]
	b	.L52
.L115:
	ldr	r1, .L117+20
	str	r3, [r2, #112]
	mov	lr, pc
	bx	r1
	b	.L48
.L116:
	ldr	r0, [r4, #108]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #76]
	rsb	r3, r0, #0
	mul	r3, r2, r3
	str	r3, [r4, #68]
	b	.L51
.L118:
	.align	2
.L117:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	playerInventory
	.word	showSelectorOnItem
	.word	useItem
	.word	signOf
	.size	handlePlayerInput, .-handlePlayerInput
	.align	2
	.global	resolveCollisions
	.syntax unified
	.arm
	.fpu softvfp
	.type	resolveCollisions, %function
resolveCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r0, #0
	bl	collisionLeft
	ldr	r5, .L145
	subs	r6, r0, #0
	ldr	r4, [r5, #12]
	beq	.L120
	mov	r6, #0
	add	r4, r4, #2
.L121:
	mov	r0, #0
	str	r4, [r5, #12]
	bl	collisionLeft
	cmp	r0, #0
	mov	r3, r4
	add	r6, r6, #1
	add	r4, r4, #2
	bne	.L121
	sub	r3, r3, r6, lsl #1
	mov	r7, #1
	str	r3, [r5, #12]
	lsl	r8, r6, #1
	b	.L122
.L123:
	sub	r4, r4, #2
	str	r4, [r5, #12]
	add	r6, r6, #1
.L120:
	mov	r0, #0
	bl	collisionRight
	subs	r7, r0, #0
	bne	.L123
	add	r4, r4, r6, lsl #1
	str	r4, [r5, #12]
	lsl	r8, r6, #1
.L122:
	mov	r0, #0
	bl	collisionAbove
	subs	r9, r0, #0
	ldr	r4, [r5, #8]
	beq	.L124
	mov	r9, #0
	add	r4, r4, #2
.L125:
	mov	r0, #0
	str	r4, [r5, #8]
	bl	collisionAbove
	cmp	r0, #0
	mov	r3, r4
	add	r9, r9, #1
	add	r4, r4, #2
	bne	.L125
	sub	r3, r3, r9, lsl #1
	cmp	r6, r9
	str	r3, [r5, #8]
	lsl	r9, r9, #1
	ble	.L126
	add	r9, r3, r9
	str	r0, [r5, #16]
	str	r9, [r5, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L128:
	sub	r4, r4, #2
	str	r4, [r5, #8]
	add	r9, r9, #1
.L124:
	mov	r0, #0
	bl	collisionBelow
	cmp	r0, #0
	bne	.L128
	add	r4, r4, r9, lsl #1
	cmp	r6, r9
	str	r4, [r5, #8]
	lsl	r3, r9, #1
	bgt	.L129
.L126:
	cmp	r6, #0
	movne	r3, #0
	ldr	r0, [r5, #12]
	strne	r3, [r5, #20]
	cmp	r7, #0
	addne	r0, r0, r8
	subeq	r0, r0, r8
	mov	r1, #16
	ldr	r3, .L145+4
	str	r0, [r5, #12]
	mov	lr, pc
	bx	r3
	str	r0, [r5, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L129:
	cmp	r9, #0
	movne	r9, r3
	sub	r4, r4, r9
	strne	r0, [r5, #16]
	str	r4, [r5, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L146:
	.align	2
.L145:
	.word	player
	.word	roundbase
	.size	resolveCollisions, .-resolveCollisions
	.align	2
	.global	equipBoots
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipBoots, %function
equipBoots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L151
	ldr	r3, [r4, #92]
	cmp	r3, #1024
	bne	.L148
	mov	r0, #512
	mov	r2, #16
	str	r0, [r4, #92]
	str	r2, [r4, #96]
	mov	r1, #0
	mov	r2, #64
	mov	r0, #4
	ldr	r3, [r4, #112]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	strh	r1, [r3, #12]	@ movhi
	str	r0, [r4, #104]
	str	r2, [r4, #100]
	pop	{r4, r5, r6, lr}
	bx	lr
.L148:
	mov	r2, #1024
	mov	r3, #20
	str	r2, [r4, #92]
	str	r3, [r4, #96]
	bl	equipCurrentItem.part.0
	add	r0, r4, #92
	ldm	r0, {r0, r5}
	ldr	r3, .L151+4
	mul	r1, r5, r5
	lsl	r0, r0, #1
	mov	lr, pc
	bx	r3
	mul	r2, r0, r5
	str	r0, [r4, #104]
	str	r2, [r4, #100]
	pop	{r4, r5, r6, lr}
	bx	lr
.L152:
	.align	2
.L151:
	.word	player
	.word	__aeabi_idiv
	.size	equipBoots, .-equipBoots
	.align	2
	.global	shrinkPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	shrinkPlayer, %function
shrinkPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L157
	ldr	r3, [r4, #116]
	cmp	r3, #0
	beq	.L154
	mov	r0, #8
	bl	collisionAbove
	cmp	r0, #0
	bne	.L153
	mov	r1, #256
	ldr	r3, [r4, #112]
	ldr	r2, [r4, #8]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	sub	r2, r2, #128
	str	r0, [r4, #116]
	str	r2, [r4, #8]
	str	r1, [r4, #28]
	strh	r0, [r3, #12]	@ movhi
.L153:
	pop	{r4, lr}
	bx	lr
.L154:
	mov	r2, #1
	mov	r3, #128
	str	r2, [r4, #116]
	str	r3, [r4, #28]
	pop	{r4, lr}
	b	equipCurrentItem.part.0
.L158:
	.align	2
.L157:
	.word	player
	.size	shrinkPlayer, .-shrinkPlayer
	.align	2
	.global	equipLegs
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipLegs, %function
equipLegs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L162
	ldr	r3, [r2, #80]
	cmp	r3, #16
	beq	.L161
	mov	r0, #16
	mov	r1, #0
	ldr	r3, [r2, #112]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	str	r0, [r2, #80]
	strh	r1, [r3, #12]	@ movhi
	bx	lr
.L161:
	mov	r3, #64
	str	r3, [r2, #80]
	b	equipCurrentItem.part.0
.L163:
	.align	2
.L162:
	.word	player
	.size	equipLegs, .-equipLegs
	.align	2
	.global	equipGloves
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipGloves, %function
equipGloves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L168
	ldr	r3, [r2, #120]
	cmp	r3, #0
	beq	.L165
	mov	r1, #0
	ldr	r3, [r2, #112]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	str	r1, [r2, #120]
	strh	r1, [r3, #12]	@ movhi
	bx	lr
.L165:
	mov	r3, #1
	str	r3, [r2, #120]
	b	equipCurrentItem.part.0
.L169:
	.align	2
.L168:
	.word	player
	.size	equipGloves, .-equipGloves
	.align	2
	.global	startLaserSling
	.syntax unified
	.arm
	.fpu softvfp
	.type	startLaserSling, %function
startLaserSling:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	ldr	r3, .L172
	ldr	r1, .L172+4
	ldr	r0, .L172+8
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L172+12
	strb	r2, [r3, #128]
	pop	{r4, lr}
	bx	lr
.L173:
	.align	2
.L172:
	.word	playSoundB
	.word	5200
	.word	snd_Ding
	.word	player
	.size	startLaserSling, .-startLaserSling
	.align	2
	.global	equipCurrentItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipCurrentItem, %function
equipCurrentItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	bne	equipCurrentItem.part.0
.L175:
	ldr	r3, .L176
	ldr	r3, [r3, #112]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	strh	r0, [r3, #12]	@ movhi
	bx	lr
.L177:
	.align	2
.L176:
	.word	player
	.size	equipCurrentItem, .-equipCurrentItem
	.align	2
	.global	setTransform
	.syntax unified
	.arm
	.fpu softvfp
	.type	setTransform, %function
setTransform:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r3
	mov	r3, r0
	ldr	fp, .L180
	add	r0, r5, #90
	smull	lr, ip, fp, r0
	asr	r4, r0, #31
	add	ip, ip, r0
	rsb	r4, r4, ip, asr #8
	add	r4, r4, r4, lsl #1
	ldr	ip, .L180+4
	rsb	r4, r4, r4, lsl #4
	ldr	r8, .L180+8
	sub	r4, r0, r4, lsl #3
	ldr	r6, [ip]
	lsl	r4, r4, #1
	ldrsh	r0, [r8, r4]
	ldr	r7, .L180+12
	add	r6, r6, r3, lsl #5
	mov	r9, r2
	mov	r10, r1
	mov	lr, pc
	bx	r7
	smull	r3, fp, r5, fp
	asr	ip, r5, #31
	add	fp, fp, r5
	rsb	ip, ip, fp, asr #8
	add	ip, ip, ip, lsl #1
	rsb	ip, ip, ip, lsl #4
	sub	ip, r5, ip, lsl #3
	strh	r0, [r6, #6]	@ movhi
	lsl	r5, ip, #1
	ldrsh	r0, [r8, r5]
	mov	r1, r10
	rsb	r0, r0, #0
	mov	lr, pc
	bx	r7
	strh	r0, [r6, #14]	@ movhi
	mov	r1, r9
	ldrsh	r0, [r8, r5]
	mov	lr, pc
	bx	r7
	strh	r0, [r6, #22]	@ movhi
	mov	r1, r9
	ldrsh	r0, [r8, r4]
	mov	lr, pc
	bx	r7
	strh	r0, [r6, #30]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L181:
	.align	2
.L180:
	.word	-1240768329
	.word	shadowOAMAffine
	.word	sinLut
	.word	__aeabi_idiv
	.size	setTransform, .-setTransform
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.align	2
	.global	generateSinLut
	.syntax unified
	.arm
	.fpu softvfp
	.type	generateSinLut, %function
generateSinLut:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r7, r1, #0
	beq	.L182
	mov	r4, r0
	sub	r4, r4, #2
	mov	r0, #0
	mov	r1, #0
	mov	r5, #0
	ldr	r6, .L190+8
	ldr	r8, .L190+12
	ldr	fp, .L190+16
	ldr	r10, .L190+20
	ldr	r9, .L190+24
	add	r7, r4, r7, lsl #1
	b	.L184
.L189:
	mov	r0, r5
	mov	lr, pc
	bx	fp
	adr	r3, .L190
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r3, .L190+28
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
.L184:
	mov	r2, #0
	ldr	r3, .L190+32
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r8
	strh	r0, [r4, #2]!	@ movhi
	cmp	r4, r7
	add	r5, r5, #1
	bne	.L189
.L182:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L191:
	.align	3
.L190:
	.word	1405670641
	.word	1074340347
	.word	__aeabi_dmul
	.word	__aeabi_d2iz
	.word	__aeabi_i2d
	.word	__aeabi_ddiv
	.word	sin
	.word	1080459264
	.word	1081081856
	.size	generateSinLut, .-generateSinLut
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #480
	mov	fp, #15872
	ldr	r3, .L194
	ldr	r1, [r3, #4]
	ldr	lr, [r3]
	ldr	r3, .L194+4
	sub	r1, r10, r1
	stmib	r3, {r1, fp}
	mov	r1, #90
	mov	r2, #0
	mov	r0, #4
	mov	ip, #1
	mov	r5, #16
	mov	r4, #64
	mov	r9, #128
	mov	r8, #256
	mov	r7, #8
	mov	r6, #512
	str	r1, [r3, #124]
	mov	r1, #15
	sub	lr, fp, lr
	str	lr, [r3]
	str	r10, [r3, #12]
	str	r9, [r3, #24]
	str	r8, [r3, #28]
	str	r7, [r3, #76]
	str	r6, [r3, #92]
	str	r1, [r3, #52]
	str	r0, [r3, #72]
	str	r0, [r3, #104]
	str	r0, [r3, #48]
	str	r5, [r3, #80]
	str	r5, [r3, #96]
	str	r4, [r3, #84]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #88]
	str	r2, [r3, #108]
	str	r2, [r3, #112]
	str	r2, [r3, #116]
	str	r2, [r3, #120]
	strb	r2, [r3, #36]
	str	r2, [r3, #44]
	str	ip, [r3, #60]
	str	ip, [r3, #56]
	str	r4, [r3, #100]
	strb	ip, [r3, #128]
	mov	r1, #360
	ldr	r0, .L194+8
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	generateSinLut
.L195:
	.align	2
.L194:
	.word	camera
	.word	player
	.word	sinLut
	.size	initPlayer, .-initPlayer
	.align	2
	.global	getUpAnimation
	.syntax unified
	.arm
	.fpu softvfp
	.type	getUpAnimation, %function
getUpAnimation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L199
	ldr	r3, [r2]
	cmp	r3, #120
	ble	.L197
	ldr	r0, .L199+4
	ldr	r1, [r0, #124]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r0, #124]
.L197:
	add	r3, r3, #1
	cmp	r3, #240
	str	r3, [r2]
	moveq	r2, #0
	ldreq	r3, .L199+4
	strbeq	r2, [r3, #128]
	bx	lr
.L200:
	.align	2
.L199:
	.word	.LANCHOR0
	.word	player
	.size	getUpAnimation, .-getUpAnimation
	.align	2
	.global	laserSlingAnimation
	.syntax unified
	.arm
	.fpu softvfp
	.type	laserSlingAnimation, %function
laserSlingAnimation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r0, .L207
	ldr	r3, [r0, #4]
	ldr	r2, .L207+4
	add	r3, r3, #1
	cmp	r3, #200
	str	r3, [r0, #4]
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	bxle	lr
	push	{r4, lr}
	ldr	r3, .L207+8
	strb	r1, [r2, #128]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L208:
	.align	2
.L207:
	.word	.LANCHOR0
	.word	player
	.word	laserSling
	.size	laserSlingAnimation, .-laserSlingAnimation
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L228
	ldrb	r5, [r4, #128]	@ zero_extendqisi2
	cmp	r5, #0
	beq	.L210
	cmp	r5, #1
	beq	.L211
	cmp	r5, #2
	beq	.L212
.L225:
	ldr	r5, [r4, #64]
.L213:
	ldr	r1, [r4, #100]
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #84]
	rsb	r1, r1, #0
	add	r0, r5, r0
	ldr	r5, .L228+4
	mov	lr, pc
	bx	r5
	mov	r3, r0
	ldr	r2, [r4, #80]
	ldr	r1, [r4, #68]
	ldr	r0, [r4, #20]
	add	r0, r0, r1
	rsb	r1, r2, #0
	str	r3, [r4, #16]
	mov	lr, pc
	bx	r5
	mov	r3, r0
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #12]
	mov	r1, #0
	add	r0, r3, r0
	rsb	r2, r2, #16384
	str	r3, [r4, #20]
	mov	lr, pc
	bx	r5
	mov	r3, r0
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #8]
	rsb	r2, r2, #16384
	add	r0, r0, r1
	mvn	r1, #63
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r5
	str	r0, [r4, #8]
	pop	{r4, r5, r6, lr}
	b	resolveCollisions
.L212:
	bl	laserSlingAnimation
	b	.L225
.L211:
	ldr	r2, .L228+8
	ldr	r3, [r2]
	cmp	r3, #120
	ble	.L214
	ldr	r1, [r4, #124]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r4, #124]
.L214:
	add	r3, r3, #1
	cmp	r3, #240
	str	r3, [r2]
	moveq	r3, #0
	ldr	r5, [r4, #64]
	strbeq	r3, [r4, #128]
	b	.L213
.L210:
	bl	handlePlayerInput
	bl	touchingGround
	cmp	r0, #0
	bne	.L226
	ldr	r3, [r4, #120]
	cmp	r3, #0
	beq	.L216
	mov	r0, #2
	bl	collisionRight
	cmp	r0, #0
	beq	.L227
.L217:
	ldr	r5, [r4, #104]
	add	r5, r5, r5, lsr #31
	asr	r5, r5, #1
	str	r5, [r4, #64]
	b	.L213
.L227:
	mov	r0, #2
	bl	collisionLeft
	cmp	r0, #0
	bne	.L217
.L216:
	ldr	r5, [r4, #104]
.L226:
	str	r5, [r4, #64]
	b	.L213
.L229:
	.align	2
.L228:
	.word	player
	.word	clamp
	.word	.LANCHOR0
	.size	updatePlayer, .-updatePlayer
	.comm	sinLut,720,4
	.comm	player,132,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	curFrame.5382, %object
	.size	curFrame.5382, 4
curFrame.5382:
	.space	4
	.type	curFrame.5386, %object
	.size	curFrame.5386, 4
curFrame.5386:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
