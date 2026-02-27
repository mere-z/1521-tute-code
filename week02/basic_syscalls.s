	.text 	# this is where your code is written! 
		# the .text tag is optional
main:




epilogue:

	jr	$ra 		
	
	.data	# this is where you store strings, 
		# arrays -- anything that needs to be in memory 
prompt:
	.asciiz "Enter a number:"