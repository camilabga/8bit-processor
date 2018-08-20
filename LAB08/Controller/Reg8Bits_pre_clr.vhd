library ieee;
use ieee.std_logic_1164.all;

entity Reg8Bits_pre_clr is
	port(clock,ld				: in std_logic;
			Preset,Clear, D	: in std_logic_vector(7 downto 0);
			Q						:out std_logic_vector(7 downto 0));
end Reg8Bits_pre_clr;

architecture ckt of Reg8Bits_pre_clr is

component FFD is
	port(clk,D,P,C	:in std_logic;
			q:out std_logic);
end component;

signal z, sQ	:std_logic_vector(7 downto 0);
begin 

	z(0) 	<= ((D(0) and ld) or(sQ(0) and not ld));
	z(1) 	<= ((D(1) and ld) or(sQ(1) and not ld));
	z(2) 	<= ((D(2) and ld) or(sQ(2) and not ld));
	z(3) 	<= ((D(3) and ld) or(sQ(3) and not ld));
	z(4) 	<= ((D(4) and ld) or(sQ(4) and not ld));
	z(5) 	<= ((D(5) and ld) or(sQ(5) and not ld));
	z(6) 	<= ((D(6) and ld) or(sQ(6) and not ld));
	z(7) 	<= ((D(7) and ld) or(sQ(7) and not ld));
	
	FFD0: FFD port map(clock,z(0),Preset(0),Clear(0),sQ(0));
	FFD1: FFD port map(clock,z(1),Preset(1),Clear(1),sQ(1));
	FFD2: FFD port map(clock,z(2),Preset(2),Clear(2),sQ(2));
	FFD3: FFD port map(clock,z(3),Preset(3),Clear(3),sQ(3));
	FFD4: FFD port map(clock,z(4),Preset(4),Clear(4),sQ(4));
	FFD5: FFD port map(clock,z(5),Preset(5),Clear(5),sQ(5));
	FFD6: FFD port map(clock,z(6),Preset(6),Clear(6),sQ(6));
	FFD7: FFD port map(clock,z(7),Preset(7),Clear(7),sQ(7));

	Q <= sQ;
	
end ckt;
