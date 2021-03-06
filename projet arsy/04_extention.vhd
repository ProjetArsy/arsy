library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity extention is 
	generic
	(
		N : integer :=32 
	);
	port (
			E : in std_logic_vector  (N-1 downto 0);
			S : out std_logic_vector (31 downto 0)
	);
end entity;

architecture arc of extention is
		--Definitions des variables d'entrees et sorties
		
		
	begin
		S(N-1 downto 0) <= E;
		S(31 downto N-2) <= (others => E(N-1));
	end arc;