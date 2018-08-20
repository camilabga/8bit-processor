-- https://www.nandland.com/vhdl/modules/double-dabble.html

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcd4_conversor is
    port(binary: in std_logic_vector(15 downto 0);
        bcd: out std_logic_vector(15 downto 0));
end bcd4_conversor;

architecture conversor of bcd4_conversor is

begin
    process (binary)
        variable aux_bin: STD_logic_vector (31 downto 0);
    begin

        aux_bin :="00000000000000000000000000000000";

        aux_bin(15 downto 0) := binary;

        for i in 0 to 10 loop
			if aux_bin(14 downto 11) > 4 then 	--1
				aux_bin(14 downto 11) := aux_bin(14 downto 11) + 3;
			end if;
			if aux_bin(18 downto 15) > 4 then	--10
				aux_bin(18 downto 15) := aux_bin(18 downto 15) + 3;
			end if;
			if aux_bin(22 downto 19) > 4 then 	--100
				aux_bin(22 downto 19) := aux_bin(22 downto 19) + 3;
			end if;
			if aux_bin(26 downto 23) > 4 then 	--1000
				aux_bin(26 downto 23) := aux_bin(26 downto 23) + 3;
			end if;
			aux_bin(31 downto 1) := aux_bin(30 downto 0); --shift
		end loop;

            bcd	<= aux_bin(26 downto 11);

        end process;
    
end conversor;