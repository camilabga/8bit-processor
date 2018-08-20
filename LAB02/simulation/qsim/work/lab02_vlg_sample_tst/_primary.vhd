library verilog;
use verilog.vl_types.all;
entity lab02_vlg_sample_tst is
    port(
        key2            : in     vl_logic;
        key3            : in     vl_logic;
        number          : in     vl_logic_vector(13 downto 0);
        r0              : in     vl_logic;
        select_mux      : in     vl_logic_vector(2 downto 0);
        sw17            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab02_vlg_sample_tst;
