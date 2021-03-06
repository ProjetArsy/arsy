library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity processeur is 
port(
	--Definitions des variables d'entrees et sorties
		CLK, Rst: in std_logic
		);
end entity;

architecture arc of processeur is
	
	signal instruction : std_logic_vector(31 downto 0);
	signal nPCsel : std_logic := '0';
	signal RegWr : std_logic := '0';
	signal MemWr : std_logic := '0';
	signal RegSel : std_logic;
	signal ALUSrc, WrSrc : std_logic;
	signal ALUCtr : std_logic_vector(1 downto 0);
	signal Offset : std_logic_vector(23 downto 0);
	signal Imm : std_logic_vector(7 downto 0);
	signal Rn, Rd, Rm, Rb : std_logic_vector(3 downto 0);
	signal n: std_logic;
	
	
	begin
		uut_unite_gestion_instr: entity work.unite_gestion_instr(arc) port map(CLK, Rst, nPCsel,Offset,Instruction);
		
		uut_unite_de_controle: entity work.unite_de_controle(arc) port map(CLK, Rst, instruction, nPCsel, RegWr, RegSel, 
													ALUSrc, MemWr, WrSrc, ALUCtr, Offset, Imm, Rn, Rd, Rm, n);
		
		uut_MUX: entity work.MUX2(arc) generic map(4) port map(Rm,Rd,Regsel,Rb);
		
		uut_assemblage_UT: entity work.Assemblage_UT(arc) port map(CLK, RegWr, Rst,ALUsrc,WrSrc,Rn, Rb, Rd,ALUCtr,n,Imm,MemWr);
		
		
end arc;