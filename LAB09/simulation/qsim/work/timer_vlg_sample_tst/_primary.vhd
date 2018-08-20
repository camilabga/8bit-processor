library verilog;
use verilog.vl_types.all;
entity timer_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clock_limiter   : in     vl_logic_vector(7 downto 0);
        mode            : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end timer_vlg_sample_tst;
