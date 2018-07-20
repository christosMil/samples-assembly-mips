.data
	message1: .asciiz "Type an integer: "
	message2: .asciiz "\nThe integer you typed is: "
	messageExit: .asciiz "\nExiting program...\n"
.text
.globl __start
start:
	# request user input
	li $v0, 4
	la $a0, message1
	syscall
	
	# read user input
	li $v0, 5
	syscall
	
	# store user input
	addi $s0, $v0, 0
	
	# provide feedback to user
	li $v0, 1
	move $a0, $s0
	syscall
	
	# pass integer as argument to routine - not necessary
	add $a1, $s0, $zero
	jal printInteger
	
	# exit program
	li $v0, 4
	la $a0, messageExit
	syscall
	li $v0, 10
	syscall

printInteger:
	# push to stack - not necessary
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	
	# print integer
	li $v0, 4
	la $a0, message2
	syscall
	li $v0, 1
	move $a0, $s0
	syscall

	# pop from stack - not necessary
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	
	# return to start routine
	jr $ra