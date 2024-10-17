# Define os arquivos
BOOTLOADER_SRC = ./bootloader/boot.asm
BOOTLOADER_BIN = ./bootloader/boot.bin
KERNEL_BIN = ./kernel/kernel.bin
OS_BIN = ./output/os.bin

# Compila o bootloader com NASM
$(BOOTLOADER_BIN): $(BOOTLOADER_SRC)
	nasm -f bin $(BOOTLOADER_SRC) -o $(BOOTLOADER_BIN)

# Combina o bootloader e o kernel em um único arquivo binário
$(OS_BIN): $(BOOTLOADER_BIN) $(KERNEL_BIN)
	cat $(BOOTLOADER_BIN) $(KERNEL_BIN) > $(OS_BIN)

# Regra para rodar o QEMU automaticamente após criar o sistema operacional
run: $(OS_BIN)
	qemu-system-i386 -fda $(OS_BIN)

# Limpa os arquivos gerados
clean:
	rm -f $(BOOTLOADER_BIN) $(OS_BIN)