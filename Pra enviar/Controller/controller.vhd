library ieee;
use ieee.std_logic_1164.all;

entity controller is
		port(	read_data					:in 	std_logic_vector(7 downto 0);
				carry, z, clk				: in  std_logic;
				op_ula 						:out  std_logic_vector(3 downto 0);
				Sel_addr_mem				:out	std_logic_vector(1 downto 0);
				Sel_mar_mem, Ld_mar_mem, Sel_se_mult, Wr_ABCD, Ld_mar_ABCD, 
				Sel_addr_ABCD, Sel_mem_in, Sel_ABCD_in, Sel_ULA_in, 
				Ld_ULA, Ld_cz, Sel_case_SP,wr_mem 	: out  std_logic;
				pc,sp		: out std_logic_vector(7 downto 0)
				;Ld_PC, Ld_IR  :out std_logic						--teste
				;opcode	: out std_logic_vector(7 downto 0)	--teste
				);
end controller;

architecture arq of controller is
	component mux2x1_8bits is
		port(	entrada1,entrada2	: in  std_logic_vector(7 downto 0);
				sel					: in  std_logic;
				saida					: out std_logic_vector(7 downto 0));
	end component;
	
	component contador_8bits_up_down is
		port (up_down, clk, ld	: in  std_logic;
				pre,clr				: in  std_logic_vector(7 downto 0);
				saida					: out std_logic_vector(7 downto 0));
	end component;
	
	component mde is
		port (clk, r, carry, z			: in std_logic;
				opcode			: in std_logic_vector(7 downto 0);
				Sel_addr_mem 	: out  std_logic_vector(1 downto 0);
				Sel_mar_mem, Ld_mar_mem, Sel_se_mult, Wr_ABCD, Ld_mar_ABCD, 
				Sel_addr_ABCD, Sel_mem_in, Sel_ABCD_in, Sel_ULA_in, 
				Ld_ULA, Ld_cz, Ld_PC, Sel_case_SP, Ld_IR, Up_down_SP, 
				Ld_SP, sel_preset_PC,wr_mem 		: out std_logic:='0'
				
				);
	end component;
	component subtrator8bits is
		port(a,b		:in  std_logic_vector(7 downto 0);
			  c		:out std_logic_vector(7 downto 0);
			  cout	:out std_logic);
	end component;
	component Registrador8Bits is
		port(clock,ld,Preset,Clear	: in std_logic;
				D: in std_logic_vector(7 downto 0);
				Q:out std_logic_vector(7 downto 0));
	end component;
	component decod_ula is
		port(entrada			:in  std_logic_vector(7 downto 0);
			  saida				:out std_logic_vector(3 downto 0));
	end component;
	component somador8bits is 				--0001
		port(a,b	:in  std_logic_vector(7 downto 0);
			  c	:out std_logic_vector(7 downto 0);
			  cin	: in std_logic;
			  cout:out std_logic);
	end component;
	

	signal sSel_mar_mem, sLd_mar_mem, sSel_se_mult, sWr_ABCD, sLd_mar_ABCD, 
				sSel_addr_ABCD, sSel_mem_in, sSel_ABCD_in, sSel_ULA_in, 
				sLd_ULA, sLd_cz, sLd_PC, sSel_case_SP, sLd_IR, sUp_down_SP, 
				sLd_SP, sSet_preset_SP,swr_mem : std_logic;
	signal	sSel_addr_mem	: std_logic_vector(1 downto 0);
	signal sop_ula 		: std_logic_vector(3 downto 0);
	signal spre_pc, sclr_pc, ssp_cont, spc, ssp, sopcode, Soma_out, spc_reg_in :std_logic_vector(7 downto 0);
	
begin
	dec_ula_pm	:	decod_ula 					port map(sopcode,sop_ula);
	mde_pm	: mde port map(clk, '0', carry, z, sopcode,sSel_addr_mem,sSel_mar_mem, sLd_mar_mem, sSel_se_mult, sWr_ABCD, sLd_mar_ABCD, 
				sSel_addr_ABCD, sSel_mem_in, sSel_ABCD_in, sSel_ULA_in, 
				sLd_ULA, sLd_cz, sLd_PC, sSel_case_SP, sLd_IR, sUp_down_SP, 
				sLd_SP,sSet_preset_SP, swr_mem );
	
	--mux_pre_PC	: mux2x1_8bits					port map("11111111", not read_data,sSet_preset_SP,spre_pc);
	--mux_clr_PC	: mux2x1_8bits					port map("11111111", read_data,sSet_preset_SP,sclr_pc);
	
	--pc_pm			: contador_8bits_up_down	port map('1', clk, sLd_PC, spre_pc, sclr_pc, spc);
	
	somador 			: somador8bits 				port map(spc, "00000001", Soma_out, '0', open);
	
	mux_PC			: mux2x1_8bits					port map(Soma_out, read_data, sSet_preset_SP, spc_reg_in);
	pc_reg			: Registrador8Bits			port map(clk, sLd_PC, '1','1', spc_reg_in, spc);
	
	
	
	sp_cont_pm	: contador_8bits_up_down	port map(sUp_down_SP, clk, sLd_SP,"11111111","11111111", ssp_cont);
	sp_sub_pm	: subtrator8bits				port map("11100111", ssp_cont,ssp,open);
	
	ir				: Registrador8Bits			port map(clk,sLd_IR, '1','1', read_data, sopcode);
	
	
	pc	<= spc;
	sp <= ssp;
	
	
	
	Sel_mar_mem		<= sSel_mar_mem;
	Ld_mar_mem		<=	sLd_mar_mem;
	Sel_se_mult 	<= sSel_se_mult;
	Wr_ABCD			<= sWr_ABCD;
	Ld_mar_ABCD 	<= sLd_mar_ABCD;
	Sel_addr_ABCD  <= sSel_addr_ABCD;
	Sel_mem_in  	<= sSel_mem_in;
	Sel_ABCD_in  	<= sSel_ABCD_in;
	Sel_ULA_in 		<= sSel_ULA_in;
	Ld_ULA 			<= sLd_ULA;
	Ld_cz  			<= sLd_cz;
	Sel_case_SP 	<= sSel_case_SP;
	op_ula			<= sop_ula;
	Ld_PC				<= sLd_PC;
	Sel_addr_mem	<= sSel_addr_mem;
	wr_mem			<= swr_mem;
	
	Ld_IR				<=	sLd_IR;
	opcode			<= sopcode;
end arq;

