# A simple program that will print 10 number from an array

# Constant for the size of the array
# This is treated like a literal 
# (i.e. you load it with `li`, not `la/lb/lw`) but is more 
# readable than a magic number
N_SIZE = 10

    .text

main:

	# $t0 - i
	# $t1 - numbers
	# $t2 - offset in array
	


print_loop_init:
	li	$t0, 0


print_loop_cond:
	bge	$t0, N_SIZE, print_loop_end

print_loop_body:
	la	$t1, numbers		# Start of the array
	mul	$t2, $t0, 4		# Offset of array element from the start
	add	$t2, $t2, $t1		# &numbers[i]

	lw	$a0, ($t2)		# Loads 4 bytes (an int)
	li	$v0, 1			# from t2 (&numbers[i])
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall



print_loop_step:
	addi	$t0, 1
	b	print_loop_cond


print_loop_end:

	jr	$ra		# return

	.data #0x0c
numbers: #0x0c
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
