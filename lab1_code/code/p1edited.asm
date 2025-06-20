	.globl main		# Make main globl so you can refer to
				# it by name in SPIM.

	.text			# Text section of the program
				# (as opposed to data).

main:				# Program starts at main.
		la  $a0, enter_1_msg #get the first number
		li  $v0,4
		syscall
		li  $v0,5
		syscall
		move $t0,$v0

		la  $a0, enter_2_msg #get the second number
		li  $v0,4
		syscall
		li  $v0,5
		syscall
		move $t1,$v0

		add $t2,$t1,$t0

		la $a0,show_result_1 #print the result
		li $v0,4
		syscall
		move $a0,$t0
		li $v0,1
		syscall
		la $a0,show_result_2
		li $v0,4
		syscall
		move $a0,$t1
		li $v0,1
		syscall
		la $a0,show_result_3
		li $v0,4
		syscall
		move $a0,$t2
		li $v0,1
		syscall
		la $a0,show_result_4
		li $v0,4
		syscall

		la $a0,end_branch
		li $v0,4
		syscall

		li $v0,5
		syscall
		move $t3,$v0

judge:
		li $t4,0
		beq $t3,$t4,main
		b re_judge

re_judge:
		li $t4,1
		beq $t3,$t4,exit
		b re_enter
exit:
		li $v0,10
		syscall

re_enter:
		la $a0,re_enter_branch
		li $v0,4
		syscall
		li $v0,5
		syscall
		move $t3,$v0
		j judge
	.data
enter_1_msg: 	.asciiz "Please enter 1st number:\n"
enter_2_msg:	.asciiz "Please enter 2nd number:\n"
show_result_1:	.asciiz "The result of "
show_result_2:  .asciiz "&"
show_result_3:  .asciiz "is:"
show_result_4:	.asciiz "\n"
end_branch:		.asciiz "Do you want to try another(0-continue/1-exit):\n"
re_enter_branch:		.asciiz "illegal input.Please enter again:\n"
