library ieee;
use ieee.std_logic_1164.all;

entity Processador is
	port(	clk27,ram_en					: in  std_logic;
			per_ram_in			: in 	std_logic_vector(7 downto 0);
	     	addr_perif			: in	std_logic_vector(7 downto 0);
			per_ram_out			: out	std_logic_vector(7 downto 0)
						
--			;sw17				: in  std_logic;
--			;sw_ram				: in  std_logic_vector(7 downto 0);
--			;D1,D2,D3				: out std_logic_vector(6 downto 0)
--			; A,B,D,pc, 
			;ram_out :out std_logic_vector(7 downto 0)--teste
--			;Ld_PC, Ld_IR,Wr_ABCD,Ld_mar_ABCD		:out std_logic
--			;write_data, 
			;C,opcode,addr_mem	: out std_logic_vector(7 downto 0)	--teste
--			;entrada2			:out std_logic_vector(7 downto 0)--teste
			;zero					: out std_logic
			);
end Processador;


architecture ckt of Processador is
	component datapath is
	port(	read_data, pc, sp		:in  std_logic_vector(7 downto 0);
	     	op_ula 					:in  std_logic_vector(3 downto 0);
			Sel_addr_mem			:in	std_logic_vector(1 downto 0);
			clk, Sel_mar_mem, Ld_mar_mem, Sel_se_mult, Wr_ABCD, Ld_mar_ABCD, 
			Sel_addr_ABCD, Sel_mem_in, Sel_ABCD_in, Sel_ULA_in, 
			Ld_ULA, Ld_cz, Sel_case_SP: in  std_logic;
	     	write_data, addr_mem		: out std_logic_vector(7 downto 0);
	     	carry,zero 					:out std_logic
			;A,B,C,D,reg2	: out std_logic_vector(7 downto 0)--teste
			);
	end component;
	
	component ram is
		port(	address_a	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				address_b	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				clock			: IN STD_LOGIC  := '1';
				data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				wren_a		: IN STD_LOGIC  := '0';
				wren_b		: IN STD_LOGIC  := '0';
				q_a			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
				q_b			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
	end component;
	component controller is
		port(	read_data					:in 	std_logic_vector(7 downto 0);
				carry, z,clk						: in  std_logic;
				op_ula 						:out  std_logic_vector(3 downto 0);
				Sel_addr_mem				:out	std_logic_vector(1 downto 0);
				Sel_mar_mem, Ld_mar_mem, Sel_se_mult, Wr_ABCD, Ld_mar_ABCD, 
				Sel_addr_ABCD, Sel_mem_in, Sel_ABCD_in, Sel_ULA_in, 
				Ld_ULA, Ld_cz, Sel_case_SP,wr_mem 	: out  std_logic;
				pc,sp		: out std_logic_vector(7 downto 0)
				;Ld_PC, Ld_IR :out std_logic		--teste
				;opcode	: out std_logic_vector(7 downto 0)	--teste
				);
	end component;
--	component bin14_disp5 is
--		port(bin				: in 	std_logic_vector (13 downto 0);	
--			  dM,M,C,D,U 	: out std_logic_vector (6 downto 0));
--	end component;
	component CLK_Div is
		port (clk_in : in std_logic;
			clk_out: out std_logic);
	end component;
	
	signal saddr_mem, swrite_data, sread_data,spc,ssp : std_logic_vector(7 downto 0);
	signal sop_ula 					: std_logic_vector(3 downto 0);
	signal sSel_addr_mem 			: std_logic_vector(1 downto 0);
	signal swr_mem,scarry, szero 	: std_logic;
	--signal sA,sB, sD,sentrada2 	: std_logic_vector(7 downto 0);--teste
	
	signal sC,sopcode 	: std_logic_vector(7 downto 0);--teste
	signal sSel_mar_mem, sLd_mar_mem, sSel_se_mult, sWr_ABCD, sLd_mar_ABCD, 
				sSel_addr_ABCD, sSel_mem_in, sSel_ABCD_in, sSel_ULA_in, 
				sLd_ULA, sLd_cz, sSel_case_SP : std_logic;
				
	--signal	sLd_PC, sLd_IR : std_logic; --teste
	signal 	ram_out_disp	: std_logic_vector(7 downto 0);
	
	signal 	sD1,sD2,sD3	: std_logic_vector(6 downto 0);
	signal 	clk			: std_logic;
	
	
	
	signal sper_ram_out		:std_logic_vector(7 downto 0);
begin

	
	clk<=clk27;
	ram_pm		: ram port map(saddr_mem,addr_perif, clk27, swrite_data, per_ram_in, swr_mem,ram_en,sread_data, sper_ram_out);
	datapath_pm 	: datapath 	port map
			  (sread_data, spc, ssp,		
				sop_ula,	sSel_addr_mem,	
				clk, sSel_mar_mem, sLd_mar_mem, sSel_se_mult, sWr_ABCD, sLd_mar_ABCD, 
				sSel_addr_ABCD, sSel_mem_in, sSel_ABCD_in, sSel_ULA_in, 
				sLd_ULA, sLd_cz, sSel_case_SP,
				swrite_data, saddr_mem,scarry, szero
				,open,open,sC,open,open
				--,sA,sB, sC, sD --TESTE
				--,sentrada2
				);
				
	controller_pm	: controller port map(	sread_data,scarry, szero, clk, 
				sop_ula, sSel_addr_mem,
				sSel_mar_mem, sLd_mar_mem, sSel_se_mult, sWr_ABCD, sLd_mar_ABCD, 
				sSel_addr_ABCD, sSel_mem_in, sSel_ABCD_in, sSel_ULA_in, 
				sLd_ULA, sLd_cz, sSel_case_SP,swr_mem,
				spc,ssp
				,open,open,sopcode
				--,sLd_PC, sLd_IR, sopcode	--teste
				);
	--bin_bcd 		:bin14_disp5 port map("000000"&ram_out_disp, open, open, sD3,sD2,sD1);
	
	per_ram_out <= sper_ram_out;
	
	
--	D1 <= sD1;
--	D2 <= sD2;
--	D3 <= sD3;
	
	
	
	
	
	
	-------------tudo teste  essa porra VVV-----------
--	A <= sA;
--	B <= sB;
	C <= sC;
--	D <= sD;
--	pc<=spc;
--	Ld_PC <= sLd_PC;
--	Ld_IR	<=sLd_IR;
	ram_out 	<=sread_data;
--	Ld_mar_ABCD	<= sLd_mar_ABCD;
--	Wr_ABCD	<= sWr_ABCD;
	opcode	<= sopcode;
	addr_mem<=saddr_mem;
	zero<=szero;
--	write_data	<= swrite_data;
--	entrada2<=sentrada2;
	-----------
end ckt;