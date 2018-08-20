library ieee;
use ieee.std_logic_1164.all;
entity mde is
		port (clk, r, carry, z			: in std_logic;
				opcode			: in std_logic_vector(7 downto 0);
				Sel_addr_mem 	: out  std_logic_vector(1 downto 0);
				Sel_mar_mem, Ld_mar_mem, Sel_se_mult, Wr_ABCD, Ld_mar_ABCD, 
				Sel_addr_ABCD, Sel_mem_in, Sel_ABCD_in, Sel_ULA_in, 
				Ld_ULA, Clr_ULA, Ld_PC, Sel_case_SP, Ld_IR, Up_down_SP, 
				Ld_SP, sel_preset_PC,wr_mem 		: out std_logic:='0'
				
				);
end mde;

architecture ckt of mde is
	type state_type is (inicio,inicio2,e0, e1, e2, e3, e4, e5, e6, e7, e8, fim);
	type operacoes is (add, sub, and_op, or_op, xor_op, not_op, shl, shr, cmp, 
				push, pop, mul, call, mov, inc, dec, jmp,jc,jnc,jz,jnz,ja,jnbe,
				jae,jnb,jb,jnae,jbe,jna,je,jne,ret,hlt, nenhum);
	type operacoes2 is (rX, m_rX, m_a, con, nenhum);
	type operacoes3 is (reg, m_reg, addr, const, nenhum);
	type op_move is (m_rrx, ma_r, ma_con, nenhum);
	signal y_present, y_next 	: state_type;
	signal op 						: operacoes;
	signal op2 						: operacoes2;
	signal op3						: operacoes3;
	signal opm 						: op_move;
		
	begin		
	op <= add 		when opcode(7 downto 3)="00000" else
			sub 		when opcode(7 downto 3)="00001" else
			and_op 	when opcode(7 downto 3)="00010" else
			or_op 	when opcode(7 downto 3)="00011" else
			xor_op 	when opcode(7 downto 3)="00100" else
			shl 		when opcode(7 downto 3)="00101" else
			shr 		when opcode(7 downto 3)="00110" else
			cmp 		when opcode(7 downto 3)="00111" else
			push 		when opcode(7 downto 3)="01000" else
			pop 		when opcode(7 downto 3)="01001" else
			mul 		when opcode(7 downto 3)="01010" else
			call 		when opcode(7 downto 3)="01011" else
			inc 		when opcode(7 downto 3)="01100" else
			dec 		when opcode(7 downto 3)="01101" else 
			not_op 	when opcode(7 downto 3)="01110" else
			jmp 		when opcode(7 downto 3)="01111" else
			mov 		when opcode(7 downto 3)="10000" else
			jc 		when opcode(7 downto 3)="10001" else
			jnc 		when opcode(7 downto 3)="10010" else
			jz 		when opcode(7 downto 3)="10011" else
			jnz 		when opcode(7 downto 3)="10100" else
			ja 		when opcode(7 downto 3)="10101" else
			jnbe 		when opcode(7 downto 3)="10110" else
			jae 		when opcode(7 downto 3)="10111" else
			jnb 		when opcode(7 downto 3)="11000" else
			jb 		when opcode(7 downto 3)="11001" else
			jnae 		when opcode(7 downto 3)="11010" else
			jbe 		when opcode(7 downto 3)="11011" else
			jna 		when opcode(7 downto 3)="11100" else
			je 		when opcode(7 downto 3)="11101" else
			jne 		when opcode(7 downto 3)="11110" else
			ret 		when opcode(7 downto 0)="11111000" else
			hlt 		when opcode(7 downto 0)="11111111" else nenhum;
			
	op2 <=rX 		when (opcode(2 downto 0)="000") else	--regX
			m_rX 		when (opcode(2 downto 0)="001") else	--mem_regx
			m_a 		when (opcode(2 downto 0)="010") else	--mem_addr
			con 		when (opcode(2 downto 0)="011") else 	--constant
			nenhum;

	opm <= m_rrx 		when (opcode(2 downto 0)="100") else	--mem_reg_reX
			 ma_r 		when (opcode(2 downto 0)="101") else	--mem_addr_reg
			 ma_con		when (opcode(2 downto 0)="110") else	--mem_addr_con
			 nenhum;
			
	op3 <= reg 		when (opcode(2 downto 0)="100") else	--reg
			m_reg 		when (opcode(2 downto 0)="101") else	--[reg]
			addr		when (opcode(2 downto 0)="110") else	--addr
			const		when (opcode(2 downto 0)="111") else	--const
			nenhum;

		process (y_present,op, op2, op3, opm, carry, z)
		begin
			Sel_mar_mem		<='0';
			Ld_mar_mem		<='0';
			Sel_se_mult		<='0';
			Wr_ABCD			<='0';
			Ld_mar_ABCD		<='0';
			Sel_addr_ABCD	<='0';
			Sel_mem_in		<='0';
			Sel_ABCD_in		<='0';
			Sel_ULA_in		<='0';
			Ld_ULA			<='0';
			Clr_ULA			<='0';
			Ld_PC				<='0';
			Sel_case_SP		<='0';
			Ld_IR				<='0';
			Up_down_SP		<='0';
			Ld_SP				<='0';
			sel_preset_PC	<='0';
			wr_mem			<='0';
			Sel_addr_mem 	<="00";
	
			case y_present is		--mde
				when inicio => 
					y_next <= inicio2;
					Ld_IR<='1';
				when inicio2 => 
					y_next <= e0;		
					Ld_IR<='1';	--carrega opcode da posicao 00000000 (acontece uma vez)
