library verilog;
use verilog.vl_types.all;
entity datapath_vlg_check_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        addr_mem        : in     vl_logic_vector(7 downto 0);
        c               : in     vl_logic;
        write_data      : in     vl_logic_vector(7 downto 0);
        z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end datapath_vlg_check_tst;
