library ieee;
use ieee.std_logic_1164.all;

entity dataPath is
	port(clock1, tot_ld, tot_clr: in std_logic;
	valorMoeda, valorRefri: in std_logic_vector(7 downto 0);
	acumulador_value: out std_logic_vector(7 downto 0);
	tot_me_s:out std_logic);
end dataPath;

architecture operational of dataPath is

signal saidaMUX, saidaREG, saidaSOM: std_logic_vector(7 downto 0);

component comparador is
	port(a,b:in std_logic_vector(7 downto 0);
	aMENORb,aMAIORb,aIGUALb:out std_logic);
end component;

component Registrador8Bits is
	port(clock,Preset,Clear:in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q:out std_logic_vector(7 downto 0));
end component;

component somador7bits is
	port(a,b:in  std_logic_vector(7 downto 0);
	     c:out std_logic_vector(7 downto 0);
	     cin: in std_logic;
	     cout:out std_logic);
end component;

component Mux21_7bit is
	port(A,B: in std_logic_vector(7 downto 0);
	op:in std_logic;
	C: out std_logic_vector(7 downto 0));
end component;

begin
	
	MUX: Mux21_7bit port map(saidaREG, saidaSOM, tot_ld, saidaMUX);
	Registrador: Registrador8Bits port map(clock1, '1', tot_clr, saidaMUX, saidaREG);
	COMPARA0: comparador port map(saidaREG, valorRefri, tot_me_s);
	Somador: somador7bits port map(valorMoeda, saidaREG, saidaSOM, '0');

	acumulador_value <= saidaREG;

end operational;