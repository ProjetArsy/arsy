library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity unite_gestion_instr is 
port(
	--Definitions des variables d'entrees et sorties
		CLK, Rst, nPCsel : in std_logic;
		Offset : in std_logic_vector(23 downto 0);
		Instruction : out std_logic_vector (31 downto 0)
		
		);
end entity;

architecture arc of unite_gestion_instr is
	
	signal Addr : std_logic_vector (31 downto 0);
	signal S_Alu1 : std_logic_vector (31 downto 0);
	signal S_Alu_Offset, S_Offset, S_MUX:  std_logic_vector(31 downto 0);
	signal n_Alu1, n_Alu_Offset: std_logic;

	begin
		uut_PC: entity work.PC(arc) port map(CLK,Rst,S_MUX,Addr);
		uut_ALU_Plus1: entity work.ALU(arc) port map(Addr,X"00000001","00",S_Alu1,n_Alu1);
		uut_MUX: entity work.MUX2(arc) port map(S_Alu1,S_Alu_Offset,nPCsel,S_MUX);
		uut_memoire_instr: entity work.memoire_instr(arc) port map(Instruction, Addr);
		uut_ALU_Plus1_PlusOffset: entity work.ALU(arc) port map(S_Offset,S_Alu1,"00",S_Alu_Offset,n_Alu_Offset);
		uut_extention: entity work.extention(arc) generic map(24) port map(Offset,S_Offset);
end arc;