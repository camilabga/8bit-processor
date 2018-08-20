library verilog;
use verilog.vl_types.all;
entity mult_8bits_vlg_check_tst is
    port(
        c               : in     vl_logic_vector(7 downto 0);
        carry           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end mult_8bits_vlg_check_tst;
