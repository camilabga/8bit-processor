library ieee;
use ieee.std_logic_1164.all;

entity lab03 is
    port (S: in std_logic_vector(7 downto 0);
          key3, key2, clk_27: in std_logic;
          led: out std_logic;
          saida_contador: out std_logic_vector(3 downto 0);
			 soma_exibir: out std_logic_vector(7 downto 0);
          HEX0, HEX1, HEX2, HEX3, HEX4: out std_logic_vector(6 downto 0));
end lab03;

architecture main of lab03 is

    component clkDiv is
        port (clk_in : in std_logic;
                clk_out : out std_logic);
    end component;

    component display is
        port(inn: in std_logic_vector (3 downto 0);
            outt: out std_logic_vector (6 downto 0));
    end component;

    component sym_button is
        port (clk , r, bi: in std_logic ;
                bo : out std_logic);
    end component;

    component bcd2_conversor is
        port(bin2ary: in std_logic_vector(5 downto 0);
            b2cd: out std_logic_vector(7 downto 0));
    end component;

    component bcd3_conversor is
        port(bin3ary: in std_logic_vector(7 downto 0);
            b3cd: out std_logic_vector(11 downto 0));
    end component;

    component rom_memory is
        port(address: in std_logic_vector(3 downto 0);
            clock: in std_logic;
            q: out std_logic_vector(5 downto 0));
    end component;

    component contador is
        port (clock, clear, load: in std_logic;
            C: out std_logic_vector (3 downto 0));
    end component;

    component maq_vendas is
        port(moeda, clock, reset: in std_logic;
            value_product: in std_logic_vector(7 downto 0);
            value_coin: in std_logic_vector(5 downto 0);
            sum_coins: out std_logic_vector(7 downto 0);
            out_product: out std_logic);
    end component;

    signal clk_out, moeda_in, led0: std_logic;
    signal select_rom: std_logic_vector(3 downto 0);
    signal A: std_logic_vector(5 downto 0);
	 signal D0, D1, D2, D3, D4: std_logic_vector(6 downto 0);
    signal Tot, display_moeda: std_logic_vector(7 downto 0);
    signal display_total: std_logic_vector(11 downto 0);

    begin

    DIV: clkDiv port map(clk_27, clk_out);

    BS: sym_button port map(clk_out, '0', key2, moeda_in);

    COUNTER: contador port map(clk_out, key3, moeda_in, select_rom);

    saida_contador <= select_rom;
	 
	 soma_exibir <= Tot;

    ROM0: rom_memory port map(select_rom, clk_out, A);

    MAQUINONA: maq_vendas port map(moeda_in, clk_out, not key3, S, A, Tot, led0);

    DISPLAYMOEDA: bcd2_conversor port map(A, display_moeda);

    DISPLAYTOTAL: bcd3_conversor port map(Tot, display_total);

    DISP0: display port map(display_moeda(3 downto 0), D0);
    DISP1: display port map(display_moeda(7 downto 4), D1);

    DISP2: display port map(display_total(3 downto 0), D2);
    DISP3: display port map(display_total(7 downto 4), D3);
    DISP4: display port map(display_total(11 downto 8), D4);

    HEX0 <= D0;
    HEX1 <= D1;
    HEX2 <= D2;
    HEX3 <= D3;
    HEX4 <= D4;
	
	led <= led0;
	 
end main;