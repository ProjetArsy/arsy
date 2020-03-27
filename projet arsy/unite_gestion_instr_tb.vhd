library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity unite_gestion_instr_tb is 

end entity;

architecture arc of unite_gestion_instr_tb is
	
	signal CLK, Rst, nPCsel : std_logic;
	signal Offset : std_logic_vector(24 downto 0);
	signal Instruction : std_logic_vector (31 downto 0);

	begin
		uut_unite_gestion_instr: entity work.unite_gestion_instr(arc) port map(CLK, Rst, nPCsel,Offset,Instruction);
		
		process
			begin
				
				wait for 100 ps;
				CLK <= '0'; 
		
		end process;
end arc;