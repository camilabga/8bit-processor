library verilog;
use verilog.vl_types.all;
entity SPI_SD is
    port(
        clk             : in     vl_logic;
        MISO            : in     vl_logic;
        instruction     : in     vl_logic_vector(7 downto 0);
        MOSI            : out    vl_logic;
        status_reg      : out    vl_logic_vector(7 downto 0);
        out_somador     : out    vl_logic_vector(7 downto 0)
    );
end SPI_SD;
