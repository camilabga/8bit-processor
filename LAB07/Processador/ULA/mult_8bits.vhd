library ieee;
use ieee.std_logic_1164.all;

entity mult_8bits is
	port(a,b			:in  std_logic_vector(7 downto 0);
	     c			:out std_logic_vector(7 downto 0);
	     carry		:out std_logic);
end mult_8bits;

architecture arq of mult_8bits is
  
  signal res_mult0,res_mult1,res_mult2,res_mult3,res_mult4,
							res_mult5,res_mult6,res_mult7: std_logic_vector (15 downto 0):="0000000000000000";
  signal res_soma0,res_soma1,res_soma2,res_soma3,res_soma4,
							res_soma5,res_soma6,res_soma7: std_logic_vector (15 downto 0):="0000000000000000";
  signal c0,c1,c2,c3,c4,
							c5,c6: std_logic;
  
	component mux2x1_8bits is
		 port(entrada1,entrada2	: in  std_logic_vector(7 downto 0);
				sel					: in  std_logic;
				saida					: out std_logic_vector(7 downto 0));
	end component;
	
	component somador16bits is
		port(a,b	:in  std_logic_vector(15 downto 0);
			  c	:out std_logic_vector(15 downto 0);
			  cin	: in std_logic;
			  cout:out std_logic);
	end component;
  
	begin
	 Mult0 : mux2x1_8bits 	port map(a,"00000000",not b(0),res_mult0(7  downto 0));
	 Mult1 : mux2x1_8bits 	port map(a,"00000000",not b(1),res_mult1(8  downto 1));
	 Mult2 : mux2x1_8bits 	port map(a,"00000000",not b(2),res_mult2(9  downto 2));
	 Mult3 : mux2x1_8bits 	port map(a,"00000000",not b(3),res_mult3(10 downto 3));
	 Mult4 : mux2x1_8bits 	port map(a,"00000000",not b(4),res_mult4(11 downto 4));
	 Mult5 : mux2x1_8bits 	port map(a,"00000000",not b(5),res_mult5(12 downto 5));
	 Mult6 : mux2x1_8bits 	port map(a,"00000000",not b(6),res_mult6(13 downto 6));
	 Mult7 : mux2x1_8bits 	port map(a,"00000000",not b(7),res_mult7(14 downto 7));
	 	 
	 Soma1 : somador16bits 	port map(res_mult0,res_mult1,res_soma0,'0',c1);
	 Soma2 : somador16bits 	port map(res_soma0,res_mult2,res_soma1,c1,c2);
	 Soma3 : somador16bits 	port map(res_soma1,res_mult3,res_soma2,c2,c3);
	 Soma4 : somador16bits 	port map(res_soma2,res_mult4,res_soma3,c3,c4);
	 Soma5 : somador16bits 	port map(res_soma3,res_mult5,res_soma4,c4,c5);
	 Soma6 : somador16bits 	port map(res_soma4,res_mult6,res_soma5,c5,c6);
	 Soma7 : somador16bits 	port map(res_soma5,res_mult7,res_soma6,c6,open);
	 
	 carry <= '0' when res_soma6(15 downto 8) = "00000000" else '1';
	 
	 c <= res_soma6(7 downto 0);
	 
	end arq;


