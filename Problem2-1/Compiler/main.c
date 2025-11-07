#include <stdint.h>

extern uint64_t get_instret(void);
extern void my_putchar(char c);
#define putch my_putchar

static void print_hex32(uint32_t v) {
    for (int i = 7; i >= 0; --i) {
        uint32_t nib = (v >> (i * 4)) & 0xF;
        char c = (nib < 10) ? ('0' + nib) : ('a' + (nib - 10));
        putch(c);
    }
}

static int next_pos_mod3(int from) {
    if (from == 0) return 2;
    else if (from == 1) return 0;
    else return 1;
}

int main(void) {
    int disk_pos[3] = {0, 0, 0};
    uint64_t A = 0, B = 0, C = 0;
    int n = 1;

    while (1) {
        if (n == 8) break;
        uint64_t t0 = get_instret();

        int g_n = n ^ (n >> 1);
        int g_n_1 = (n - 1) ^ ((n - 1) >> 1);
        int changed = g_n ^ g_n_1;
        int disk_idx = (changed & 1) ? 0 : ((changed & 2) ? 1 : 2);

        int from = disk_pos[disk_idx];
        int to;
        if (disk_idx == 0)
            to = next_pos_mod3(from);
        else
            to = 3 - from - disk_pos[0];

        char from_ch = 'A' + from;
        char to_ch = 'A' + to;

        uint64_t t1 = get_instret();
        A += (t1 - t0);

        t0 = get_instret();
        const char *s1 = "Move Disk ";
        while (*s1) putch(*s1++);
        putch('0' + disk_idx + 1);
        const char *s2 = " from ";
        while (*s2) putch(*s2++);
        putch(from_ch);
        const char *s3 = " to ";
        while (*s3) putch(*s3++);
        putch(to_ch);
        putch('\n');
        t1 = get_instret();
        B += (t1 - t0);

        t0 = get_instret();
        disk_pos[disk_idx] = to;
        n++;
        t1 = get_instret();
        C += (t1 - t0);
    }

    const char *msgA = "A: 0x"; while (*msgA) putch(*msgA++);
    print_hex32((uint32_t)(A >> 32)); print_hex32((uint32_t)A); putch('\n');

    const char *msgB = "B: 0x"; while (*msgB) putch(*msgB++);
    print_hex32((uint32_t)(B >> 32)); print_hex32((uint32_t)B); putch('\n');

    const char *msgC = "C: 0x"; while (*msgC) putch(*msgC++);
    print_hex32((uint32_t)(C >> 32)); print_hex32((uint32_t)C); putch('\n');

    return 0;
}
