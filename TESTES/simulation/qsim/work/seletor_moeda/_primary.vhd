library verilog;
use verilog.vl_types.all;
entity seletor_moeda is
    port(
        is_there_coin   : in     vl_logic_vector(5 downto 0);
        clock           : in     vl_logic;
        clear           : in     vl_logic;
        number_small    : in     vl_logic;
        valor_moeda     : out    vl_logic_vector(9 downto 0);
        valor_moeda_a2  : out    vl_logic_vector(9 downto 0);
        ran_out_of_coins: out    vl_logic;
        nao_tem_moeda_atual: out    vl_logic
    );
end seletor_moeda;
