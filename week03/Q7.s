	.text
N_SIZE = 10

	# t3 = numbers[i]
	# t2 = &numbers[i]

main:
add_42_to_negatives_loop_init:
	li	$t0, 0 
add_42_to_negatives_loop_cond:
	bge	$t0, N_SIZE, add_42_to_negatives_loop_end
add_42_to_negatives_loop_body:

	la	$t1, numbers		# array start
	mul	$t2, $t0, 4		# offset of i from array start
	add	$t2, $t2, $t1		# &numbers[i] = &numbers + offset of i 

	lw	$t3, ($t2)		
	bge	$t3, 0, if_numbers_i_ge_0		# if (numbers[i] < 0) {
									#     numbers[i] += 42;
									# }
	addi	$t3, 42
	sw	$t3, ($t2)

if_numbers_i_ge_0:
add_42_to_negatives_loop_step:
	addi	$t0, 1
	b	add_42_to_negatives_loop_cond
add_42_to_negatives_loop_end:

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



epilogue:
	jr	$ra	

	.data
numbers:
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9
