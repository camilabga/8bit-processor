library ieee;
use ieee.std_logic_1164.all;

entity fastPWM_mode is 
    port(clk: in std_logic;
         duty_cycle: in std_logic_vector(7 downto 0);
         timer: out std_logic);
end fastPWM_mode;

architecture mode of fastPWM_mode is
    component cont_8bits_up_down is
        port (updown, clk, ld, clr: in std_logic;
            saida: out std_logic_vector (7 downto 0));
    end component;

    component FFD is
        port(clk,D,P,C	:in std_logic;
                q:out std_logic);
    end component;

    component comparador_8bits is
		 port(a,b: in  std_logic_vector(7 downto 0);
				maior, igual, menor	: out std_logic);
	end component;

    signal change, in_reg, out0, to1: std_logic;
    signal out_cont: std_logic_vector(7 downto 0);

    begin

    CONTADOR000: cont_8bits_up_down port map('1', clk, '1', '1', out_cont);

    COMPARADOR000: comparador_8bits port map(duty_cycle, out_cont, open, open, to1);

    timer <= not to1;

end mode;