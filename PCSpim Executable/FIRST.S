# #############################################################################################	#
# File: first.s											#
# Assignment: Phase 2										#
# Name: Anthony Keeley, #355724825								#
# Course: CS312-001										#
# Created: 8:06 PM 10/19/2003									#
# Description: Program in MIPS assembly. Asks user to enter two numbers, checks to see if they  #
#	       are between 0 and 256 and outputs if they are equal or not. Uses "if" statement.	#
# #############################################################################################	#

.data
	STR_FIRSTNUM: .asciiz "Please enter the first number: "
	STR_SECONDNUM: .asciiz "Please enter the second number: "
	STR_EQUAL: .asciiz "The two numbers are equal."
	STR_NOT_EQUAL: .asciiz "The two numbers are not equal."

.text
	.globl main

main:
	FIRSTNUM:	li $v0, 4			# system call for print string
			la $a0, STR_FIRSTNUM		# specify string
			syscall				# display message

			li $v0, 5			# sytem call for read_int
			syscall				# get int from user
			move $t0, $v0 			# move user int into $t0

			li $t1, 257			# load 257 into t1
			slt $t2, $t0, $t1		# check if t0 < 256
			beq $t2, $zero, FIRSTNUM	# if t2 = 0, then ask to reenter number

			slt $t2, $t0, $zero		# check if t0 < 0
			bne $t2, $zero, FIRSTNUM	# if t2 = 0, then ask to reenter number

			move $s0, $t0			# move int from t1 to s0

	SECONDNUM:	li $v0, 4			# system call for print string
			la $a0, STR_SECONDNUM		# specify string
			syscall				# display message

			li $v0, 5			# sytem call for read_int
			syscall				# get int from user
			move $t0, $v0 			# move user int into $t0

			slt $t2, $t0, $t1		# check if t0 < 256
			beq $t2, $zero, SECONDNUM	# if t2 = 0, then ask to reenter number

			slt $t2, $t0, $zero		# check if t0 < 0
			bne $t2, $zero, SECONDNUM	# if t2 = 0, then ask to reenter number

			move $s1, $t0			# move int from t1 to s0

	bne $s0, $s1, ELSE	# if s0 = s1, continue, Else goto ELSE
	li $v0, 4		# system call for print string
	la $a0, STR_EQUAL	# specify string
	syscall			# display string
	j EXIT

	ELSE:		li $v0, 4		# system call for print string
			la $a0, STR_NOT_EQUAL	# specify string
			syscall			# display string
			j EXIT

	EXIT:		jr $31			# return to main

# END OF THE LINES ##############################################################################
