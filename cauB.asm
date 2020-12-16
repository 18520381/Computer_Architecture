.data  
  	stIn: 		.asciiz "Enter a char: "
  	stBefore: 	.asciiz "\nThe char before "
  	stAfter: 	.asciiz "\nThe char after "
  	stSpace: 	.asciiz " "
  	stTrans: 	.asciiz "\nUpper or lower character: "
.text  
main:  
  	la $a0, stIn
  	li $v0, 4  
  	syscall 
 	
  	addi $v0, $0, 12  
  	syscall  
  	addi $s0, $v0, 0  
 
	la $a0, stBefore
  	li $v0, 4  
  	syscall 
  
  	addi $a0, $s0, -2  
  	li $v0, 11
 	syscall
 
  	la $a0, stSpace
  	li $v0, 4  
  	syscall  

 
 	addi $a0, $s0, -1  
  	li $v0, 11
 	syscall
 	
 	la $a0, stAfter
  	li $v0, 4  
  	syscall 

  	addi $a0, $s0, 1  
  	li $v0, 11
  	syscall  

	la $a0, stSpace
  	li $v0, 4  
  	syscall  
  	
  	addi $a0, $s0, 2  
  	li $v0, 11
  	syscall
  	
  	la $a0, stTrans
  	li $v0, 4  
  	syscall
  	
  	addi $t1, $0, 91
  	slt $t2, $t1, $s0
  	bne $t2, $0, NEXT
  
  	addi $a0, $s0, 32  
  	li $v0, 11
  	syscall
  	j END	
NEXT:
	addi $a0, $s0, -32  
  	li $v0, 11
  	syscall
END: