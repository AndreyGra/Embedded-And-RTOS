    .global start, sum
start:  LDR SP, =stack_top
        BL main
stop:   B stop

sum:    //int sum(int a,b,c,d,e,f) { return a+b+c+e+f);
        //upon entry, stack contains e, f passed by main() in C
        //Establish stack frame
        STMFD SP!, {FP, LR}    // Push fp, lr
        ADD   FP, SP, #4       // fp -> save lr on stack

        //compute the sum of all (6) parameters
        ADD   R0, R0, R1      // First 4 params are in r0 - r3
        ADD   R0, R0, R2
        ADD   R0, R0, R3
        LDR   R3, [FP, #4]    //Load e into r3
        ADD   R0, R0, R3
        LDR   R3, [FP, #8]    //Load f into r3
        ADD   R0, R0, R3

        //Return to Caller
        SUB   SP, FP, #4      // sp = fp-4
        LDMFD SP!, {FP, PC}   // return to caller 

        
