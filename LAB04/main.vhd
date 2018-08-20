library ieee;
use ieee.std_logic_1164.all;

entity lab04 is
    port(clk_27, key2, key3: in std_logic;
         sw: in std_logic_vector(5 downto 0);
         hex0, hex1, hex2: out std_logic_vector(6 downto 0);

        valor_V: out std_logic_vector(9 downto 0);
        trocar_moeda, manter_moeda, ultima_moeda: out std_logic;

         ledg0, ledg1, ledg2, ledg3: out std_logic;
         ledr: out std_logic_vector(5 downto 0));
end lab04;

architecture main of lab04 is

component contador4bits is
    port (clock, clear, load: in std_logic;
          C: out std_logic_vector (3 downto 0));
end component;

component memory_rom IS
	port(address: in STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock: in STD_LOGIC  := '1';
		q: out STD_LOGIC_VECTOR (9 DOWNTO 0));
end component;

component display is
	port(inn: in std_logic_vector (3 downto 0);
		outt: out std_logic_vector (6 downto 0));
end component;	

component bcd3_conversor is
    port(bin3ary: in std_logic_vector(9 downto 0);
        b3cd: out std_logic_vector(11 downto 0));
end component;

component sym_button is
    port (clk , r, bi: in std_logic ;
            bo : out std_logic);
end component;

component clkDiv is
	port (clk_in : in std_logic;
			clk_out : out std_logic);
end component;

component maquina_troco is
    port(V: in std_logic_vector(9 downto 0);
         tem_moeda: in std_logic_vector(5 downto 0);
         new_troco, clock: in std_logic;

        value_reg_exibir: out std_logic_vector(9 downto 0);
        trocar_moeda, manter_moeda, ultima_moeda: out std_logic;

         processando, sem_trocado: out std_logic;         
         out_moeda: out std_logic_vector(5 downto 0));
end component;

signal clock, clear_cnt, load_troco, processando, sem_trocado, trocar_moeda0, manter_moeda0, ultima_moeda0: std_logic;
signal addr_rom: std_logic_vector(3 downto 0);
signal troco, value_reg_exibir: std_logic_vector(9 downto 0);
signal out_bcd: std_logic_vector(11 downto 0);
signal out_moeda: std_logic_vector(5 downto 0);
signal hex0_aux, hex1_aux, hex2_aux: std_logic_vector(6 downto 0);

begin

CLK: clkDiv port map(clk_27, clock);

BTSYM2: sym_button port map(clock, '0', key2, load_troco);
BTSYM3: sym_button port map(clock, '0', key3, clear_cnt);

CONTADORROM: contador4bits port map(clock, not clear_cnt, load_troco, addr_rom);

ROM: memory_rom port map(addr_rom, clock, troco);

BCDCONVERSOR: bcd3_conversor port map(troco, out_bcd);

HEX00: display port map(out_bcd(3 downto 0), hex0_aux);
HEX01: display port map(out_bcd(7 downto 4), hex1_aux);
HEX02: display port map(out_bcd(11 downto 8), hex2_aux);

hex0 <= hex0_aux;
hex1 <= hex1_aux;
hex2 <= hex2_aux;

MAQUINADETROCO: maquina_troco port map(troco, sw, load_troco, clock, value_reg_exibir, 
            trocar_moeda0, manter_moeda0, ultima_moeda0, processando, sem_trocado, out_moeda);

ledr <= out_moeda;

ledg0 <= clock;
ledg1 <= load_troco;
ledg2 <= processando;
ledg3 <= sem_trocado;

ultima_moeda <= ultima_moeda0;
manter_moeda <=manter_moeda0;
ultima_moeda <= ultima_moeda0;

valor_V <= troco;

end main;