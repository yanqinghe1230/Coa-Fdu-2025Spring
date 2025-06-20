    .globl main
    .globl arrs
    .globl N
    .text

main:
    la $a0,arrs
    lw $a1,N
    jal sumn

    move $t0,$v0
    la $a0,print_result #print the result
    li $v0,4
    syscall
    move $a0,$t0
    li $v0,1
    syscall
    li $v0,10
    syscall

sumn:
    move $s0,$a0
    move $s1,$a1
    subu $sp,$sp,32
    sw $ra,28($sp)
    sw $fp,24($sp)
    sw $s0,20($sp) #$s0-arr
    sw $s1,16($sp) #$s1-N
    sw $s2,12($sp) #$s2-idx
    sw $s3,8($sp) #s3-sum

    addu $fp,$sp,32

    li $s2,0
    li $s3,0

    blt $s2,$s1,loop

loop:
    lw $s0,20($sp)
    sll $s2,$s2,2

    add $s0,$s0,$s2 #get the address of arr[idx]
    lw $s4,0($s0)
    add $s3,$s3,$s4 #sum+=arr[idx]

    lw $s2,12($sp)
    add $s2,$s2,1 #idx++
    sw $s2,12($sp)
    bge $s2,$s1,endloop

    b loop

endloop:
    move $v0,$s3
    lw $ra,28($sp)
    lw $fp,24($sp)
    addu $sp,$sp,32
    jr $ra

    .data
arrs:  .word 9, 7, 15, 19, 20, 30, 11, 18
N:  .word 8
print_result: .asciiz "The result is: "


