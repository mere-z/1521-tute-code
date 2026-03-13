# This program prints out a danish flag, by
# looping through the rows and columns of the flag.
# Each element inside the flag is a single character.
# (i.e., 1 byte).
#
# (Dette program udskriver et dansk flag, ved at
# sløjfe gennem rækker og kolonner i flaget.)
#

# $t2 - array calculations

FLAG_ROWS = 6
FLAG_COLS = 12

.text
main:
	#t0 - row 
	#t1 - col
	#t2 - flag
	#t3 - array address calculations

main_row_loop_init:
	li	$t0, 0
main_row_loop_cond:
	bge	$t0, FLAG_ROWS, main_row_loop_end
main_row_loop_body:
main_col_loop_init:
	li	$t1, 0
main_col_loop_cond:
	bge	$t1, FLAG_COLS, main_col_loop_end
main_col_loop_body:

	la	$t2, flag
	mul	$t3, $t0, FLAG_COLS
	add	$t3, $t3, $t1
	add	$t3, $t3, $t2
	
	lb	$a0, ($t3)
	li	$v0, 11
	syscall

main_col_loop_step:
	addi	$t1, 1
	b	main_col_loop_cond
main_col_loop_end:
	li	$a0, '\n'
	li	$v0, 11
	syscall
main_row_loop_step:
	addi	$t0, 1
	b 	main_row_loop_cond
main_row_loop_end:

	jr	$ra



.data
# This label inside the data region refers to the bytes of the flag.
# Note that even thought the bytes are listed on separate lines,
# they are actually stored as a single contiguous chunk or 'string' in memory.
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.',  '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'