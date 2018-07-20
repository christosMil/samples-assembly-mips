##############################
# Adding user typed integers #
##############################

.text
.globl __start
__start:
	# Print message "Enter 1st integer: "
	li $v0, 4
	la $a0, message1
	syscall
	
	# Read 1st integer
	li $v0, 5
	syscall
	
	# Store 1st integer
	move $t0, $v0
	
	# Show to user the integer he typed
	li $v0, 1
	move $a0, $t0
	syscall
	
	# Print message "Enter 2nd integer: "
	li $v0, 4
	la $a0, message2
	syscall
	
	# Read 2nd integer
	li $v0, 5
	syscall
	
	# Store 2nd integer
	move $t1, $v0
	
	# Show to user the integer he typed
	li $v0, 1
	move $a0, $t1
	syscall
	
	# Add the integers
	add $s0, $t0, $t1
	
	# Print the result
	li $v0, 4
	la $a0, message3
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, message4
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, message5
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	
	#Exit program
	li $v0, 4
	la $a0, message6
	syscall
	li $v0, 10
	syscall
.data
	message1: .asciiz "Type the 1st integer: "
	message2: .asciiz "\nType the 2nd integer: "
	message3: .asciiz "\nThe result is: "
	message4: .asciiz " + "
	message5: .asciiz " = "
	message6: .asciiz "\nExiting program..."