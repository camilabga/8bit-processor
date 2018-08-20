library verilog;
use verilog.vl_types.all;
entity select_mux_rom_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clock           : in     vl_logic;
        rd              : in     vl_logic;
        wr              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end select_mux_rom_vlg_sample_tst;
