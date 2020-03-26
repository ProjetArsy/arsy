library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opérateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity ALU_tb is 

end entity;


architecture arc of ALU_tb is
--Definitions des variables d'entrees et sorties
		signal a:  std_logic_vector (31 downto 0);	
		signal b:  std_logic_vector (31 downto 0);
		signal op: std_logic_vector (1 downto 0);
		signal y:  std_logic_vector (31 downto 0);
		--Bit de signe 
		signal n: std_logic;

begin
	uut: entity work.ALU(arc) port map(a,b,op,y,n);
	process
		begin
			op<= "00";
			a<= X"00000000";
			b<= X"FFFFFFFF";
			wait for 100 ns ;
			op<= "10";
			a<= X"00000011";
			b<= X"FFFFFFFF";
			wait for 100 ns ;
		
	end process;

end arc;
