library verilog;
use verilog.vl_types.all;
entity lab01_vlg_sample_tst is
    port(
        buttons         : in     vl_logic_vector(3 downto 0);
        clk_27          : in     vl_logic;
        r0              : in     vl_logic;
        sw              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab01_vlg_sample_tst;
