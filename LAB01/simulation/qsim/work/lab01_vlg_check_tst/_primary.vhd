library verilog;
use verilog.vl_types.all;
entity lab01_vlg_check_tst is
    port(
        display7        : in     vl_logic_vector(6 downto 0);
        ledr            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end lab01_vlg_check_tst;
