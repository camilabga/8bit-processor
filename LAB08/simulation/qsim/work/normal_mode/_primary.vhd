library verilog;
use verilog.vl_types.all;
entity normal_mode is
    port(
        clk             : in     vl_logic;
        timer           : out    vl_logic
    );
end normal_mode;
