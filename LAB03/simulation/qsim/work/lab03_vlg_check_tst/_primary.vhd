library verilog;
use verilog.vl_types.all;
entity lab03_vlg_check_tst is
    port(
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        HEX2            : in     vl_logic_vector(6 downto 0);
        HEX3            : in     vl_logic_vector(6 downto 0);
        HEX4            : in     vl_logic_vector(6 downto 0);
        led             : in     vl_logic;
        saida_contador  : in     vl_logic_vector(3 downto 0);
        soma_exibir     : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab03_vlg_check_tst;
