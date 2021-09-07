.data
	num_1: .asciiz "\nIngrese un numero: "
	num_2: .asciiz "\nIngrese otro numero: "
	suma: .asciiz "\nLa suma es: "
	resta: .asciiz "\nLa diferencia es: "
	multi: .asciiz "\nLa multiplicación es: "
	divi: .asciiz "\nLa division es: "
	promedio: .asciiz "\nEl promedio es: "
.text
main:
	li $v0, 4
	la $a0, num_1
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	li $v0, 4
	la $a0, num_2
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

#OPERACIONES
	#SUMA
	la $a0, suma
	li $v0, 4
	syscall
	
	add $t0, $t1, $t2
	move $a0, $t0
	li $v0, 1
	syscall
	
	#RESTA
	la $a0, resta
	li $v0, 4
	syscall

	sub $a0, $t1, $t2
	li $v0, 1
	syscall
	
	#MULTIPLICACIÓN
	la $a0, multi
	li $v0, 4
	syscall

	mul $a0, $t1, $t2
	li $v0, 1
	syscall
	
	#DIVISIÓN
	la $a0, divi
	li $v0, 4
	syscall

	mtc1 $t1, $f1
  	cvt.s.w $f1, $f1
  	mtc1 $t2, $f2
 	cvt.s.w $f2, $f2
	
	div.s $f12, $f1, $f2
	li $v0, 2
	syscall
	
	#PROMEDIO
	la $a0, promedio
	li $v0, 4
	syscall
	
	mtc1 $t0, $f3
	cvt.s.w $f3, $f3
	
	li.s $f4, 2.0
	
	div.s $f12, $f3, $f4
	li $v0, 2
	syscall
	
	jr $ra