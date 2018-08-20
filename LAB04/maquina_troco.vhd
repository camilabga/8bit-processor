library ieee;
use ieee.std_logic_1164.all;

entity maquina_troco is
    port(V: in std_logic_vector(9 downto 0);
         tem_moeda: in std_logic_vector(5 downto 0);
         new_troco, clock: in std_logic;

        value_reg_exibir: out std_logic_vector(9 downto 0);
        trocar_moeda, manter_moeda, ultima_moeda: out std_logic;

         processando, sem_trocado: out std_logic;         
         out_moeda: out std_logic_vector(5 downto 0));
end maquina_troco;

architecture change_machine of maquina_troco is

component operations is
    port(moeda_value, moeda_value_a2, value: in std_logic_vector(9 downto 0);
		 nao_tem_moeda_atual: in std_logic;
         trocar_moeda, manter_moeda, ultima_moeda: out std_logic;
         next_value: out std_logic_vector(9 downto 0));
end component;

component mux_reg_atual is
    port(V, saida_subtrator: in std_logic_vector(9 downto 0);
         new_troco, processando: in std_logic;
         in_reg: out std_logic_vector(9 downto 0));
end component;

component registrador is
    port(registrador_in: in std_logic_vector(9 downto 0);
        ld, clear, clk: in std_logic;
        registrador_out: out std_logic_vector(9 downto 0));
end component;

component seletor_moeda is
    port(is_there_coin: in std_logic_vector(5 downto 0);
         clock, clear, number_small, processando_aux: in std_logic;
         valor_moeda, valor_moeda_a2: out std_logic_vector(9 downto 0);
         ran_out_of_coins, nao_tem_moeda_atual: out std_logic);
end component;

component decod_moeda_out is
    port(valor_moeda: in std_logic_vector(9 downto 0);
         tem_moeda: in std_logic_vector(5 downto 0);
         clock, manter_moeda, ultima_moeda, trocar_moeda, processando_aux, value_nulo: in std_logic;
         out_moeda: out std_logic_vector(5 downto 0));
end component;

component FFD is
	port(clk,D,P,C:in std_logic;
		q:out std_logic);
end component;

signal clear_seletor_moeda, trocar_moeda_aux, manter_moeda_aux, ld_reg: std_logic;
signal ultima_moeda_aux, processando_aux, sem_trocado_aux, value_nulo, nao_tem_moeda_atual, sem_trocado_aux1: std_logic;
signal valor_moeda, valor_moeda_a2, value, next_value, out_mux: std_logic_vector(9 downto 0);
signal out_moeda_aux: std_logic_vector(5 downto 0);

begin

clear_seletor_moeda <= (not processando_aux and new_troco) or (value_nulo);

OPERACIONAL: operations port map(valor_moeda, valor_moeda_a2, value, nao_tem_moeda_atual, trocar_moeda_aux, manter_moeda_aux, ultima_moeda_aux, next_value);

MUXREGATUAL: mux_reg_atual port map(V, next_value, new_troco, processando_aux, out_mux);

CONTROLLER: seletor_moeda port map(tem_moeda, clock, clear_seletor_moeda, trocar_moeda_aux, processando_aux, valor_moeda, 
                                    valor_moeda_a2, sem_trocado_aux, nao_tem_moeda_atual);

REG: registrador port map(out_mux, ld_reg, '0', clock, value);
value_nulo <= '1' when value = "0000000000" else '0';
ld_reg <= (new_troco or (not trocar_moeda_aux and not value_nulo)) and (not nao_tem_moeda_atual);

DECODOUT: decod_moeda_out port map(valor_moeda, tem_moeda, clock, manter_moeda_aux, ultima_moeda_aux, trocar_moeda_aux, processando_aux, value_nulo, out_moeda_aux);

PROCESSREG: ffd port map(clock, (processando_aux or new_troco), '1', not ultima_moeda_aux, processando_aux);

--processando_aux <= not ultima_moeda_aux;

out_moeda <= out_moeda_aux;

processando <= processando_aux;

--sem_trocado_aux1 <= '1' when (valor_moeda="0000000001" and nao_tem_moeda_atual='1') else '0';
--sem_trocado_aux1 <= '1' when (valor_moeda="0000000000") else '0';

sem_trocado<=sem_trocado_aux;


value_reg_exibir <= value;
trocar_moeda <= trocar_moeda_aux;
manter_moeda <= manter_moeda_aux;
ultima_moeda <= ultima_moeda_aux;

end change_machine;