N_SIZE = 10
N_SIZE_M_1 = N_SIZE - 1
N_SIZE_D_2 = N_SIZE / 2
	.text
main:
	# t0 - i
	# t1 - numbers
	# t2 - array offset & &numbers[i] & numbers[i]
	# t3 - numbers[N_SIZE_M_1 - i]
	# t4 - x
	# t5 - y 

reverse_array_init:
	li	$t0, 0
reverse_array_cond:
	bge	$t0, N_SIZE_D_2, reverse_array_end
reverse_array_body:

	la	$t1, numbers
	mul	$t2, $t0, 4
	add	$t2, $t2, $t1		# &numbers[i]
	lw	$t4, ($t2)		# x = numbers[i]
	
	sub	$t3, N_SIZE_M_1, $t0	# N_SIZE_M_1 - i
	mul	$t3, $t3, 4		# 4(N_SIZE_M_1 - i) aka. array element offset
	add	$t3, $t3, $t1		# &numbers[N_SIZE_M_1 - i]
	lw	$t5, ($t3)		# y = numbers[N_SIZE_M_1 - i]

	sw	$t5, ($t2)		# numbers[i] = y;
	sw	$t4, ($t3)		# numbers[N_SIZE_M_1 - i] = x;


reverse_array_step:
	addi	$t0, 1
	b	reverse_array_cond

reverse_array_end:

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
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9