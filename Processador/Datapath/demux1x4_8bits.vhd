library ieee;
use ieee.std_logic_1164.all;

entity demux1x4_8bits is
		port(entrada1		: in  std_logic_vector(7 downto 0);
			sel				: in  std_logic_vector(1 downto 0);
			saida1,saida2,
			saida3,saida4	: out std_logic_vector(7 downto 0));
end demux1x4_8bits;

architecture ckt of demux1x4_8bits is
begin
saida1		<=  entrada1 when (sel = "00") else "00000000";
saida2		<=  entrada1 when (sel = "01") else "00000000";
saida3		<=  entrada1 when (sel = "10") else "00000000";
saida4		<=  entrada1 when (sel = "11") else "00000000";
end ckt;