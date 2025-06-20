    .text

main:
    subu $sp,$sp,32
    sw $ra,28($sp)
    sw $fp,24($sp)
    addu $fp,$sp,32

    li $v0,5
    syscall
    
    move $a0,$v0
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
    bgt $a0,1,fib_recurse
    li $v0,1
    jr $ra

fib_recurse:
    subu $sp,$sp,16
    sw $ra,12($sp)
    sw $fp,8($sp)
    addu $fp,$sp,16

    sw $a0,4($sp) #record n
    sub $a0,$a0,1
    jal fib

    sw $v0,0($sp) #record fib(n-1)
    lw $a0,4($sp)
    sub $a0,$a0,2
    jal fib

    lw $t1,0($sp)

    add $v0,$t1,$v0
    lw $ra,12($sp)
    lw $fp,8($sp)
    addu $sp,$sp,16
    jr $ra

    .data
newline: .asciiz "\n"

