library verilog;
use verilog.vl_types.all;
entity Processador_vlg_sample_tst is
    port(
        clk27           : in     vl_logic;
        sw              : in     vl_logic_vector(7 downto 0);
        sw17            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Processador_vlg_sample_tst;
