;
; LAB10.asm
;
; Created: 10/05/2018 10:32:09
; Author : Camila Barbosa
;

.INCLUDE "m328Pdef.inc"

.ORG   0x0000                  // Tells the next instruction to be written
RJMP   MAIN                    // State that the program begins at the main label

MAIN:
LDI R16, 0xFF               // Load the immedate value 0xFF (all bits 1) into register 16
OUT DDRB, R16               // Set Data Direction Register B to output for all pins
OUT DDRD, R16
; 124

LOOP:
LDI R24, 1 ;;;;;;;;;;;;;;;;;;;;; 1
SBI PORTD, 5
OUT PORTB, R24 
LDI R25, 20
CALL DELAY
CBI PORTD, 5
LDI R24, 7 ;;;;;;;;;;;;;;;;;;;;; 2
SBI PORTD, 6
OUT PORTB, R24
LDI R25, 20
CALL DELAY
CBI PORTD, 6
LDI R24, 1 ;;;;;;;;;;;;;;;;;;;;; 4
SBI PORTD, 7
OUT PORTB, R24
LDI R25, 20
CALL DELAY
CBI PORTD, 7
RJMP LOOP

// Everything beneath is part of the delay loop
DELAY:
LDI R16, 1

OUTER_LOOP:
LDI R24, 0x10;LOW(RAMEND)
LDI R25, 0xF9;LOW(RAMEND)

DELAY_LOOP:
ADIW R24, 1
BRNE DELAY_LOOP
DEC R16
BRNE OUTER_LOOP
RET