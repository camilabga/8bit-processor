library ieee;
use ieee.std_logic_1164.all;

entity registrador8bits is
	port(clock,preset,clear:in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q:out std_logic_vector(7 downto 0));
end registrador8bits;

architecture ckt of registrador8bits is

component FFD is
	port(clk,D,P,C:in std_logic;
	q:out std_logic);
end component;

begin 

	FFD1: FFD port map(clock,D(0),preset,clear,Q(0));
	FFD2: FFD port map(clock,D(1),preset,clear,Q(1));
	FFD3: FFD port map(clock,D(2),preset,clear,Q(2));
	FFD4: FFD port map(clock,D(3),preset,clear,Q(3));
	FFD5: FFD port map(clock,D(4),preset,clear,Q(4));
	FFD6: FFD port map(clock,D(5),preset,clear,Q(5));
	FFD7: FFD port map(clock,D(6),preset,clear,Q(6));
	FFD8: FFD port map(clock,D(7),preset,clear,Q(7));

end ckt;
