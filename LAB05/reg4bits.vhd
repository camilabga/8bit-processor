library ieee;
use ieee.std_logic_1164.all;

entity reg4bits is
    port(registrador_in: in std_logic_vector(3 downto 0);
        ld, clear, clk: in std_logic;
        registrador_out: out std_logic_vector(3 downto 0));
end reg4bits;

architecture reg of reg4bits is

    component ffd is 
        port (clk, D,P,C : IN std_logic;
                    q: OUT std_logic);
    end component;

    signal reg_in, q: std_logic_vector (3 downto 0);

begin

    reg_in(3) <= (registrador_in(3) and ld) or (q(3) and not ld);
    reg_in(2) <= (registrador_in(2) and ld) or (q(2) and not ld);
    reg_in(1) <= (registrador_in(1) and ld) or (q(1) and not ld);
    reg_in(0) <= (registrador_in(0) and ld) or (q(0) and not ld);
   
    FF3: ffd port map(clk, reg_in(3), '1', not clear, q(3));      
    FF2: ffd port map(clk, reg_in(2), '1', not clear, q(2));
    FF1: ffd port map(clk, reg_in(1), '1', not clear, q(1));
    FF0: ffd port map(clk, reg_in(0), '1', not clear, q(0));
        
    registrador_out <= q;
            
end reg;