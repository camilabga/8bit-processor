library ieee;
use ieee.std_logic_1164.all;

entity somadorcompleto is
	port(
		a,b,cin: in std_logic;
		s, cout: out std_logic
	);
end somadorcompleto;

architecture arq of somadorcompleto is
	begin
		s <= ((not a) and (not b) and cin) or ((not a) and b and (not cin)) or (a and (not b) and (not cin)) or (a and b and cin);
		cout <= ((not a) and b and cin) or (a and (not b) and cin) or (a and b and (not cin)) or (a and b and cin);
	end arq;