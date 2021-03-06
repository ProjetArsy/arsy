library IEEE;				-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;		-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity memoire_tb is 

end entity;

architecture arc of memoire_tb is

	signal CLK, WrEn , Rst : std_logic;
	signal DataIn : std_logic_vector(31 downto 0);
	signal DataOut : std_logic_vector (31 downto 0);
	signal Addr : std_logic_vector (5 downto 0);
	
	begin
	
	uut_memoire: entity work.memoire(arc) port map(CLK, WrEn, Rst, DataIn, DataOut, Addr);
	
		process
			begin
			
				-- Lecture de M15
				wait for 100 ps;
				CLK <= '0';
				WrEn <= '0';
				Addr <= "001111";
				wait for 100 ps;
				CLK <= '1';
				
				wait for 100 ps;
				CLK <= '0';
				wait for 100 ps;
				CLK <= '1';
				
				-- Ecriture de 9 à M63
				wait for 100 ps;
				CLK <= '0';
				WrEn <= '1';
				DataIn <= X"00000009";
				Addr <= "111111";
				wait for 100 ps;
				CLK <= '1';
				
				
		end process;
end arc;