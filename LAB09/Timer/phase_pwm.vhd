library ieee;
use ieee.std_logic_1164.all;

entity phasePWM_mode is 
    port(clk: in std_logic;
         duty_cycle: in std_logic_vector(7 downto 0);
         timer: out std_logic
         --; contador_out: out std_logic_vector(7 downto 0)
         );
end phasePWM_mode;

architecture mode of phasePWM_mode is
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

    signal out0, to1, up_down: std_logic;
    signal out_cont: std_logic_vector(7 downto 0);

    begin

    CONTADOR000: cont_8bits_up_down port map(up_down, clk, '1', '1', out_cont);

    up_down <= '0' when out_cont="11111111" else
               '1' when out_cont="00000000";

    COMPARADOR000: comparador_8bits port map(out_cont, duty_cycle, open, open, to1);

    --contador_out <= out_cont;

    timer <= to1;

end mode;