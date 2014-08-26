#include <asm/unistd.h> /*Define the __NR_write & other kernel syscall numbers.*/

.section .text /*What's assembled below is used for machine instructions*/
 .globl _start /*So the linker knows about our symbol spelled _start*/
_start:        /*So _start symbolizes the address of the next instruction*/
        movb $7,%al /*Supply integer value 7 for further computing */
        addb $'0',%al /*Add the ASCII code for digit 0 to 7 to make the ASCII code for 7*/
	movb %al,buff /*Copy that ASCII code into addressable memory
	                because the write syscall takes its data from there*/
	movb $'\n',buff+1 /*Copy an ASCII code for newline next to the code for 7.*/
        movl $__NR_write,%eax /*Supply the syscall number for writing*/
        movl $1,%ebx  /*Supply the file descriptor describing where to write*/
	movl $buff,%ecx /*Supply the address locating WHAT to write*/
	movl $2,%edx    /*Supply the count of HOW MANY chars or bytes to write*/
        int $0x80       /*Ask the OS kernel to write; print the 7 on a line by itself*/
        movl $__NR_exit,%eax /*Supply the syscall number to exit cleanly*/
        movl $0,%ebx    /*Supply the exit code that means no errors.*/
        int $0x80       /*Ask the OS kernel to end our process*/

        .comm buff,2    /*Prepare a 2-byte buffer in addressable memory
	                  for the 2 characters we will write*/
