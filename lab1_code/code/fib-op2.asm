    .text

main:
    subu $sp,$sp,32
    sw $ra,28($sp)
    sw $fp,24($sp)
    addu $fp,$sp,32

    li $v0,5
    syscall

    move $a0,$v0
    li $a1,1
    li $a2,1
    jal fib
    
    move $a0,$v0
    li $v0,1
    syscall

    la $a0,newline
    li $v0,4
    syscall

    li $v0,10
    syscall

fib:
    blt $a0,2,end  #if n<2, end loop
    subu $sp,$sp,16
    sw $ra,12($sp)
    sw $fp,8($sp)
    addu $fp,$sp,16

    sub $a0,$a0,1
    move $t0,$a2
    add $a2,$a1,$a2
    move $a1,$t0
    jal fib

    lw $ra,12($sp)
    lw $fp,8($sp)
    addu $sp,$sp,16
    j exit


end:
    move $v0,$a1  #return first

exit:
    jr $ra

    .data
newline: .asciiz "\n"

