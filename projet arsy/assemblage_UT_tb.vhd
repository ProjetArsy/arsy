library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opÃ©rateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity Assemblage_UT_tb is 

end entity;

architecture arc of Assemblage_UT_tb is

	--Definitions des variables d'entrees et sorties
		signal CLK, We, Rst,COM1,COM2 :  std_logic;
		signal Ra, Rb, Rw :  std_logic_vector(3 downto 0);
		signal op:  std_logic_vector (1 downto 0);
		--Bit de signe 
		signal n: std_logic;
		signal Imm :  std_logic_vector(7 downto 0);
		signal WrEn  : std_logic;

	begin
		uut_assemblage_UT: entity work.Assemblage_UT(arc) port map(CLK, We, Rst,COM1,COM2,Ra, Rb, Rw,op,n,Imm,WrEn);
		
		process
		begin
		--addition de deux registre R2=R1+R15=48
		wait for 100 ps ;
		Rst <= '0';
		CLK <= '0';
		We <= '1';
		Rw<="0010";
		Ra<="0001";
		Rb<="1111";
		op<= "00";
		COM1 <= '0';
		COM2<= '0';
		WrEn<='0';
	
		wait for 100 ps ;
		CLK <= '1';

		--addition d'un registre avec une valeur immediatte R3=  R15+8
		wait for 100 ps ;
		Rst <= '0';
		CLK <= '0';
		We <= '1';
		Rw<="0011";
		Ra<="1111";
		--Rb<="1111"
		op<= "00";
		COM1 <= '1';
		COM2<= '0';
		WrEn<='0';
		Imm<="00001000";
	
		wait for 100 ps ;
		CLK <= '1';

		--soustraction de deux registre R4=R1-R15=-48
		wait for 100 ps ;
		Rst <= '0';
		CLK <= '0';
		We <= '1';
		Rw<="0100";
		Ra<="0001";
		Rb<="1111";
		op<= "10";
		COM1 <= '0';
		COM2<= '0';
		WrEn<='0';
	
		wait for 100 ps ;
		CLK <= '1';

		--soustraction d'un registre avec une valeur immediatte R5=R15-8
		wait for 100 ps ;
		Rst <= '0';
		CLK <= '0';
		We <= '1';
		Rw<="0101";
		Ra<="1111";
		--Rb<="1111"
		op<= "10";
		COM1 <= '1';
		COM2<= '0';
		WrEn<='0';
		Imm<="00001000";
	
		wait for 100 ps ;
		CLK <= '1';

		--copie  d'un registre dans un autre R6=R15
		wait for 100 ps ;
		Rst <= '0';
		CLK <= '0';
		We <= '1';
		Rw<="0110";
		Ra<="1111";
		op<= "11";
		COM1 <= '0';
		COM2<= '0';
		WrEn<='0';
	
		wait for 100 ps ;
		CLK <= '1';

		--lecture d'un mot de la memoire dans un registre R7=M15
		wait for 100 ps ;
		Rst <= '0';
		CLK <= '0';
		We <= '1';
		Rw<="0111";
		op<= "01";
		COM1 <= '1';
		COM2<= '1';
		WrEn<='0';
		Imm<="00001111";
	
		wait for 100 ps ;
		CLK <= '1';

		--ecriture d'un registre dans la memoire  M0=R15
		wait for 100 ps ;
		Rst <= '0';
		CLK <= '0';
		We <= '0';
		Ra<="0001";
		Rb<="1111";
		op<= "11";
		COM1 <= '0';
		COM2<= '0';
		WrEn<='1';
	
		wait for 100 ps ;
		CLK <= '1';
		
		end process;

		
end arc;