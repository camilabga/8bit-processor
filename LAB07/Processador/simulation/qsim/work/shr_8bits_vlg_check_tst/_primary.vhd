library verilog;
use verilog.vl_types.all;
entity shr_8bits_vlg_check_tst is
    port(
        carry           : in     vl_logic;
        s               : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end shr_8bits_vlg_check_tst;
