library verilog;
use verilog.vl_types.all;
entity ctc_mode_vlg_check_tst is
    port(
        changeO         : in     vl_logic;
        con_out         : in     vl_logic_vector(7 downto 0);
        timer           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ctc_mode_vlg_check_tst;
