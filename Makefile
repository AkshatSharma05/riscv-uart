CC = riscv64-unknown-elf-gcc

CFLAGS = \
    -march=rv32imac \
    -mabi=ilp32 \
    -nostdlib \
    -ffreestanding

all:
	$(CC) $(CFLAGS) \
	start.S main.c \
	-T linker.ld \
	-o kernel.elf

run:
	qemu-system-riscv32 \
	-machine virt \
	-nographic \
	-bios none \
	-kernel kernel.elf
