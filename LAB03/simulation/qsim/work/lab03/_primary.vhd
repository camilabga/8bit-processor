library verilog;
use verilog.vl_types.all;
entity lab03 is
    port(
        S               : in     vl_logic_vector(7 downto 0);
        key3            : in     vl_logic;
        key2            : in     vl_logic;
        clk_27          : in     vl_logic;
        led             : out    vl_logic;
        saida_contador  : out    vl_logic_vector(3 downto 0);
        soma_exibir     : out    vl_logic_vector(7 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0)
    );
end lab03;
