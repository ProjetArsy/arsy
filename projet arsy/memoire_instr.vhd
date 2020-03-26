library IEEE;				-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;		-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity memoire_instr is 
	port(
	--Definitions des variables d'entrees et sorties
		Instruction : out std_logic_vector (31 downto 0);
		Addr : in std_logic_vector (31 downto 0)

	);
end entity;

architecture arc of memoire_instr is

	-- Declaration Type Tableau Memoire
	type table is array (63 downto 0) of std_logic_vector ( 31 downto 0);
	-- Fonction d'Initialisation du Banc de Registres
	function init_banc return table is
		variable result : table;
		begin 
			for i in 63 downto 0 loop
			result (i) := (others=>'0');
			end loop;
			return result;
	end init_banc;

		-- Déclaration et Initialisation du Banc de Registres 64x32 bits
	signal Banc: table:=init_banc;
	
	begin
		Instruction <= Banc(to_integer(unsigned(Addr(5 downto 0))));
end arc;