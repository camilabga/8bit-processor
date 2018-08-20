library ieee;
use ieee.std_logic_1164.all;

entity Mux21_7bit is
	port(
	A,B: in std_logic_vector(7 downto 0);
	op:in std_logic;
	C: out std_logic_vector(7 downto 0)
	);
end Mux21_7bit;

architecture arq of Mux21_7bit is

begin
	C <= A when op ='0'
		else B;
end arq;
