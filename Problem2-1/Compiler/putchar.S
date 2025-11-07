    .section .text
    .globl my_putchar
my_putchar:
    # a0 = 要輸出的字元
    li   a7, 64          # Linux syscall: write
    li   a0, 1           # fd = 1 (stdout)
    la   a1, chbuf
    sb   a0, 0(a1)       # 把字元存到暫存區
    li   a2, 1           # 寫入 1 byte
    ecall
    ret

    .data
chbuf: .byte 0
