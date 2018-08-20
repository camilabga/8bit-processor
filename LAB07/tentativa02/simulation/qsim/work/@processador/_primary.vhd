library verilog;
use verilog.vl_types.all;
entity Processador is
    port(
        clk27           : in     vl_logic;
        sw17            : in     vl_logic;
        sw_ram          : in     vl_logic_vector(7 downto 0);
        D1              : out    vl_logic_vector(6 downto 0);
        D2              : out    vl_logic_vector(6 downto 0);
        D3              : out    vl_logic_vector(6 downto 0);
        A               : out    vl_logic_vector(7 downto 0);
        B               : out    vl_logic_vector(7 downto 0);
        C               : out    vl_logic_vector(7 downto 0);
        D               : out    vl_logic_vector(7 downto 0);
        pc              : out    vl_logic_vector(7 downto 0);
        ram_out         : out    vl_logic_vector(7 downto 0);
        Ld_PC           : out    vl_logic;
        Ld_IR           : out    vl_logic;
        Wr_ABCD         : out    vl_logic;
        Ld_mar_ABCD     : out    vl_logic;
        opcode          : out    vl_logic_vector(7 downto 0);
        write_data      : out    vl_logic_vector(7 downto 0);
        entrada2        : out    vl_logic_vector(7 downto 0)
    );
end Processador;
