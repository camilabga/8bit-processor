.ORG   0x0000                  // Tells the next instruction to be written
.INCLUDE "m328Pdef.inc"


;RJMP	teste

setup:
	LDI		r16, 0xFF      
	OUT		DDRB, r16               // Set Data Direction Register B to output for all pins
	LDI		r16, 0xFF;0b11100000
	OUT		DDRD, r16
	LDI		r16, 0b11111000               
	OUT		DDRC, r16
	

setup_adc:
	LDI		r16, 0b01100000
	STS		ADMUX,	r16				//configura saida analog
	LDI		r16, 0b10000111			//adcen
	STS		ADCSRA, r16				//inicia conversao
	

bt:
	CALL	update
	SBIS	PINC,1
	RJMP	bt			;se o bt for 1 atualiza e mantem em loop
	
	CALL	analog_read
	MOV		R22,R16
	MOV		R23,R16


loop:

	CALL	analog_read

	CP		R16,R22	;MAIOR
	BRPL	up
	CP		R16,R23	;MENOR
	BRMI	down
	
	trono_ret:

	MOV		R16, R22
	SUB		R16, R23

	CALL	bin_bcd

	CALL	update 
	
	SBIS	PINC, 1
	RJMP	bt
	
	RJMP	loop




up:	
	MOV		R22,R16
	RJMP	trono_ret

down:	
	MOV		R23,R16
	RJMP	trono_ret

bin_bcd:
	//r18,r19,r20,
	LDI		R18,0
	LDI		R19,0
	LDI		R20,0
	continua:
	CPI		R16,100
	BRSH	tira_100	

	CPI		R16,10
	BRSH	tira_10	
	
	MOV		R20,R16
RET

	
tira_100:
	SUBI	R16,100
	INC		R18		;Unidade
	RJMP	continua

tira_10:
	SUBI	R16,10
	INC		R19		;dezena
	RJMP	continua


	
update:
	;R18(unid)	R19(dez)	R20(cent)
	SBI		PortD, 7
	OUT		PortB, R18
	RCALL  delay_05
	
	CBI		PortD, 7
	SBI		PortD, 6
	OUT		PortB, R19
	RCALL  delay_05
	
	CBI		PortD, 6
	SBI		PortD, 5
	OUT		PortB, R20
	RCALL  delay_05
	
	CBI		PortD, 5
RET
	
	
analog_read:
	//configura adc e espera fim da conversao
	LDI		r16, 0b11000111			//adcen
	STS		ADCSRA, r16				//inicia conversao
	wait_analog:
	LDS		r16, ADCSRA
	SBRS	r16, 4					//pula linha se tiver terminado
	RJMP	wait_analog				

	LDS		r16, ADCH				//resultado da conversao
RET

	
 delay_05:
 LDI    r16, 1

 outer_loop:
 LDI    r24, 0xFF;low(3037)
 LDI    r25, 0xF0;high(3037)

 delay_loop:
 ADIW   r24, 1
 BRNE   delay_loop
 DEC    r16
 BRNE   outer_loop
 RET

    