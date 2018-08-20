library verilog;
use verilog.vl_types.all;
entity shl_8bits is
    port(
        i               : in     vl_logic_vector(7 downto 0);
        shift           : in     vl_logic_vector(7 downto 0);
        s               : out    vl_logic_vector(7 downto 0);
        carry           : out    vl_logic
    );
end shl_8bits;
