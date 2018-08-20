library verilog;
use verilog.vl_types.all;
entity seletor_moeda_vlg_check_tst is
    port(
        nao_tem_moeda_atual: in     vl_logic;
        ran_out_of_coins: in     vl_logic;
        valor_moeda     : in     vl_logic_vector(9 downto 0);
        valor_moeda_a2  : in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end seletor_moeda_vlg_check_tst;
