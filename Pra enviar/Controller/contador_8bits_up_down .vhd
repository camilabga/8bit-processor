library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador_8bits_up_down is
    port (up_down, clk, ld	: in std_logic;
			 pre,clr				: in std_logic_vector(7 downto 0);
          saida				: out std_logic_vector (7 downto 0));
end contador_8bits_up_down;

architecture ckt of contador_8bits_up_down is
	component somador8bits is
		port(
			  a,b	:in  std_logic_vector(7 downto 0);
			  c	:out std_logic_vector(7 downto 0);
			  cin	: in std_logic;
			  cout:out std_logic
		);
	end component;

	component Reg8Bits_pre_clr is
		port(clock,ld			: in std_logic;
				Preset,Clear,D	: in std_logic_vector(7 downto 0);
				Q					:out std_logic_vector(7 downto 0));
	end component;
	
	signal inc_dec				: std_logic_vector(7 downto 0);
	signal d, q, Soma_out	: std_logic_vector(7 downto 0);
	
	signal limites	: std_logic;
	

begin
	somador 	: somador8bits port map(q, inc_dec, Soma_out, '0', open);
	
	reg 		: Reg8Bits_pre_clr port map(clk, ld,pre,clr,Soma_out,q);
	
	inc_dec <= 	"00000001" when up_down  = '1' else
					"11111111";
	saida <= q;

	

end ckt;