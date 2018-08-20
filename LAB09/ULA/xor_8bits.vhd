library ieee;
use ieee.std_logic_1164.all;

entity xor_8bits is
	port(a,b	:in  std_logic_vector(7 downto 0);
	     s	:out std_logic_vector(7 downto 0));
end xor_8bits;

architecture arq of xor_8bits is
  begin
	s(0) <= a(0) xor b(0);
	s(1) <= a(1) xor b(1);
	s(2) <= a(2) xor b(2);
	s(3) <= a(3) xor b(3);
	s(4) <= a(4) xor b(4);
	s(5) <= a(5) xor b(5);
	s(6) <= a(6) xor b(6);
	s(7) <= a(7) xor b(7);
	 
end arq;


