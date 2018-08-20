library ieee;
use ieee.std_logic_1164.all;

entity in_reg is
    port(current, next_value, rom: in std_logic_vector(12 downto 0);
         carrega_rom, rd, wr: in std_logic;
         in_registrador: out std_logic_vector(12 downto 0));
end in_reg;

architecture logic_in_reg of in_reg is

signal aux_reg: std_logic_vector(12 downto 0);

begin

aux_reg(0) <= (wr and carrega_rom and rom(0) and not rd) or (not carrega_rom and current(0) and not rd) or (rd and next_value(0));
aux_reg(1) <= (wr and carrega_rom and rom(1) and not rd) or (not carrega_rom and current(1) and not rd) or (rd and next_value(1));
aux_reg(2) <= (wr and carrega_rom and rom(2) and not rd) or (not carrega_rom and current(2) and not rd) or (rd and next_value(2));
aux_reg(3) <= (wr and carrega_rom and rom(3) and not rd) or (not carrega_rom and current(3) and not rd) or (rd and next_value(3));
aux_reg(4) <= (wr and carrega_rom and rom(4) and not rd) or (not carrega_rom and current(4) and not rd) or (rd and next_value(4));
aux_reg(5) <= (wr and carrega_rom and rom(5) and not rd) or (not carrega_rom and current(5) and not rd) or (rd and next_value(5));
aux_reg(6) <= (wr and carrega_rom and rom(6) and not rd) or (not carrega_rom and current(6) and not rd) or (rd and next_value(6));
aux_reg(7) <= (wr and carrega_rom and rom(7) and not rd) or (not carrega_rom and current(7) and not rd) or (rd and next_value(7));
aux_reg(8) <= (wr and carrega_rom and rom(8) and not rd) or (not carrega_rom and current(8) and not rd) or (rd and next_value(8));
aux_reg(9) <= (wr and carrega_rom and rom(9) and not rd) or (not carrega_rom and current(9) and not rd) or (rd and next_value(9));
aux_reg(10) <= (wr and carrega_rom and rom(10) and not rd) or (not carrega_rom and current(10) and not rd) or (rd and next_value(10));
aux_reg(11) <= (wr and carrega_rom and rom(11) and not rd) or (not carrega_rom and current(11) and not rd) or (rd and next_value(11));
aux_reg(12) <= (wr and carrega_rom and rom(12) and not rd) or (not carrega_rom and current(12) and not rd) or (rd and next_value(12));

in_registrador <= aux_reg;

end logic_in_reg;