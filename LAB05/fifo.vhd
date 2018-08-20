library ieee;
use ieee.std_logic_1164.all;

entity fifo is
	port(wr, rd, clr_fifo, clk: in std_logic;
		 w_data: in std_logic_vector(12 downto 0);
		 r_data: out std_logic_vector(12 downto 0);
         --entrada_reg0, entrada_reg1: out std_logic_vector(12 downto 0);
		 --contador_select00: out std_logic_vector(3 downto 0);
		 empty, full: out std_logic);
end fifo;

architecture fila of fifo is

component registrador is
    port(registrador_in: in std_logic_vector(12 downto 0);
        ld, clear, clk: in std_logic;
        registrador_out: out std_logic_vector(12 downto 0));
end component;

component mux_rom is
    port(select_reg: in std_logic_vector(3 downto 0);
         selected: out std_logic_vector(15 downto 0));
end component;

component select_mux_rom is
    port(wr, rd, clear, clock: in std_logic;
         result: out std_logic_vector(3 downto 0);
         full, empty: out std_logic);
end component;

component in_reg is
    port(current, next_value, rom: in std_logic_vector(12 downto 0);
         carrega_rom, rd, wr: in std_logic;
         in_registrador: out std_logic_vector(12 downto 0));
end component;

signal in_reg0, in_reg1, in_reg2, in_reg3, in_reg4, in_reg5: std_logic_vector(12 downto 0); 
signal in_reg6, in_reg7, in_reg8, in_reg9, in_reg10, in_reg11: std_logic_vector(12 downto 0);
signal in_reg12, in_reg13, in_reg14, in_reg15: std_logic_vector(12 downto 0);

signal out_reg0, out_reg1, out_reg2, out_reg3, out_reg4, out_reg5: std_logic_vector(12 downto 0); 
signal out_reg6, out_reg7, out_reg8, out_reg9, out_reg10, out_reg11: std_logic_vector(12 downto 0);
signal out_reg12, out_reg13, out_reg14, out_reg15, out_reg_final: std_logic_vector(12 downto 0);

signal out_select: std_logic_vector(3 downto 0);
signal out_mux: std_logic_vector(15 downto 0);

begin

SELECT_WRRD: select_mux_rom port map(wr, rd, clr_fifo, clk, out_select, full, empty);

MUX_WRRD: mux_rom port map(out_select, out_mux);

LOGICA_REG0: in_reg port map(out_reg0, out_reg1, w_data, out_mux(0), rd, wr, in_reg0);
LOGICA_REG1: in_reg port map(out_reg1, out_reg2, w_data, out_mux(1), rd, wr, in_reg1);
LOGICA_REG2: in_reg port map(out_reg2, out_reg3, w_data, out_mux(2), rd, wr, in_reg2);
LOGICA_REG3: in_reg port map(out_reg3, out_reg4, w_data, out_mux(3), rd, wr, in_reg3);
LOGICA_REG4: in_reg port map(out_reg4, out_reg5, w_data, out_mux(4), rd, wr, in_reg4);
LOGICA_REG5: in_reg port map(out_reg5, out_reg6, w_data, out_mux(5), rd, wr, in_reg5);
LOGICA_REG6: in_reg port map(out_reg6, out_reg7, w_data, out_mux(6), rd, wr, in_reg6);
LOGICA_REG7: in_reg port map(out_reg7, out_reg8, w_data, out_mux(7), rd, wr, in_reg7);
LOGICA_REG8: in_reg port map(out_reg8, out_reg9, w_data, out_mux(8), rd, wr, in_reg8);
LOGICA_REG9: in_reg port map(out_reg9, out_reg10, w_data, out_mux(9), rd, wr, in_reg9);
LOGICA_REG10: in_reg port map(out_reg10, out_reg11, w_data, out_mux(10), rd, wr, in_reg10);
LOGICA_REG11: in_reg port map(out_reg11, out_reg12, w_data, out_mux(11), rd, wr, in_reg11);
LOGICA_REG12: in_reg port map(out_reg12, out_reg13, w_data, out_mux(12), rd, wr, in_reg12);
LOGICA_REG13: in_reg port map(out_reg13, out_reg14, w_data, out_mux(13), rd, wr, in_reg13);
LOGICA_REG14: in_reg port map(out_reg14, out_reg15, w_data, out_mux(14), rd, wr, in_reg14);
LOGICA_REG15: in_reg port map(out_reg15, "0000000000000", w_data, out_mux(15), rd, wr, in_reg15);

REG0: registrador port map(in_reg0, rd or wr, clr_fifo, clk, out_reg0);
REG1: registrador port map(in_reg1, rd or wr, clr_fifo, clk, out_reg1);
REG2: registrador port map(in_reg2, rd or wr, clr_fifo, clk, out_reg2);
REG3: registrador port map(in_reg3, rd or wr, clr_fifo, clk, out_reg3);
REG4: registrador port map(in_reg4, rd or wr, clr_fifo, clk, out_reg4);
REG5: registrador port map(in_reg5, rd or wr, clr_fifo, clk, out_reg5);
REG6: registrador port map(in_reg6, rd or wr, clr_fifo, clk, out_reg6);
REG7: registrador port map(in_reg7, rd or wr, clr_fifo, clk, out_reg7);
REG8: registrador port map(in_reg8, rd or wr, clr_fifo, clk, out_reg8);
REG9: registrador port map(in_reg9, rd or wr, clr_fifo, clk, out_reg9);
REG10: registrador port map(in_reg10, rd or wr, clr_fifo, clk, out_reg10);
REG11: registrador port map(in_reg11, rd or wr, clr_fifo, clk, out_reg11);
REG12: registrador port map(in_reg12, rd or wr, clr_fifo, clk, out_reg12);
REG13: registrador port map(in_reg13, rd or wr, clr_fifo, clk, out_reg13);
REG14: registrador port map(in_reg14, rd or wr, clr_fifo, clk, out_reg14);
REG15: registrador port map(in_reg15, rd or wr, clr_fifo, clk, out_reg15);

r_data <= out_reg0;

--entrada_reg0 <= in_reg0;
--entrada_reg1 <= in_reg1;
--contador_select00 <= out_select;


end fila;