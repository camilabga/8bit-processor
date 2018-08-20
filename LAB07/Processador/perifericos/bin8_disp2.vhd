library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--entity bin8_disp2 is
--	port(bin				: in 	std_logic_vector (7 downto 0);	
--		  D,U 			: out std_logic_vector (6 downto 0));
--end bin8_disp2;
--
--architecture ckt of bin8_disp2 is
--	component display7 is
--		port(inn: in std_logic_vector (3 downto 0);
--			outt: out std_logic_vector (6 downto 0));
--	end component;
--	
--	component bin_bcd_14bits is
--		port(bin				: in 	std_logic_vector (13 downto 0);	
--			  dM,M,C,D,U 	: out std_logic_vector (3 downto 0));
--	end component;
--	
--	signal d0,d1		:	std_logic_vector(6 downto 0);
--	signal sD,sU 		: 	std_logic_vector(3 downto 0);
--	begin
--	bcd:  bin_bcd_14bits port map("000000"&bin,open,open,open,sD,sU);
--	
--	dis0 :	display7 port map(sU,d0);
--	dis1 :	display7 port map(sD,d1);
--	
--	U		<=	d0;
--	D		<=	d1;
--end ckt;
--	
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--
--entity bin_bcd_14bits is
--port(bin				: in 	std_logic_vector(13 downto 0);	
--	  dM,M,C,D,U 	: out std_logic_vector(3 downto 0));
--end bin_bcd_14bits;
--	
--architecture ckt of bin_bcd_14bits is
--begin
--    bcd1: process(bin)
--	 variable z: STD_logic_vector(29 downto 0);	--soma da quantidade de posicoes de B e P -3(economizado na unidade)
--	 begin
--		for i in 0 to 29 loop--necessario para nao correr o risco de indefinicao ao somar
--			z(i) := '0';
--		end loop;
--		
--		z(13 downto 0) :=bin;
--		
--		for i in 0 to 10 loop --deslocamento total da ultima casa do bin para a ultima do bcd
--			--escolhido (14-11 na unidade) para que fique apenas os 3 bits mais significativos na unidade 
--			--(pois é a menor quantidade possivel que pode somar 5)
--			if z(14 downto 11) > 4 then 	--coluna da unidade 
--				z(14 downto 11) 	:= z(14 downto 11) + 3;
--			end if;
--			if z(18 downto 15) > 4 then	--coluna da dezena 
--				z(18 downto 15) 	:= z(18 downto 15) + 3;
--			end if;
--			if z(22 downto 19) > 4 then 	--coluna da centena
--				z(22 downto 19) 	:= z(22 downto 19) + 3;
--			end if;
--			if z(26 downto 23) > 4 then 	--coluna do milhar
--				z(26 downto 23) 	:= z(26 downto 23) + 3;
--			end if;
--			z(29 downto 1) := z(28 downto 0); --desloca
--		end loop;
--		--bcd	<= z(28 downto 11);
--		U		<=	z(14 downto 11);
--		D		<=	z(18 downto 15);
--		C		<=	z(22 downto 19);
--		M		<=	z(26 downto 23);
--		dM(0)		<=	z(27);
--		dM(3 downto 1) <= "000";
--	end process bcd1;
--end ckt;



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity display7 is
	port(inn: in std_logic_vector (3 downto 0);
		outt: out std_logic_vector (6 downto 0));
end display7;	

architecture seg7 of display7 is
	begin
	outt <= 		 "1000000" when inn = "0000"     --64		--0
				else "1111001" when inn = "0001"	--121		--1
				else "0100100" when inn = "0010"	--36		--2
				else "0110000" when inn = "0011"	--48		--3
				else "0011001" when inn = "0100"	--25		--4
				else "0010010" when inn = "0101"	--18		--5
				else "0000010" when inn = "0110"	--2		    --6
				else "1111000" when inn = "0111"	--120		--7
				else "0000000" when inn = "1000"	--0		    --8
				else "0010000" when inn = "1001"	--16		--9
				else "1000000";
end seg7;	
	

