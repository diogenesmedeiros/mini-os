void kernel_main() __attribute__((section(".text")));
void kernel_main() {
    const char *msg = "Hello, Mini OS!";
    char *video_memory = (char *)0xb8000;  // Endereço de memória de vídeo
    int i = 0;

    // Exibe a mensagem "Hello, Mini OS!" no modo texto
    while (msg[i] != '\0') {
        video_memory[i * 2] = msg[i];       // Coloca o caractere
        video_memory[i * 2 + 1] = 0x07;     // Cor do texto (branco no preto)
        i++;
    }

    while (1) {}  // Loop infinito
}