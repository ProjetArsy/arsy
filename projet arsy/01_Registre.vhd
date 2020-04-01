library IEEE;				-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;		-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity Registre is 
	port(
	--Definitions des variables d'entrees et sorties
		CLK, We, Rst : in std_logic;
		W : in std_logic_vector(31 downto 0);
		Ra, Rb, Rw : in std_logic_vector(3 downto 0);
		A , B : out std_logic_vector (31 downto 0)

	);
end entity;

architecture arc of Registre is

	-- Declaration Type Tableau Memoire
	type table is array (15 downto 0) of std_logic_vector ( 31 downto 0);
	-- Fonction d'Initialisation du Banc de Registres
	function init_banc return table is
		variable result : table;
		begin 
			for i in 14 downto 0 loop
			result (i) := (others=>'0');
			end loop;
			result (15):=X"00000030";
			return result;
	end init_banc;

		-- Déclaration et Initialisation du Banc de Registres 16x32 bits
	signal Banc: table:=init_banc;
	
	begin

		process(CLK)
			begin 
				if rising_edge(CLK) then 
					if Rst = '1' then
						
					else
						if We = '1' then
							Banc(to_integer(unsigned(Rw)))<=W;
						end if;
						
					end if;
				end if;

		end process;
		
		A <= Banc(to_integer(unsigned(Ra)));
		B <= Banc(to_integer(unsigned(Rb)));
end arc;