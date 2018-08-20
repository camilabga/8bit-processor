library ieee;
use ieee.std_logic_1164.all;

entity lab01 is
    port(clk_27, sw, r0: in std_logic;
        buttons: in std_logic_vector(3 downto 0);
        ledr: out std_logic;
        display7: out std_logic_vector(6 downto 0));
end lab01;

architecture main of lab01 is

    component clkDiv is
        port (clk_in : in std_logic;
              clk_out : out std_logic);
    end component;

    component mde is
        port (clk, sw0, r: in std_logic ;
			key: in std_logic_vector(3 downto 0);
            ledr0 : out std_logic;
            number : out std_logic_vector(3 downto 0));
    end component;

    component display is
	    port(inn: in std_logic_vector (3 downto 0);
		    outt: out std_logic_vector (6 downto 0));
    end component;

    component sym_button is
        port (clk , r, bi: in std_logic ;
            bo : out std_logic);
    end component;

    signal clock_out: std_logic;
    signal bt, num: std_logic_vector(3 downto 0);

begin

    CLK: clkDiv port map(clk_27, clock_out);

    MDE0: mde port map(clock_out, sw, r0, bt, ledr, num);

    DISP: display port map(num, display7);

    SB0: sym_button port map(clock_out, r0, buttons(0), bt(0));

    SB1: sym_button port map(clock_out, r0, buttons(1), bt(1));

    SB2: sym_button port map(clock_out, r0, buttons(2), bt(2));

    SB3: sym_button port map(clock_out, r0, buttons(3), bt(3));

end main;