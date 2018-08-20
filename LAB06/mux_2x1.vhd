library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is
    port(in0, in1: in std_logic_vector(15 downto 0);
         select_bit: in std_logic;
         out0: out std_logic_vector(15 downto 0));
end mux_2x1;

architecture mux_op of mux_2x1 is

begin

    out0 <= in0 when select_bit='0' else in1;

end mux_op;