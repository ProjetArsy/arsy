library IEEE;				-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;		-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity PC is 
	port(
	--Definitions des variables d'entrees et sorties
		CLK, Rst : in std_logic;
		E : in std_logic_vector(31 downto 0);
		S : out std_logic_vector (31 downto 0)

	);
end entity;

architecture arc of PC is
	
	begin

		process(CLK)
			begin 
				if rising_edge(CLK) then 
					if Rst = '1' then
						S <= X"00000000";
					else
						S <= E;
					end if;
				end if;

		end process;
		
end arc;