library ieee;
use ieee.std_logic_1164.all;

entity decod_ula is
	port(entrada			:in  std_logic_vector(7 downto 0);
	     saida				:out std_logic_vector(3 downto 0));
end decod_ula;

architecture arq of decod_ula is
begin
	saida<= 	"0000" 	when entrada(7 downto 3) = "10000" else
				"0001"	when entrada(7 downto 3) = "00000" else
				"0010"	when entrada(7 downto 3) = "00001" else
				"0011"	when entrada(7 downto 3) = "01010" else
				"0100"	when entrada(7 downto 3) = "00010" else
				"0101"	when entrada(7 downto 3) = "00011" else
				"0110"	when entrada(7 downto 3) = "00100" else
				"0111"	when entrada(7 downto 3) = "00101" else
				"1000"	when entrada(7 downto 3) = "00110" else
				"1001"	when entrada(7 downto 3) = "00111" else
				"1010"	when entrada(7 downto 3) = "01100" else
				"1011"	when entrada(7 downto 3) = "01101" else
				"1100"	when entrada(7 downto 3) = "01110" else "0000";
					
end arq;


