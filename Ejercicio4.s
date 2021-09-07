.data
    number: .asciiz "\nIngrese un numero: "
    numero: .asciiz "\nEl numero  "
    esMultiplo: .asciiz " es multiplo de "
    noMultiplo: .asciiz " no es multiplo de "

.text
    main:
    li $t1, 1                    
    li $t2, 21

    li $v0, 4
	la $a0, number
	syscall
	
    li $v0,5 
    syscall 
    move $a1, $v0

    LoopMultiplo:
		beq $t2, $t1, Exit

		div	 $t1, $a1
		mfhi $t3
		
		beq $t3, 0, Multiplo

		NoMultiplo:
			li $v0, 4
			la $a0, numero
			syscall
			move $a0 $t1
			
			li $v0, 1 
			syscall 
			move $t1 $a0
			
			li $v0, 4
			la $a0, noMultiplo
			syscall
			move $a0 $a1
			
			li $v0, 1 
			syscall
			move $a1 $a0
			
			add $t1, $t1, 1 
		j LoopMultiplo

		Multiplo: 
			li $v0, 4
			la $a0, numero
			syscall
			move $a0 $t1
			
			li $v0, 1 
			syscall 
			move $t1 $a0
			
			li $v0, 4
			la $a0, esMultiplo
			syscall
			move $a0 $a1
			
			li $v0, 1 
			syscall
			move $a1 $a0
			
			add $t1, $t1, 1 
		j LoopMultiplo
    Exit:

    jr $ra