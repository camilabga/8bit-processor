library verilog;
use verilog.vl_types.all;
entity maquina_troco is
    port(
        V               : in     vl_logic_vector(9 downto 0);
        tem_moeda       : in     vl_logic_vector(5 downto 0);
        new_troco       : in     vl_logic;
        clock           : in     vl_logic;
        value_reg_exibir: out    vl_logic_vector(9 downto 0);
        trocar_moeda    : out    vl_logic;
        manter_moeda    : out    vl_logic;
        ultima_moeda    : out    vl_logic;
        processando     : out    vl_logic;
        sem_trocado     : out    vl_logic;
        out_moeda       : out    vl_logic_vector(5 downto 0)
    );
end maquina_troco;
