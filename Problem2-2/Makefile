include ../../../mk/toolchain.mk

ARCH = -march=rv32i_zicsr
ABI  = -mabi=ilp32
LINKER_SCRIPT = linker.ld

EMU ?= ../../../build/rv32emu

AFLAGS = -g $(ARCH) $(ABI)
CFLAGS = -g $(ARCH) $(ABI)
LDFLAGS = -T $(LINKER_SCRIPT)
EXEC = test.elf

CC = $(CROSS_COMPILE)gcc -O2
AS = $(CROSS_COMPILE)as 
LD = $(CROSS_COMPILE)ld
OBJDUMP = $(CROSS_COMPILE)objdump

LIBGCC := $(shell $(CC) $(CFLAGS) -print-libgcc-file-name)

OBJS = start.o main.o perfcounter.o chacha20_asm.o

.PHONY: all run dump clean

all: $(EXEC)

$(EXEC): $(OBJS) $(LINKER_SCRIPT)
	$(CC) $(CFLAGS) -nostartfiles -nostdlib -Wl,-T,$(LINKER_SCRIPT) -o $@ $(OBJS) $(LIBGCC)

%.o: %.S
	$(AS) $(AFLAGS) $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@ -c

run: $(EXEC)
	@test -f $(EMU) || (echo "Error: $(EMU) not found" && exit 1)
	@grep -q "ENABLE_ELF_LOADER=1" ../../../build/.config || (echo "Error: ENABLE_ELF_LOADER=1 not set" && exit 1)
	@grep -q "ENABLE_SYSTEM=1" ../../../build/.config || (echo "Error: ENABLE_SYSTEM=1 not set" && exit 1)
	$(EMU) $<

print:
	gcc -DHOST_TEST main.c -lm -o print
	./print

dump: $(EXEC)
	$(OBJDUMP) -Ds $< | less

clean:
	rm -f $(EXEC) $(OBJS)

.PHONY: print