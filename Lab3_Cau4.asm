# 	t1=a	t2=b	t3=c	t4=d
	addi $t1, $0, 6	#	I-type
	addi $t2, $0, 5	#	I-type
	sub $t3, $t1, $t2	#	R-type
	add $t4, $t1, $t2	#	R-type

#	s0=f	s1=g	s2=h	s3=i	s4=j
	bne $s3, $s4, NEXT
	add $s0, $s1, $s2
	j END
NEXT:
	sub $s0, $s1, $s2
END: