.data
	message1: .asciiz "Give 1st integer: "
	message2: .asciiz "\nGive 2nd integer: "
	message3: .asciiz "\n============"
	message4: .asciiz "\nThe sum result is: "
	message5: .asciiz "\nThe subtract result is: "
	message6: .asciiz "\nThe multiplication result is: "
	message7: .asciiz "\nThe division result is: "
	message8: .asciiz "\nThe division reminder is: "
	message9: .asciiz "\nThe float division result is: "
	message10: .asciiz ","
	messageExit: .asciiz "\nExiting program...\n"
.text
.globl __start
__start:
	# request user input
	li $v0, 4
	la $a0, message1
	syscall
	
	# read user input
	li $v0, 5
	syscall
	
	# store user input
	addi $t0, $v0, 0
	
	# provide feedback to user
	li $v0, 1
	move $a0, $t0
	syscall
	
	# request user input
	li $v0, 4
	la $a0, message2
	syscall
	
	# read user input
	li $v0, 5
	syscall
	
	# store user input
	addi $t1, $v0, 0
	
	# provide feedback to user
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, message3
	syscall
	
	# calculate sum, subtract, multiplication, division
	add $s0, $t0, $t1
	sub $s1, $t0, $t1
	mult $t0, $t1
	mflo $s2
	div $t0, $t1
	mflo $s3
	mfhi $s4
	addi $t2, $zero, 100
	mult $s4, $t2
	mflo $t2
	div $t2, $t1
	mflo $s5
	# check for round up
	mfhi $t2
	addi $t3, $zero, 2
	div $t1, $t3
	mflo $t3
	bge $t2, $t3, RoundUp
	j Endbge
RoundUp:
	addi $s5, $s5, 1
	
Endbge:	
	# print results
	li $v0, 4
	la $a0, message4
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, message5
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 4
	la $a0, message6
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
	li $v0, 4
	la $a0, message7
	syscall
	li $v0, 1
	move $a0, $s3
	syscall
	li $v0, 4
	la $a0, message8
	syscall
	li $v0, 1
	move $a0, $s4
	syscall
	li $v0, 4
	la $a0, message9
	syscall
	li $v0, 1
	move $a0, $s3
	syscall
	li $v0, 4
	la $a0, message10
	syscall
	li $v0, 1
	move $a0, $s5
	syscall
	
	# exit program
	li $v0, 4
	la $a0, messageExit
	syscall
	li $v0, 10
	syscall