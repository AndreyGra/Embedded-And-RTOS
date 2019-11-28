//UART Driver Code
#define TXFE 0x80
#define RXFF 0x40
#define TXFF 0x20
#define RXFE 0x10
#define BUSY 0x08
#define UDR  0x00
#define UFR  0x18

typedef volatile struct uart {
    char *base;     //Base Address
    int   n;        //UART Number 0-3
} UART;

UART uart[4]; //4 UART Structures

int uart_init(){
    int uartNum;
    UART *up;

    int offset = 0x1000;
    int uartMemStart = 0x10009000;

    //UART 0,1,2 are adjacent
    for (uartNum = 0; uartNum < 4; uartNum++){
        up = &uart[uartNum];
        up -> base = (char*)(uartMemStart + uartNum*offset);
        up -> n = uartNum;
    }
}

// input a char to UART pointed by up
int ugetc(UART *up){        
    while (  *(up->base+UFR ) & RXFE  );     //loop if UFR is REFE

    return *( up -> base+UDR);              //Return a character in UDR
}

// ouput a char to UART pointed by up
int uputc(UART *up, char c){
    while ( *(up->base+UFR) & TXFF);        //Loop if UFR is TXFF
    *(up->base+UDR) = c;
};

//Input string of chars
int upgets(UART *up, char *s){
    while ( (*s = ugetc(up) ) != '\r'){
        uputc(up,*s);
        s++;
    }

    *s = 0;
}

//Output string of chars
int uprints(UART *up, char *s){
    while(*s){
        uputc(up, *s++);
    }
}
