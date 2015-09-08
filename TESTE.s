KEY: .ASCIZ "PARALELEPIPEDOVERDE" 

print:
	ldr r2, =KEY
	mov r0, #1
	mov r1, #1
	swi 0x204