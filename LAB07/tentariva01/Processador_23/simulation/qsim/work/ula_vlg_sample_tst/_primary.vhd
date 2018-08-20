library verilog;
use verilog.vl_types.all;
entity ula_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        entrada         : in     vl_logic_vector(7 downto 0);
        ld              : in     vl_logic;
        sel_op          : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end ula_vlg_sample_tst;
