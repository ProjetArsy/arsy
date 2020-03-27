library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity Ass_ual_reg_tb is 

end entity;

architecture arc of Ass_ual_reg_tb is
		--Definitions des variables d'entrees et sorties
		signal CLK, We, Rst :  std_logic;
		signal W :  std_logic_vector(31 downto 0);
		signal Ra, Rb, Rw :  std_logic_vector(3 downto 0);
		signal op:  std_logic_vector (1 downto 0);
		signal y:  std_logic_vector (31 downto 0);
		--Bit de signe 
		signal n:  std_logic;
		
	begin
		uut: entity work.Ass_ual_reg(arc) port map(CLK,We,Rst,W,Ra,Rb,Rw,op,y,n);
		
		process
			begin
			CLK<='0';
			W<=y;
			Rst<='0';
			op<="01";
			We<='1';
			Rw<="0001";
			Ra<="1111";
			wait for 100 ps ;
			CLK<='1';
			
			
			
		end process;
		
		
		

	end arc;