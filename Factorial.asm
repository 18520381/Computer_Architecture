	.data
output:	.asciiz "The factorial of 10 is: "	
	.text
main:	
	addi	$s0, $0, 10
	li	$a0, 10
	
	jal	factorial
	
	move	$t0, $v0
	li	$v0, 4
	la	$a0, output
	syscall	
	
	li	$v0, 1
	move	$a0, $t0
	syscall
	
	j	Exit
Fact:

	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	bge	$a0, 1, Skip	# >= 
	lw	$ra, 0($sp)
	li	$v0, 1
	addi	$sp, $sp, 4
	jr	$ra
	
Skip:
	addi	$sp, $sp, -4
	sw	$a0, 0($sp)
	addi	$a0, $a0, -1
	
	jal	Fact
	
	lw	$t0, 0($sp)
	mul	$v0, $t0, $v0
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	
	jr	$ra
	
Exit:
