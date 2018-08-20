library ieee;
use ieee.std_logic_1164.all;

entity registrador is
    port(registrador_in: in std_logic_vector(13 downto 0);
        ld, clear, clk: in std_logic;
        registrador_out: out std_logic_vector(13 downto 0));
end registrador;

architecture reg of registrador is

    component ffd is 
        port (clk, D,P,C : IN std_logic;
                    q: OUT std_logic);
    end component;

    signal reg_in, q: std_logic_vector (13 downto 0);
    signal clock: std_logic;

begin

    clock <= clk;

    reg_in(13) <= (registrador_in(13) and ld) or (q(13) and not ld);
    reg_in(12) <= (registrador_in(12) and ld) or (q(12) and not ld);
    reg_in(11) <= (registrador_in(11) and ld) or (q(11) and not ld);
    reg_in(10) <= (registrador_in(10) and ld) or (q(10) and not ld);
    reg_in(9) <= (registrador_in(9) and ld) or (q(9) and not ld);
    reg_in(8) <= (registrador_in(8) and ld) or (q(8) and not ld);
    reg_in(7) <= (registrador_in(7) and ld) or (q(7) and not ld);
    reg_in(6) <= (registrador_in(6) and ld) or (q(6) and not ld);
    reg_in(5) <= (registrador_in(5) and ld) or (q(5) and not ld);
    reg_in(4) <= (registrador_in(4) and ld) or (q(4) and not ld);
    reg_in(3) <= (registrador_in(3) and ld) or (q(3) and not ld);
    reg_in(2) <= (registrador_in(2) and ld) or (q(2) and not ld);
    reg_in(1) <= (registrador_in(1) and ld) or (q(1) and not ld);
    reg_in(0) <= (registrador_in(0) and ld) or (q(0) and not ld);

    FF13: ffd port map(clock, reg_in(13), '1', clear, q(13));   
    FF12: ffd port map(clock, reg_in(12), '1', clear, q(12));   
    FF11: ffd port map(clock, reg_in(11), '1', clear, q(11));   
    FF10: ffd port map(clock, reg_in(10), '1', clear, q(10));   
    FF9: ffd port map(clock, reg_in(9), '1', clear, q(9));      
    FF8: ffd port map(clock, reg_in(8), '1', clear, q(8));
    FF7: ffd port map(clock, reg_in(7), '1', clear, q(7));   
    FF6: ffd port map(clock, reg_in(6), '1', clear, q(6));   
    FF5: ffd port map(clock, reg_in(5), '1', clear, q(5));   
    FF4: ffd port map(clock, reg_in(4), '1', clear, q(4));   
    FF3: ffd port map(clock, reg_in(3), '1', clear, q(3));      
    FF2: ffd port map(clock, reg_in(2), '1', clear, q(2));
    FF1: ffd port map(clock, reg_in(1), '1', clear, q(1));
    FF0: ffd port map(clock, reg_in(0), '1', clear, q(0));
        
    registrador_out <= q;   
            
end reg;