.data
	stNhap:	.asciiz "Nhap n: "
	stA:	.asciiz "Nhap mang a: \n"
	stB:	.asciiz "Nhap mang b: \n"
	stSpace:.asciiz "\n"
	a: .word 0:100
	b: .word 0:100
.text
main:
  	la $a0, stNhap
  	addi $v0, $0, 4
  	syscall

  	addi $v0, $0, 5
  	syscall
  	addi $s5, $v0, 0	
  	
  	la $s1, a	
  	addi $s3, $s1, 0
  	la $s2, b
  	addi $s4, $s2, 0
  	
	#	mang a
  	la $a0, stA
  	addi $v0, $0, 4
  	syscall
  	
	addi $s0, $0, 0
FOR1:
    	slt $t0, $s0, $s5
    	beq $t0, $0, END1
    	
      	addi $v0, $0, 5
      	syscall
      	
      	sw $v0, 0($s1)		
      	addi $s1, $s1, 4
      	addi $s0, $s0, 1	
      	
    	j FOR1
END1:

	#	mang b
  	la $a0, stB
  	addi $v0, $0, 4
  	syscall
  	
	addi $s0, $0, 0
FOR2:
    	slt $t0, $s0, $s5
    	beq $t0, $0, END2
    	
      	addi $v0, $0, 5
      	syscall
      	
      	sw $v0, 0($s2)		
      	addi $s2, $s2, 4
      	addi $s0, $s0, 1	
      	
    	j FOR2
END2:
	addi $s0, $0, 2
	
	addi $t3, $0, 10
	addi $t4, $s5, 0
#	slt $t0, $t3, $s5
#    	beq $t0, $0, FOR3
	addi $s5, $0, 10
FOR3:
    	slt $t0, $s0, $s5
    	beq $t0, $0, END3
    	
    	addi $s6, $s0, -2
    	
  	sll $t1, $s6, 2
 	add $t1, $t1, $s3
	lw $t1, 0($t1)
	
	sll $t2, $t1, 2
	add $t2, $t2, $s4
	lw $t2, 0($t2)
	
	sll $t3, $s0, 2
	add $t3, $t3, $s3
	sw $t2, 0($t3)
	
	addi $s0, $s0, 1
	j FOR3
END3:
	la $a0, stSpace
  	addi $v0, $0, 4
  	syscall
  	
	addi $s5, $t4, 0
	addi $s0, $0, 0
FOR4:
	slt $t0, $s0, $s5
    	beq $t0, $0, END4
    	
    	sll $t1, $s0, 2
 	add $t1, $t1, $s3
	lw $t1, 0($t1)
	
	addi $a0, $t1, 0
  	addi $v0, $0, 1
  	syscall
	
	la $a0, stSpace
  	addi $v0, $0, 4
  	syscall
	
	addi $s0, $s0, 1
	j FOR4
END4:

	addi $v0, $0, 10
  	syscall
