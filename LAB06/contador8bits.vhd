library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador8bits is
    port (sobe, desce, clk, ld, clr: in std_logic;
          saida: out std_logic_vector (7 downto 0));
end contador8bits;

architecture ckt of contador8bits is
	component somador8bits is
        port(a,b: in  std_logic_vector(7 downto 0);
            c: out std_logic_vector(7 downto 0);
            cin: in std_logic;
            cout: out std_logic);
    end component;

	component registrador8Bits is
        port(clock,ld,Preset,Clear	: in std_logic;
                D: in std_logic_vector(7 downto 0);
                Q:out std_logic_vector(7 downto 0));
    end component;
	
	signal inc_dec: std_logic_vector(7 downto 0);
	signal d, q, soma_out: std_logic_vector(7 downto 0);
	
	signal limites: std_logic;
	

begin
	somador: somador8bits port map(q, inc_dec, soma_out, '0', open);
	
	reg: registrador8Bits port map(clk, ld,'1',not clr,Soma_out,q);
	
		
	inc_dec <= 	"00000001" when sobe  = '1' else
				"11111111" when desce = '1' else
				"00000000";
	saida <= q;

end ckt;