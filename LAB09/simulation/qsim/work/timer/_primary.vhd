library verilog;
use verilog.vl_types.all;
entity timer is
    port(
        clk             : in     vl_logic;
        mode            : in     vl_logic_vector(1 downto 0);
        clock_limiter   : in     vl_logic_vector(7 downto 0);
        timer0          : out    vl_logic
    );
end timer;
