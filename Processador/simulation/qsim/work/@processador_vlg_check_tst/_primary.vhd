library verilog;
use verilog.vl_types.all;
entity Processador_vlg_check_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        C               : in     vl_logic_vector(7 downto 0);
        D               : in     vl_logic_vector(7 downto 0);
        entrada2        : in     vl_logic_vector(7 downto 0);
        Ld_IR           : in     vl_logic;
        Ld_mar_ABCD     : in     vl_logic;
        Ld_PC           : in     vl_logic;
        opcode          : in     vl_logic_vector(7 downto 0);
        out0            : in     vl_logic_vector(6 downto 0);
        out1            : in     vl_logic_vector(6 downto 0);
        out2            : in     vl_logic_vector(6 downto 0);
        pc              : in     vl_logic_vector(7 downto 0);
        ram_out         : in     vl_logic_vector(7 downto 0);
        Wr_ABCD         : in     vl_logic;
        write_data      : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Processador_vlg_check_tst;