---------------------------------------- inicio da MDE de verdade ------------------------------------------
				when e0 =>	y_next<= e1;
					Ld_IR<='1'; 	Ld_PC <= '1'; 			--carrega opcode e chama prox operando
				when e1 =>	y_next<= e2;
					if (op=hlt) then y_next<=fim; end if;
				when e2 =>	y_next <= e3;
					if (op=mov) then 
						if (op2=rX or op2=m_rX or op2=m_a or op2=con)	then
							Ld_mar_ABCD<='1'; Ld_PC<='1';						end if;--operador 1
						if (opm=m_rrx) then
							Ld_mar_mem<='1'; Ld_PC<='1'; Sel_addr_ABCD<='1'; Sel_mar_mem<='1';	end if;
						if (opm=ma_r or opm=ma_con) then
							Ld_mar_mem<='1'; Ld_PC<='1'; Sel_mar_mem<='0';	end if;
					end if;
					if (op= add or op=sub or op=and_op or op=or_op or op=xor_op or op=shl or op=shr or op=cmp) then 
							Ld_mar_ABCD<='1'; Ld_PC<='1'; --operando 1 e chama prox
					end if;
					if (op=jmp) or (op=jc and carry='1') or (op=jnc and not carry='1') or (op=jz and z='1') or 
					   (op=jnz and not z='1') or (op=ja and not carry='1' and not z='1') or
					   (op=jnbe and not carry='1' and not z='1') or (op=jae and not carry='1') or 
					   (op=jnb and not carry='1') or (op=jb and carry='1') or (op=jnae and carry='1') or 
					   (op=jbe and (carry='1' or z='1')) or (op=jna and (carry='1' or z='1')) or 
					   (op=je and z='1') or (op=jne and not z='1') then
						Ld_mar_mem<='1';  end if;
						
					if (op=call) then 
						Ld_mar_mem<='1';	end if;

					if (op=mul) then
						if (op3=reg) then
							Sel_addr_ABCD<='1'; Ld_ULA<='1'; Ld_PC<='1';	end if;
						if (op3=m_reg) then
							Ld_mar_mem<='1'; Sel_mar_mem<='1'; Sel_addr_ABCD<='1'; Ld_PC<='1';	end if;
						if (op3=addr) then 
							Ld_mar_mem<='1'; Sel_mar_mem<='0'; Ld_PC<='1';	end if;
						if (op3=const) then
							Ld_ULA<='1'; Sel_ULA_in<='1'; Ld_PC<='1';	end if;
					end if;

					if (op=inc or op=dec or op=not_op) then 
						Ld_mar_ABCD<='1'; Ld_PC<='1'; end if;

					
				when e3 =>	y_next <= e4;
					if (op=mul) then
						if (op3=reg) then
							Sel_ABCD_in<='1'; Sel_se_mult<='1'; Sel_addr_ABCD<='0'; end if;
						if (op3=m_reg) then
							Sel_ULA_in<='1'; Sel_addr_mem<="01"; end if;
						if (op3=addr) then 
							Sel_addr_mem<="01"; Sel_ULA_in<='1';	end if;
						if (op3=const) then
							Sel_ABCD_in<='1'; Sel_se_mult<='1'; Sel_addr_ABCD<='0'; Wr_ABCD<='1'; y_next <= e0;	end if;
					end if;
					
					if (op=call) then
						sel_case_SP<='1'; sel_ABCD_in<='1'; wr_mem<='1'; Ld_PC<='1'; end if;

					if (op=jmp) or (op=jc and carry='1') or (op=jnc and not carry='1') or (op=jz and z='1') or 
					   (op=jnz and not z='1') or (op=ja and not carry='1' and not z='1') or
					   (op=jnbe and not carry='1' and not z='1') or (op=jae and not carry='1') or 
					   (op=jnb and not carry='1') or (op=jb and carry='1') or (op=jnae and carry='1') or 
					   (op=jbe and (carry='1' or z='1')) or (op=jna and (carry='1' or z='1')) or 
					   (op=je and z='1') or (op=jne and not z='1') then
						 Sel_addr_mem<="01"; sel_preset_PC<='1';  Ld_PC<='1'; end if;
				
				when e4 =>	y_next <= e5;
					if (op=mov) then  
						Ld_PC<='1';
						if (op2=con)	then 
							Wr_ABCD<='1';							end if;
						if	(op2=rX) then
							Sel_addr_ABCD<='1'; Ld_ULA<='1';  	end if;--operador 2
						if	(op2=m_rX) then	
							Sel_addr_ABCD<='1'; Sel_addr_mem<="10";	end if;
						if	(op2=m_a) then
							Ld_mar_mem<='1';	Sel_mar_mem<='0';	end if;
						if (opm=m_rrx or opm=ma_r) then
							Sel_addr_ABCD<='1'; Ld_ULA<='1'; Sel_addr_mem<="01"; end if;
						if (opm=ma_con) then
							Sel_ULA_in<='1'; Ld_ULA<='1'; 	end if;
					end if;
					
					if (op=call) then 
						Ld_SP<='1'; up_down_SP<='1';	end if;
					
					if (op= add or op=sub or op=and_op or op=or_op or op=xor_op or op=shl or op=shr or op=cmp) then 
						if	(op2=rX) 	then	--igual a mov
							 Sel_addr_ABCD<='1'; Ld_ULA<='1'; Ld_PC<='1';end if;--operador 2
						if	(op2=m_rX) 	then	
							Ld_PC<='1';	Ld_mar_mem<='1'; 	Sel_addr_ABCD<='1'; Sel_mar_mem<='1';	 end if;
						if	(op2=m_a) 	then	
							Ld_PC<='1';	Ld_mar_mem<='1';	 end if;
						if	(op2=con) 	then	
							Sel_ULA_in<='1'; Ld_ULA<='1';	Ld_PC<='1'; end if;
					end if;
						
					if (op=jmp) or (op=jc and carry='1') or (op=jnc and not carry='1') or (op=jz and z='1') or 
					   (op=jnz and not z='1') or (op=ja and not carry='1' and not z='1') or
					   (op=jnbe and not carry='1' and not z='1') or (op=jae and not carry='1') or 
					   (op=jnb and not carry='1') or (op=jb and carry='1') or (op=jnae and carry='1') or 
					   (op=jbe and (carry='1' or z='1')) or (op=jna and (carry='1' or z='1')) or 
					   (op=je and z='1') or (op=jne and not z='1') then
								end if;

					if (op=mul) then
						if (op3=reg) then
							Sel_ABCD_in<='1'; Sel_se_mult<='1'; Sel_addr_ABCD<='0'; Wr_ABCD<='1'; y_next <= e0;	end if;
						if (op3=m_reg or op3=addr) then
							Sel_ULA_in<='1'; Ld_ULA<='1'; end if;
					end if;

					if (op=inc or op=dec or op=not_op) then 
						Ld_ULA<='1'; Sel_ABCD_in<='1';	end if;

					
				when e5 =>	y_next <= e6;
					if (op=mov) then 
						Ld_PC<='0';
						if (op2=con)	then 
								Wr_ABCD<='0';	 y_next <= e0; 	end if;
						if	(op2=rX) then
								Ld_ULA<='0'; Sel_ABCD_in<='1'; Wr_ABCD<='1'; y_next <= e0; 	end if;
						if	(op2=m_rX) then	
								Wr_ABCD<='1'; y_next <= e0;	end if;
						if	(op2=m_a) then
							Sel_addr_mem<="01";	end if;
						if (opm=m_rrx or opm=ma_r or opm=ma_con) then
							Sel_addr_mem<="01"; wr_mem<='1'; end if;
					end if;
					
					if (op=call) then 
						Sel_addr_mem<="01"; sel_preset_PC<='1';  Ld_PC<='1';	end if;
					
					if (op= add or op=sub or op=and_op or op=or_op or op=xor_op or op=shl or op=shr or op=cmp) then 
						Sel_ABCD_in<='1';  
						if	(op2=m_rX or op2=m_a) then	
							Sel_addr_mem<="01"; 	end if;
						if	(op2=con) 	then	
							Sel_ABCD_in<='1'; Wr_ABCD<='1'; y_next<=e0;  end if;
					end if;
					
					if (op=mul) then
						if (op3=m_reg or op3=addr) then
							Sel_ABCD_in<='1'; Sel_se_mult<='1'; Sel_addr_ABCD<='0'; Wr_ABCD<='1'; y_next <= e0; end if;
					end if;

					if (op=inc or op=dec or op=not_op) then 
						Sel_ABCD_in<='1'; Wr_ABCD<='1'; y_next <= e0;
					end if;

					if (op=jmp) or (op=jc and carry='1') or (op=jnc and not carry='1') or (op=jz and z='1') or 
					   (op=jnz and not z='1') or (op=ja and not carry='1' and not z='1') or
					   (op=jnbe and not carry='1' and not z='1') or (op=jae and not carry='1') or 
					   (op=jnb and not carry='1') or (op=jb and carry='1') or (op=jnae and carry='1') or 
					   (op=jbe and (carry='1' or z='1')) or (op=jna and (carry='1' or z='1')) or 
					   (op=je and z='1') or (op=jne and not z='1') then
							y_next<=e0;		end if;

					
				when e6 =>	y_next <= e7;
					if (op=mov) then
						if	(op2=m_a) then
							Sel_ULA_in<='1'; Ld_ULA<='1';	end if;
						if (opm=m_rrx or opm=ma_r or opm=ma_con) then
							Sel_addr_mem<="00"; wr_mem<='0'; y_next<=e0; end if;
					end if;
					if (op= add or op=sub or op=and_op or op=or_op or op=xor_op or op=shl or op=shr or op=cmp) then 
						Sel_ABCD_in<='1';  
						if	(op2=rX) then
							Wr_ABCD<='1'; y_next <= e0; 	end if;
						if	(op2=m_rX or op2=m_a) then	
							Sel_ULA_in<='1'; Ld_ULA<='1';	end if;
					end if;
					
					if (op=call) then 
						end if;

					
				when e7 =>	y_next <= e8;
					if (op= add or op=sub or op=and_op or op=or_op or op=xor_op or op=shl or op=shr or op=cmp) then 
						if	(op2=m_rX or op2=m_a) then	
							Sel_ABCD_in<='1';  Wr_ABCD<='1'; y_next <= e0;	end if;
					end if;
					if (op=mov) then
						if	(op2=m_a) then
							Sel_ABCD_in<='1'; Wr_ABCD<='1'; y_next <= e0; end if;
					end if;
					
					if (op=call) then 
						y_next<=e0; end if;
					
				when e8 =>	y_next <= e1;
				when fim => y_next <= fim;
				end case;
-----------------------------------------------------------------------------------

		end process;
		
		process (clk,r)
		begin
			if r = '1' then
				y_present <= inicio;
			elsif (clk'event and clk = '1') then
				y_present <= y_next;
			end if;
		end process;
end ckt;