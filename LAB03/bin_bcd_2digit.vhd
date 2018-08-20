-- https://www.nandland.com/vhdl/modules/double-dabble.html

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcd2_conversor is
    port(bin2ary: in std_logic_vector(5 downto 0);
        b2cd: out std_logic_vector(7 downto 0));
end bcd2_conversor;

architecture conversor2 of bcd2_conversor is

begin
    process (bin2ary)
        variable aux_bin: STD_logic_vector (31 downto 0);
    begin

        aux_bin :="00000000000000000000000000000000";

        aux_bin(5 downto 0) := bin2ary;

        for i in 0 to 10 loop
			if aux_bin(14 downto 11) > 4 then 	--1
				aux_bin(14 downto 11) := aux_bin(14 downto 11) + 3;
			end if;
			if aux_bin(18 downto 15) > 4 then	--10
				aux_bin(18 downto 15) := aux_bin(18 downto 15) + 3;
			end if;
			aux_bin(31 downto 1) := aux_bin(30 downto 0); --shift
		end loop;

            b2cd	<= aux_bin(18 downto 11);

        end process;
    
end conversor2;