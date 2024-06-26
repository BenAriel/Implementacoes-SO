.include "macros.asm"

.data
.text             
      	#criação dos processos com prioridade
	SyscallFork(Programa1)
	SyscallFork(Programa2)
	
	#escalonando o primeiro processo
	SyscallProcessChange
	
Programa1:					
		addi $s1, $zero, 1 # valor inicial do contador
		addi $s2, $zero, 10 # valor limite do contador
	loop1: 	addi $s1, $s1, 1
		beq $s1, $s2, fim1
j loop1
	fim1:	SyscallProcessTerminate

Programa2: 
		addi $s3, $zero, -1 # valor inicial do contador
		addi $s4, $zero, -10 # valor limite do contador
	loop2: 	addi $s3, $s3, -1
		beq $s3, $s4, fim2
		j loop2
	fim2:	SyscallProcessTerminate
