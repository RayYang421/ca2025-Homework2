#####################
# q1-uf8.s
# 1st version
#####################


.data
result: .word 0

.text
.globl main

# main function
main:

    jal  ra, test           
    xori a0, a0, 1          
    j    Exit


# function : clz with branchless
# registers:
# a0: input value
# a0: return value

clz:
    li      t1, 0                 # r = 0

    # c = (x < 0x00010000) << 4
    lui     t3, 0x00001           # t3 = 0x00010000
    sltu    t2, a0, t3            # t2 = (x < 0x00010000) ? 1 : 0
    slli    t2, t2, 4             # c = 0 or 16
    add     t1, t1, t2            # r += c
    sll     a0, a0, t2            # x <<= c

    # c = (x < 0x01000000) << 3
    lui     t3, 0x001000          # t3 = 0x01000000
    sltu    t2, a0, t3
    slli    t2, t2, 3             # c = 0 or 8
    add     t1, t1, t2
    sll     a0, a0, t2

    # c = (x < 0x10000000) << 2
    lui     t3, 0x010000          # t3 = 0x10000000
    sltu    t2, a0, t3
    slli    t2, t2, 2             # c = 0 or 4
    add     t1, t1, t2
    sll     a0, a0, t2

    # c = (x < 0x40000000) << 1
    lui     t3, 0x040000          # t3 = 0x40000000
    sltu    t2, a0, t3
    slli    t2, t2, 1             # c = 0 or 2
    add     t1, t1, t2
    sll     a0, a0, t2

    # c = (x < 0x80000000)
    lui     t3, 0x080000          # t3 = 0x80000000
    sltu    t2, a0, t3            # c = 0 or 1
    add     t1, t1, t2
    sll     a0, a0, t2

    # r += (x == 0)
    seqz    t3, a0                # t3 = (x==0) ? 1 : 0   (pseudo: sltiu t3,a0,1)
    add     t1, t1, t3

    mv      a0, t1                # return r
    ret


# function : uf8_encode
# registers:    
# a0: input value
# a0: output fl
# t0: lz
# t1: msb
# t2: exp
# t3: overflow

uf8_encode:

    addi   t0, x0, 16
    bltu a0, t0, encode_done


    addi sp, sp, -8
    sw   ra, 4(sp)
    sw   s0, 0(sp)
    mv   s0, a0     

    jal  ra, clz                # a0 = clz(value)
    li   t0, 31
    sub  t0, t0, a0             # t0 = msb = 31 - lz


    mv   t1, x0                 # t1 = exponent = 0
    mv   t2, x0                 # t2 = overflow = 0

    li   t3, 5
    blt  t0, t3, find_exact_exponent

    addi t1, t0, -4             # exponent = msb - 4

    li   t3, 15
    blt  t3, t1, clamp_exponent
    j    calc_overflow
clamp_exponent:
    mv   t1, t3                 # exponent = 15

calc_overflow:
    mv   t4, x0                 # t4 = e = 0

calc_overflow_loop:
    bge  t4, t1, adjust_down 
    slli t2, t2, 1
    addi t2, t2, 16
    addi t4, t4, 1
    j    calc_overflow_loop

adjust_down:

adjust_down_loop:
    bge  x0, t1, find_exact_exponent   # t1 <= 0
    bge  s0, t2, find_exact_exponent

    addi t2, t2, -16
    srli t2, t2, 1
    addi t1, t1, -1
    j    adjust_down_loop

find_exact_exponent:

find_exact_loop:
    li   t3, 15
    bge  t1, t3, final_calc   

    slli t4, t2, 1
    addi t4, t4, 16

    blt  s0, t4, final_calc

    mv   t2, t4
    addi t1, t1, 1
    j    find_exact_loop

final_calc:

    sub  t5, s0, t2             # t5 = value - overflow
    srl  t5, t5, t1             # t5 = mantissa = t5 >> exponent
    

    slli t1, t1, 4
    or   a0, t1, t5             # a0 = (exponent << 4) | mantissa

    # 恢復堆疊並返回
    lw   s0, 0(sp)
    lw   ra, 4(sp)
    addi sp, sp, 8
    ret

encode_done:
    ret # 對於 value < 16 的情況，直接返回 a0

# function : uf8_decode
# registers:
# a0: input fl
# a0: output value
# t0: mantissa
# t1: exponent
# t2: offset
# t3: 0x7fff

uf8_decode:
    andi t0, a0, 0x0f        # mantissa = fl & 0x0f
    srli t1, a0, 4           # exponent = fl >> 4

    addi t2, x0, 15
    sub  t2, t2, t1          # t2 = 15 - exponent
    li   t3, 0x7fff          

    srl  t2, t3, t2          # t2 = 0x7FFF >> (15 - exponent)
    slli t2, t2, 4           # offset = ... << 4

    sll  a0, t0, t1          # mantissa << exponent
    add  a0, a0, t2          # + offset

    ret         

test:
    # 保存 ra
    addi sp, sp, -4
    sw   ra, 0(sp)

    li   t6, 1          # passed = 1

    li   a0, 0
    jal  ra, uf8_encode
    mv   t1, a0         # fl = encode(0)
    mv   a0, t1

    jal  ra, uf8_decode
    li   t2, 16
    beq  a0, t2, test0
    li   t6, 0
test0:

    # --- 測試 15 ---
    li   a0, 15
    jal  ra, uf8_encode
    mv   t1, a0
    mv   a0, t1
    jal  ra, uf8_decode
    li   t2, 15  
    beq  a0, t2, test15
    li   t6, 0
test15:

    # --- 測試 1024 ---
    li   a0, 1024
    jal  ra, uf8_encode
    mv   t1, a0
    mv   a0, t1
    jal  ra, uf8_decode
    li   t2, 1008
    
    beq  a0, t2, test1024
    li   t6, 0
test1024:

    beq  t6, x0, test_ret


test_ret:
    mv   a0, t6          # return passed (1/0)
    lw   ra, 0(sp)
    addi sp, sp, 4
    ret


Exit:

    addi a7, x0, 93
    ecall

.data
msg: .ascii "Program done\n"