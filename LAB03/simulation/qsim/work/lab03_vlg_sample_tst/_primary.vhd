library verilog;
use verilog.vl_types.all;
entity lab03_vlg_sample_tst is
    port(
        clk_27          : in     vl_logic;
        key2            : in     vl_logic;
        key3            : in     vl_logic;
        S               : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end lab03_vlg_sample_tst;
