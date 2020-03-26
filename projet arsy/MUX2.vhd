library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity MUX2 is 
	generic
	(
		N : integer :=32 
	);
	port (
			A,B : in std_logic_vector (N-1 downto 0);
			COM : in std_logic;
			S : out std_logic_vector (N-1 downto 0)
	);
end entity;

architecture arc of MUX2 is
		--Definitions des variables d'entrees et sorties
		
		
	begin
	
	with COM select
		S <= A when '0',
			 B when '1',
			 (others => '-') when others;
			  

	end arc;