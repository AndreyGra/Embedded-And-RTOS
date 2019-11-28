#include "string.c"
#include "uart.c"

int v[] = {1,2,3,4,5,6,7,8,9,10};
int sum;

int main(){
    int i;
    char string[64];

    UART *up;
    uart_init();    //Initialize UART
    up = &uart[0];  //Test UART0

    uprints(up, "Enter lines from serial terminal 0\n\r");

    while(1){
        upgets(up, string);
        uprints(up, "       ");
        uprints(up, string);
        uprints(up, "\n\r");

        if (strcmp(string,"end") == 0){
            break;
        }
    }

    uprints(up, "Computer sum of array: \n\r");

    sum = 0;
    for (i = 0; i < 10; i++){
        sum += v[i];
    }

    uprints(up, "sum = ");
    uputc(up, (sum/10)+'0');
    uputc(up, (sum%10)+'0');
    uprints(up, "\n\r END OF RUN \n\r");

    return 0;
}