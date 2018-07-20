.text
.globl __start
__start:
	main:
		# Print message "Type 1st integer"
		li $v0, 4
		la $a0, message1
		syscall
		
		# Read 1st integer
		li $v0, 5
		syscall
		
		# Store 1st integer
		addi $t0, $v0, 0
		
		# Print the integer of user as feedback
		li, $v0, 1
		addi $a0, $t0, 0
		syscall

		
		# Print message "Type 2nd integer"
		li $v0, 4
		la $a0, message2
		syscall
		
		# Read 2nd integer
		li $v0, 5
		syscall
		
		# Store 2nd integer
		addi $t1, $v0, 0
		
		# Print the integer of user as feedback
		li, $v0, 1
		addi $a0, $t1, 0
		syscall
		
		# Call SumResult to calcute sum of the 2 integers
		add $a1, $zero, $t0
		add $a2, $zero, $t1
		add $a3, $zero, $s2
		jal SumResult
		
		# Print the sum of the integers
		li $v0, 4
		la $a0, message3
		syscall
		li, $v0, 1
		addi $a0, $t0, 0
		syscall
		li $v0, 4
		la $a0, message4
		syscall
		li, $v0, 1
		addi $a0, $t1, 0
		syscall
		li $v0, 4
		la $a0, message5
		syscall
		li, $v0, 1
		addi $a0, $s2, 0
		syscall
		
	# Exit program
	li $v0, 4
	la $a0, message6
	syscall
		
	SumResult:
		addi $sp, $sp, -4
		sw $s2, 0($sp)
		add $s2, $a1, $a2
		add $v0, $s2, $zero
		lw $s0, 0($sp)
		addi $sp, $sp, 4
		jr $ra
.data
	message1: .asciiz "Type 1st integer: "
	message2: .asciiz "\nType 2nd integer: "
	message3: .asciiz "\nThe result of "
	message4: .asciiz " + "
	message5: .asciiz " = "
	message6: .asciiz "\nExiting program..."