library ieee;
use ieee.std_logic_1164.all;

entity somador7bits is
	port(a,b:in  std_logic_vector(7 downto 0);
	     c:out std_logic_vector(7 downto 0);
	     cin: in std_logic;
	     cout:out std_logic);
end somador7bits;

architecture sum of somador7bits is
  
  signal s: std_logic_vector (6 downto 0);
  
  component somadorcompleto is
	port(
		a,b,cin: in std_logic;
		s, cout: out std_logic
	);
	end component;
  
	begin
	 
	 SOMA1 : somadorcompleto port map(a(0),b(0),'0',c(0),s(0));
	 SOMA2 : somadorcompleto port map(a(1),b(1),s(0),c(1),s(1));
	 SOMA3 : somadorcompleto port map(a(2),b(2),s(1),c(2),s(2));
	 SOMA4 : somadorcompleto port map(a(3),b(3),s(2),c(3),s(3));
	 SOMA5 : somadorcompleto port map(a(4),b(4),s(3),c(4),s(4));
	 SOMA6 : somadorcompleto port map(a(5),b(5),s(4),c(5),s(5));
	 SOMA7 : somadorcompleto port map(a(6),b(6),s(5),c(6),s(6));
	 SOMA8 : somadorcompleto port map(a(7),b(7),s(6),c(7),cout);		

end sum;