library verilog;
use verilog.vl_types.all;
entity SD07_vlg_check_tst is
    port(
        addr_mem        : in     vl_logic_vector(7 downto 0);
        C               : in     vl_logic_vector(7 downto 0);
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
        opcode          : in     vl_logic_vector(7 downto 0);
        ram_out         : in     vl_logic_vector(7 downto 0);
        zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end SD07_vlg_check_tst;
