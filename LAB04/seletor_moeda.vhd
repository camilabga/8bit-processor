library ieee;
use ieee.std_logic_1164.all;

entity seletor_moeda is
    port(is_there_coin: in std_logic_vector(5 downto 0);
         clock, clear, number_small, processando_aux: in std_logic;
         valor_moeda, valor_moeda_a2: out std_logic_vector(9 downto 0);
         ran_out_of_coins, nao_tem_moeda_atual: out std_logic);
end seletor_moeda;

architecture seletor of seletor_moeda is

component mux_tem_moeda is
    port(vector: in std_logic_vector(5 downto 0);
         to_select: in std_logic_vector(2 downto 0);
         out_mux: out std_logic);
end component;

component decod_moeda is
    port(select_moeda: in std_logic_vector(2 downto 0);
         valor_moeda, valor_moeda_a2: out std_logic_vector(9 downto 0));
end component;

component contador3bits is
    port (clock, clear, load: in std_logic;
          C: out std_logic_vector (2 downto 0));
end component;

component FFD is
	port(clk,D,P,C:in std_logic;
		q:out std_logic);
end component;

signal out_contador: std_logic_vector(2 downto 0);
signal load_contador, out_mux, ran_out_of_coins_aux, cabou_moedas: std_logic;
signal valor_moeda_aux, valor_moeda_a2_aux: std_logic_vector(9 downto 0);

begin

CONTADORMOEDA: contador3bits port map(clock, not clear, load_contador, out_contador);

MUXMOEDA: mux_tem_moeda port map(is_there_coin, out_contador, out_mux);

DECODMOEDA: decod_moeda port map(out_contador, valor_moeda_aux, valor_moeda_a2_aux);

load_contador <= (not out_mux or number_small) and not ran_out_of_coins_aux;

--load_contador <= '1' when ((out_mux='0' or number_small='1') and not out_contador="101") else '0';

valor_moeda <= valor_moeda_aux;

--CABOUASMOEDAS: FFD port map(clock, ran_out_of_coins_aux, '1', not ran_out_of_coins_aux, cabou_moedas);

ran_out_of_coins_aux <= '1' when (out_contador = "101" and out_mux='0') else '0';
--ran_out_of_coins_aux <= '1' when (out_contador = "101" and out_mux='0' and processando_aux='1') else '0';


ran_out_of_coins <= ran_out_of_coins_aux;

nao_tem_moeda_atual <= not out_mux;

valor_moeda_a2 <= valor_moeda_a2_aux;

end seletor;