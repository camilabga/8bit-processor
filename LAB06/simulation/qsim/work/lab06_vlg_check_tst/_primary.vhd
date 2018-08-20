library verilog;
use verilog.vl_types.all;
entity lab06_vlg_check_tst is
    port(
        hex0            : in     vl_logic_vector(6 downto 0);
        hex1            : in     vl_logic_vector(6 downto 0);
        hex2            : in     vl_logic_vector(6 downto 0);
        hex3            : in     vl_logic_vector(6 downto 0);
        ir_ex           : in     vl_logic_vector(15 downto 0);
        opcode_ex       : in     vl_logic_vector(3 downto 0);
        out_display_ex  : in     vl_logic_vector(15 downto 0);
        pc_out_ex       : in     vl_logic_vector(7 downto 0);
        ram_out_exibir  : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab06_vlg_check_tst;
