library ieee;
use ieee.std_logic_1164.all;

entity operational_unit is
    port(clock, s, W_wr, Rp_rd, Rq_rd, s0: in std_logic;
         W_addr, Rp_addr, Rq_addr: in std_logic_vector(3 downto 0);
         R_data: in std_logic_vector(15 downto 0);
         W_data: out std_logic_vector(15 downto 0));
end operational_unit;

architecture op of operational_unit is

    component mux_2x1 is
        port(in0, in1: in std_logic_vector(15 downto 0);
            select_bit: in std_logic;
            out0: out std_logic_vector(15 downto 0));
    end component;
    
    component banco_reg is
        port(clock, W_wr, Rp_rd, Rq_rd: in std_logic;
            W_addr, Rp_addr, Rq_addr: in std_logic_vector(3 downto 0);
            W_data: in std_logic_vector(15 downto 0);
            Rp_data, Rq_data: out std_logic_vector(15 downto 0));
    end component;

    component ula is
        port(A,B: in std_logic_vector(15 downto 0);
            s0, clock: in std_logic;
            ula_out: out std_logic_vector(15 downto 0));
    end component;

    signal out_ula, out_mux, Rp_data, Rq_data: std_logic_vector(15 downto 0);

begin

MUXSELECT: mux_2x1 port map(out_ula, R_data, s, out_mux);
BANCOREG0: banco_reg port map(clock, W_wr, Rp_rd, Rq_rd, W_addr, Rp_addr, Rq_addr, out_mux, Rp_data, Rq_data);
ULA000: ula port map(Rp_data, Rq_data, s0, clock, out_ula);

W_data <= Rp_data;

end op;