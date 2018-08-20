library verilog;
use verilog.vl_types.all;
entity lab01 is
    port(
        clk_27          : in     vl_logic;
        sw              : in     vl_logic;
        r0              : in     vl_logic;
        buttons         : in     vl_logic_vector(3 downto 0);
        ledr            : out    vl_logic;
        display7        : out    vl_logic_vector(6 downto 0)
    );
end lab01;
