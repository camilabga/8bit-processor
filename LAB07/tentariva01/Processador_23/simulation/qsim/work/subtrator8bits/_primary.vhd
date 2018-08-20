library verilog;
use verilog.vl_types.all;
entity subtrator8bits is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        c               : out    vl_logic_vector(7 downto 0);
        cout            : out    vl_logic
    );
end subtrator8bits;
