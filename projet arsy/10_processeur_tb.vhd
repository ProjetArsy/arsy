library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity processeur_tb is 
end entity;

architecture arc of processeur_tb is
	
	signal CLK: std_logic := '1';
	signal Rst: std_logic;	
	
	begin
		uut_processeur: entity work.processeur(arc) port map(CLK, Rst);
		Rst <= '0';

		process
			begin
				wait for 100 ps;
				Rst <= '0';
				CLK <= not(CLK);
		end process;
end arc;