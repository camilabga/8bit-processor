library ieee;
use ieee.std_logic_1164.all;

entity SPI_SD is
	port(clk, MISO: in  std_logic;
         instruction: in std_logic_vector(7 downto 0);
		 MOSI: out std_logic;
         status_reg: out std_logic_vector(7 downto 0)
         --; out_somador: out std_logic_vector(7 downto 0)
         );
end SPI_SD;

architecture ckt of SPI_SD is

    component FFD is
        port(clk,D,P,C	:in std_logic;
                q:out std_logic);
    end component;

    component cont_8bits_up_down is
        port (updown, clk, ld, clr: in std_logic;
            saida: out std_logic_vector (7 downto 0));
    end component;

    component comparador_8bits is
		 port(a,b: in  std_logic_vector(7 downto 0);
				maior, igual, menor	: out std_logic);
	end component;

    signal in_reg, out_reg, out_cont: std_logic_vector(7 downto 0);
    signal cont8, cont9: std_logic;

begin 

    CONTADOR000: cont_8bits_up_down port map('1', clk, '1', not cont9, out_cont);

    COMPARA_89: comparador_8bits port map("00000111", out_cont, open, cont8, cont9);

	in_reg(0) <= ((instruction(0) and (cont8 or cont9)) or(miso and not (cont8 or cont9)));
	in_reg(1) <= ((instruction(1) and (cont8 or cont9)) or(out_reg(0) and not (cont8 or cont9)));
	in_reg(2) <= ((instruction(2) and (cont8 or cont9)) or(out_reg(1) and not (cont8 or cont9)));
	in_reg(3) <= ((instruction(3) and (cont8 or cont9)) or(out_reg(2) and not (cont8 or cont9)));
	in_reg(4) <= ((instruction(4) and (cont8 or cont9)) or(out_reg(3) and not (cont8 or cont9)));
	in_reg(5) <= ((instruction(5) and (cont8 or cont9)) or(out_reg(4) and not (cont8 or cont9)));
	in_reg(6) <= ((instruction(6) and (cont8 or cont9)) or(out_reg(5) and not (cont8 or cont9)));
	in_reg(7) <= ((instruction(7) and (cont8 or cont9)) or(out_reg(6) and not (cont8 or cont9)));
	
	FFD0: FFD port map(clk,in_reg(0),'1','1',out_reg(0));
	FFD1: FFD port map(clk,in_reg(1),'1','1',out_reg(1));
	FFD2: FFD port map(clk,in_reg(2),'1','1',out_reg(2));
	FFD3: FFD port map(clk,in_reg(3),'1','1',out_reg(3));
	FFD4: FFD port map(clk,in_reg(4),'1','1',out_reg(4));
	FFD5: FFD port map(clk,in_reg(5),'1','1',out_reg(5));
	FFD6: FFD port map(clk,in_reg(6),'1','1',out_reg(6));
	FFD7: FFD port map(clk,in_reg(7),'1','1',out_reg(7));

	MOSI <= out_reg(7);

    --out_somador <= out_cont;

    status_reg <= out_reg;

end ckt;