library verilog;
use verilog.vl_types.all;
entity lab04_vlg_check_tst is
    port(
        hex0            : in     vl_logic_vector(6 downto 0);
        hex1            : in     vl_logic_vector(6 downto 0);
        hex2            : in     vl_logic_vector(6 downto 0);
        ledg0           : in     vl_logic;
        ledg1           : in     vl_logic;
        ledg2           : in     vl_logic;
        ledg3           : in     vl_logic;
        ledr            : in     vl_logic_vector(5 downto 0);
        manter_moeda    : in     vl_logic;
        trocar_moeda    : in     vl_logic;
        ultima_moeda    : in     vl_logic;
        valor_V         : in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab04_vlg_check_tst;
