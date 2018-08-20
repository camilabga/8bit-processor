library ieee ;
use ieee.std_logic_1164.all;

entity mde is
    port (clk, sw0, r: in std_logic ;
			key: in std_logic_vector(3 downto 0);
            ledr0 : out std_logic;
            number : out std_logic_vector(3 downto 0));
end mde;

architecture ckt of mde is
    type state_type is (espera, b1, b2, b3, b4, b5, acertou);
    signal y_present , y_next : state_type ;
begin
    process (sw0, key, y_present)
    begin
        case y_present is
            when espera =>
                if key = "0111" then y_next <= b1;
                else y_next <= espera;
					 end if;
            when b1 =>
                if key = "1101" then y_next <= b2;
					 elsif key = "1111" then y_next <= b1; 
                else y_next <= espera; 
					 end if;
            when b2 =>
                if key = "1110" then y_next <= b3;
					 elsif key = "1111" then y_next <= b2; 
                else y_next <= espera; 
					 end if;
            when b3 =>
                if key = "1011" then y_next <= b4;
					 elsif key = "1111" then y_next <= b3; 
                else y_next <= espera; end if;
            when b4 =>
                if key = "1011" then y_next <= b5;
					 elsif key = "1111" then y_next <= b4; 
                else y_next <= espera; end if;
            when b5 =>
                if key = "1101" then y_next <= acertou;
					 elsif key = "1111" then y_next <= b5; 
                else y_next <= espera; end if;
            when acertou =>
                if sw0 = '1' then y_next <= espera;
                else y_next <= acertou; end if;
        end case;
    end process;

    process (clk, r)
    begin
        if r = '1' then
            y_present <= espera;
        elsif (clk ' event and clk = '1') then
        
        y_present <= y_next ;
        end if;

		case y_present is
            when espera =>
                number <= "0000";
            when b1 =>
                number <= "0001";
            when b2 =>
                number <= "0010";
            when b3 =>
                number <= "0011";
            when b4 =>
                number <= "0100";
            when b5 =>
                number <= "0101";
            when acertou =>
                number <= "0110";
        end case;  

    end process ;
    
    ledr0 <= '1' when y_present = acertou else '0';
	 
    
end ckt;