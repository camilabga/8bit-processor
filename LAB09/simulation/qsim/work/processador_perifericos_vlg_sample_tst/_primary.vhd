library verilog;
use verilog.vl_types.all;
entity processador_perifericos_vlg_sample_tst is
    port(
        clk27           : in     vl_logic;
        KEY3_0          : in     vl_logic_vector(3 downto 0);
        SW7_0           : in     vl_logic_vector(7 downto 0);
        SW15_8          : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end processador_perifericos_vlg_sample_tst;
