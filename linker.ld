ENTRY(kernel_main)

SECTIONS
{
    . = 0x1000;  /* O endereço inicial onde o kernel será carregado */

    .text : {
        *(.text)  /* Coloca todas as seções de código do kernel */
    }

    .data : {
        *(.data)  /* Coloca as seções de dados (se houver) */
    }

    .bss : {
        *(.bss)  /* Memória não inicializada */
    }
}