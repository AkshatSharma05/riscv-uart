#define UART0 0x10000000L

volatile unsigned char *uart =
    (volatile unsigned char*) UART0;

void putc(char c)
{
    *uart = c;
}

void puts(char *s)
{
    while (*s)
    {
        putc(*s++);
    }
}

int main()
{
    puts("Hello RISC-V!\n");

    while (1);
}
