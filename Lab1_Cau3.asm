.data
	a: .word 0:100
.text
main:
  	addi $v0, $0, 5
  	syscall
  	addi $s4, $v0, 0	
  	
  	addi $s0, $0, 0
  	addi $s1, $0, 0
  	la $s3, a	
  	addi $s2, $s3, 0
FOR:
    	slt $t0, $s0, $s4
    	beq $t0, $0, END
    	
      	addi $v0, $0, 5
      	syscall
      	
      	sw $v0, 0($s3)		
      	addi $s3, $s3, 4
      	addi $s0, $s0, 1	
      	
    	j FOR
END:
  	addi $v0, $0, 10
  	syscall
