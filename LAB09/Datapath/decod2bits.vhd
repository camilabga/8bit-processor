library ieee;
use ieee.std_logic_1164.all;

entity decod2bits is
		port(	entrada		: in  std_logic_vector(1 downto 0);
				saida			: out std_logic_vector(3 downto 0));
end decod2bits;

architecture ckt of decod2bits is
begin
saida	<=  "0001" when (entrada = "00") else 
          "0010" when (entrada = "01") else 
          "0100" when (entrada = "10") else 
          "1000";
end ckt;