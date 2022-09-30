.globl main
.globl loop

.data
x: .byte 4
y: .byte 5

.text
loop:  
    add $s0, $s0, $a0    # Add x to Running Sum
    addi $s1, $s1, -1   # Decrement Counter
    bne $s1, $0, loop   # Branch Back to Add x Again
    or $0, $t0, $0    #nop
    jr $ra
    add $v0, $0, $0           # Store result to memory at y

main:
    lui $t0, 0x1000
    lb $a0, x
    lb $a1, y        
    add $s1, $0, $a1     # Counter Initialization
    addi $s0, $0, $0     # Running Sum Initialization
    jal loop
    or $0, $0, $0
done:
    or $0, $0, $0
    