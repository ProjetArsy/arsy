library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity MUX2_tb is 
	
end entity;

architecture arc of MUX2_tb is
		--Definitions des variables d'entrees et sorties
		Signal A,B :  std_logic_vector (31 downto 0);
		Signal COM :  std_logic;
		Signal S   : std_logic_vector (31 downto 0);
	begin
		uut: entity work.MUX2(arc) generic map(32) port map(A,B,COM,S);
		
		process
			begin
				COM <= '0';
				A<=X"00000030";
				B<=X"00000010";
				wait for 100 ps;
				COM <= '1';
				wait for 100 ps;
		end process;

	end arc;