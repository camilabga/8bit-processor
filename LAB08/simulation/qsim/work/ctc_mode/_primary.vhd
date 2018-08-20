library verilog;
use verilog.vl_types.all;
entity ctc_mode is
    port(
        clk             : in     vl_logic;
        top             : in     vl_logic_vector(7 downto 0);
        timer           : out    vl_logic;
        con_out         : out    vl_logic_vector(7 downto 0);
        changeO         : out    vl_logic
    );
end ctc_mode;
