library ieee;
use ieee.std_logic_1164.all;

entity banco_reg is
    port(clock, W_wr, Rp_rd, Rq_rd: in std_logic;
         W_addr, Rp_addr, Rq_addr: in std_logic_vector(3 downto 0);
         W_data: in std_logic_vector(15 downto 0);
         Rp_data, Rq_data: out std_logic_vector(15 downto 0));
end banco_reg;

architecture rf of banco_reg is
    component decod_reg is
        port(W_addr: in std_logic_vector(3 downto 0);
            W_wr: in std_logic;
            W_decod: out std_logic_vector(15 downto 0));
    end component;

    component registrador16Bits is
        port(clock,ld,Preset,Clear	: in std_logic;
                D: in std_logic_vector(15	downto 0);
                Q:out std_logic_vector(15 downto 0));
    end component;

    component mux16x16 is
        port(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p: in std_logic_vector(15 downto 0);
            addr: in std_logic_vector(3 downto 0);
            out_mux: out std_logic_vector(15 downto 0));
    end component;

    signal decod, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15: std_logic_vector(15 downto 0);
    signal rp_data_aux, rq_data_aux: std_logic_vector(15 downto 0);

begin

DECODREG0: decod_reg port map(W_addr, W_wr, decod);

REG000:registrador16Bits port map (clock, decod(0), '1', '1', W_data, out0);
REG001:registrador16Bits port map (clock, decod(1), '1', '1', W_data, out1);
REG002:registrador16Bits port map (clock, decod(2), '1', '1', W_data, out2);
REG003:registrador16Bits port map (clock, decod(3), '1', '1', W_data, out3);
REG004:registrador16Bits port map (clock, decod(4), '1', '1', W_data, out4);
REG005:registrador16Bits port map (clock, decod(5), '1', '1', W_data, out5);
REG006:registrador16Bits port map (clock, decod(6), '1', '1', W_data, out6);
REG007:registrador16Bits port map (clock, decod(7), '1', '1', W_data, out7);
REG008:registrador16Bits port map (clock, decod(8), '1', '1', W_data, out8);
REG009:registrador16Bits port map (clock, decod(9), '1', '1', W_data, out9);
REG010:registrador16Bits port map (clock, decod(10), '1', '1', W_data, out10);
REG011:registrador16Bits port map (clock, decod(11), '1', '1', W_data, out11);
REG012:registrador16Bits port map (clock, decod(12), '1', '1', W_data, out12);
REG013:registrador16Bits port map (clock, decod(13), '1', '1', W_data, out13);
REG014:registrador16Bits port map (clock, decod(14), '1', '1', W_data, out14);
REG015:registrador16Bits port map (clock, decod(15), '1', '1', W_data, out15);

MUXRP: mux16x16 port map(out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, Rp_addr, rp_data_aux);

MUXRQ: mux16x16 port map(out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, Rq_addr, rq_data_aux);

Rq_data <= rq_data_aux;
Rp_data <= rp_data_aux;

end rf;