main:
	
	la	$a0, x
	jal	f



f:
	# a0 is the address of x
	move	$s0, $a0

	jal another_function

	
	# print the value in a0 

another_function:

	li $a0, 11



.data

x:
	.word 10