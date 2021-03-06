library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity Ass_ual_reg_tb is 

end entity;

architecture arc of Ass_ual_reg_tb is
		--Definitions des variables d'entrees et sorties
		signal We, Rst :  std_logic;
		signal CLK : std_logic :='0';
		signal Ra, Rb, Rw :  std_logic_vector(3 downto 0);
		signal op:  std_logic_vector (1 downto 0);
		--Bit de signe 
		signal n:  std_logic;
		
	begin
		uut: entity work.Ass_ual_reg(arc) port map(CLK,We,Rst,Ra,Rb,Rw,op,n);
		
		process
			begin
			
			--R1 = R15 = 48
			wait for 100 ps ;
			CLK<='0';
			Rst<='0';
			op<="01";
			We<='1';
			Rw<="0001";
			Rb<="1111";
			wait for 100 ps ;
			CLK<='1';

			--R1 = R1 + R15 = 96
			wait for 100 ps ;
			CLK<='0';
			Rst<='0';
			op<="00";
			We<='1';
			Ra<="0001";
			Rw<="0001";
			Rb<="1111";
			wait for 100 ps ;
			CLK<='1';

			--R2 = R1 + R15 = 144
			wait for 100 ps ;
			CLK<='0';
			Rst<='0';
			op<="00";
			We<='1';
			Ra<="0001";
			Rw<="0010";
			Rb<="1111";
			wait for 100 ps ;
			CLK<='1';
			
			--R3 = R1 - R15 = 48
			wait for 100 ps ;
			CLK<='0';
			Rst<='0';
			op<="10";
			We<='1';
			Ra<="0001";
			Rw<="0011";
			Rb<="1111";
			wait for 100 ps ;
			CLK<='1';
			
			--R5 = R7 - R15 = -48
			wait for 100 ps ;
			CLK<='0';
			Rst<='0';
			op<="10";
			We<='1';
			Ra<="0111";
			Rw<="0101";
			Rb<="1111";
			wait for 100 ps ;
			CLK<='1';					
			
		end process;
		
		
		

	end arc;