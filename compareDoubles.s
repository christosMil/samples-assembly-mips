.data
	message1: .asciiz "Type 1st double: "
	message2: .asciiz "\nType 2nd double: "
	message3: .asciiz "\nThe numbers you typed are equal"
	message4: .asciiz "\nThe numbers you typed are not equal"
	message5: .asciiz "\nThe difference of the numbers is: "
	messageExit: .asciiz "\nExiting program...\n"
	zeroDouble: .double 0.0
	zeroNegative: .double -1.0
.text
.globl __start
__start:
	# load 0.0, -1.0 from memory
	l.d $f6, zeroDouble
	l.d $f8, zeroNegative

	# request double
	li $v0, 4
	la $a0, message1
	syscall
	
	# read double
	li $v0, 7
	syscall
	
	# store double
	add.d $f2, $f0, $f6
	
	# give feedback to user
	li $v0, 3
	add.d $f12, $f2, $f6
	syscall
	
	# request double
	li $v0, 4
	la $a0, message2
	syscall
	
	# read double
	li $v0, 7
	syscall
	
	# store double
	add.d $f4, $f0, $f6
	
	# give feedback to user
	li $v0, 3
	add.d $f12, $f4, $f6
	syscall
	
	# compare
	c.eq.d $f2, $f4
	
	# equal
	bc1t areEqual
	
	# not equal
	li $v0, 4
	la $a0, message4
	syscall
	
	# show difference - if differnce is negative we multiply by -1
	sub.d $f12, $f2, $f4
	c.lt.d $f12, $f6
	bc1t negativeDifference
showDifference:
	li $v0, 4
	la $a0, message5
	syscall
	li $v0, 3
	syscall # we have already stored difference in $f12
	j exit
	
negativeDifference:
	mul.d $f12, $f12, $f8
	j showDifference
	
	# equal occasion
areEqual:
	li $v0, 4
	la $a0, message3
	syscall

	# exit program
exit:
	li $v0, 4
	la $a0, messageExit
	syscall
	li $v0, 10
	syscall
	