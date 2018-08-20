library verilog;
use verilog.vl_types.all;
entity controller_vlg_sample_tst is
    port(
        carry           : in     vl_logic;
        clk             : in     vl_logic;
        read_data       : in     vl_logic_vector(7 downto 0);
        z               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end controller_vlg_sample_tst;
