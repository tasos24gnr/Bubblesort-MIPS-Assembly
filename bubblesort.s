#Anastasios Benos 3130141
#Efthimios Tsopelas 3130210
# +==========================+
# |   BubbleSort in MIPS     |
# +==========================+

.data 
Array: .word -4, 5, -1, 3, 0, 5, 2, 6, -1, 9, 22, -25, 13, -5, 15, 16
prompt: .asciiz "enter 'a' to sort the array in ascending order or 'd' to sort in descneding order: "
msg: .asciiz "gamw thn mana sou thn poytanara"

.text 
.globl main 
main:
	la $a0, prompt #loads prompt to $a0
	li $v0, 4 #prints prompt
	syscall

	li $v0, 5
	syscall
	move $t1,$v0;

	li $s0,	97
	li $s1,	100
	li $t0, 16				# my i for the loop
	li $t5, 16				# my j for the loop
	la $t3, Array

	beq $t1, $s0, ascend
	
ascend:

	beqz $t0,exit			#if t0=i==0 then exit
	addi $t0, $t0, -1
	addi $t5, $t5, -1
	blez $t5, reset
	lw $t2, 0($t3)
	lw $t4, 4($t3) 
	bgt $t2, $t4, swap
	beq $t2, $t4, no_swap
	addi $t3, $t3, 4 
	j ascend
	
swap: 
	sw $t4, 0($t3) #store the value on $t4 into the array cell 60
	sw $t2, 4($t3) #store the value on $t5 into the array cell n+1 
	addi $t3, $t3, 4 #increment array position 
	li $t0, 0 #sets $t0 to 0 
	addi $t0, $t0, 16 #$t0 back to 16  
	j ascend
	
no_swap:
	addi $t3, $t3, 4 #increment array position 
	j ascend
	
reset: 
	la $t3, Array #loads original array back to $t3 to check the first element again 
	li $t5, 16 #resets counter to 16  
	j ascend
	
exit: 

	
	la $a0, msg #loads prompt to $a0
	li $v0, 4 #prints prompt
	syscall
	li $v0, 10 #exits program syscall

 