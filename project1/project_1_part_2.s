.globl main
.globl done
.globl sum

.data
prompt:  .asciiz   "Enter a number:"
result:  .asciiz   "The sum is "

.text
sum:   	add $v1, $a1, $a2      # Routine
	add $v1, $a3, $v1
	add $v1, $a0, $v1
	jr $ra                 # Return
	add $0, $0, $0         # Branch Delay Slot (NOP)

main:	addi $v0, $0, 4
	lui $a0, 0x1000        # Address of prompt
	syscall                # Display prompt
	addi $v0, $0, 5
	syscall                # Get first integer
	add $a1, $0, $v0       # First integer becomes parameter
	addi $v0, $0, 4
	syscall                # Display Prompt
	addi $v0, $0, 5        
	syscall		       # Get second integer
	add $a2, $0, $v0       # First integer becomes parameter
	addi $v0, $0, 4
	syscall                # Display Prompt
	addi $v0, $0, 5        
	syscall		       # Get second integer
	add $a3, $0, $v0       # First integer becomes parameter
	addi $v0, $0, 4
	syscall                # Display Prompt
	addi $v0, $0, 5        
	syscall		       # Get second integer
	add $a0, $0, $v0       # First integer becomes parameter
	jal sum				   # Call the routine
	add $a2, $0, $v0       # Branch delay slot used to pass second parameter
	addi $v0, $0, 4
	lui $a0, 0x1000
	addi $a0, $a0, 16      # Address of result string
	syscall                # Display result string
	addi $v0, $0, 1
	add $a0, $0, $v1
	syscall                # Display integer result
done:	add $0, $0, $0         # End of Program.  Set breakpoint here to analyze results.
