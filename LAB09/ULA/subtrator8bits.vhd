library ieee;
use ieee.std_logic_1164.all;

entity subtrator8bits is
	port(
	     a,b	:in  std_logic_vector(7 downto 0);
	     c	:out std_logic_vector(7 downto 0);
	     cout:out std_logic
	);
end subtrator8bits;

architecture arq of subtrator8bits is
  
  signal s		: std_logic_vector (7 downto 0);
  signal b_negado, b_a2		: std_logic_vector (7 downto 0); 
  
	component somadorcompleto is
		port(a,b,cin	: in std_logic;
				s, cout	: out std_logic);
	end component;
	component not_8bits is
		port(i	:in  std_logic_vector(7 downto 0);
			  s	:out std_logic_vector(7 downto 0));
	end component;
	component somador8bits is
		port(a,b	:in  std_logic_vector(7 downto 0);
			  c	:out std_logic_vector(7 downto 0);
			  cin	: in std_logic;
			  cout:out std_logic);
	end component;
  
	begin
	 not_b			: not_8bits port map(b, b_negado);
	 mais_um			: somador8bits port map(b_negado,"00000001",b_a2,'0',open);
	 
	 H1 : somadorcompleto port map(a(0),b_a2(0),'0',c(0),s(0));
	 H2 : somadorcompleto port map(a(1),b_a2(1),s(0),c(1),s(1));
	 H3 : somadorcompleto port map(a(2),b_a2(2),s(1),c(2),s(2));
	 H4 : somadorcompleto port map(a(3),b_a2(3),s(2),c(3),s(3));
	 H5 : somadorcompleto port map(a(4),b_a2(4),s(3),c(4),s(4));
	 H6 : somadorcompleto port map(a(5),b_a2(5),s(4),c(5),s(5));
	 H7 : somadorcompleto port map(a(6),b_a2(6),s(5),c(6),s(6));
	 H8 : somadorcompleto port map(a(7),b_a2(7),s(6),c(7),cout);		 

end arq;


