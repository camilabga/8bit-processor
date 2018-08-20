library ieee;
use ieee.std_logic_1164.all;

entity perifericos is
	port(clk: in  std_logic;
			reg_in: in 	std_logic_vector(7 downto 0);
	     	addr: out	std_logic_vector(7 downto 0);
			wr_ram: out	std_logic_vector(7 downto 0);
			SW7_0, SW15_8: in  std_logic_vector(7 downto 0);
			KEY3_0: in  std_logic_vector(3 downto 0);
			HEX0,HEX1,HEX2,HEX3, HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0);
			LEDR7_0,LEDR15_8,LEDG7_0: out std_logic_vector(7 downto 0);
			wr_ram_en: out std_logic);
end perifericos;

architecture ckt of perifericos is
	component Registrador8Bits is
		port(clock,ld,Preset,Clear	: in std_logic;
				D: in std_logic_vector(7 downto 0);
				Q:out std_logic_vector(7 downto 0));
	end component;
	
	component cont_8bits_up_down is
		 port (updown, clk, ld, clr	: in std_logic;
				 saida: out std_logic_vector (7 downto 0));
	end component;
	
	component comparador_8bits is
		 port(a,b: in  std_logic_vector(7 downto 0);
				maior, igual, menor	: out std_logic);
	end component;
	
	component somador8bits is
		port(a,b:in  std_logic_vector(7 downto 0);
			  c	:out std_logic_vector(7 downto 0);
			  cin	: in std_logic;
			  cout:out std_logic);
	end component;
	
	component decod_4x10 is
		 port(W_addr: in std_logic_vector(3 downto 0);
				W_decod: out std_logic_vector(9 downto 0));
	end component;
	
	component display7 is
		port(inn: in std_logic_vector (3 downto 0);
			outt: out std_logic_vector (6 downto 0));
	end component;

	component mux3x1_8bits is
		 port(entrada1,entrada2, entrada3	: in  std_logic_vector(7 downto 0);
				sel: in  std_logic_vector(1 downto 0);
				saida: out std_logic_vector(7 downto 0));
	end component;
	
	component demux8x10u is
		port(inD: in std_logic_vector(7 downto 0);
				outD: out std_logic_vector(9 downto 0));
	end component;
	
	signal cont_reg, saddr,swr_ram, in_mem_b_a 	: std_logic_vector(7 downto 0);
	signal clr_cont		: std_logic;
	signal out_regA,out_regB,out_regC,out_regD,out_regE,out_regF,out_regG: std_logic_vector(7 downto 0);
		
	signal sld	: std_logic_vector(9 downto 0);
	signal sHEX0,sHEX1,sHEX2,sHEX3,
			sHEX4,sHEX5,sHEX6,sHEX7 :std_logic_vector (6 downto 0);
			
	signal swr_ram_en : std_logic;
	signal saddr_in_ram : std_logic_vector(1 downto 0);

begin

	CONTA_ENDERECO: cont_8bits_up_down port map ('1', clk, '1', not clr_cont , cont_reg);
	
	COMPARA_COM10: comparador_8bits port map (cont_reg, "00001010", clr_cont, open, open);
	
	SOMA231: somador8bits port map (cont_reg, "11100111", saddr,'0',open);
	
	DECOD_LOADS000: demux8x10u port map(cont_reg, sld);
	
	DISPLAY000: display7 port map (out_regA(3 downto 0), sHEX0);
	DISPLAY111: display7 port map (out_regA(7 downto 4), sHEX1);
	
	DISPLAY222: display7 port map (out_regB(3 downto 0), sHEX2);
	DISPLAY333: display7 port map (out_regB(7 downto 4), sHEX3);
	
	DISPLAY444: display7 port map (out_regC(3 downto 0), sHEX4);
	DISPLAY555: display7 port map (out_regC(7 downto 4), sHEX5);
	
	DISPLAY666: display7 port map (out_regD(3 downto 0), sHEX6);
	DISPLAY777: display7 port map (out_regD(7 downto 4), sHEX7);
	
	REGAAA: Registrador8Bits port map (clk,sld(1),'1','1',reg_in, out_regA);	--232
	REGBBB: Registrador8Bits port map (clk,sld(2),'1','1',reg_in, out_regB);	--233
	REGCCC: Registrador8Bits port map (clk,sld(3),'1','1',reg_in, out_regC);	--234
	REGDDD: Registrador8Bits port map (clk,sld(4),'1','1',reg_in, out_regD);	--235
	REGEEE: Registrador8Bits port map (clk,sld(5),'1','1',reg_in, out_regE);	--236
	REGFFF: Registrador8Bits port map (clk,sld(6),'1','1',reg_in, out_regF);	--237
	REGGGG: Registrador8Bits port map (clk,sld(7),'1','1',reg_in, out_regG);	--238

	swr_ram_en <= sld(7) or sld(8) or sld(9);
	
	in_mem_b_a(0) <= (SW7_0(0) and sld(7)) or (SW15_8(0) and sld(8)) or (KEY3_0(0) and sld(9));
	in_mem_b_a(1) <= (SW7_0(1) and sld(7)) or (SW15_8(1) and sld(8)) or (KEY3_0(1) and sld(9));
	in_mem_b_a(2) <= (SW7_0(2) and sld(7)) or (SW15_8(2) and sld(8)) or (KEY3_0(2) and sld(9));
	in_mem_b_a(3) <= (SW7_0(3) and sld(7)) or (SW15_8(3) and sld(8)) or (KEY3_0(3) and sld(9));
	in_mem_b_a(4) <= (SW7_0(4) and sld(7)) or (SW15_8(4) and sld(8));
	in_mem_b_a(5) <= (SW7_0(5) and sld(7)) or (SW15_8(5) and sld(8));
	in_mem_b_a(6) <= (SW7_0(6) and sld(7)) or (SW15_8(6) and sld(8));
	in_mem_b_a(7) <= (SW7_0(7) and sld(7)) or (SW15_8(7) and sld(8));
	
	
	HEX0	<=sHEX0;
	HEX1	<=sHEX1;
	HEX2	<=sHEX2;
	HEX3	<=sHEX3;
	HEX4	<=sHEX4;
	HEX5	<=sHEX5;
	HEX6	<=sHEX6;
	HEX7	<=sHEX7;
	LEDR7_0	<= out_regE;
	LEDR15_8<=out_regF;
	LEDG7_0	<=out_regG;
	
	addr<=saddr;
	
	wr_ram_en <= swr_ram_en;
	wr_ram <= in_mem_b_a;
	
end ckt;