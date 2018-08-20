;
; LAB12.asm
;
; Created: 15/05/2018 09:33:29
; Author : Camila Barbosa
;


.INCLUDE "m328Pdef.inc"

;.ORG   0x0000                  // Tells the next instruction to be written
;RJMP   SETUP                    // State that the program begins at the main label

SETUP:
;;; ENTRADAS E SA�DAS - DEFINES
LDI R16, 0x02               
OUT DDRB, R16               

LDI R16, 0x00
OUT DDRC, R16

LDI R16, 0b11111100
OUT DDRD, R16

;;;; ADMUX CONFIGURACAO
LDI R16, 0b01100000
STS ADMUX, R16

;; TCCRnn CONFIGURACAO
LDI R16, 0b10100001
STS TCCR1A, R16

LDI R16, 0b00001001
STS TCCR1B, R16

LDI R16, 0xEF
STS OCR1AL, R16

LDI R16, 0x00
STS OCR1AH, R16

/*;; ADCSRA CONFIGURACAO
LDI R16, 0b11000111
STS ADCSRA, R16 ;seta ADEN e ADSC p 1*/

LOOP_LEITURA:
LDI R16, 0b11000111
STS ADCSRA, R16 ;seta ADEN e ADSC p 1

ESPERA:
LDS R16, ADCSRA
SBRS R16, 4 ; ver se ADIF � 1
RJMP ESPERA

LDS R16, ADCH // copia o valor analogico para o reg21
LDS R17, ADCL // copia o valor analogico para o reg22
//OUT PORTD, R22

STS OCR1AH, R17
STS OCR1AL, R16

;LDI R27, 0xFF
;CALL DELAY0
RJMP LOOP_LEITURA

/*DELAY0:
DEC R27
CPI R27, 0
BRNE DELAY0
LDI R27, 0xFF
DELAY1:
DEC R27
CPI R27, 0
BRNE DELAY1
RET*/

;LDI R21, 128
;STS OCR0A, R21 // copia o valor analogico para o registrador de comparar (TIMER)



;RJMP LOOP_LEITURA


/*LDI R17, 0x00
LOOP: 
SBI PORTB, 1
LIGA: 
INC R17
CP R17, R21
BRNE LIGA
CBI PORTB, 1
APAGA:
INC R17
CPI R17, 0xFF
BRNE APAGA
JMP LOOP_LEITURA*/

//OUT PORTB, R21

/*CPI R21, 128
BRLO APAGA
SBI PORTB, 5
RJMP LOOP_LEITURA

APAGA:
CBI PORTB, 5
RJMP LOOP_LEITURA
*/
;LOOP:
;SBI PORTB, 5
;CALL DELAY
;CBI PORTB, 5
;CALL DELAY
;RJMP LOOP_LEITURA

// Everything beneath is part of the delay loop
//DELAY:
//LDI R16, 80

//OUTER_LOOP:
//LDI R24, 0x10;LOW(RAMEND)
//LDI R25, 0xF0;LOW(RAMEND)

//DELAY_LOOP:
//ADIW R24, 1
//BRNE DELAY_LOOP
//DEC R16
//BRNE OUTER_LOOP
//RET