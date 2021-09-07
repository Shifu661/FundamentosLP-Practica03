.data
	lado1: .asciiz "\nIngrese el primer lado del triangulo: "
	lado2: .asciiz "\nIngrese el segundo lado del triangulo: "
	lado3: .asciiz "\nIngrese el tercer lado del triangulo: "
	valido: .asciiz "\nEl triangulo ES VÁLIDO"
	invalido: .asciiz "\nEl triangulo NO ES VÁLIDO"
.text
main:
	li $v0, 4
	la $a0, lado1
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	li $v0,4
	la $a0,lado2
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0

	li $v0,4
	la $a0,lado3
	syscall
	
	li $v0,5
	syscall
	move $t3,$v0
	
	add $t4, $t1, $t2
	add $t5, $t2, $t3
	add $t6, $t1, $t3

	bge $t3, $t4, TrianguloINV
	bge $t2, $t6, TrianguloINV
	bge $t1, $t5, TrianguloINV
	
	b TrianguloVal
	#TRIANGULO VALIDO
	TrianguloVal:
		li $v0, 4
		la $a0, valido
		syscall
		b FIN
	#TRIANGULO INVALIDO
	TrianguloINV:
		li $v0, 4
		la $a0, invalido
		syscall
		b FIN

    FIN:
	
    jr $ra