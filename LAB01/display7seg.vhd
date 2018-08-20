library ieee;
use ieee.std_logic_1164.all;

entity display is
	port(inn: in std_logic_vector (3 downto 0);
		outt: out std_logic_vector (6 downto 0));
end display;	

architecture seg7 of display is
	begin
	outt <= "1000000" when inn = "0000"
			else "1111001" when inn = "0001"
			else "0100100" when inn = "0010"
			else "0110000" when inn = "0011"
			else "0011001" when inn = "0100"
			else "0010010" when inn = "0101"
			else "0000010" when inn = "0110"
			else "1111000" when inn = "0111"
			else "0000000" when inn = "1000"
			else "0010000" when inn = "1001"
			else "1000000";
end seg7;