library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_8bits is
    port(entrada1,entrada2	: in  std_logic_vector(7 downto 0);
			sel					: in  std_logic;
         saida					: out std_logic_vector(7 downto 0));
end mux2x1_8bits;

architecture ckt of mux2x1_8bits is
begin
saida		<= entrada1 when (sel = '0') else 
            entrada2;
end ckt;