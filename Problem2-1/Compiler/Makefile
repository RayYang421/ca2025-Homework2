include ../../../mk/toolchain.mk

CROSS_COMPILE ?= riscv-none-elf-

ARCH := -march=rv32i_zicsr_zicntr
ABI  := -mabi=ilp32

LINKER_SCRIPT = linker.ld
EMU ?= ../../../build/rv32emu

CC      = $(CROSS_COMPILE)gcc
OBJDUMP = $(CROSS_COMPILE)objdump

CFLAGS  = -g -Os $(ARCH) $(ABI)
AFLAGS  = -g -Os $(ARCH) $(ABI)
LDFLAGS = -T $(LINKER_SCRIPT) -nostdlib

EXEC = Test.elf

OBJS = start.o main.o perfcounter.o putchar.o

.PHONY: all run dump clean

all: $(EXEC)

$(EXEC): $(OBJS) $(LINKER_SCRIPT)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)

%.o: %.S
	$(CC) $(AFLAGS) -c $< -o $@

%.o: %.s
	$(CC) $(AFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

run: $(EXEC)
	@test -f $(EMU) || (echo "Error: $(EMU) not found" && exit 1)
	@grep -q "ENABLE_ELF_LOADER=1" ../../../build/.config || (echo "Error: ENABLE_ELF_LOADER=1 not set" && exit 1)
	@grep -q "ENABLE_SYSTEM=1" ../../../build/.config || (echo "Error: ENABLE_SYSTEM=1 not set" && exit 1)
	$(EMU) $<

dump: $(EXEC)
	$(OBJDUMP) -Ds $< > dump.txt
	@echo "Output: dump.txt"

clean:
	rm -f $(EXEC) $(OBJS)
