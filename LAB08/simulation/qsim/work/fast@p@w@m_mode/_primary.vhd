library verilog;
use verilog.vl_types.all;
entity fastPWM_mode is
    port(
        clk             : in     vl_logic;
        duty_cycle      : in     vl_logic_vector(7 downto 0);
        timer           : out    vl_logic
    );
end fastPWM_mode;
