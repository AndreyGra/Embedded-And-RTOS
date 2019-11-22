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

    int const offset = 0x1000;
    int const uartMemStart = 0x101F1000;

    //UART 0,1,2 are adjacent
    for (uartNum = 0; uartNum < 4; uartNum++){
        up = &uart[uartNum];
        up -> base = (char*)(uartMemStart + uartNum*offset);
        up -> n = uartNum;
    }

    uart[3].base = (char*)(0x1000900); //UART 3 is at 0x1000900
}