library verilog;
use verilog.vl_types.all;
entity ula is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        entrada         : in     vl_logic_vector(7 downto 0);
        sel_op          : in     vl_logic_vector(3 downto 0);
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        ld              : in     vl_logic;
        saida           : out    vl_logic_vector(7 downto 0);
        c               : out    vl_logic;
        z               : out    vl_logic
    );
end ula;
