library ieee;
use ieee.std_logic_1164.all;

entity mux16x16 is
    port(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p: in std_logic_vector(15 downto 0);
         addr: in std_logic_vector(3 downto 0);
         out_mux: out std_logic_vector(15 downto 0));
end mux16x16;

architecture mux1616 of mux16x16 is

begin
    out_mux <= a when addr="0000" else
               b when addr="0001" else
               c when addr="0010" else
               d when addr="0011" else
               e when addr="0100" else
               f when addr="0101" else
               g when addr="0110" else
               h when addr="0111" else
               i when addr="1000" else
               j when addr="1001" else
               k when addr="1010" else
               l when addr="1011" else
               m when addr="1100" else
               n when addr="1101" else
               o when addr="1110" else
               p when addr="1111";

end mux1616;