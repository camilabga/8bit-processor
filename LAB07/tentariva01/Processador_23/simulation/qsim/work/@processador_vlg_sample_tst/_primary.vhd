library verilog;
use verilog.vl_types.all;
entity Processador_vlg_sample_tst is
    port(
        clk27           : in     vl_logic;
        key             : in     vl_logic_vector(3 downto 0);
        sw7_0           : in     vl_logic_vector(7 downto 0);
        sw15_8          : in     vl_logic_vector(7 downto 0);
        sw17            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Processador_vlg_sample_tst;
