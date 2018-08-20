library verilog;
use verilog.vl_types.all;
entity SPI_SD_vlg_check_tst is
    port(
        MOSI            : in     vl_logic;
        out_somador     : in     vl_logic_vector(7 downto 0);
        status_reg      : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end SPI_SD_vlg_check_tst;
