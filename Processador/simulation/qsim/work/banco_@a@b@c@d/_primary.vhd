library verilog;
use verilog.vl_types.all;
entity banco_ABCD is
    port(
        write_ABCD      : in     vl_logic_vector(7 downto 0);
        r_addr          : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        w_ABCD          : in     vl_logic;
        out_ABCD        : out    vl_logic_vector(7 downto 0);
        A               : out    vl_logic_vector(7 downto 0)
    );
end banco_ABCD;
