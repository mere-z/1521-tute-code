main:

	# t0 i
	# t1 j
main_outer_loop_init:
	li	$t0, 1

main_outer_loop_cond:
	bgt	$t0, 10, main_outer_loop_end

main_outer_loop_body:
main_inner_loop_init:
	li	$t1, 0
main_inner_loop_cond:
	bge	$t1, $t0, main_inner_loop_end
main_inner_loop_body:
	li	$a0, '*'
	li	$v0, 11
	syscall
main_inner_loop_step:
	addi	$t1, 1
	b	main_inner_loop_cond
main_inner_loop_end:

	li	$a0, '\n'
	li	$v0, 4
	syscall
main_outer_loop_step:
	addi	$t0, 1
	b	main_outer_loop_cond
main_outer_loop_end:

epilogue:
	jr 	$ra

.data

asterisk:
	.asciiz	"*"