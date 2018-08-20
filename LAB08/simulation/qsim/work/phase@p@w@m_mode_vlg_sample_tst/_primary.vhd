library verilog;
use verilog.vl_types.all;
entity phasePWM_mode_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        duty_cycle      : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end phasePWM_mode_vlg_sample_tst;
