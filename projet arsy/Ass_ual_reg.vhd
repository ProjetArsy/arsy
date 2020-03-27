library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity Ass_ual_reg is 
port(
	--Definitions des variables d'entrees et sorties
		CLK, We, Rst : in std_logic;
		W : in std_logic_vector(31 downto 0);
		Ra, Rb, Rw : in std_logic_vector(3 downto 0);
		op: in std_logic_vector (1 downto 0);
		y: out std_logic_vector (31 downto 0);
		--Bit de signe 
		n: out std_logic

	);

end entity;

architecture arc of Ass_ual_reg is
	signal A , B : std_logic_vector (31 downto 0);

	begin
		uut0: entity work.Registre(arc) port map(CLK,We,Rst,W,Ra,Rb,Rw,A,B);
		uut1: entity work.ALU(arc) port map(A,B,op,y,n);

	end arc;