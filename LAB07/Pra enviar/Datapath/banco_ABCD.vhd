library ieee;
use ieee.std_logic_1164.all;

entity banco_ABCD is
	port(	write_ABCD				: in 	std_logic_vector(7 downto 0);
	     	r_addr					: in	std_logic_vector(1 downto 0);
			clk, wr_ABCD			: in  std_logic;
	     	out_ABCD, A				: out std_logic_vector(7 downto 0)
			;B,C,D					: out std_logic_vector(7 downto 0)--teste
			);
end banco_ABCD;

architecture ckt of banco_ABCD is
	component Registrador8Bits is
		port(clock,ld,Preset,Clear	: in std_logic;
				D: in std_logic_vector(7 downto 0);
				Q:out std_logic_vector(7 downto 0));
	end component;

	component mux4x1_8bits is
		port(entrada1,entrada2,
			entrada3,entrada4	: in  std_logic_vector(7 downto 0);
			sel					: in  std_logic_vector(1 downto 0);
			saida				: out std_logic_vector(7 downto 0));
	end component;
	
	component demux1x4_8bits is
		port(	entrada1			: in  std_logic_vector(7 downto 0);
				sel				: in  std_logic_vector(1 downto 0);
				saida1,saida2,
				saida3,saida4	: out std_logic_vector(7 downto 0));
	end component;
	
	component decod2bits is
		port(	entrada		: in  std_logic_vector(1 downto 0);
				saida			: out std_logic_vector(3 downto 0));
	end component;

	signal sregA, sregB, sregC, sregD : std_logic_vector(7 downto 0);
	signal smuxA, smuxB, smuxC, smuxD, sout_ABCD : std_logic_vector(7 downto 0);
	signal sLd_reg : std_logic_vector(3 downto 0);
	
	
begin
	demux_reg 	: demux1x4_8bits 		port map(write_ABCD, r_addr, smuxA, smuxB, smuxC, smuxD);
	mux_reg		: mux4x1_8bits 		port map(sregA, sregB, sregC, sregD, r_addr, sout_ABCD);
	decod 		: decod2bits			port map(r_addr, sLd_reg);
	
	A_pm			: Registrador8Bits 	port map(clk, sLd_reg(0) and wr_ABCD,'1','1',smuxA, sregA);
	B_pm			: Registrador8Bits 	port map(clk, sLd_reg(1) and wr_ABCD,'1','1',smuxB, sregB);
	C_pm			: Registrador8Bits 	port map(clk, sLd_reg(2) and wr_ABCD,'1','1',smuxC, sregC);
	D_pm			: Registrador8Bits 	port map(clk, sLd_reg(3) and wr_ABCD,'1','1',smuxD, sregD);
	
	out_ABCD <= sout_ABCD;
	A 	<= sregA;
	B	<= sregB;
	C	<= sregC;
	D	<= sregD;
end ckt;


