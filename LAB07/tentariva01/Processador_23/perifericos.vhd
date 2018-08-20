library ieee;
use ieee.std_logic_1164.all;

entity perifericos is
	port(clk27: in std_logic;
		 sw7_0, sw15_8, out_mem2: in std_logic_vector(7 downto 0);
		 key: in std_logic_vector(3 downto 0);
		 ledr7_0, ledr15_8, ledg: out std_logic_vector(7 downto 0);
		 wr_b_mem: out std_logic;
		 in_mem_b, addr_mem_io: out std_logic_vector(7 downto 0);
		 hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7: out std_logic_vector(6 downto 0)
		 ; --- testes
		 sOutA, sOutB, sOutC, sOutD: out std_logic_vector(7 downto 0)
		 );
end perifericos;


architecture peri of perifericos is
	component contador88bits is
		port (sobe, desce, clk, ld, clr: in std_logic;
			saida: out std_logic_vector (7 downto 0));
	end component;

	component bin8_disp2 is
		port(bin				: in 	std_logic_vector (7 downto 0);	
			D,U 			: out std_logic_vector (6 downto 0));
	end component;

	component Registrador8Bits is
		port(clock,ld,Preset,Clear	: in std_logic;
				D: in std_logic_vector(7 downto 0);
				Q:out std_logic_vector(7 downto 0));
	end component;

	component demux8x10u is
		port(inD: in std_logic_vector(7 downto 0);
			outD: out std_logic_vector(9 downto 0));
	end component;

	component somador8bits is
		port(a,b	:in  std_logic_vector(7 downto 0);
			c	:out std_logic_vector(7 downto 0);
			cin	: in std_logic;
			cout:out std_logic);
	end component;
	
	component comparador_8bits is
		 port(a,b						: in  std_logic_vector(7 downto 0);
				maior, igual, menor	: out std_logic);
	end component;

	component mux3x1_8bits is
		port(entrada1,entrada2, entrada3	: in  std_logic_vector(7 downto 0);
				sel					: in  std_logic_vector(1 downto 0);
			saida					: out std_logic_vector(7 downto 0));
	end component;
	
	signal out_cont, addr_mem, outA, outB, outC, outD, outF, outE, outG, outH, outI, outJ, in_mem_b_a: std_logic_vector(7 downto 0);
	signal bin0, bin1, bin2, bin3: std_logic_vector(13 downto 0);
	signal ldPort: std_logic_vector(9 downto 0);
	signal clr_loop: std_logic;

begin

	CONTA_LOOP: contador88bits port map('1', '0', clk27, '1', clr_loop, out_cont);
	COMPARA10: comparador_8bits port map(out_cont, "00001010", open, clr_loop, open);
	ADDR_RAMOUTIN: somador8bits port map(out_cont, "11100111", addr_mem, '0', open);

	addr_mem_io <= addr_mem;

	DEMUX345: demux8x10u port map(out_cont, ldPort);

	PORTA: Registrador8Bits port map(clk27, '1', ldPort(0), '1', out_mem2, outA);
	PORTB: Registrador8Bits port map(clk27, '1', ldPort(1), '1', out_mem2, outB);
	PORTC: Registrador8Bits port map(clk27, '1', ldPort(2), '1', out_mem2, outC);
	PORTD: Registrador8Bits port map(clk27, '1', ldPort(3), '1', out_mem2, outD);
	PORTE: Registrador8Bits port map(clk27, '1', ldPort(4), '1', out_mem2, outE);
	PORTF: Registrador8Bits port map(clk27, '1', ldPort(5), '1', out_mem2, outF);
	PORTG: Registrador8Bits port map(clk27, '1', ldPort(6), '1', out_mem2, outG);

	PORTH: Registrador8Bits port map(clk27, '1', '1', '1', sw7_0, outH);
	PORTI: Registrador8Bits port map(clk27, '1', '1', '1', sw15_8, outI);
	PORTJ: Registrador8Bits port map(clk27, '1', '1', '1', "0000"&key, outJ);

	in_mem_b_a(0) <= (outH(0) and ldPort(7)) or (outI(0) and ldPort(8)) or (outJ(0) and ldPort(9));
	in_mem_b_a(1) <= (outH(1) and ldPort(7)) or (outI(1) and ldPort(8)) or (outJ(1) and ldPort(9));
	in_mem_b_a(2) <= (outH(2) and ldPort(7)) or (outI(2) and ldPort(8)) or (outJ(2) and ldPort(9));
	in_mem_b_a(3) <= (outH(3) and ldPort(7)) or (outI(3) and ldPort(8)) or (outJ(3) and ldPort(9));
	in_mem_b_a(4) <= (outH(4) and ldPort(7)) or (outI(4) and ldPort(8)) or (outJ(4) and ldPort(9));
	in_mem_b_a(5) <= (outH(5) and ldPort(7)) or (outI(5) and ldPort(8)) or (outJ(5) and ldPort(9));
	in_mem_b_a(6) <= (outH(6) and ldPort(7)) or (outI(6) and ldPort(8)) or (outJ(6) and ldPort(9));
	in_mem_b_a(7) <= (outH(7) and ldPort(7)) or (outI(7) and ldPort(8)) or (outJ(7) and ldPort(9));

	in_mem_b <= in_mem_b_a;

	wr_b_mem <= ldPort(7) or ldPort(8) or ldPort(9);

	BIN000: bin8_disp2 port map(outA, bin0(6 downto 0), bin0(13 downto 7));
	hex0<= bin0(13 downto 7);
	hex1<= bin0(6 downto 0);

	BIN111: bin8_disp2 port map(outB, bin1(6 downto 0), bin1(13 downto 7));
	hex2<= bin1(13 downto 7);
	hex3<= bin1(6 downto 0);

	BIN222: bin8_disp2 port map(outC, bin2(6 downto 0), bin2(13 downto 7));
	hex4<= bin2(13 downto 7);
	hex5<= bin2(6 downto 0);

	BIN333: bin8_disp2 port map(outD, bin3(6 downto 0), bin3(13 downto 7));
	hex6<= bin3(13 downto 7);
	hex7<= bin3(6 downto 0);

	sOutA <= outA;
	sOutB <= outB;
	sOutC <= outC;
	sOutD <= outD;

	ledr7_0 <= outE;
	ledr15_8 <= outF;
	ledg <= outG;

end peri;