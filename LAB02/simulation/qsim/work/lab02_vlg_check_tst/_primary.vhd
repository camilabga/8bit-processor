library verilog;
use verilog.vl_types.all;
entity lab02_vlg_check_tst is
    port(
        C               : in     vl_logic_vector(3 downto 0);
        D               : in     vl_logic_vector(3 downto 0);
        D0              : in     vl_logic_vector(6 downto 0);
        D1              : in     vl_logic_vector(6 downto 0);
        D2              : in     vl_logic_vector(6 downto 0);
        D3              : in     vl_logic_vector(6 downto 0);
        M               : in     vl_logic_vector(3 downto 0);
        U               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab02_vlg_check_tst;
