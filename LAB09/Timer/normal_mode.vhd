library ieee;
use ieee.std_logic_1164.all;

entity normal_mode is 
    port(clk: in std_logic;
         timer: out std_logic);
end normal_mode;

architecture mode of normal_mode is
    component cont_8bits_up_down is
        port (updown, clk, ld, clr: in std_logic;
            saida: out std_logic_vector (7 downto 0));
    end component;

    component FFD is
        port(clk,D,P,C	:in std_logic;
                q:out std_logic);
    end component;

    signal change, in_reg, out0: std_logic;
    signal out_cont: std_logic_vector(7 downto 0);

    begin

    CONTADOR000: cont_8bits_up_down port map('1', clk, '1', '1', out_cont);

    change <= '1' when out_cont="11111111" else '0';

    in_reg <= (not change and out0) or (change and not out0);

    TIMEROUT: FFD port map(clk, in_reg, '1', '1', out0);

    timer <= out0;

end mode;




