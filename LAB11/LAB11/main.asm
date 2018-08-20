; LAB11.asm
; Created: 20/05/2018 13:45:36
; Author : Camila Barbosa


;				R-G-R-B

.INCLUDE "M328PDEF.INC"

.ORG 0x0000

SETUP:
LDI R16, 0b11111000		
OUT DDRB, R16
LDI R16, 0b00011100	
OUT DDRD, R16
CLR r25
LDI R16, 0b00000101
OUT TCCR0B, R16
LDI R16, 0b00000010		; CTC
OUT TCCR0A, R16
LDI R16, 0b11111111
OUT OCR0A, R16

START:
CLR R18					
LDI R20,255		
LDI R26, 60	// 1 segundo		
CLR R15			
LDI R20, 60 // 1 segundo

LDI R22, 0b00011100
OUT PORTD, R22			; Acende tudo
IN R16, PINB			
CPI R16, 0b00000100		
BREQ BLUE_ON				
CPI R16, 0b00000010		
BREQ GREEN_ON				
CPI R16, 0b00000001		
BREQ RED_ON				
JMP START

LOOP:
CPI R25, 4				; Check 4 botoes
BREQ START
IN R16, PINB			
CPI R16, 0b00000100		; B
BREQ BLUE_ON		
CPI R16, 0b00000010		; G 
BREQ GREEN_ON			
CPI R16, 0b00000001		; R 
BREQ RED_ON

COUNTER_CONFIG:
IN R17, TCNT0			; Read the timer
CP R17, R18				; Compare with previous value
MOV R18, R17			; Save current value
BRSH LOOP				; Unless the timer has decreased, repeat
DEC R20					; Decrement the software counter
BRNE LOOP				; If not zero, go back to checking the timer
JMP LOOP2

BLUE_ON:	
LDI R22, 0b00010000
OUT PORTD, R22			
INC R25					
CALL DELAY_LED			
JMP LOOP				

GREEN_ON:
LDI R22, 0b00001000
OUT PORTD, R22			
INC R25					
CALL DELAY_LED			
JMP LOOP				

RED_ON:	
LDI R22, 0b00000100
OUT PORTD, R22			
INC R25					
CALL DELAY_LED
JMP LOOP				

ON_BLUE:	
LDI R22, 0b00010000		
OUT PORTD, R22			
INC R25					
CALL DELAY_LED		
JMP LOOP2			
	
ON_GREEN:							
LDI R22, 0b00001000
OUT PORTD, R22			
INC R25
CALL DELAY_LED		
JMP LOOP2		
		
ON_RED:							
LDI R22, 0b00000100
OUT PORTD, R22
INC R25
CALL DELAY_LED
JMP LOOP2

DELAY_LED: 
LDI R19, 21
LDI R21, 75
LDI R23, 191
PASSA_TEMPO:
DEC R23
BRNE PASSA_TEMPO
DEC R21
BRNE PASSA_TEMPO
DEC R19
BRNE PASSA_TEMPO
LDI R24, 0b00000000
OUT PORTD, R24 
RET

LOOP2:
SBRC R25,3
JMP START
IN R16, PINB			
CPI R16, 0b00000100		; B 
BREQ BLUE_ON				
CPI R16, 0b00000010		; G 
BREQ GREEN_ON				
CPI R16, 0b00000001		; R
BREQ RED_ON			
	
IN R17, TCNT0			; Read the timer
CP R17, R15				; Compare with previous value
MOV R15, R17			; Save current value
BRSH LOOP2				; unless the timer has decreased, repeat
DEC R26					; decrement the software counter
BRNE LOOP2				; if not zero, go back to checking the timer
JMP START