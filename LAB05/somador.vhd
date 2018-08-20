library ieee;
use ieee.std_logic_1164.all;

entity somador4bits is
	port(a,b:in  std_logic_vector(3 downto 0);
	     c:out std_logic_vector(3 downto 0);
	     cin: in std_logic;
	     cout:out std_logic);
end somador4bits;

architecture sum of somador4bits is
  
  signal s: std_logic_vector (2 downto 0);
  
  component somador_bit is
	port(a,b,cin: in std_logic;
		s, cout: out std_logic);
	end component;
  
	begin
	 
	SOMA1 : somador_bit port map(a(0),b(0),cin,c(0),s(0));
	SOMA2 : somador_bit port map(a(1),b(1),s(0),c(1),s(1));
	SOMA3 : somador_bit port map(a(2),b(2),s(1),c(2),s(2));
	SOMA4 : somador_bit port map(a(3),b(3),s(2),c(3),cout);	

end sum;