library ieee;
use ieee.std_logic_1164.all;

entity ula is
	port(A,entrada			:in  std_logic_vector(7 downto 0):="00000000";
	     sel_op				:in  std_logic_vector(3 downto 0);
		  ld_cz, clk, ld		:in  std_logic;
	     saida				:out std_logic_vector(7 downto 0);
	     c,z					:out std_logic
		  ;reg2			:out std_logic_vector(7 downto 0)
		  );
end ula;

architecture arq of ula is
	component somador8bits is 				--0001
		port(a,b	:in  std_logic_vector(7 downto 0);
			  c	:out std_logic_vector(7 downto 0);
			  cin	: in std_logic;
			  cout:out std_logic);
	end component;
	
	component subtrator8bits is 			--0010
		port(a,b		:in  std_logic_vector(7 downto 0);
			  c		:out std_logic_vector(7 downto 0);
			  cout	:out std_logic);
	end component;
	
	component mult_8bits is
		port(a,b			:in  std_logic_vector(7 downto 0);
			  c			:out std_logic_vector(7 downto 0);
			  carry		:out std_logic);
	end component;
	
	component and_8bits is					--0100
		port(a,b	:in  std_logic_vector(7 downto 0);
			  s	:out std_logic_vector(7 downto 0));
	end component;
	
	component or_8bits is					--0101
		port(a,b	:in  std_logic_vector(7 downto 0);
			  s	:out std_logic_vector(7 downto 0));
	end component;
	
	component xor_8bits is					--0110
		port(a,b	:in  std_logic_vector(7 downto 0);
			  s	:out std_logic_vector(7 downto 0));
	end component;
		
	component shl_8bits is					--0111
		port(i,shift	:in  std_logic_vector(7 downto 0);
			  s			:out std_logic_vector(7 downto 0);
			  carry		:out std_logic);
	end component;
		
	component shr_8bits is					--1000
		port(i,shift	:in  std_logic_vector(7 downto 0);
			  s			:out std_logic_vector(7 downto 0);
			  carry		:out std_logic);
	end component;
	
	component comparador_8bits is			--1001
    port(a,b						: in  std_logic_vector(7 downto 0);
         maior, igual, menor	: out std_logic);
	end component;

	component not_8bits is 					--1100
		port(i	:in  std_logic_vector(7 downto 0);
			  s	:out std_logic_vector(7 downto 0));
	end component;
	
	component Registrador8Bits is
			port(clock,ld,Preset,Clear	: in std_logic;
			D: in std_logic_vector(7 downto 0);
			Q:out std_logic_vector(7 downto 0));
	end component;
	component FFD is
		port(clk,D,P,C:in std_logic;
			q:out std_logic);
	end component;
		
	signal res_op, entrada2	: std_logic_vector(7 downto 0);
	signal 	sres0, sres1, sres2, sres3, sres4, sres5, sres6, sres7, 
	sres8, sres10, sres11, sres12 : std_logic_vector(7 downto 0);
	
	signal D_c,Q_c,	sc0, sc1, sc2, sc3, 
	sc7, sc8, sc9, sc10, sc11 : std_logic;
	
	signal D_z,Q_z, sz : std_logic;
	
begin
	op_pm1	: somador8bits 		port map(entrada2, entrada, sres1, '0', sc1);
	op_pm2	: subtrator8bits		port map(entrada, entrada2, sres2, sc2);
	op_pm3	: mult_8bits			port map(entrada2, A, sres3, sc3);
	op_pm4	: and_8bits				port map(entrada2, entrada, sres4);
	op_pm5	: or_8bits				port map(entrada2, entrada, sres5);	
	op_pm6	: xor_8bits				port map(entrada2, entrada, sres6);
	op_pm7	: shl_8bits				port map(entrada, entrada2, sres7, sc7);
	op_pm8	: shr_8bits				port map(entrada, entrada2, sres8, sc8);
	op_pm9	: comparador_8bits	port map(entrada2, entrada, open, sz, sc9);
	op_pm10	: somador8bits 		port map(entrada, "00000001", sres10, '0', sc10);
	op_pm11	: somador8bits 		port map(entrada, "11111111", sres11, '0', sc11);
	op_pm12	: not_8bits 			port map(entrada, sres12);

	res_op <= 	entrada2 when sel_op = "0000" else
					sres1		when sel_op = "0001" else
					sres2		when sel_op = "0010" else
					sres3		when sel_op = "0011" else
					sres4		when sel_op = "0100" else
					sres5		when sel_op = "0101" else
					sres6		when sel_op = "0110" else
					sres7		when sel_op = "0111" else
					sres8		when sel_op = "1000" else
					sres10	when sel_op = "1010" else
					sres11	when sel_op = "1011" else
					sres12	when sel_op = "1100" else "00000000";
	
	reg_c			: FFD port map(clk,((D_c and ld_cz) or (Q_c and not ld_cz)),'1','1',Q_c);
	reg_z			: FFD port map(clk,((D_z and ld_cz) or (Q_z and not ld_cz)),'1','1',Q_z);
	
	D_c<= sc1		when sel_op = "0001" else
			sc2		when sel_op = "0010" else
			sc3		when sel_op = "0011" else
			sc7		when sel_op = "0111" else
			sc8		when sel_op = "1000" else
			sc9		when sel_op = "1001" else
			sc10		when sel_op = "1010" else
			sc11		when sel_op = "1011" else '0';

	D_z <= sz 		when sel_op = "1001" else '0';
	reg 		: Registrador8Bits	port map(clk,ld,'1','1', entrada, entrada2);
	
	c<=Q_c;
	z<=Q_z;
	saida <= res_op;
	reg2 <= entrada2;
end arq;


