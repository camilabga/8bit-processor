library verilog;
use verilog.vl_types.all;
entity lab05_vlg_sample_tst is
    port(
        clock_27        : in     vl_logic;
        key0            : in     vl_logic;
        key1            : in     vl_logic;
        key3            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab05_vlg_sample_tst;
