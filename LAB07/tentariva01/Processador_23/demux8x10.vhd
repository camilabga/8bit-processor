library ieee;
use ieee.std_logic_1164.all;

entity demux8x10u is
	port(inD: in std_logic_vector(7 downto 0);
         outD: out std_logic_vector(9 downto 0));
end demux8x10u;


architecture ckt of demux8x10u is

begin

    outD <= "0000000001" when inD="00000000" else 
            "0000000010" when inD="00000001" else 
            "0000000100" when inD="00000010" else 
            "0000001000" when inD="00000011" else 
            "0000010000" when inD="00000100" else 
            "0000100000" when inD="00000101" else 
            "0001000000" when inD="00000110" else 
            "0010000000" when inD="00000111" else 
            "0100000000" when inD="00001000" else 
            "1000000000" when inD="00001001" else
            "0000000000";

end ckt;
