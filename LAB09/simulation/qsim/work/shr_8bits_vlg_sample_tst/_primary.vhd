library verilog;
use verilog.vl_types.all;
entity shr_8bits_vlg_sample_tst is
    port(
        i               : in     vl_logic_vector(7 downto 0);
        shift           : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end shr_8bits_vlg_sample_tst;
