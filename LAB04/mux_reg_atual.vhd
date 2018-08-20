library ieee;
use ieee.std_logic_1164.all;

entity mux_reg_atual is
    port(V, saida_subtrator: in std_logic_vector(9 downto 0);
         new_troco, processando: in std_logic;
         in_reg: out std_logic_vector(9 downto 0));
end mux_reg_atual;

architecture decide_reg_atual of mux_reg_atual is

begin

--in_reg <= V when(new_troco='1' and saida_subtrator="0000000000") else
--          saida_subtrator;

in_reg <= V when(new_troco='1' and processando='0') else
    saida_subtrator;


end decide_reg_atual;