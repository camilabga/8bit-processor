library ieee;
use ieee.std_logic_1164.all;

entity select_mux_rom is
    port(wr, rd, clear, clock: in std_logic;
         result: out std_logic_vector(3 downto 0);
         full, empty: out std_logic);
end select_mux_rom;

architecture wr_rd_sum of select_mux_rom is

component somador4bits is
	port(a,b:in  std_logic_vector(3 downto 0);
	     c:out std_logic_vector(3 downto 0);
	     cin: in std_logic;
	     cout:out std_logic);
end component;

component reg4bits is
    port(registrador_in: in std_logic_vector(3 downto 0);
        ld, clear, clk: in std_logic;
        registrador_out: out std_logic_vector(3 downto 0));
end component;

signal cont, sum_out, current_value: std_logic_vector(3 downto 0);

begin

cont <= "0000" when ((current_value = "1111" and wr='1') or (current_value = "0000" and rd = '1')) else
        "0001" when wr='1' else
        "1111" when rd='1';

full <= '1' when current_value = "1111" else '0';
empty <= '1' when current_value = "0000" else '0';

SOMA: somador4bits port map(current_value, cont, sum_out, '0', open);
SAVECONT: reg4bits port map(sum_out, wr or rd, clear, clock, current_value);

result <= current_value;

end wr_rd_sum;