.include "m328pdef.inc"

.org 0000

Main:
    ; Configura os pinos do PORTB como entrada
    LDI R16, 0b00000000
    OUT DDRB, R16

    ; Configura os pinos do PORTC como entrada
    LDI R16, 0b00000000
    OUT DDRC, R16

    ; Configura os pinos do PORTD como saída
    LDI R16, 0b11111111
    OUT DDRD, R16

Loop:
    ; Lê o primeiro operando do PORTB
    IN R16, PINB

    ; Lê a operação a ser realizada do PORTC
    IN R17, PINC

    ; Lê o segundo operando do PORTB
    IN R18, PINB

Soma:
    ADD R16, R18 ; Soma os operandos e armazena o resultado em R16
    JMP EscreveResultado

EscreveResultado:
    ; Escreve o resultado no PORTD
    OUT PORTD, R16

    ; Pula para o próximo ciclo do loop
    RJMP Loop

