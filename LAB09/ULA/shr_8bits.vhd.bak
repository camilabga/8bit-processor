library ieee;
use ieee.std_logic_1164.all;

entity shl_8bits is
	port(i,shift	:in  std_logic_vector(7 downto 0);
	     s			:out std_logic_vector(7 downto 0);
		  carry		:out std_logic);
end shl_8bits;

architecture arq of shl_8bits is
  begin
	s<=i(7 downto 0)				when shift = "00000000" else
		i(6 downto 0)&"0" 		when shift = "00000001" else
		i(5 downto 0)&"00"		when shift = "00000010" else
		i(4 downto 0)&"000"		when shift = "00000011" else
		i(3 downto 0)&"0000"		when shift = "00000100" else
		i(2 downto 0)&"00000"	when shift = "00000101" else
		i(1 downto 0)&"000000"	when shift = "00000110" else
		i(0)&"0000000"				when shift = "00000111" else
		"00000000";
	
	carry	<=	'0'	when shift = "00000000" else
				i(7)	when shift = "00000001" else
				i(6)	when shift = "00000010" else
				i(5)	when shift = "00000011" else
				i(4)	when shift = "00000100" else
				i(3)	when shift = "00000101" else
				i(2)	when shift = "00000110" else
				i(1)	when shift = "00000111" else
				i(0)	when shift = "00001000" else '0';
	
		
  
	 
end arq;


