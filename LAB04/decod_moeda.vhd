library ieee;
use ieee.std_logic_1164.all;

entity decod_moeda is
    port(select_moeda: in std_logic_vector(2 downto 0);
         valor_moeda, valor_moeda_a2: out std_logic_vector(9 downto 0));
end decod_moeda;

architecture decod_coin of decod_moeda is

begin

valor_moeda <=  "0001100100" when select_moeda = "000" else
                "0000110010" when select_moeda = "001" else
                "0000011001" when select_moeda = "010" else
                "0000001010" when select_moeda = "011" else
                "0000000101" when select_moeda = "100" else
                "0000000001" when select_moeda = "101" else
                "0000000000";

valor_moeda_a2 <=   "1110011100" when select_moeda = "000" else
                    "1111001110" when select_moeda = "001" else
                    "1111100111" when select_moeda = "010" else
                    "1111110110" when select_moeda = "011" else
                    "1111111011" when select_moeda = "100" else
                    "1111111111" when select_moeda = "101" else
                    "0000000000";

end decod_coin;