##EXAMEN 28 JUNIO 2013
			
			.data
V:		.word 9,2,0,9,0,4,3,6,5,8
res:	.space 4

			.text
main:	li $t0,0	#t0 = suma
		li $t1,2	#t1 = valor
		li $t2,1	#t2 = i = 1
		li $t3,10	#t3 = lim superior = 10
		li $t4,3	#t4 comprueba si es multiplo de 3
		la $t5,V	#se carga en t5 la dirección de V
		#t6 almacena el resultado de la división
		
para:	bgt $t2,$t3,finpara	#si i > 10, salta a finpara
		lw $s0,0($t5)		#s0 = V[i]

		ble $s0,$t1,finsi	#V[i] > valor
		
		div $s0,$t1
		mfhi $t6
		beq $t6,$0,entonces	#V[i] es par
		
		div $s0,$t4
		mfhi $t6
		bne $t6,$0,finsi	#V[i] es multiplo de 3
		
entonces:	add $t0,$t0,$s0	#suma = suma + V[i]
		
finsi:	addi $t2,$t2,1
		addi $t5,$t5,4
		j para

finpara:	sw $t0,res
			jr $31
#--------------------------------------------------------------------------------------#
								##MODIFICACIÓN 3##
#--------------------------------------------------------------------------------------#
			.data
V:		.half 9,2,0,9,0,4,3,6,5,8
res:	.space 4

			.text
main:	li $t0,0	#t0 = suma
		li $t1,2	#t1 = valor
		li $t2,1	#t2 = i = 1
		li $t3,10	#t3 = lim superior = 10
		li $t4,3	#t4 comprueba si es multiplo de 3
		la $t5,V	#se carga en t5 la dirección de V
		#t6 almacena el resultado de la división
		
para:	bgt $t2,$t3,finpara	#si i > 10, salta a finpara
		lh $s0,0($t5)		#s0 = V[i]

		ble $s0,$t1,finsi	#V[i] > valor
		
		div $s0,$t1
		mfhi $t6
		beq $t6,$0,entonces	#V[i] es par
		
		div $s0,$t4
		mfhi $t6
		bne $t6,$0,finsi	#V[i] es multiplo de 3
		
entonces:	add $t0,$t0,$s0	#suma = suma + V[i]
		
finsi:	addi $t2,$t2,1
		addi $t5,$t5,2
		j para

finpara:	sh $t0,res
			jr $31