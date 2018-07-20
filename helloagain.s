	.text
	.globl __start
__start:
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 4
	la $a0, finalPrint
	syscall
	li $v0, 10
	syscall
.data
	str1: .asciiz "I am printing a string!\n"
	finalPrint: .asciiz "Exiting programm...\n"