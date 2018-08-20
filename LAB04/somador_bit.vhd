library ieee;
use ieee.std_logic_1164.all;

entity somador_bit is
	port(a,b,cin: in std_logic;
		s, cout: out std_logic);
end somador_bit;

architecture soma_bit of somador_bit is
	begin
		s <= ((not a) and (not b) and cin) or ((not a) and b and (not cin)) or (a and (not b) and (not cin)) or (a and b and cin);
		cout <= ((not a) and b and cin) or (a and (not b) and cin) or (a and b and (not cin)) or (a and b and cin);
	end soma_bit;