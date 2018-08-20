library verilog;
use verilog.vl_types.all;
entity lab04_vlg_sample_tst is
    port(
        clk_27          : in     vl_logic;
        key2            : in     vl_logic;
        key3            : in     vl_logic;
        sw              : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end lab04_vlg_sample_tst;
