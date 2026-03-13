# Sum 4 numbers using function calls.
# For simplicity we are not using a frame pointer
# Only push/pop are needed for this.


main:
main_prologue:
	push	$ra
main_body:

	li	$a0, 11
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4

	move	$a0, $v0
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

main_epilogue:
	pop	$ra
	jr	$ra


sum4:
sum4_prologue:
	push	$ra
	push	$s0
	push	$s1
	push	$s2

sum4_body:
	# c - $s0
	# d - $s1
	# res1 - $s2 
	move	$s0, $a2
	move	$s1, $a3

	jal	sum2		#    	int res1 = sum2(a, b);
	move	$s2, $v0 

	move	$a0, $s0	#	int res2 = sum2(c, d);
	move	$a1, $s1
	jal 	sum2

	move	$a0, $s2	#	 return sum2 (res1, res2);
	move	$a1, $v0	
	jal	sum2


sum4_epilogue:
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra

	jr	$ra


sum2:
	add	$v0, $a0, $a1
	jr	$ra
