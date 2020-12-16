.data
	str: .byte '\t':100
	stIn: .asciiz "Enter a string: "
	stOut: .asciiz "String: "
	stRev:	.asciiz "Reverse: "
.text
main:
	la $a0, stIn
	li $v0,4
	syscall
	
	la $a0, str
	li $a1,100
	li $v0, 8
	syscall
	
	li $t5, 0
	li $t1, 0
	la $t0, str
	
find_length:
	add $t2, $t0, $t1
	lb $t3, 0($t2)	
	
	beq $t3, 0, next 
	
	addi $t5, $t5, 1
	addi $t1, $t1, 1
	j find_length
next:
	addi $t5, $t5, -1
	
	la $a0, stOut
	li $v0,4
	syscall
	
	la $a0, str
	li $v0,4
	syscall
	
	la $a0, stRev
	li $v0,4
	syscall

	la $t0, str
reverse:
	beq $t5, -1, exit
	add $t2, $t0, $t5
		
	lb $a0, 0($t2) 
	li $v0, 11
	syscall
		
	addi $t5, $t5, -1
	j reverse
exit:	
