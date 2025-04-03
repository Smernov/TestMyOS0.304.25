CC=i686-elf-gcc
LD=i686-elf-ld
CFLAGS=-ffreestanding -O2 -Wall -Wextra -nostdlib -fno-pic -fno-stack-protector -m32
LDFLAGS=-ffreestanding -O2 -nostdlib -m32

# Исходники
SRC = kernel.c
OBJ = kernel.o

# Результат
OUTPUT = kernel.bin

# Команды для сборки
all: $(OUTPUT)

$(OUTPUT): $(OBJ)
	$(LD) -T linker.ld -o $(OUTPUT) $(OBJ) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o $(OUTPUT)
