library verilog;
use verilog.vl_types.all;
entity Processador is
    port(
        clk27           : in     vl_logic;
        ram_en          : in     vl_logic;
        per_ram_in      : in     vl_logic_vector(7 downto 0);
        addr_perif      : in     vl_logic_vector(7 downto 0);
        per_ram_out     : out    vl_logic_vector(7 downto 0);
        ram_out         : out    vl_logic_vector(7 downto 0);
        C               : out    vl_logic_vector(7 downto 0);
        opcode          : out    vl_logic_vector(7 downto 0);
        addr_mem        : out    vl_logic_vector(7 downto 0);
        zero            : out    vl_logic
    );
end Processador;
