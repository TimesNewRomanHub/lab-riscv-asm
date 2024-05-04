.data
N:
.word 4
M:
.word 4
matrix:
.word 1, 2, 3, 4
.word 1, 2, 3, 4
.word 1, 2, 3, 4
.word 1, 2, 3, 4
column:
.word 1 # column number
result:
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
la a6, column
call process
la a3, result
call print
call exit

print:

addi t2, x0, 0
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 32
ecall
ret

exit:
addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M
lw t4, 0(a6) # column number


init:
addi t5, x0, 0 # result to save
addi t3, x0, 0 # column element number
slli t4, t4, 2 # calculate offset to target column in 1st row
add a4, a4, t4 # initialize pointer to element in target column (1st row)
slli t1, t1, 2 # get the offset to the end of the row

cycle:
lw t6, 0(a4) # load value from array
add a4, a4, t1 # increment array pointer
add t5, t5, t6 # count sum
addi t3, t3, 1
blt t3, t2, cycle
sw t5, 0(a5) # save result to resulting array
ret