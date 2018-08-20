library ieee;
use ieee.std_logic_1164.all;

entity lab05 is
    port(key0, key1, key3, clock_27: in std_logic;
         hex0, hex1, hex2, hex3, hex4, hex5: out std_logic_vector(6 downto 0);
			
			bts_rd, bts_wr: out std_logic;
            contador_ROM: out std_logic_vector(5 downto 0);
            r_data_exibir, w_data_exibir: out std_logic_vector(12 downto 0);
			
         ledr0, ledr1: out std_logic);
end lab05;

architecture main_fifo of lab05 is

component clkDiv is
	port (clk_in : in std_logic;
			clk_out : out std_logic);
end component;

component sym_button is
    port (clk , r, bi: in std_logic ;
            bo : out std_logic);
end component;

component contador6bits is
    port (clock, clear, load: in std_logic;
          C: out std_logic_vector (5 downto 0));
end component;

component rom_memory is
	port(address: in STD_LOGIC_VECTOR (5 DOWNTO 0);
		clock: in STD_LOGIC;
		q: out STD_LOGIC_VECTOR (12 DOWNTO 0));
end component;

component fifo is
	port(wr, rd, clr_fifo, clk: in std_logic;
		 w_data: in std_logic_vector(12 downto 0);
		 r_data: out std_logic_vector(12 downto 0);
		 empty, full: out std_logic);
end component;

component bcd_conversor is
    port(binary: in std_logic_vector(13 downto 0);
        bcd: out std_logic_vector(15 downto 0));
end component;

component bcd2_conversor is
    port(bin2ary: in std_logic_vector(5 downto 0);
        b2cd: out std_logic_vector(7 downto 0));
end component;

component display is
	port(inn: in std_logic_vector (3 downto 0);
		outt: out std_logic_vector (6 downto 0));
end component;	

signal clock, rd_s, wr_s, empty, full: std_logic;
signal out_contador_rom: std_logic_vector(5 downto 0);
signal w_data, r_data: std_logic_vector(12 downto 0);
signal out_bcd_rom: std_logic_vector(7 downto 0);
signal out_bcd_r_data: std_logic_vector(15 downto 0);
signal aux0, aux1, aux2, aux3, aux4, aux5: std_logic_vector(6 downto 0);

begin

CLOCK000: clkDiv port map(clock_27, clock);

BTS0: sym_button port map(clock, not key3, key0, rd_s);
BTS1: sym_button port map(clock, not key3, key1, wr_s);

CONTADOR000: contador6bits port map(clock, key3, wr_s, out_contador_rom);
ROM6413: rom_memory port map(out_contador_rom, clock, w_data);

FIFOFIFO: fifo port map(wr_s, rd_s, not key3, clock, w_data, r_data, empty, full);

OUTCONTADOR0: bcd2_conversor port map(out_contador_rom, out_bcd_rom);

RDATA0: bcd_conversor port map('0'&r_data, out_bcd_r_data);

HEX00: display port map(out_bcd_r_data(3 downto 0), aux0);
HEX01: display port map(out_bcd_r_data(7 downto 4), aux1);
HEX02: display port map(out_bcd_r_data(11 downto 8), aux2);
HEX03: display port map(out_bcd_r_data(15 downto 12), aux3);

HEX04: display port map(out_bcd_rom(3 downto 0), aux4);
HEX05: display port map(out_bcd_rom(7 downto 4), aux5);

ledr0 <= full;
ledr1 <= empty;

hex0 <= aux0;
hex1 <= aux1;
hex2 <= aux2;
hex3 <= aux3;
hex4 <= aux4;
hex5 <= aux5;

bts_rd <= rd_s;
bts_wr <= wr_s;
contador_ROM <= out_contador_rom;
r_data_exibir <= r_data;
w_data_exibir <= w_data;

end main_fifo;