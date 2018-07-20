.text
.globl __start
__start:
	li $v0, 4
	la $a0, myText
	syscall
	li $v0, 4
	la $a0, mySecondText
	syscall
	li $v0, 4
	la $a0, myThirdText
	syscall
	li $v0, 10
	syscall	
.data
	myText: .asciiz "Hello assembly MIPS!\n"
	mySecondText: .asciiz "Hello again MIPS!\n"
	myThirdText: .asciiz "Bye!\n"
