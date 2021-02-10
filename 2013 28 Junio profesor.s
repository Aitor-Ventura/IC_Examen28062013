	.data
v: .word 9, 2, 0, 9, 0, 4, 3, 6, 5, 8
suma: .space 4

	.text
main: add $t0,$0,$t0   #t0(suma)= 0
      li $t1,2         #t1(valor)= 2, mayor que 2
      li $t2,10        #t2(numero elementos)= 10, tamaño vector
      li $t3,1         #t3(indice)= 1
      li $t4,1         #t4 comprueba si es par, paridad      
      li $t5,3         #t5 multiplo de 3
      la $t6,v         #t6 direccion del vector v

para: bgt $t3,$t2,finpara
      lw $s0,0($t6)   #s0 almacena los elementos de v

      ble $s0,$t1,finsi  #v[i]> valor
      
      and $s1,$s0,$t4 
      beq $0,$s1,entonces   #se comprueba si es par

      div $s0,$t5        
      mfhi $s1
      bgtz $s1,finsi     #v[i] multiplo de 3

entonces: add $t0,$t0,$s0   #suma += v[i]
       
finsi: addi $t3,$t3,1
       addi $t6,$t6,4
       j para

finpara: sw $t0, suma  #se guarda s0 en suma
         jr $31
      