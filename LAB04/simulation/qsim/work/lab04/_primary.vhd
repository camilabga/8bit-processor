library verilog;
use verilog.vl_types.all;
entity lab04 is
    port(
        clk_27          : in     vl_logic;
        key2            : in     vl_logic;
        key3            : in     vl_logic;
        sw              : in     vl_logic_vector(5 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        valor_V         : out    vl_logic_vector(9 downto 0);
        trocar_moeda    : out    vl_logic;
        manter_moeda    : out    vl_logic;
        ultima_moeda    : out    vl_logic;
        ledg0           : out    vl_logic;
        ledg1           : out    vl_logic;
        ledg2           : out    vl_logic;
        ledg3           : out    vl_logic;
        ledr            : out    vl_logic_vector(5 downto 0)
    );
end lab04;
