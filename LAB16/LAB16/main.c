/*
 * LAB16.c
 *
 * Created: 29/05/2018 11:35:03
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

unsigned char x ;
unsigned char x1;
unsigned char x2;

void senoide(){
	x = 0;
	for(int i=0; i<=FREQ; i++){
		x = sin((i/FREQ) * 2*C_PI)*127+127;
		
		x1 = x;
		x2 = x;
		
		x1 = x1*4 ;
		x2 = x2/64;
		
		PORTD = x1;
		PORTB = x2;
		
		if(PINC != 0b00000000){
			break;
		}
		
		_delay_loop_2(3);
	
	}
}

void quadrada(){
	x = 0;
	for(int i=0;i<=FREQ;i++){
		if(i<(FREQ/2)){
			x = 255;
			}else{
			x = 0;
		}
		
		x1 = x;
		x2 = x;
		
		x1 = x1*4 ;
		x2 = x2/64;
		
		PORTD = x1;
		PORTB = x2;
		
		if(PINC != 0b00000001){
			break;
		}
		
		_delay_loop_2(670);
	}
}

void triangular(){
	x = 0;
	for(int i=0;i<=(FREQ/2);i++){
		x = (i/(FREQ/2))*255;
		
		x1 = x;
		x2 = x;
		
		x1 = x1*4 ;
		x2 = x2/64;
		
		PORTD = x1;
		PORTB = x2;
		
		if(PINC != 0b00000010){
			return;
		}
		
		_delay_loop_2(520);
	}
	
	for(int i=FREQ/2;i>=0;i--){
		x = (i/(FREQ/2))*255;
		
		x1 = x;
		x2 = x;
		
		x1 = x1*4 ;
		x2 = x2/64;
		
		PORTD = x1;
		PORTB = x2;
		
		if(PINC != 0b00000010){
			break;
		}
		
		_delay_loop_2(520);
	}
}

void setup(){
	DDRB = 0b00000011;
	DDRC = 0b11111100;
	DDRD = 0b11111100;
}

int main(void){
	setup();
	
    while (1) {
		if(PINC == 0b00000000){
			senoide();
		} else if(PINC == 0b00000001) {
			quadrada();
		} else if(PINC == 0b00000010) {
			triangular();
		}
    }
}