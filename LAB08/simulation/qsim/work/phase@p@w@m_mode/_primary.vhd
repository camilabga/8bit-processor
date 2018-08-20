library verilog;
use verilog.vl_types.all;
entity phasePWM_mode is
    port(
        clk             : in     vl_logic;
        duty_cycle      : in     vl_logic_vector(7 downto 0);
        timer           : out    vl_logic;
        contador_out    : out    vl_logic_vector(7 downto 0)
    );
end phasePWM_mode;
