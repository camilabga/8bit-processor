library verilog;
use verilog.vl_types.all;
entity maquina_troco_vlg_check_tst is
    port(
        manter_moeda    : in     vl_logic;
        out_moeda       : in     vl_logic_vector(5 downto 0);
        processando     : in     vl_logic;
        sem_trocado     : in     vl_logic;
        trocar_moeda    : in     vl_logic;
        ultima_moeda    : in     vl_logic;
        value_reg_exibir: in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end maquina_troco_vlg_check_tst;
