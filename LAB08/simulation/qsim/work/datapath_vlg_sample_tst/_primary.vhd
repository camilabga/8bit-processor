library verilog;
use verilog.vl_types.all;
entity datapath_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        Clr_ULA         : in     vl_logic;
        Ld_mar_ABCD     : in     vl_logic;
        Ld_mar_mem      : in     vl_logic;
        Ld_ULA          : in     vl_logic;
        op_ula          : in     vl_logic_vector(3 downto 0);
        pc              : in     vl_logic_vector(7 downto 0);
        read_data       : in     vl_logic_vector(7 downto 0);
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
        sampler_tx      : out    vl_logic
    );
end datapath_vlg_sample_tst;
