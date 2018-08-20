library ieee;
use ieee.std_logic_1164.all;

entity contador3bits is
    port (clock, clear, load: in std_logic;
          C: out std_logic_vector (2 downto 0));
end contador3bits;

architecture coun3ter of contador3bits is
    component FFD is
        port(clk,D,P,C:in std_logic;
            q:out std_logic);
    end component;
  
    signal next_D, z, in_D: std_logic_vector (2 downto 0);

    begin

    next_D(0) <= not z(0); 
    next_D(1) <= (not z(1) and z(0)) or (z(1) and not z(0));
    next_D(2) <= (z(2) and not z(1)) or (z(2) and not z(0)) or (not z(2) and z(1) and z(0));
   
    in_D(0) <= (not load and z(0)) or (load and next_D(0));
    in_D(1) <= (not load and z(1)) or (load and next_D(1));
    in_D(2) <= (not load and z(2)) or (load and next_D(2));

    FFD0: ffd port map(clock, in_D(0), '1', clear, z(0));
    FFD1: ffd port map(clock, in_D(1), '1', clear, z(1));
    FFD2: ffd port map(clock, in_D(2), '1', clear, z(2));
 
    C <= z;

end coun3ter;