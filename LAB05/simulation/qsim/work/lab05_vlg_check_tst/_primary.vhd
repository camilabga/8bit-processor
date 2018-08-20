library verilog;
use verilog.vl_types.all;
entity lab05_vlg_check_tst is
    port(
        bts_rd          : in     vl_logic;
        bts_wr          : in     vl_logic;
        contador_ROM    : in     vl_logic_vector(5 downto 0);
        hex0            : in     vl_logic_vector(6 downto 0);
        hex1            : in     vl_logic_vector(6 downto 0);
        hex2            : in     vl_logic_vector(6 downto 0);
        hex3            : in     vl_logic_vector(6 downto 0);
        hex4            : in     vl_logic_vector(6 downto 0);
        hex5            : in     vl_logic_vector(6 downto 0);
        ledr0           : in     vl_logic;
        ledr1           : in     vl_logic;
        r_data_exibir   : in     vl_logic_vector(12 downto 0);
        w_data_exibir   : in     vl_logic_vector(12 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab05_vlg_check_tst;
