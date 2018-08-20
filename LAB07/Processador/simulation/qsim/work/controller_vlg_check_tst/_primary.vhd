library verilog;
use verilog.vl_types.all;
entity controller_vlg_check_tst is
    port(
        Clr_ULA         : in     vl_logic;
        Ld_IR           : in     vl_logic;
        Ld_mar_ABCD     : in     vl_logic;
        Ld_mar_mem      : in     vl_logic;
        Ld_PC           : in     vl_logic;
        Ld_ULA          : in     vl_logic;
        op_ula          : in     vl_logic_vector(3 downto 0);
        opcode          : in     vl_logic_vector(7 downto 0);
        pc              : in     vl_logic_vector(7 downto 0);
        Sel_ABCD_in     : in     vl_logic;
        Sel_addr_ABCD   : in     vl_logic;
        Sel_addr_mem    : in     vl_logic_vector(1 downto 0);
        Sel_case_SP     : in     vl_logic;
        Sel_mar_mem     : in     vl_logic;
        Sel_mem_in      : in     vl_logic;
        Sel_se_mult     : in     vl_logic;
        Sel_ULA_in      : in     vl_logic;
        sp              : in     vl_logic_vector(7 downto 0);
        Wr_ABCD         : in     vl_logic;
        wr_mem          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end controller_vlg_check_tst;
