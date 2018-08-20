/*
 * LAB17.c
 *
 * Created: 29/05/2018 11:42:57
 * Author : Camila Barbosa
 */ 

#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>
#include <avr/interrupt.h>

#define set_bit(Y,bit_x) (Y|=(1<<bit_s))
#define clr_bit(Y,bit_x) (Y&=~(1<<bit_x))
#define tst_bit(Y,bit_x) (Y&(1<<bit_x))
#define cpl_bit(Y,bit_x) (Y^=(1<<bit_x))

#define C_PI 3.1415
#define FREQ 93.0
#define PERIODO_60Hz 16.666 //ms

double x, x1, x2,z;
unsigned char saida1, saida2;

void modulador(){
	x = 0;
	for(int i=0; i<=FREQ; i++){
		x = cos((i/FREQ) * 2*C_PI)*z;
		//x = z;
		
		x = x/2;
		
		saida1 = (char) x + 127;
		saida2 = (char) x + 127;
		
		x1 = saida1;
		x2 = saida2;
		
		x1 = x1*4 ;
		x2 = x2/64;
		
		PORTD = x1;
		PORTB = x2;
		
		//PORTB = saida1;
		
		//_delay_loop_2(3);
	}
}

void setup(){
	DDRB = 0b00000011;
	DDRC = 0b11111100;
	DDRD = 0b11111100;

	ADMUX = 0x60;
	ADCSRA = 0xCF;	
}

ISR(ADC_vect){
	z = ADCH;
	//z = z;
	ADCSRA |= 0x40;
}

int main(void){
	setup();
	sei();
	while (1) {
		modulador();
	}
}