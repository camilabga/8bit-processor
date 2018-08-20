library verilog;
use verilog.vl_types.all;
entity SPI_SD_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        instruction     : in     vl_logic_vector(7 downto 0);
        MISO            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end SPI_SD_vlg_sample_tst;
