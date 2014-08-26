#include <asm/unistd.h>

.section .text
 .globl _start
_start: 
        movb $7,%al
        addb $'0',%al
	movb %al,buff
	movb $'\n',buff+1
        movl $__NR_write,%eax
        movl $1,%ebx
	movl $buff,%ecx
	movl $2,%edx
        int $0x80
        movl $__NR_exit,%eax
        movl $0,%ebx
        int $0x80

        .comm buff,2,1
