library ieee;
use ieee.std_logic_1164.all;

entity shr_8bits is
	port(i,shift	:in  std_logic_vector(7 downto 0);
	     s			:out std_logic_vector(7 downto 0);
		  carry		:out std_logic);
end shr_8bits;

architecture arq of shr_8bits is
  begin
	s<=i(7 downto 0)				when shift = "00000000" else
		"0"&i(7 downto 1) 		when shift = "00000001" else
		"00"&i(7 downto 2)		when shift = "00000010" else
		"000"&i(7 downto 3)		when shift = "00000011" else
		"0000"&i(7 downto 4)		when shift = "00000100" else
		"00000"&i(7 downto 5)	when shift = "00000101" else
		"000000"&i(7 downto 6)	when shift = "00000110" else
		"0000000"&i(7)				when shift = "00000111" else
		"00000000";
	
	carry	<=	i(0)	when shift = "00000001" else
				i(1)	when shift = "00000010" else
				i(2)	when shift = "00000011" else
				i(3)	when shift = "00000100" else
				i(4)	when shift = "00000101" else
				i(5)	when shift = "00000110" else
				i(6)	when shift = "00000111" else
				i(7)	when shift = "00001000" else '0';
	
		
  
	 
end arq;


