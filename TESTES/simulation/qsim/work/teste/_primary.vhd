library verilog;
use verilog.vl_types.all;
entity teste is
    port(
        clock           : in     vl_logic;
        clear           : in     vl_logic;
        load            : in     vl_logic;
        C               : out    vl_logic_vector(5 downto 0)
    );
end teste;
