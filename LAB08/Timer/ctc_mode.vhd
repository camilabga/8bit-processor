library ieee;
use ieee.std_logic_1164.all;

entity ctc_mode is 
    port(clk: in std_logic;
         top: in std_logic_vector(7 downto 0);
         timer: out std_logic
         --;con_out: out std_logic_vector(7 downto 0)
         --; clrO: out std_logic
		 --;changeO: out std_logic
         );
end ctc_mode;

architecture mode of ctc_mode is
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

    signal change, in_reg, out0, to1, clr: std_logic;
    signal out_cont: std_logic_vector(7 downto 0);

    begin

    CONTADOR000: cont_8bits_up_down port map('1', clk, '1', not clr, out_cont);

    COMPARA_TOP: comparador_8bits port map(top, out_cont, open, clr, open);

    change <= '1' when out_cont="00000000" else '0';
    
    in_reg <= (not change and out0) or (change and not out0);

    TIMEROUT: FFD port map(clk, in_reg, '1', '1', out0);

    timer <= not out0;

    --clrO <= clr;
    --changeO <= change;
    --con_out <= out_cont;

end mode;