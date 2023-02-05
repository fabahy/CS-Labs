# Bai 7: Nhap mot mang cac so nguyen n phan tu, xuat mang do ra man hinh.
.data
	tb1: .asciiz "Nhap n: "
	tb2: .asciiz "A["
	tb3: .asciiz "]: "
	tb4: .asciiz "Mang vua nhap la: "
	n: .word 0
	s:.word 0
	arr: .space 400 

.text
	#xuat tb1
	li $v0,4
	la $a0,tb1
	syscall

	#nhap n
	li $v0,5
	syscall

	#Luu v0 vao n
	sw $v0,n

	#load n vao s0
	lw $s0,n
	
	
	#load dia chia arr vao s1
	la $s1,arr

	#khoi tao vong lap
	li $t0,0

LoopNhap:
	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall

	#xuat i
	li $v0,1
	move $a0,$t0
	syscall

	#xuat tb3
	li $v0,4
	la $a0,tb3
	syscall
	
	#nhap a[i]
	li $v0,5
	syscall

	#luu v0 vao a[i]
	sw $v0,($s1)
	
	#Tang dia chi mang
	add $s1,$s1,4

	#tang chi so i
	addi $t0,$t0,1
	
	#Kiem tra i < n thi lap
	slt $t1,$t0,$s0
	beq $t1,1,LoopNhap


	#xuat tb4
	li $v0,4
	la $a0,tb4
	syscall


	#load dia chi mang vao s1
	la $s1,arr
	
	#khoi tao vong lap
	li $t0,0 # i = 0
LoopXuat:
	#xuat a[i]
	li $v0,1
	lw $a0,($s1)
	syscall


	#xuat khoang trang
	li $v0,11
	li $a0,' '
	syscall


	#tang dia chi mang
	add $s1,$s1,4
	
	#tang chi so i
	addi $t0,$t0,1
	
	#Kiem tra i < n thi lap
	slt $t1,$t0,$s0
	beq $t1,1,LoopXuat
	
	


