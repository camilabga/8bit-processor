library ieee;
use ieee.std_logic_1164.all;

entity main is
	port(	clk27								: in  std_logic;
			SW7_0, SW15_8					: in  std_logic_vector(7 downto 0);
			KEY							: in  std_logic_vector(3 downto 0);
			
			HEX0,HEX1,HEX2,HEX3,
			HEX4,HEX5,HEX6,HEX7			: out std_logic_vector(6 downto 0);
			LEDR7_0,LEDR15_8,LEDG7_0	: out std_logic_vector(7 downto 0)
			;ram_out :out std_logic_vector(7 downto 0)--teste
			;opcode,addr_mem	: out std_logic_vector(7 downto 0)	--teste
			--;cont_reg_teste						: out std_logic_vector(7 downto 0)	--teste
			; zero: out std_logic
			
			);
end main;

architecture ckt of main is
	component Processador is
		port(	clk27,ram_en					: in  std_logic;
			per_ram_in			: in 	std_logic_vector(7 downto 0);
	     	addr_perif			: in	std_logic_vector(7 downto 0);
			per_ram_out			: out	std_logic_vector(7 downto 0)
						
--			;sw17				: in  std_logic;
--			;sw_ram				: in  std_logic_vector(7 downto 0);
--			;D1,D2,D3				: out std_logic_vector(6 downto 0)
--			; A,B,C,D,pc, 
			;ram_out :out std_logic_vector(7 downto 0)--teste
			; zerao:out std_logic
--			;Ld_PC, Ld_IR,Wr_ABCD,Ld_mar_ABCD		:out std_logic
--			;write_data, 
			;opcode,addr_mem	: out std_logic_vector(7 downto 0)	--teste
--			;entrada2			:out std_logic_vector(7 downto 0)--teste
			);
	end component;

	component perifericos is
		port(clk27: in std_logic;
		 sw7_0, sw15_8, out_mem2: in std_logic_vector(7 downto 0);
		 key: in std_logic_vector(3 downto 0);
		 ledr7_0, ledr15_8, ledg: out std_logic_vector(7 downto 0);
		 wr_b_mem: out std_logic;
		 in_mem_b, addr_mem_io: out std_logic_vector(7 downto 0);
		 hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7: out std_logic_vector(6 downto 0)
		 --; --- testes
		 --sOutA, sOutB, sOutC, sOutD: out std_logic_vector(7 downto 0)
		 );
	end component;
	
	signal sHEX0,sHEX1,sHEX2,sHEX3,
			sHEX4,sHEX5,sHEX6,sHEX7 	: std_logic_vector (6 downto 0);
				
	signal sLEDR7_0, sLEDR15_8,sLEDG				: std_logic_vector(7 downto 0);
	
	signal sper_ram_out 					: std_logic_vector(7 downto 0);
	signal sin_data_ram2, saddr				: std_logic_vector(7 downto 0);
	signal swr_ram_en, szero						: std_logic;
	
	signal sram_out,sopcode,saddr_mem,scont_reg_teste : std_logic_vector(7 downto 0);

  begin
  processador_pm		: processador port map(clk27, swr_ram_en, sin_data_ram2,saddr, sper_ram_out,sram_out, szero, sopcode,saddr_mem);
  
  perifericos_pm 		: perifericos port map(clk27, sw7_0, sw15_8, sper_ram_out, key, sLEDR7_0, sLEDR15_8,sLEDG,
  									swr_ram_en, sin_data_ram2, saddr, sHEX0,sHEX1,sHEX2, sHEX3,sHEX4,sHEX5,sHEX6,sHEX7 
		);
  
  
	zero <= szero;


	HEX0	<=sHEX0;
	HEX1	<=sHEX1;
	HEX2	<=sHEX2;
	HEX3	<=sHEX3;
	HEX4	<=sHEX4;
	HEX5	<=sHEX5;
	HEX6	<=sHEX6;
	HEX7	<=sHEX7;
	LEDR7_0	<= sLEDR7_0;
	LEDR15_8	<=	sLEDR15_8;
	LEDG7_0	<=	sLEDG;
	
	ram_out <= sram_out;
	opcode  <= sopcode;
	addr_mem<=saddr_mem;
	
end ckt;


