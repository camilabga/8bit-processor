library ieee;
use ieee.std_logic_1164.all;

entity controller is
	port(clk_c, C, tot_menor_s:in std_logic;
	d, ld_tot, clr_tot:out std_logic);
end controller;

architecture arq of controller is

signal J,K,Q: std_logic_vector(1 downto 0);

component FFJK is
 port(clk,J,K,P,C:in std_logic;
   q:out std_logic);
end component;

begin
	
	J(1) <= (((not tot_menor_s) and Q(0)) or (C and Q(0)) or Q(1));
	K(1) <= '1';
	J(0) <= '1';
	K(0) <= (Q(1) or C);
	d <= (Q(1) and Q(0));
	ld_tot <= (Q(1) and (not Q(0)));
	clr_tot <= ((not Q(1)) and (not Q(0)));

	FFJK1: FFJK port map(clk_c, J(1), K(1), '1', '1', Q(1));
	FFJK2: FFJK port map(clk_c, J(0), K(0), '1', '1', Q(0)); 
	 
end arq;


