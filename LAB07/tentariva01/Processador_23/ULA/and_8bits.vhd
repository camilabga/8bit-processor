library ieee;
use ieee.std_logic_1164.all;

entity and_8bits is
	port(a,b	:in  std_logic_vector(7 downto 0);
	     s	:out std_logic_vector(7 downto 0));
end and_8bits;

architecture arq of and_8bits is
  begin
	s(0) <= a(0) and b(0);
	s(1) <= a(1) and b(1);
	s(2) <= a(2) and b(2);
	s(3) <= a(3) and b(3);
	s(4) <= a(4) and b(4);
	s(5) <= a(5) and b(5);
	s(6) <= a(6) and b(6);
	s(7) <= a(7) and b(7);
	 
end arq;


