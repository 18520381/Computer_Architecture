.data
	stNhap: .asciiz "Nhap n: "
	stXuat: .asciiz "!="
.text
	la $a0, stNhap
	addi $v0, $0, 4
	syscall
	
	addi $v0, $0, 5
	syscall
	addi $t0, $v0, 0
	
	addi $t1, $0, 2
	addi $t2, $0, 1
	
loop:
	slt $t3, $t0, $t1
	bne $t3, $0, EXIT
	
	mul $t2, $t2, $t1
	addi $t1, $t1, 1
	j loop
EXIT:
	addi $a0, $t0, 0
  	addi $v0, $0, 1
  	syscall
  	
  	la $a0, stXuat
	addi $v0, $0, 4
	syscall
	
	addi $a0, $t2, 0
  	addi $v0, $0, 1
  	syscall