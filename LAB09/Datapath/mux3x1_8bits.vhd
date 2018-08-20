library ieee;
use ieee.std_logic_1164.all;

entity mux3x1_8bits is
    port(entrada1,entrada2, entrada3	: in  std_logic_vector(7 downto 0);
			sel					: in  std_logic_vector(1 downto 0);
         saida					: out std_logic_vector(7 downto 0));
end mux3x1_8bits;

architecture ckt of mux3x1_8bits is
begin
saida		<=  entrada1 when (sel = "00") else 
				 entrada2 when (sel = "01") else 
				 entrada3 when (sel = "10") else
				 "00000000";
end ckt;