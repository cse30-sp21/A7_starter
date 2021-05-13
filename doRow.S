        .arch armv7
        .cpu cortex-a53
        .equ 	NUL, 0

        .global asm_doRow
        // !!! SET FP_OFFSET TO THE NUMBER OF (SAVED REGISTERS -1 * 4)
	
	// TODO - ADJUST FOR CALLEE SAVED REGISTERS
        .equ 	FP_OFFSET, 4 	     // (# of saved regs - 1) * 4
	.equ    NCOLS_OFFSET, 4      // number columns	(5th parameter)
	
	// TODO - ALLOCATE LOCAL SPACE or PARAMETER SPACE
	// (you can save incoming parameters in either one)
	.equ	LOCAL_SPACE, 0	     // total local space
	.equ    PARAM_SPACE, 0       // total param space
	
	// TODO define your local variable offsets here
	// offsets are referenced to the framepointer.
	.equ    XX_OFFSET, 0
	


asm_doRow:	
	push {fp, lr}
	add fp, sp, #FP_OFFSET
	sub sp, sp, #(LOCAL_SPACE + PARAM_SPACE)
	
	// TODO your doRow implementation here.


	sub sp, fp, #FP_OFFSET
	pop {fp, lr}
	bx lr
	
