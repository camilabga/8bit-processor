library verilog;
use verilog.vl_types.all;
entity lab05 is
    port(
        key0            : in     vl_logic;
        key1            : in     vl_logic;
        key3            : in     vl_logic;
        clock_27        : in     vl_logic;
        hex0            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex5            : out    vl_logic_vector(6 downto 0);
        bts_rd          : out    vl_logic;
        bts_wr          : out    vl_logic;
        contador_ROM    : out    vl_logic_vector(5 downto 0);
        r_data_exibir   : out    vl_logic_vector(12 downto 0);
        w_data_exibir   : out    vl_logic_vector(12 downto 0);
        ledr0           : out    vl_logic;
        ledr1           : out    vl_logic
    );
end lab05;
