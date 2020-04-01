library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity PSR is 
port(
	--Definitions des variables d'entrees et sorties
		CLK, Rst, We : in std_logic;
		DataIn : in std_logic_vector(31 downto 0);
		Dataout : out std_logic_vector (31 downto 0)
		
		);
end entity;

architecture arc of PSR is
	signal reg_psr : std_logic_vector(31 downto 0);

	begin
		process(CLK)
			begin 
				if rising_edge(CLK) then

					if Rst = '1' then 
					
					else
						if We = '1' then 		
							reg_psr<=DataIn;	
						end if;
					end if ;
						
				end if;

		end process;
		Dataout<= reg_psr;
end arc;