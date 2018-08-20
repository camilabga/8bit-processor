library verilog;
use verilog.vl_types.all;
entity contador16bits is
    port(
        sobe            : in     vl_logic;
        desce           : in     vl_logic;
        clk             : in     vl_logic;
        ld              : in     vl_logic;
        clr             : in     vl_logic;
        saida           : out    vl_logic_vector(15 downto 0)
    );
end contador16bits;
