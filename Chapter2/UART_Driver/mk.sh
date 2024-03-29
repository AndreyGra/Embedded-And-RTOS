arm-none-eabi-as -mcpu=arm926ej-s -g ts.s -o ts.o
arm-none-eabi-gcc -c -mcpu=arm926ej-s -g t.c -o t.o
arm-none-eabi-ld -T t.ld ts.o t.o -o t.elf
arm-none-eabi-objcopy -O binary t.elf t.bin
rm *.o *.elf

echo ready to go?
read dummy

echo enter "telent localhost 1234" from another pseudo terminal
qemu-system-arm -M realview-pbx-a9 -m 128M -kernel t.bin -nographic \
 -serial telnet:localhost:1234,server