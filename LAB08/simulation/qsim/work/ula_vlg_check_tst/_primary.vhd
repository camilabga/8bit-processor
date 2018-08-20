library verilog;
use verilog.vl_types.all;
entity ula_vlg_check_tst is
    port(
        c               : in     vl_logic;
        saida           : in     vl_logic_vector(7 downto 0);
        z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ula_vlg_check_tst;
