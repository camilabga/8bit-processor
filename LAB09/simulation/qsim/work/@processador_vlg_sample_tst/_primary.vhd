library verilog;
use verilog.vl_types.all;
entity Processador_vlg_sample_tst is
    port(
        addr_perif      : in     vl_logic_vector(7 downto 0);
        clk27           : in     vl_logic;
        per_ram_in      : in     vl_logic_vector(7 downto 0);
        ram_en          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Processador_vlg_sample_tst;
