.text
start:
.globl start
 la a1, array_length #}
 lw a1, 0(a1) #} a3 = <длина массива>
 la a0, array # a4 = <адрес 0-го элемента массива>
 li a2, 1 # a2 = 1
 jal zero, loop_check1 # goto loop_check
loop1:
 #{
 slli a5, a2, 2 # a5 = a2 << 2 = a2 * 4
 add a5, a0, a5 # a5 = a4 + a5 = a4 + a2 * 4 (array[i])
 addi a6, a5, -4 # a6 = a5 + (-4) = a5 - 4 (array[i - 1])
 lw a6, 0(a6) 
 addi a6, a6, 1 # a6 += 1
 sw a6, 0(a5) # array[i] = a6
 addi a2, a2, 1 # a2 += 1
 #}
loop_check1:
 bltu a2, a1, loop1 # if( a2 < a3 ) goto loop
loop_exit1:
li a2, 1 # a2 = 1
jal zero, loop_check # goto loop_check
loop:
#{
 slli a5, a2, 2 # a5 = a2 << 2 = a2 * 4
 add a5, a0, a5 # a5 = a4 + a5 = a4 + a2 * 4
 lw t1, 0(a5) # t1 = array[i]
 #получение кода грея
 srli t3, t1, 1 # t3 = t1 >> 1
 xor t1, t1, t3
 sw t1, 0(a5) # array[i] = t1
 #
 addi a2, a2, 1 # a2 += 1
#}
loop_check:
 bltu a2, a1, loop # if( a2 < a3 ) goto loop
loop_exit:
# запись массива в регистры
lw s2, 0(a0)
lw s3, 4(a0)
lw s4, 8(a0)
lw s5, 12(a0)
lw s6, 16(a0)
lw s7, 20(a0)
lw s8, 24(a0)
lw s9, 28(a0)
#
finish:
 li a0, 10 # x10 = 10
 li a1, 0 # x11 = 0
 ecall # ecall при значении x10 = 10 => останов симулятора
.rodata
array_length:
 .word 8 # разрядность 3(2^3)
.data
array:
 .word 0, 0, 0, 0, 0, 0, 0, 0 