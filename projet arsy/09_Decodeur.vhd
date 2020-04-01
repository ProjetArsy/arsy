library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity decodeur is 
port(
	--Definitions des variables d'entrees et sorties
		--CLK, Rst : in std_logic;
		instruction : in std_logic_vector(31 downto 0);
		nPCsel, RegWr, RegSel: out std_logic;
		ALUSrc, PSREn, MemWr, WrSrc : out std_logic;
		ALUCtr : out std_logic_vector(1 downto 0);
		PSR_Out : in std_logic_vector(31 downto 0);
		Offset : out std_logic_vector(23 downto 0);
		Imm : out std_logic_vector(7 downto 0);
		Rn, Rd, Rm : out std_logic_vector(3 downto 0)
		
		);
end entity;

architecture arc of decodeur is
	
	type enum_instruction is (MOV, ADDi, ADDr, CMP, LDR, STR, BAL, BLT);
	
	signal instr_courante: enum_instruction;

	begin
		
		instr_actu: process(instruction)
						begin
							if (instruction(27) = '1') then
								-- branchement
								if (instruction(31 downto 28) = "1110") then
									instr_courante <= BAL;
									
									nPCsel <= '1';
									RegWr  <= '0';
									ALUSrc <= '-';
									ALUCtr <= "--";
									PSREn  <= '0';
									MemWr  <= '0';
									WrSrc  <= '-';
									RegSel <= '0';
									Offset <= instruction(23 downto 0);
									
								elsif (instruction(31 downto 28) = "1011") then
									instr_courante <= BLT;
									
									nPCsel <= PSR_Out(0);
									RegWr  <= '0';
									ALUSrc <= '-';
									ALUCtr <= "--";
									PSREn  <= '0';
									MemWr  <= '0';
									WrSrc  <= '-';
									RegSel <= '0';
									Offset <= instruction(23 downto 0);
									
								end if;
								
							elsif (instruction(27) = '0') then
								-- Les autres operateurs
								if (instruction(31 downto 20) = "111000101000") then
									instr_courante <= ADDi;
									
									nPCsel <= '0';
									RegWr  <= '1';
									ALUSrc <= '1';
									ALUCtr <= "00";
									PSREn  <= '0';
									MemWr  <= '0';
									WrSrc  <= '0';
									RegSel <= '0';
									Rn <= instruction(19 downto 16);
									Rd <= instruction(15 downto 12);
									Imm <= instruction(7 downto 0);
									
								elsif (instruction(31 downto 20) = "111000001000") then
									instr_courante <= ADDr;
									
									nPCsel <= '0';
									RegWr  <= '1';
									ALUSrc <= '0';
									ALUCtr <= "00";
									PSREn  <= '0';
									MemWr  <= '0';
									WrSrc  <= '0';
									RegSel <= '0';
									Rn <= instruction(19 downto 16);
									Rd <= instruction(15 downto 12);
									Rm <= instruction(3 downto 0);

									
								elsif (instruction(31 downto 20) = "111000111010") then
									instr_courante <= MOV;
									
									nPCsel <= '0';
									RegWr  <= '1';
									ALUSrc <= '1';
									ALUCtr <= "01";
									PSREn  <= '0';
									MemWr  <= '0';
									WrSrc  <= '0';
									RegSel <= '0';
									Rd <= instruction(15 downto 12);
									Imm <= instruction(7 downto 0);

									
								elsif (instruction(31 downto 20) = "111000110101") then
									instr_courante <= CMP;
									
									nPCsel <= '0';
									RegWr  <= '0';
									ALUSrc <= '1';
									ALUCtr <= "10";
									PSREn  <= '1';
									MemWr  <= '0';
									WrSrc  <= '0';
									RegSel <= '0';
									Rn <= instruction(19 downto 16);
									Imm <= instruction(7 downto 0);
									
								elsif (instruction(31 downto 20) = "111001100001") then
									instr_courante <= LDR;
									
									nPCsel <= '0';
									RegWr  <= '1';
									ALUCtr <= "00";
									PSREn  <= '0';
									MemWr  <= '0';
									WrSrc  <= '1';
									RegSel <= '0';
									ALUSrc <= '1';
									Rn <= instruction(19 downto 16);
									Rd <= instruction(15 downto 12);
									Imm <= instruction(7 downto 0);
									
								elsif (instruction(31 downto 20) = "111001100000") then
									instr_courante <= STR;
									
									nPCsel <= '0';
									RegWr  <= '0';
									ALUSrc <= '0';
									ALUCtr <= "00";
									PSREn  <= '0';
									MemWr  <= '1';
									WrSrc  <= '0';
									ALUSrc <= '1';
									RegSel <= '1';
									Rn <= instruction(19 downto 16);
									Rd <= instruction(15 downto 12);
									Imm <= instruction(7 downto 0);
									
								end if;
								
							end if;
						
					end process;
		 
		
end arc;