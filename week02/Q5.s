SQUARE_MAX = 46340

main:
	# x in $t0
	# y in $t1

	la	$a0, prompt_str		#  printf("Enter a number: ");
	li	$v0, 4
	syscall 

	li	$v0, 5			#     scanf("%d", &x);
	syscall

	move	$t0, $v0	

	ble	$t0, SQUARE_MAX, if_x_le_square_max
	

	la	$a0, too_big_str	#   printf("square too big for 32 bits\n");
	li	$v0, 4
	syscall 

	b	after_print
if_x_le_square_max:

	mul	$t1, $t0, $t0		#    y = x * x;

	move	$a0, $t1		# 	printf("%d", y);
	li	$v0, 1
	syscall

	li 	$a0, '\n'
	li	$v0, 11			#      printf("\n", y);
	syscall	

after_print:

	jr	$ra


	.data
prompt_str: 
        .asciiz "Enter a number: "
too_big_str:
        .asciiz "square too big for 32 bits\n"