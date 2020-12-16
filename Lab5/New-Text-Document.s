.include "nios_macros.s"
.text
.equ NUM, 0x90abcdef
.global _start
_start:
movia r7, NUM
mov r4, r7
COUNT:
mov r2, r0
addi r3, r0, 1
COUNT_LOOP:
beq r4, r0, END_COUNT
and r5, r4, r3
beq r5, r0, Skip
addi r2, r2, 1
Skip:
srli r4, r4, 1
br COUNT_LOOP
END_COUNT:
mov r16, r2
END:
br END
.end