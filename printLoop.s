.data
	EndOfLine: .asciiz "\n"
	messageExit: .asciiz "Exiting program...\n"
.text
.globl __start
__start:
	# store terminate value of loop
	addi $s1, $zero, 10

	# do the loop
whileLoop:
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, EndOfLine
	syscall
	addi $s0, $s0, 1
	ble $s0, $s1, whileLoop
	
	# exit program
	li $v0, 4
	la $a0, messageExit
	syscall
	li $v0, 10
	syscall