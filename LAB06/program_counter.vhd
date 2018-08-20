library ieee;
use ieee.std_logic_1164.all;

entity program_counter is
    port(PC_clr, PC_inc, PC_clk: in std_logic;
         addr: out std_logic_vector(7 downto 0));
end program_counter;

architecture pc of program_counter is

component contador8bits is
    port (sobe, desce, clk, ld, clr: in std_logic;
          saida: out std_logic_vector (7 downto 0));
end component;

signal addr0: std_logic_vector(7 downto 0);

begin

CONT0: contador8bits port map('1', '0', PC_clk, PC_inc, PC_clr, addr0);

addr <= addr0;

end pc;