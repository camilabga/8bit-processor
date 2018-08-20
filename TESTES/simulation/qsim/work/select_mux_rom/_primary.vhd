library verilog;
use verilog.vl_types.all;
entity select_mux_rom is
    port(
        wr              : in     vl_logic;
        rd              : in     vl_logic;
        clear           : in     vl_logic;
        clock           : in     vl_logic;
        result          : out    vl_logic_vector(3 downto 0);
        full            : out    vl_logic;
        empty           : out    vl_logic
    );
end select_mux_rom;
