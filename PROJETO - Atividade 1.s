MESSAGE: .ASCIZ "SISTEMAS EMBARCADOS"
KEY: .ASCIZ "PARALELEPIPEDOVERDE" 
ENCODESTRING: .ASCIZ ""

start: 
	ldr r0, =MESSAGE @ R0 = &MESSAGE
	ldr r1, =KEY @ R1 = &KEY
	ldr r2, =ENCODESTRING @ R2 = &ENCODE

encode:
	cmp r0, #0 @ Ve se acabou a string
	beq outencode
	ldrb r3, [r0], #1 @ r3 = *(r0++)
	ldrb r4, [r1], #1 @ r4 = *(r1++)
	eor r5, r3, r4 @ r5 = r3 XOR r4
	strb r5, [r2], #1 @ ENCODE <= r5
	b encode

outencode:
	ldr r0, =ENCODESTRING @ R0 = &ENCODE
	ldr r1, =KEY @ R1 = &KEY
	ldr r2, =DECODESTRING @ R2 = &DECODE

decode:
	cmp r0, #0 @ Ve se acabou a string
	beq print
	ldrb r3, [r0], #1 @ r3 = *(r0++)
	ldrb r4, [r1], #1 @ r4 = *(r1++)
	eor r5, r3, r4 @ r5 = r3 XOR r4
	strb r5, [r2], #1 @ DECODE <= r5
	b decode

print:
	ldr r2, =DECODESTRING
	mov r0, #1
	mov r1, #1
	swi 0x204

stop:
	b stop

DECODESTRING: .ASCIZ ""

@ http://www.davespace.co.uk/arm/introduction-to-arm/conditional.html