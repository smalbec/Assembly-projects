.globl main
.globl done
.globl sum
.globl diff
.globl mulp
.globl avg
.globl result


.data
prompt0: .asciiz "This program will evaluate 2 numbers given a number for an expression: \n 1 for +, 2 for -, 3 for *, 4 for average"
prompt1: .asciiz "Enter #1: "
prompt2: .asciiz "Enter #2: "
prompt3: .asciiz "Enter operation: "
prompt4: .asciiz "Result: "
prompt5: .asciiz "Run again? (1 for yes/0 for no)"

.text

sum:
    lui $v0, 0x1000
    lui $v1, 0x10000020
    add	$t0, $v1, $v0		# $t0 = $t1 + $t2
    addi $v0, $0, 4      # Print String Sys
    addi $a0, $a0, 18    # Jump to prompt4
    addi $a1,$a0, 0 
    syscall              # Display prompt4
    addi $v0, $0, 1      # Print String Sys
    addi $a0, $0, $t0    # Jump to prompt4
    syscall
    jr		$ra					# jump to $ra
    add $0, $0, $0

diff:
    lui $v0, 0x1000
    lui $v1, 0x10000020
    sub	$t0, $v0, $v1		# $t0 = $t1 + $t2
    addi $v0, $0, 4      # Print String Sys
    addi $a0, $a0, 18    # Jump to prompt4
    addi $a1,$a0, 0 
    syscall              # Display prompt4
    addi $v0, $0, 1      # Print String Sys
    addi $a0, $0, $t0    # Jump to prompt4
    syscall
    jr		$ra					# jump to $ra
    addi $0, $0, $0

mult:
    lui $v0, 0x1000
    lui $v1, 0x10000020
    add	$t0, $v1, $v0		# $t0 = $t1 + $t2
    addi $v0, $0, 4      # Print String Sys
    addi $a0, $a0, 18    # Jump to prompt4
    addi $a1,$a0, 0 
    syscall              # Display prompt4
    addi $v0, $0, 1      # Print String Sys
    addi $a0, $0, $t0    # Jump to prompt4
    syscall
    jr		$ra					# jump to $ra
    add $0, $0, $0

average:
    lui $v0, 0x1000
    lui $v1, 0x10000020
    add	$t0, $v1, $v0		# $t0 = $t1 + $t2
    addi $v0, $0, 4      # Print String Sys
    addi $a0, $a0, 18    # Jump to prompt4
    addi $a1,$a0, 0 
    syscall              # Display prompt4
    addi $v0, $0, 1      # Print String Sys
    addi $a0, $0, $t0    # Jump to prompt4
    syscall
    jr		$ra					# jump to $ra
    add $0, $0, $0        
     


main:
    lui $a0, 0x1000      
    addi $v0, $0, 4      # Print String Sys
    syscall              # Display prompt0
    addi $a0, $a0, 69    # Jumps to prompt1
    syscall              # Display prompt1
    addi $v0, $0, 5      # Read int Sys
    syscall              # Get first string
    sw $v0, 0x1000       # Store first string at 1000
    addi $a0, $a0, 11    # Jump to prompt2
    addi $v0, $0, 4      # Print String Sys
    syscall              # Get second string
    addi $v0, $0, 5      # Read int Sys
    syscall              # Get second string
    sw $v0, 0x10000020   # Store second string at 1020
    addi $a0, $a0, 11    # Jump to prompt3
    addi $v0, $0, 4      # Print String Sys
    syscall              # Prompt3 
    addi $v0, $0, 5      # Read int Sys
    syscall              # Get operation
    addi $t0, $t0, $1
    addi $t1, $t1, $2 
    addi $t2, $t2, $3 
    addi $t3, $t3, $4  
    beq	$v0, $t0, sum	     # if $t0 == $t1 sumtarget
    add $0, $0, $0
    beq	$v0, $t1, diff
    add $0, $0, $0
    beq	$v0, $t2, mulp
    add $0, $0, $0  
    beq	$v0, $t3, avg
    add $0, $0, $0
    addi $v0, $0, 4      # Print String Sys
    addi $a0, $a1, 9    # Jump to prompt5
    syscall
    addi $v0, $0, 5      # Read int Sys
    syscall              # Get second string
    addi $t1, $0, $0
    bne	$v0, $t1, main	# if $t0 /= $t1 then target
    add $0, $0, $0


done:
    or $0, $0, $0
    