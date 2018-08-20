library verilog;
use verilog.vl_types.all;
entity maquina_troco_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        new_troco       : in     vl_logic;
        tem_moeda       : in     vl_logic_vector(5 downto 0);
        V               : in     vl_logic_vector(9 downto 0);
        sampler_tx      : out    vl_logic
    );
end maquina_troco_vlg_sample_tst;
