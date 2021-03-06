library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity Assemblage_UT is 
port(
	--Definitions des variables d'entrees et sorties
		CLK, We, Rst,COM1,COM2 : in std_logic;
		--W : in std_logic_vector(31 downto 0);
		Ra, Rb, Rw : in std_logic_vector(3 downto 0);
		op: in std_logic_vector (1 downto 0);
		--Bit de signe 
		n: out std_logic;
		Imm : in std_logic_vector(7 downto 0);
		WrEn : in std_logic
		
		);
end entity;

architecture arc of Assemblage_UT is
	
	signal A , B : std_logic_vector (31 downto 0);
	signal DataIn, DataOut :  std_logic_vector(31 downto 0);
	signal ALU_out,W, SImm,S : std_logic_vector (31 downto 0);

	begin
		uut_registre: entity work.Registre(arc) port map(CLK,We,Rst,W,Ra,Rb,Rw,A,B);
		uut_ALU: entity work.ALU(arc) port map(A,S,op,ALU_out,n);
		uut_MUX_memoire: entity work.MUX2(arc) port map(ALU_out,DataOut,COM2,W);
		uut_MUX_ALU: entity work.MUX2(arc) port map(B,SImm,COM1,S);
		uut_memoire: entity work.memoire(arc) port map(CLK, WrEn,Rst,B,DataOut,ALU_out(5 downto 0));
		uut_extention: entity work.extention(arc) generic map(8) port map(Imm,SImm);
end arc;