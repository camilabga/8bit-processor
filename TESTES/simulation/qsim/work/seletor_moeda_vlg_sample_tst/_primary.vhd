library verilog;
use verilog.vl_types.all;
entity seletor_moeda_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clock           : in     vl_logic;
        is_there_coin   : in     vl_logic_vector(5 downto 0);
        number_small    : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end seletor_moeda_vlg_sample_tst;
