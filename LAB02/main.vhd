LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity lab02 is
    port(number: in std_logic_vector(13 downto 0);
         select_mux: in std_logic_vector(2 downto 0);
         key2, key3, sw17: in std_logic;
         D0, D1, D2, D3: out std_logic_vector(6 downto 0));
         --U, D, C, M: out std_logic_vector(3 downto 0));
end lab02;

architecture main of lab02 is
    component display is
	    port(inn: in std_logic_vector (3 downto 0);
		    outt: out std_logic_vector (6 downto 0));
    end component;

    component mux8_14 is
        port(R1, R2, R3, R4, R5, R6, R7, R8: in std_logic_vector(13 downto 0);
            SW: in std_logic_vector(2 downto 0);
            seq_out: out std_logic_vector(13 downto 0));
    end component;

    component registrador is
        port(registrador_in: in std_logic_vector(13 downto 0);
            ld, clear, clk: in std_logic;
            registrador_out: out std_logic_vector(13 downto 0));
    end component;

    component bcd_conversor is
        port(binary: in std_logic_vector(13 downto 0);
            bcd: out std_logic_vector(15 downto 0));
    end component;

    signal aux0, aux1, aux2, aux3, aux4, aux5, aux6, aux7: std_logic_vector(13 downto 0);
    signal in_conversor: std_logic_vector(13 downto 0);
    signal number_bcd: std_logic_vector(15 downto 0);

begin

    --U <= number_bcd(3 downto 0);
	
	--D <= number_bcd(7 downto 4);

    --C <= number_bcd(11 downto 8);

    --M <= number_bcd(15 downto 12);

    DISPLAY0: display port map(number_bcd(3 downto 0), D0);

    DISPLAY1: display port map(number_bcd(7 downto 4), D1);

    DISPLAY2: display port map(number_bcd(11 downto 8), D2);

    DISPLAY3: display port map(number_bcd(15 downto 12), D3);

    MUX0: mux8_14 port map(aux0, aux1, aux2, aux3, aux4, aux5, 
            aux6, aux7, select_mux, in_conversor);

    CONVERSOR0: bcd_conversor port map(in_conversor, number_bcd);

    REG0: registrador port map(number, sw17, key3, key2, aux0);

    REG1: registrador port map(aux0, sw17, key3, key2, aux1);

    REG2: registrador port map(aux1, sw17, key3, key2, aux2);
    
    REG3: registrador port map(aux2, sw17, key3, key2, aux3);

    REG4: registrador port map(aux3, sw17, key3, key2, aux4);

    REG5: registrador port map(aux4, sw17, key3, key2, aux5);

    REG6: registrador port map(aux5, sw17, key3, key2, aux6);

    REG7: registrador port map(aux6, sw17, key3, key2, aux7);

end main;