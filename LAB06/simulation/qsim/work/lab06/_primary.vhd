library verilog;
use verilog.vl_types.all;
entity lab06 is
    port(
        clk_27          : in     vl_logic;
        sw17            : in     vl_logic;
        sw              : in     vl_logic_vector(7 downto 0);
        ram_out_exibir  : out    vl_logic_vector(15 downto 0);
        out_display_ex  : out    vl_logic_vector(15 downto 0);
        opcode_ex       : out    vl_logic_vector(3 downto 0);
        ir_ex           : out    vl_logic_vector(15 downto 0);
        pc_out_ex       : out    vl_logic_vector(7 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0)
    );
end lab06;
