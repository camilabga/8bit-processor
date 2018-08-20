library ieee;
use ieee.std_logic_1164.all;

entity mux8_14 is
    port(R1, R2, R3, R4, R5, R6, R7, R8: in std_logic_vector(13 downto 0);
        SW: in std_logic_vector(16 downto 14);
        seq_out: out std_logic_vector(13 downto 0));
end mux8_14;

architecture mux of mux8_14 is

begin

    seq_out <= R1 when (SW = "000") else 
               R2 when (SW = "001") else
               R3 when (SW = "010") else
               R4 when (SW = "011") else
               R5 when (SW = "100") else
               R6 when (SW = "101") else
               R7 when (SW = "110") else
               R8 when (SW = "111");

end mux;