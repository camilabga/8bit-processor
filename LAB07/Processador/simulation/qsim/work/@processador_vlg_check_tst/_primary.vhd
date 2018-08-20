library verilog;
use verilog.vl_types.all;
entity Processador_vlg_check_tst is
    port(
        addr_mem        : in     vl_logic_vector(7 downto 0);
        C               : in     vl_logic_vector(7 downto 0);
        opcode          : in     vl_logic_vector(7 downto 0);
        per_ram_out     : in     vl_logic_vector(7 downto 0);
        ram_out         : in     vl_logic_vector(7 downto 0);
        zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Processador_vlg_check_tst;
