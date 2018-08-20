library ieee;
use ieee.std_logic_1164.all;

entity mux_tem_moeda is
    port(vector: in std_logic_vector(5 downto 0);
         to_select: in std_logic_vector(2 downto 0);
         out_mux: out std_logic);
end mux_tem_moeda;

architecture tem_moeda of mux_tem_moeda is
    
begin
    
     out_mux <= vector(0) when to_select="000" else
                vector(1) when to_select="001" else
                vector(2) when to_select="010" else
                vector(3) when to_select="011" else
                vector(4) when to_select="100" else
                vector(5) when to_select="101" else
                '0';

end tem_moeda;