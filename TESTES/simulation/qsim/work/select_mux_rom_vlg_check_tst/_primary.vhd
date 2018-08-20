library verilog;
use verilog.vl_types.all;
entity select_mux_rom_vlg_check_tst is
    port(
        empty           : in     vl_logic;
        full            : in     vl_logic;
        result          : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end select_mux_rom_vlg_check_tst;
