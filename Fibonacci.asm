.data
	stNhap: .asciiz "Nhap n: "
	stSpace: .asciiz " "
	stTong:	.asciiz "\nTong la: "
.text
	la $a0, stNhap
	addi $v0, $0, 4
	syscall
	
	addi $v0, $0, 5
	syscall
	addi $t0, $v0, 0
	
	addi $t1, $0, 1
	addi $t2, $0, 1	
	addi $t4, $0, 2
	
	addi $t6, $0, 1
	slt $t5, $t0, $t6
	bne $t5, $0, EXIT
	
	addi $a0, $t1, 0
  	addi $v0, $0, 1
  	syscall
  	la $a0, stSpace
	addi $v0, $0, 4
	syscall

	addi $t6, $0, 2
	slt $t5, $t0, $t6
	bne $t5, $0, EXIT
	
	addi $a0, $t2, 0
  	addi $v0, $0, 1
  	syscall
  	la $a0, stSpace
	addi $v0, $0, 4
	syscall
	
	addi $t7, $0, 0
	addi $t6, $0, 1
	
	slt $t5, $t0, $t6
	bne $t5, $0, SKIP
	addi $t7, $0, 2	
	
SKIP:
	addi $t6, $0, 3
	slt $t5, $t0, $t6
	bne $t5, $0, EXIT
	
	addi $t0, $t0, -1
FOR:
	slt $t5, $t0, $t4
	bne $t5, $0, EXIT
	
	add $t3, $t1, $t2
	
	slt $t5, $t0, $t3
	bne $t5, $0, NEXT
	add $t7, $t7, $t3	
NEXT:
	addi $a0, $t3, 0
  	addi $v0, $0, 1
  	syscall
  	
	la $a0, stSpace
	addi $v0, $0, 4
	syscall
	
	addi $t4, $t4, 1
	add $t1, $0, $t2
	add $t2, $0, $t3
	j FOR
EXIT:
	la $a0, stTong
	addi $v0, $0, 4
	syscall
	
	addi $a0, $t7, 0
  	addi $v0, $0, 1
  	syscall