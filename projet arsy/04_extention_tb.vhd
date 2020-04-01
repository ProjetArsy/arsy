library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity extention_tb is 

end entity;

architecture arc of extention_tb is
		--Definitions des variables d'entrees et sorties
		
		signal E : std_logic_vector  (15 downto 0);
		Signal S : std_logic_vector  (31 downto 0);
		
	begin
		uut: entity work.extention(arc) generic map(16) port map(E,S);
		
		process
			begin
			E<=X"0030";
			wait for 100 ps ;
			E<=X"F020";
			wait for 100 ps ;
				
		end process;
		
		

	end arc;