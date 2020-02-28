library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity Registre_tb is 

end entity;

architecture arc of Registre_tb is
	--Definitions des variables d'entrees et sorties
		signal CLK, We, Rst :  std_logic;
		signal W :  std_logic_vector(31 downto 0);
		signal Ra, Rb, Rw :  std_logic_vector(3 downto 0);
		signal A , B :  std_logic_vector (31 downto 0); 
	begin
		uut: entity work.Registre port map(CLK,We,Rst,W,Ra,Rb,Rw,A,B);
		process
			begin
			-- A continuer 
		end process;
	end arc;