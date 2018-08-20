library verilog;
use verilog.vl_types.all;
entity Processador is
    port(
        clk27           : in     vl_logic;
        sw17            : in     vl_logic;
        sw7_0           : in     vl_logic_vector(7 downto 0);
        sw15_8          : in     vl_logic_vector(7 downto 0);
        key             : in     vl_logic_vector(3 downto 0);
        ledr7_0         : out    vl_logic_vector(7 downto 0);
        ledr15_8        : out    vl_logic_vector(7 downto 0);
        ledg            : out    vl_logic_vector(7 downto 0);
        hex0            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex5            : out    vl_logic_vector(6 downto 0);
        hex6            : out    vl_logic_vector(6 downto 0);
        hex7            : out    vl_logic_vector(6 downto 0);
        outA            : out    vl_logic_vector(7 downto 0);
        outB            : out    vl_logic_vector(7 downto 0);
        outC            : out    vl_logic_vector(7 downto 0);
        outD            : out    vl_logic_vector(7 downto 0);
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
