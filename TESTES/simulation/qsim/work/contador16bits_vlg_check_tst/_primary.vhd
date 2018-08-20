library verilog;
use verilog.vl_types.all;
entity contador16bits_vlg_check_tst is
    port(
        saida           : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end contador16bits_vlg_check_tst;
