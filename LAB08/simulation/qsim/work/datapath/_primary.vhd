library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        read_data       : in     vl_logic_vector(7 downto 0);
        pc              : in     vl_logic_vector(7 downto 0);
        sp              : in     vl_logic_vector(7 downto 0);
        op_ula          : in     vl_logic_vector(3 downto 0);
        Sel_addr_mem    : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        Sel_mar_mem     : in     vl_logic;
        Ld_mar_mem      : in     vl_logic;
        Sel_se_mult     : in     vl_logic;
        Wr_ABCD         : in     vl_logic;
        Ld_mar_ABCD     : in     vl_logic;
        Sel_addr_ABCD   : in     vl_logic;
        Sel_mem_in      : in     vl_logic;
        Sel_ABCD_in     : in     vl_logic;
        Sel_ULA_in      : in     vl_logic;
        Ld_ULA          : in     vl_logic;
        Clr_ULA         : in     vl_logic;
        Sel_case_SP     : in     vl_logic;
        write_data      : out    vl_logic_vector(7 downto 0);
        addr_mem        : out    vl_logic_vector(7 downto 0);
        c               : out    vl_logic;
        z               : out    vl_logic;
        A               : out    vl_logic_vector(7 downto 0)
    );
end datapath;
