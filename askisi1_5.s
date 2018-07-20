.text
.globl __start
__start:
	# print message "Type an integer: "
	li $v0, 4
	la $a0, message1
	syscall
	
	# read an integer
	li $v0, 5
	syscall

	# store user's input
	move $t0, $v0
	
	# print the integer you read
	li $v0, 1
	move $a0, $t0
	syscall
	
	# print message "The integer you typed is: {your_integer}"
	li $v0, 4
	la $a0, message2
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	
	# end_line
	li $v0, 4
	la $a0, message3
	syscall
	
	# exit program
	li $v0, 10
	syscall
.data
	message1: .asciiz "Type an integer: "
	message2: .asciiz "\nThe integer you typed is: "
	message3: .asciiz "\n"