library verilog;
use verilog.vl_types.all;
entity banco_ABCD_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        r_addr          : in     vl_logic_vector(1 downto 0);
        w_ABCD          : in     vl_logic;
        write_ABCD      : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end banco_ABCD_vlg_sample_tst;
