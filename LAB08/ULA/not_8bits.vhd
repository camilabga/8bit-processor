library ieee;
use ieee.std_logic_1164.all;

entity not_8bits is
	port(
	     i	:in  std_logic_vector(7 downto 0);
	     s	:out std_logic_vector(7 downto 0)
	);
end not_8bits;

architecture arq of not_8bits is
  begin
	s(0) <= not i(0);
	s(1) <= not i(1);
	s(2) <= not i(2);
	s(3) <= not i(3);
	s(4) <= not i(4);
	s(5) <= not i(5);
	s(6) <= not i(6);
	s(7) <= not i(7);
	 
end arq;


