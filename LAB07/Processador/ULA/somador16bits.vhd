library ieee;
use ieee.std_logic_1164.all;

entity somador16bits is
	port(
	     a,b	:in  std_logic_vector(15 downto 0);
	     c	:out std_logic_vector(15 downto 0);
	     cin	: in std_logic;
	     cout:out std_logic
	);
end somador16bits;

architecture arq of somador16bits is
  
  signal s: std_logic_vector (15 downto 0);
  
  component somadorcompleto is
	port(
		a,b,cin	: in std_logic;
		s, cout	: out std_logic
	);
	end component;
  
	begin
	 
	 H1 : somadorcompleto port map(a(0),b(0),cin,c(0),s(0));
	 H2 : somadorcompleto port map(a(1),b(1),s(0),c(1),s(1));
	 H3 : somadorcompleto port map(a(2),b(2),s(1),c(2),s(2));
	 H4 : somadorcompleto port map(a(3),b(3),s(2),c(3),s(3));
	 H5 : somadorcompleto port map(a(4),b(4),s(3),c(4),s(4));
	 H6 : somadorcompleto port map(a(5),b(5),s(4),c(5),s(5));
	 H7 : somadorcompleto port map(a(6),b(6),s(5),c(6),s(6));
	 H8 : somadorcompleto port map(a(7),b(7),s(6),c(7),s(7));
	 H9 : somadorcompleto port map(a(8),b(8),s(7),c(8),s(8));
	 H10 : somadorcompleto port map(a(9),b(9),s(8),c(9),s(9));
	 H11 : somadorcompleto port map(a(10),b(10),s(9),c(10),s(10));
	 H12 : somadorcompleto port map(a(11),b(11),s(10),c(11),s(11));
	 H13 : somadorcompleto port map(a(12),b(12),s(11),c(12),s(12));
	 H14 : somadorcompleto port map(a(13),b(13),s(12),c(13),s(13));
	 H15 : somadorcompleto port map(a(14),b(14),s(13),c(14),s(14));
	 H16 : somadorcompleto port map(a(15),b(15),s(14),c(15),cout);		 
	end arq;


