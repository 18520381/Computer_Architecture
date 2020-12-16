.data
	st0:	.asciiz	"Oh "
	st1:	.asciiz	"One "
	st2:	.asciiz	"Two "
	st3:	.asciiz	"Three "
	st4:	.asciiz	"Four "
	st5:	.asciiz	"Five "
	st6:	.asciiz	"Six "
	st7:	.asciiz	"Seven "
	st8:	.asciiz	"Eight "
	st9:	.asciiz	"Nine "
	stIn:	.asciiz	"Enter a number: "
	stNum:	.space 50
	stEr:	.asciiz	"Invalid Entry"
.text
main:
	la $a0, stIn
	li $v0, 4
	syscall
	
	la $a0, stNum
	li $a1, 50
	li $v0, 8
	syscall
	
	li $t7, 0
	li $t1, 0
	la $t0, stNum
	
find_length:
	add $t2, $t0, $t1
	lb $t3, 0($t2)
	beq $t3, 0, NEXT
	addi $t7, $t7, 1
	addi $t1, $t1, 1
	j find_length
	
NEXT:
	addi $t7, $t7, -1
	li $t0, 0
	la $t2, stNum

loop:
	beq $t7, $t0, END

	add $t4, $t0, $t2
	lb $t5, 0($t4)
	addi $t0, $t0, 1
	
	Oh:	
	addi $t6, $0, 48
	bne $t5, $t6, One
	la $a0, st0
	li $v0, 4
	syscall
	j loop
	
	One:
	addi $t6, $0, 49
	bne $t5, $t6, Two
	la $a0, st1
	li $v0, 4
	syscall
	j loop
	
	Two:
	addi $t6, $0, 50
	bne $t5, $t6, Three
	la $a0, st2
	li $v0, 4
	syscall
	j loop
	
	Three:
	addi $t6, $0, 51
	bne $t5, $t6, Four
	la $a0, st3
	li $v0, 4
	syscall
	j loop
	
	Four:
	addi $t6, $0, 52
	bne $t5, $t6, Five
	la $a0, st4
	li $v0, 4
	syscall
	j loop
	
	Five:
	addi $t6, $0, 53
	bne $t5, $t6, Six
	la $a0, st5
	li $v0, 4
	syscall
	j loop
	
	Six:
	addi $t6, $0, 54
	bne $t5, $t6, Seven
	la $a0, st6
	li $v0, 4
	syscall
	j loop
	
	Seven:
	addi $t6, $0, 55
	bne $t5, $t6, Eight
	la $a0, st7
	li $v0, 4
	syscall
	j loop
	
	Eight:
	addi $t6, $0, 56
	bne $t5, $t6, Nine
	la $a0, st8
	li $v0, 4
	syscall
	j loop
	
	Nine:
	addi $t6, $0, 57
	bne $t5, $t6, Err
	la $a0, st9
	li $v0, 4
	syscall
	j loop
	
	Err:
	la $a0, stEr
	li $v0, 4
	syscall
	j END
END:
