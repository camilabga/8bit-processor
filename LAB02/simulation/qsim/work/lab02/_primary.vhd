library verilog;
use verilog.vl_types.all;
entity lab02 is
    port(
        number          : in     vl_logic_vector(13 downto 0);
        select_mux      : in     vl_logic_vector(2 downto 0);
        r0              : in     vl_logic;
        key2            : in     vl_logic;
        key3            : in     vl_logic;
        sw17            : in     vl_logic;
        D0              : out    vl_logic_vector(6 downto 0);
        D1              : out    vl_logic_vector(6 downto 0);
        D2              : out    vl_logic_vector(6 downto 0);
        D3              : out    vl_logic_vector(6 downto 0);
        U               : out    vl_logic_vector(3 downto 0);
        D               : out    vl_logic_vector(3 downto 0);
        C               : out    vl_logic_vector(3 downto 0);
        M               : out    vl_logic_vector(3 downto 0)
    );
end lab02;
