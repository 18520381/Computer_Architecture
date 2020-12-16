.data
  	stIn: 	.asciiz "Num of array: "
  	stFind:	.asciiz "\nSelect: "
  	stOut:	.asciiz "Select is: "
	stMax: 	.asciiz "Max = "
	stMin:	.asciiz "\nMin = "
	stSum: 	.asciiz "\nSum = "
  	a: 	.word 0:100
.text
main:
# $t0=n	$t1=i  $t3=can tim  $s4=tim	$t5=min   $t6=max	$t7=sum  $s1=mang
  	la $a0, stIn
  	addi $v0, $0, 4
  	syscall
  	
  	addi $v0, $0, 5
  	syscall
  	addi $t0, $v0, 0	  	
#Nhap mang
  	addi $t1, $0, 0
  	addi $t7, $0, 0
  	la $s0, a		#gan a vao $s0
  	addi $s1, $s0, 0
FOR:
    	slt $t2, $t1, $t0
    	beq $t2, $0, END
    	
      	addi $v0, $0, 5
      	syscall
      	
      	addi $t2, $0, 0
	bne $t1, $t2, next2
	add $t5, $0, $v0
	add $t6, $0, $v0
next2:
      	
      	sw $v0, 0($s0)		#luu gtri mang
      	add $t7, $t7, $v0	#sum
      	
      	addi $s0, $s0, 4
      	addi $t1, $t1, 1	#i++
      	
      	slt $t2, $t6, $v0	#max
      	beq $t2, $0, next1
      	addi $t6, $v0, 0
next1:
      	slt $t2, $v0, $t5	#max
      	beq $t2, $0, FOR
      	addi $t6, $v0, 0
    	j FOR
END:
  
  	la $a0, stMax
  	addi $v0, $0, 4
  	syscall
  	
	addi $a0, $t6, 0
  	addi $v0, $0, 1
  	syscall
  
  	la $a0, stMin
  	addi $v0, $0, 4
  	syscall
  	
	addi $a0, $t5, 0
  	addi $v0, $0, 1
  	syscall
  	
  	la $a0, stSum
  	addi $v0, $0, 4
  	syscall
  	
  	addi $a0, $t7, 0
  	addi $v0, $0, 1
  	syscall
  	
  	la $a0, stFind
  	addi $v0, $0, 4
	syscall
	
  	addi $v0, $0, 5
  	syscall
  	addi $t3, $v0, -1
  	
  	la $a0, stOut
  	addi $v0, $0, 4
  	syscall
  	  	
  	sll $t4, $t3, 2
 	add $t4, $t4, $s1
	lw $t4, 0($t4)	
  	
  	addi $a0, $t4, 0
  	addi $v0, $0, 1
  	syscall
  	
  	addi $v0, $0, 10
  	syscall
