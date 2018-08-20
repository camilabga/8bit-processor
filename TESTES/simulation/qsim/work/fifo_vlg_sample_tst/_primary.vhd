library verilog;
use verilog.vl_types.all;
entity fifo_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clr_fifo        : in     vl_logic;
        rd              : in     vl_logic;
        w_data          : in     vl_logic_vector(12 downto 0);
        wr              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end fifo_vlg_sample_tst;
