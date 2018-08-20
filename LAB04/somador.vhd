library ieee;
use ieee.std_logic_1164.all;

entity somador10bits is
	port(a,b:in  std_logic_vector(9 downto 0);
	     c:out std_logic_vector(9 downto 0);
	     cin: in std_logic;
	     cout:out std_logic);
end somador10bits;

architecture sum of somador10bits is
  
  signal s: std_logic_vector (8 downto 0);
  
  component somador_bit is
	port(a,b,cin: in std_logic;
		s, cout: out std_logic);
	end component;
  
	begin
	 
	SOMA1 : somador_bit port map(a(0),b(0),cin,c(0),s(0));
	SOMA2 : somador_bit port map(a(1),b(1),s(0),c(1),s(1));
	SOMA3 : somador_bit port map(a(2),b(2),s(1),c(2),s(2));
	SOMA4 : somador_bit port map(a(3),b(3),s(2),c(3),s(3));
	SOMA5 : somador_bit port map(a(4),b(4),s(3),c(4),s(4));
	SOMA6 : somador_bit port map(a(5),b(5),s(4),c(5),s(5));
	SOMA7 : somador_bit port map(a(6),b(6),s(5),c(6),s(6));
	SOMA8 : somador_bit port map(a(7),b(7),s(6),c(7),s(7));
	SOMA9 : somador_bit port map(a(8),b(8),s(7),c(8),s(8));
	SOMA0 : somador_bit port map(a(9),b(9),s(8),c(9),cout);	

end sum;