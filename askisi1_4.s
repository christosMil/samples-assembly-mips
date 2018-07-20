.text
.globl __start
__start:
	# print message "Enter your input: "
	li $v0, 4
	la $a0, str1
	syscall
	
	# read user's input
	li $v0, 8	
	la $a0, userInput
	li $a1, 20
	move $t0, $a0
	syscall
	
	# print user's input
	li $v0, 4
	la $a0, userInput
	move $a0, $t0
	syscall
	
	# terminate program
	li $v0, 10
	syscall
.data
	str1: .asciiz "Enter your input: "
	userInput: .space 20