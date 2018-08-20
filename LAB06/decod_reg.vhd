library ieee;
use ieee.std_logic_1164.all;

entity decod_reg is
    port(W_addr: in std_logic_vector(3 downto 0);
         W_wr: in std_logic;
         W_decod: out std_logic_vector(15 downto 0));
end decod_reg;

architecture decoder00 of decod_reg is

begin

W_decod <= "0000000000000000" when W_wr='0' else
           "0000000000000001" when W_addr="0000" and W_wr='1' else
           "0000000000000010" when W_addr="0001" and W_wr='1' else
           "0000000000000100" when W_addr="0010" and W_wr='1' else
           "0000000000001000" when W_addr="0011" and W_wr='1' else
           "0000000000010000" when W_addr="0100" and W_wr='1' else
           "0000000000100000" when W_addr="0101" and W_wr='1' else
           "0000000001000000" when W_addr="0110" and W_wr='1' else
           "0000000010000000" when W_addr="0111" and W_wr='1' else
           "0000000100000000" when W_addr="1000" and W_wr='1' else
           "0000001000000000" when W_addr="1001" and W_wr='1' else
           "0000010000000000" when W_addr="1010" and W_wr='1' else
           "0000100000000000" when W_addr="1011" and W_wr='1' else
           "0001000000000000" when W_addr="1100" and W_wr='1' else
           "0010000000000000" when W_addr="1101" and W_wr='1' else
           "0100000000000000" when W_addr="1110" and W_wr='1' else
           "1000000000000000" when W_addr="1111" and W_wr='1';

end decoder00;