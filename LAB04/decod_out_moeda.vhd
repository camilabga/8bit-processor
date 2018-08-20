library ieee;
use ieee.std_logic_1164.all;

entity decod_moeda_out is
    port(valor_moeda: in std_logic_vector(9 downto 0);
         tem_moeda: in std_logic_vector(5 downto 0);
         clock, manter_moeda, ultima_moeda, trocar_moeda, processando_aux, value_nulo: in std_logic;
         out_moeda: out std_logic_vector(5 downto 0));
end decod_moeda_out;

architecture decod_coin_out of decod_moeda_out is

signal out_moeda_aux, saida_aux: std_logic_vector(5 downto 0);

begin

out_moeda_aux <= "100000" when valor_moeda = "0001100100" else
                 "010000" when valor_moeda = "0000110010" else
                 "001000" when valor_moeda = "0000011001" else
                 "000100" when valor_moeda = "0000001010" else
                 "000010" when valor_moeda = "0000000101" else
                 "000001" when valor_moeda = "0000000001" else
                 "000000";

saida_aux(0) <= (out_moeda_aux(5)) and clock and tem_moeda(0) and not trocar_moeda;
saida_aux(1) <= (out_moeda_aux(4)) and clock and tem_moeda(1) and not trocar_moeda;
saida_aux(2) <= (out_moeda_aux(3)) and clock and tem_moeda(2) and not trocar_moeda;
saida_aux(3) <= (out_moeda_aux(2)) and clock and tem_moeda(3) and not trocar_moeda;
saida_aux(4) <= (out_moeda_aux(1)) and clock and tem_moeda(4) and not trocar_moeda;
saida_aux(5) <= (out_moeda_aux(0)) and clock and tem_moeda(5) and not trocar_moeda;

out_moeda <= saida_aux;

end decod_coin_out;