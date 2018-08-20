library verilog;
use verilog.vl_types.all;
entity contador16bits_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        desce           : in     vl_logic;
        ld              : in     vl_logic;
        sobe            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end contador16bits_vlg_sample_tst;
