library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity unite_de_controle is 
port(
	--Definitions des variables d'entrees et sorties
		CLK, Rst: in std_logic;
		instruction : in std_logic_vector(31 downto 0);
		nPCsel, RegWr, RegSel: out std_logic;
		ALUSrc, MemWr, WrSrc : out std_logic;
		ALUCtr : out std_logic_vector(1 downto 0);
		Offset : out std_logic_vector(23 downto 0);
		Imm : out std_logic_vector(7 downto 0);
		Rn, Rd, Rm : out std_logic_vector(3 downto 0);
		
		--Bit de signe 
		n: in std_logic
		
		);
end entity;

architecture arc of unite_de_controle is

	signal PSR_Out : std_logic_vector(31 downto 0);
	signal PSR_In : std_logic_vector(31 downto 0);
	signal PSREn : std_logic;

	begin
	
		PSR_In(0) <= n;
		PSR_In(31 downto 1) <= (others => '0');
		
		uut_decodeur: entity work.Decodeur(arc) port map(instruction, nPCsel, RegWr, RegSel, 
							ALUSrc, PSREn, MemWr, WrSrc, ALUCtr, PSR_Out, Offset, Imm, Rn, Rd, Rm);
		
		
		uut_psr: entity work.PSR(arc) port map(CLK, Rst, PSREn, PSR_In, PSR_Out);
end arc; 