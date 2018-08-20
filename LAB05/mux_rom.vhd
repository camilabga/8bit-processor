library ieee;
use ieee.std_logic_1164.all;

entity mux_rom is
    port(select_reg: in std_logic_vector(3 downto 0);
         selected: out std_logic_vector(15 downto 0));
end mux_rom;

architecture mux of mux_rom is

begin

selected <= "0000000000000001" when (select_reg = "0000") else 
            "0000000000000010" when (select_reg = "0001") else
            "0000000000000100" when (select_reg = "0010") else
            "0000000000001000" when (select_reg = "0011") else
            "0000000000010000" when (select_reg = "0100") else
            "0000000000100000" when (select_reg = "0101") else
            "0000000001000000" when (select_reg = "0110") else
            "0000000010000000" when (select_reg = "0111") else
            "0000000100000000" when (select_reg = "1000") else
            "0000001000000000" when (select_reg = "1001") else
            "0000010000000000" when (select_reg = "1010") else
            "0000100000000000" when (select_reg = "1011") else
            "0001000000000000" when (select_reg = "1100") else
            "0010000000000000" when (select_reg = "1101") else
            "0100000000000000" when (select_reg = "1110") else
            "1000000000000000" when (select_reg = "1111");
end mux;