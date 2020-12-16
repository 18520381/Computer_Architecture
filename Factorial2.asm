.data
	stOut: 	.asciiz "The factorial of 10 is  "
.text
main:
	li	$v0, 4
	la	$a0, stOut
	syscall
	
	addi	$a0, $zero, 10
	
	jal Fact
	
	addi 	$a0, $v0, 0
	li 	$v0, 1
	syscall

	j Exit
	
Fact:
	bne 	$a0, $0 , Turn
	addi 	$v0, $0, 1
	jr 	$ra
	
Turn:
	addi 	$sp, $sp, -8
	sw 	$a0, 0($sp)
	sw 	$ra, 4($sp)
	addi 	$a0, $a0, -1
	
	jal Fact

	lw 	$a0, 0($sp)  
	addi 	$a1, $v0, 0  
	
	jal Multi

	lw 	$ra, 4($sp)  
	addi 	$sp, $sp, 8  
	jr 	$ra

Multi:
	addi 	$sp, $sp, -4
	sw 	$ra, 0($sp)
	addi 	$v0, $0, 0

Inside:
	slt 	$t0, $0, $a1
	beq 	$t0, $0, Next
	add 	$v0, $v0, $a0
	addi	$a1, $a1, -1
	j Inside
	
Next:
	lw 	$ra, 0($sp)
	addi 	$sp, $sp, 4
	jr 	$ra
Exit:
