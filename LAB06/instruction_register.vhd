library ieee;
use ieee.std_logic_1164.all;

entity instruction_register is
    port(data_in: in std_logic_vector(15 downto 0);
         ld, clock, clear: in std_logic;
         data_out: out std_logic_vector(15 downto 0));
end instruction_register;

architecture ir of instruction_register is

component registrador16Bits is
	port(clock,ld,Preset,Clear	: in std_logic;
			D: in std_logic_vector(15 downto 0);
			Q:out std_logic_vector(15 downto 0));
end component;

signal data_out_aux: std_logic_vector(15 downto 0);

begin

REGir: registrador16Bits port map(clock, ld, '1', not clear, data_in, data_out_aux);

data_out <= data_out_aux;

end ir;