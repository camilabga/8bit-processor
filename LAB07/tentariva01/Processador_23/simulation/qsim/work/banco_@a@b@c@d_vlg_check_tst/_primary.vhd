library verilog;
use verilog.vl_types.all;
entity banco_ABCD_vlg_check_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        out_ABCD        : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end banco_ABCD_vlg_check_tst;
