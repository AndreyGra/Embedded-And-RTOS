    .text
    .global start

start:  LDR SP, =stack_top   //setup stack pointer
        BL  sum              //call sum
stop:   B   stop

// int sum(): computer the sum of an inter array in Results
sum:    STMFD SP!, {R0-R4, LR}  // Save r0-r4, lr on stack
        MOV R0, #0              // r0 = 0
        LDR R1, =Array          // r1 = &Array
        LDR R2, =N              // r2 = &N
        LDR R2, [R2]            // r2 = N
loop:   LDR R3, [R1], #4        // r3 = *(r1++)
        ADD R0, R0, R3          // r0 += r3
        SUB R2, R2, #1          // r2--
        CMP R2, #0              // if (r2 != 0)
        BNE loop                //     goto loop;
        LDR R4, =Result         // r4 = &Result
        STR R0, [R4]            // Result = r0
        LDMFD SP!, {R0-R4, PC}  // pop stack, return to caller

        .data
N:      .word 10                    //Number of array elements
Array:  .word 1,2,3,4,5,6,7,8,9,10  //Array values
Result: .word 0                     //Result

