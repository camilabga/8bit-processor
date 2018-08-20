library verilog;
use verilog.vl_types.all;
entity processador_perifericos_timer_spi is
    port(
        clk27           : in     vl_logic;
        DAT             : in     vl_logic;
        SW7_0           : in     vl_logic_vector(7 downto 0);
        SW15_8          : in     vl_logic_vector(7 downto 0);
        KEY3_0          : in     vl_logic_vector(3 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        HEX6            : out    vl_logic_vector(6 downto 0);
        HEX7            : out    vl_logic_vector(6 downto 0);
        LEDR7_0         : out    vl_logic_vector(7 downto 0);
        LEDR15_8        : out    vl_logic_vector(7 downto 0);
        LEDG7_0         : out    vl_logic_vector(7 downto 0);
        LEDR17          : out    vl_logic;
        DAT3            : out    vl_logic;
        CMD             : out    vl_logic;
        SCK             : out    vl_logic;
        opcode          : out    vl_logic_vector(7 downto 0);
        ram_out         : out    vl_logic_vector(7 downto 0)
    );
end processador_perifericos_timer_spi;
