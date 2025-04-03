#include <stdint.h>

void print_string(const char *str) {
    volatile uint16_t *video_memory = (volatile uint16_t *)0xB8000;
    while (*str) {
        *video_memory = (uint16_t)(*str | 0x0F00); // Белый цвет на черном фоне
        video_memory++;
        str++;
    }
}

void kernel_main() {
    print_string("Hello World\n");
    while(1); // Бесконечный цикл, чтобы система не завершила выполнение
}
