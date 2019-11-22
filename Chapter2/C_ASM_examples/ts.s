/*************************/
    .text
    .global start

start:
        MOV R0, #1              // r0 = 1
        MOV R1, #2              // r1 = 2
        ADD R1, R1, R0          // r1 = r1 + r0
        LDR R2, =result         // r2 = &result
        STR r1, [r2]            // result = r1

stop:   
        B stop
    
        .data

result:    .word    0           // A word location 
