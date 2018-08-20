library verilog;
use verilog.vl_types.all;
entity processador_perifericos_timer_vlg_check_tst is
    port(
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        HEX2            : in     vl_logic_vector(6 downto 0);
        HEX3            : in     vl_logic_vector(6 downto 0);
        HEX4            : in     vl_logic_vector(6 downto 0);
        HEX5            : in     vl_logic_vector(6 downto 0);
        HEX6            : in     vl_logic_vector(6 downto 0);
        HEX7            : in     vl_logic_vector(6 downto 0);
        LEDG7_0         : in     vl_logic_vector(7 downto 0);
        LEDR7_0         : in     vl_logic_vector(7 downto 0);
        LEDR15_8        : in     vl_logic_vector(7 downto 0);
        LEDR17          : in     vl_logic;
        opcode          : in     vl_logic_vector(7 downto 0);
        ram_out         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end processador_perifericos_timer_vlg_check_tst;
