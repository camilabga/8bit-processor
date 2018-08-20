library verilog;
use verilog.vl_types.all;
entity fifo is
    port(
        wr              : in     vl_logic;
        rd              : in     vl_logic;
        clr_fifo        : in     vl_logic;
        clk             : in     vl_logic;
        w_data          : in     vl_logic_vector(12 downto 0);
        r_data          : out    vl_logic_vector(12 downto 0);
        empty           : out    vl_logic;
        full            : out    vl_logic
    );
end fifo;
