library ieee;
use ieee.std_logic_1164.all;

entity clk_pcir is
	port (clk_in : in std_logic;
			clk_out : out std_logic);
end clk_pcir;
	
architecture clock_pcir of clk_pcir is
signal ax : std_logic;

begin
	process (clk_in)
		variable cnt: integer range 0 to 3 := 0; --- 1 por 13500000
	begin 
		if (rising_edge(clk_in)) then
			if (cnt = 3) then --- 1 por 13500000
				cnt := 0 ;
				ax <= not ax;
			else 
			 cnt:=cnt+1;
			end if;
		end if;
	end process;
	clk_out <= ax;
end clock_pcir;