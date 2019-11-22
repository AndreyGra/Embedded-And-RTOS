    .global start, stack_top    //  Stack top is defined in t.ld

start: 
        LDR SP, =stack_top     //   Set SVC mode stack pointer
        BL  main               //   Call main() in C
        B   .                  //   if main() returns, just loop
