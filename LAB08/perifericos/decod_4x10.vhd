library ieee;
use ieee.std_logic_1164.all;

entity decod_4x10 is
    port(W_addr: in std_logic_vector(3 downto 0);
         W_decod: out std_logic_vector(9 downto 0));
end decod_4x10;

architecture ckt of decod_4x10 is

begin

W_decod <= "0000000001" when W_addr="0000" else
           "0000000010" when W_addr="0001" else
           "0000000100" when W_addr="0010" else
           "0000001000" when W_addr="0011" else
           "0000010000" when W_addr="0100" else
           "0000100000" when W_addr="0101" else
           "0001000000" when W_addr="0110" else
           "0010000000" when W_addr="0111" else 
           "0100000000" when W_addr="1000" else 
           "1000000000" when W_addr="1001" else "0000000000";

end ckt;