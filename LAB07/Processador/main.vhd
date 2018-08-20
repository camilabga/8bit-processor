library ieee;
use ieee.std_logic_1164.all;

entity processador_perifericos is
	port(clk27: in  std_logic;
		 SW7_0, SW15_8: in  std_logic_vector(7 downto 0);
		 KEY3_0: in  std_logic_vector(3 downto 0);
		 HEX0,HEX1,HEX2,HEX3, HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0);
		 LEDR7_0,LEDR15_8,LEDG7_0: out std_logic_vector(7 downto 0)
		 --;ram_out :out std_logic_vector(7 downto 0)--teste
		 ;opcode, ram_out: out std_logic_vector(7 downto 0)
		 --;C,opcode,addr_mem	: out std_logic_vector(7 downto 0)	--teste
		 --;zero: out std_logic
		 --; cont_reg_show: out std_logic_vector(7 downto 0)
		 );
end processador_perifericos;

architecture main of processador_perifericos is
	component Processador is
		port(clk27,ram_en					: in  std_logic;
				per_ram_in: in	std_logic_vector(7 downto 0);
				addr_perif: in std_logic_vector(7 downto 0);
				per_ram_out: out std_logic_vector(7 downto 0)
				;ram_out :out std_logic_vector(7 downto 0)
				;C,opcode,addr_mem: out std_logic_vector(7 downto 0)
				;zero: out std_logic
				);
	end component;

	component perifericos is
		port(clk: in  std_logic;
			reg_in: in 	std_logic_vector(7 downto 0);
	     	addr: out	std_logic_vector(7 downto 0);
			wr_ram: out	std_logic_vector(7 downto 0);
			SW7_0, SW15_8: in  std_logic_vector(7 downto 0);
			KEY3_0: in  std_logic_vector(3 downto 0);
			HEX0,HEX1,HEX2,HEX3, HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0);
			LEDR7_0,LEDR15_8,LEDG7_0: out std_logic_vector(7 downto 0);
			wr_ram_en: out std_logic);
	end component;
	
	component CLK_Div is
		port (clk_in : in std_logic;
			clk_out: out std_logic);
	end component;
	
	signal sHEX0,sHEX1,sHEX2,sHEX3, sHEX4,sHEX5,sHEX6,sHEX7: std_logic_vector (6 downto 0);
				
	signal sLEDR7_0, sLEDR15_8,sLEDG7_0				: std_logic_vector(7 downto 0);
	
	signal sper_ram_out 					: std_logic_vector(7 downto 0);
	signal swr_ram, saddr,sC				: std_logic_vector(7 downto 0);
	signal swr_ram_en	, clk					: std_logic;
	
	signal sopcode, sram_out: std_logic_vector(7 downto 0);

	begin
	
		clk_pm: CLK_Div port map(clk27, clk);
		--clk<=clk27;
		
		PROCESSADOR0000: processador port map(clk, swr_ram_en, swr_ram,saddr, sper_ram_out,sram_out,open,sopcode,open,open);
  
		PERIFERICOS0000: perifericos port map(clk, sper_ram_out, saddr, swr_ram,SW7_0, SW15_8,KEY3_0, sHEX0,sHEX1,sHEX2,sHEX3,sHEX4,
  											 sHEX5,sHEX6,sHEX7,sLEDR7_0, sLEDR15_8,sLEDG7_0, swr_ram_en);
  
		opcode <= sopcode;
  
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
		LEDG7_0	<=	sLEDG7_0;
		
		ram_out <= sram_out;
		
end main;


