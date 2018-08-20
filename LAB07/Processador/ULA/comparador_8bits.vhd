library ieee;
use ieee.std_logic_1164.all;


entity comparador_8bits is
    port(a,b						: in  std_logic_vector(7 downto 0);
         maior, igual, menor	: out std_logic);
end comparador_8bits;

architecture ckt of comparador_8bits is


begin

	maior <= '1' when a > b else '0';
	igual <= '1' when a = b else '0';
	menor <= '1' when a < b else '0';
		
end ckt;