library verilog;
use verilog.vl_types.all;
entity mult_8bits is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        c               : out    vl_logic_vector(7 downto 0);
        carry           : out    vl_logic
    );
end mult_8bits;
