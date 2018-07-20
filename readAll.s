.data
	message1: .asciiz "Type an integer: "
	message2: .asciiz "\nType a float: "
	message3: .asciiz "\nType a double: "
	message4: .asciiz "\nType a string: "
	userInput: .space 20
	message5: .asciiz "-----------------------"
	message6: .asciiz "\nThe integer you typed was: "
	message7: .asciiz "\nThe float you typed was: "
	message8: .asciiz "\nThe double you typed was: "
	message9: .asciiz "\nThe string you typed was: "
	messageExit: .asciiz "\nExiting program...\n"
.text
.globl __start
__start:
	# request integer
	li $v0, 4
	la $a0, message1
	syscall
	
	# read integer
	li $v0, 5
	syscall
	
	# store integer
	move $t0, $v0
	
	# provide feedback to user
	li $v0, 1
	move $a0, $t0
	syscall
	
	# request float
	li $v0, 4
	la $a0, message2
	syscall
	
	# read float
	li $v0, 6
	syscall
	
	# store float
	add.s $f2, $f0, $f1
	
	# provide feedback to user
	li $v0, 2
	add.s $f12, $f2, $f1
	syscall
	
	# request double
	li $v0, 4
	la $a0, message3
	syscall
	
	# read double
	li $v0, 7
	syscall
	
	# store double
	add.d $f4, $f0, $f6
	
	# provide feedback to user
	li $v0, 3
	add.d $f12, $f4, $f6
	syscall
	
	# request string
	li $v0, 4
	la $a0, message4
	syscall

	# read & store string
	li $v0, 8
	la $a0, userInput
	la $a1, 20
	syscall
	
	# provide feedback to user
	li $v0, 4
	la $a0, userInput
	syscall
	
	# print user's input
	li $v0, 4
	la $a0, message5
	syscall
	li $v0, 4
	la $a0, message6
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, message7
	syscall
	li $v0, 2
	add.s $f12, $f2, $f6
	syscall
	li $v0, 4
	la $a0, message8
	syscall
	li $v0, 3
	add.d $f12, $f4, $f6
	syscall
	li $v0, 4
	la $a0, message9
	syscall
	li $v0, 4
	la $a0, userInput
	syscall
	
	# exit program
	li $v0, 4
	la $a0, messageExit
	syscall
	li $v0, 10
	syscall