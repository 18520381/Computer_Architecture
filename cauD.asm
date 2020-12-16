.data
	stIn1: 	.asciiz "Enter num1: "
	stIn2: 	.asciiz "Enter num2: "
	st0:	.asciiz	"Khong "
	st1:	.asciiz	"Mot "
	st2:	.asciiz	"Hai "
	st3:	.asciiz	"Ba "
	st4:	.asciiz	"Bon "
	st5:	.asciiz	"Nam "
	st6:	.asciiz	"Sau "
	st7:	.asciiz	"Bay "
	st8:	.asciiz	"Tam "
	st9:	.asciiz	"Chin "
	stNum1:	.space 50
	stNum2:	.space 50
.text
main:

	li $v0, 4
	la $a0, stIn1
	syscall
	
	la $a0, stNum1
	li $a1, 50
	li $v0, 8
	syscall
  	
  	li $v0, 4
	la $a0, stIn2
	syscall
	
	la $a0, stNum2
	li $a1, 50
	li $v0, 8
	syscall
	
	li $t7, 0
	li $t1, 0
	la $t0, stNum1
	
find_lengthn1:
	add $t2, $t0, $t1
	lb $t3, 0($t2)
	beq $t3, 0, NEXTn1
	addi $t7, $t7, 1
	addi $t1, $t1, 1
	j find_lengthn1
	
NEXTn1:
	addi $t7, $t7, -1
	li $t0, 0
	la $t2, stNum1
	addi $s0, $0, 0
loopn1:
	beq $t7, $t0, ENDn1
	add $t4, $t0, $t2
	lb $t5, 0($t4)
	subi $t5, $t5, 48
	addi $t0, $t0, 1
	mulo $s0, $s0, 10
	add $s0, $s0, $t5
	j loopn1
ENDn1:

	li $t7, 0
	li $t1, 0
	la $t0, stNum2
	
find_lengthn2:
	add $t2, $t0, $t1
	lb $t3, 0($t2)
	beq $t3, 0, NEXTn2
	addi $t7, $t7, 1
	addi $t1, $t1, 1
	j find_lengthn2
	
NEXTn2:
	addi $t7, $t7, -1
	li $t0, 0
	la $t2, stNum2
	addi $s1, $0, 0
loopn2:
	beq $t7, $t0, ENDn2
	add $t4, $t0, $t2
	lb $t5, 0($t4)
	subi $t5, $t5, 48
	addi $t0, $t0, 1
	mulo $s1, $s1, 10
	add $s1, $s1, $t5
	j loopn2
ENDn2:
	
  	slt $t0, $s0, $s1  
	bne $t0, $0, NUM2   
	
	li $t7, 0
	li $t1, 0
	la $t0, stNum1
	
find_length1:
	add $t2, $t0, $t1
	lb $t3, 0($t2)
	beq $t3, 0, NEXT1
	addi $t7, $t7, 1
	addi $t1, $t1, 1
	j find_length1
	
NEXT1:
	addi $t7, $t7, -1
	li $t0, 0
	la $t2, stNum1

loop1:
	beq $t7, $t0, END1

	add $t4, $t0, $t2
	lb $t5, 0($t4)
	addi $t0, $t0, 1
	
	Oh:	
	addi $t6, $0, 48
	bne $t5, $t6, One
	la $a0, st0
	li $v0, 4
	syscall
	j loop1
	
	One:
	addi $t6, $0, 49
	bne $t5, $t6, Two
	la $a0, st1
	li $v0, 4
	syscall
	j loop1
	
	Two:
	addi $t6, $0, 50
	bne $t5, $t6, Three
	la $a0, st2
	li $v0, 4
	syscall
	j loop1
	
	Three:
	addi $t6, $0, 51
	bne $t5, $t6, Four
	la $a0, st3
	li $v0, 4
	syscall
	j loop1
	
	Four:
	addi $t6, $0, 52
	bne $t5, $t6, Five
	la $a0, st4
	li $v0, 4
	syscall
	j loop1
	
	Five:
	addi $t6, $0, 53
	bne $t5, $t6, Six
	la $a0, st5
	li $v0, 4
	syscall
	j loop1
	
	Six:
	addi $t6, $0, 54
	bne $t5, $t6, Seven
	la $a0, st6
	li $v0, 4
	syscall
	j loop1
	
	Seven:
	addi $t6, $0, 55
	bne $t5, $t6, Eight
	la $a0, st7
	li $v0, 4
	syscall
	j loop1
	
	Eight:
	addi $t6, $0, 56
	bne $t5, $t6, Nine
	la $a0, st8
	li $v0, 4
	syscall
	j loop1
	
	Nine:
	addi $t6, $0, 57
	la $a0, st9
	li $v0, 4
	syscall
	j loop1
END1:
	
  	j NEXT

NUM2:

  	li $t7, 0
	li $t1, 0
	la $t0, stNum2
	
find_length2:
	add $t2, $t0, $t1
	lb $t3, 0($t2)
	beq $t3, 0, NEXT2
	addi $t7, $t7, 1
	addi $t1, $t1, 1
	j find_length2
	
NEXT2:
	addi $t7, $t7, -1
	li $t0, 0
	la $t2, stNum2

loop2:
	beq $t7, $t0, END2

	add $t4, $t0, $t2
	lb $t5, 0($t4)
	addi $t0, $t0, 1
	
	Oh2:	
	addi $t6, $0, 48
	bne $t5, $t6, One2
	la $a0, st0
	li $v0, 4
	syscall
	j loop2
	
	One2:
	addi $t6, $0, 49
	bne $t5, $t6, Two2
	la $a0, st1
	li $v0, 4
	syscall
	j loop2
	
	Two2:
	addi $t6, $0, 50
	bne $t5, $t6, Three2
	la $a0, st2
	li $v0, 4
	syscall
	j loop2
	
	Three2:
	addi $t6, $0, 51
	bne $t5, $t6, Four2
	la $a0, st3
	li $v0, 4
	syscall
	j loop2
	
	Four2:
	addi $t6, $0, 52
	bne $t5, $t6, Five2
	la $a0, st4
	li $v0, 4
	syscall
	j loop2
	
	Five2:
	addi $t6, $0, 53
	bne $t5, $t6, Six2
	la $a0, st5
	li $v0, 4
	syscall
	j loop2
	
	Six2:
	addi $t6, $0, 54
	bne $t5, $t6, Seven2
	la $a0, st6
	li $v0, 4
	syscall
	j loop2
	
	Seven2:
	addi $t6, $0, 55
	bne $t5, $t6, Eight2
	la $a0, st7
	li $v0, 4
	syscall
	j loop2
	
	Eight2:
	addi $t6, $0, 56
	bne $t5, $t6, Nine2
	la $a0, st8
	li $v0, 4
	syscall
	j loop2
	
	Nine2:
	addi $t6, $0, 57
	la $a0, st9
	li $v0, 4
	syscall
	j loop2
END2:
	
NEXT:

