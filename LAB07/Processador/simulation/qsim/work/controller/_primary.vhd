library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        read_data       : in     vl_logic_vector(7 downto 0);
        carry           : in     vl_logic;
        z               : in     vl_logic;
        clk             : in     vl_logic;
        op_ula          : out    vl_logic_vector(3 downto 0);
        Sel_addr_mem    : out    vl_logic_vector(1 downto 0);
        Sel_mar_mem     : out    vl_logic;
        Ld_mar_mem      : out    vl_logic;
        Sel_se_mult     : out    vl_logic;
        Wr_ABCD         : out    vl_logic;
        Ld_mar_ABCD     : out    vl_logic;
        Sel_addr_ABCD   : out    vl_logic;
        Sel_mem_in      : out    vl_logic;
        Sel_ABCD_in     : out    vl_logic;
        Sel_ULA_in      : out    vl_logic;
        Ld_ULA          : out    vl_logic;
        Clr_ULA         : out    vl_logic;
        Sel_case_SP     : out    vl_logic;
        wr_mem          : out    vl_logic;
        pc              : out    vl_logic_vector(7 downto 0);
        sp              : out    vl_logic_vector(7 downto 0);
        Ld_PC           : out    vl_logic;
        Ld_IR           : out    vl_logic;
        opcode          : out    vl_logic_vector(7 downto 0)
    );
end controller;
