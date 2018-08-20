library ieee;
use ieee.std_logic_1164.all;

entity datapath is
	port(	read_data, pc, sp		:in  std_logic_vector(7 downto 0);
	     	op_ula 			:in  std_logic_vector(3 downto 0);
			Sel_addr_mem	:in	std_logic_vector(1 downto 0);
			clk, Sel_mar_mem, Ld_mar_mem, Sel_se_mult, Wr_ABCD, Ld_mar_ABCD, 
			Sel_addr_ABCD, Sel_mem_in, Sel_ABCD_in, Sel_ULA_in, 
			Ld_ULA, Ld_cz, Sel_case_SP: in  std_logic;
	     	write_data, addr_mem	: out std_logic_vector(7 downto 0);
	     	carry,zero						:out std_logic
			;A,B,C,D,reg2				:out std_logic_vector(7 downto 0)--teste
			);
end datapath;

architecture ckt of datapath is

	component Registrador8Bits is
		port(clock,ld,Preset,Clear	: in std_logic;
				D: in std_logic_vector(7 downto 0);
				Q:out std_logic_vector(7 downto 0));
	end component;

	component mux2x1_8bits is
		port(	entrada1,entrada2	: in  std_logic_vector(7 downto 0);
				sel					: in  std_logic;
				saida					: out std_logic_vector(7 downto 0));
	end component;

	component mux4x1_8bits is
		port(	entrada1,entrada2,
				entrada3,entrada4	: in  std_logic_vector(7 downto 0);
				sel					: in  std_logic_vector(1 downto 0);
				saida					: out std_logic_vector(7 downto 0));
	end component;

	component banco_ABCD is
		port(	write_ABCD				: in 	std_logic_vector(7 downto 0);
				r_addr					: in	std_logic_vector(1 downto 0);
				clk, wr_ABCD			: in  std_logic;
				out_ABCD, A				: out std_logic_vector(7 downto 0)
				;B,C,D					: out std_logic_vector(7 downto 0)--teste
			);
	end component;
	
	component ula is
		port(A,entrada			:in  std_logic_vector(7 downto 0);
			  sel_op				:in  std_logic_vector(3 downto 0);
			  ld_cz, clk, ld	:in  std_logic;
			  saida				:out std_logic_vector(7 downto 0);
			  c,z					:out std_logic
			;reg2			:out std_logic_vector(7 downto 0));
	end component;

	signal  sA,spc_sp,sout_mar_mem, sout_ABCD,sout_mar_ABCD, saddr_mem, 
				smux_out_se_mult, sr_addr, sula_out, sABCD_in, swrite_data,sout_mux_mar_mem,
				sULA_in
			: std_logic_vector(7 downto 0);
	signal sB, sC, sD, sentrada2: std_logic_vector(7 downto 0);
	signal scarry, szero : std_logic;
	
begin
	mux_addr 		: mux4x1_8bits port map(spc_sp, sout_mar_mem, sout_ABCD, sout_mar_ABCD, Sel_addr_mem, saddr_mem);
	addr_mem <= saddr_mem;

	mar_abcd 		: Registrador8Bits 	port map(clk,Ld_mar_ABCD ,'1','1', read_data, sout_mar_ABCD);
	mar_mem 			: Registrador8Bits 	port map(clk,Ld_mar_mem  ,'1','1', sout_mux_mar_mem, sout_mar_mem);
	
	mux_se_mult		: mux2x1_8bits		port map(sout_mar_ABCD,"00000000",Sel_se_mult, smux_out_se_mult);
	mux_addr_ABCD	: mux2x1_8bits		port map(smux_out_se_mult,read_data,Sel_addr_ABCD, sr_addr);
	
	mux_mar_mem		: mux2x1_8bits		port map(read_data, sout_ABCD, Sel_addr_ABCD, sout_mux_mar_mem);
	
	mux_case_sp		: mux2x1_8bits		port map(pc, sp, Sel_case_SP, spc_sp);
	
	mux_mem_in		: mux2x1_8bits		port map(sula_out,pc,Sel_mem_in, swrite_data);
	
	mux_ABCD_in		: mux2x1_8bits		port map(read_data, sula_out, Sel_ABCD_in, sABCD_in);
	b_abcd_pm		: banco_ABCD		port map(sABCD_in, sr_addr(1 downto 0),clk, Wr_ABCD, sout_ABCD, sA,sB, sC, sD);
	
	mux_ULA_in		: mux2x1_8bits		port map(sout_ABCD, read_data, Sel_ULA_in, sULA_in);
	ula_pm			: ula					port map(sA, sULA_in, op_ula, Ld_cz, clk, Ld_ULA, sula_out, scarry, szero, sentrada2);
	
	
	addr_mem	 <= saddr_mem;
	write_data <= swrite_data;
	carry <= scarry;
	zero  <= szero;
	A <= sA;
	B <= sB;
	C <= sC;
	D <= sD;
	reg2<=sentrada2;
end ckt;


