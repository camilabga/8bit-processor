library ieee;
use ieee.std_logic_1164.all;

entity maq_vendas is
	port(moeda, clock, reset: in std_logic;
	value_product: in std_logic_vector(7 downto 0);
	value_coin: in std_logic_vector(5 downto 0);
	sum_coins: out std_logic_vector(7 downto 0);
	out_product: out std_logic);
end maq_vendas;

architecture maq_v of maq_vendas is

component dataPath is
	port(clock1, tot_ld, tot_clr: in std_logic;
		valorMoeda, valorRefri: in std_logic_vector(7 downto 0);
		acumulador_value: out std_logic_vector(7 downto 0);
		tot_me_s:out std_logic);
end component;

component controller is
	port(clk_c, C, tot_menor_s:in std_logic;
		d, ld_tot, clr_tot:out std_logic);
end component;

signal load_tot, clear_tot, clearVerdadeiro, ME: std_logic;

begin

	clearVerdadeiro <= '0' when (reset = '1') else (not clear_tot);

	OPERA: dataPath port map(clock, load_tot, clearVerdadeiro, "00"&value_coin, value_product, sum_coins, ME);
	
	CONTROL: Controller port map(clock, moeda, ME, out_product, load_tot, clear_tot); 

end maq_v;
