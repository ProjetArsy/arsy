library IEEE;	-- type boolean, bit, character, severity_level
use IEEE.STD_LOGIC_1164.ALL;	-- definit les types std_logic , std_logic_vector , std_ulogic, les opérateurs logiques et les fonctions de recherches de fronts rising_edge() et falling_edge(). introduit par IEE 1164 en 1992.
use IEEE.NUMERIC_STD.ALL;		-- definit les sous-types entier "signed" ou "unsigned", introduit par IEEE 1076.3

entity ALU is 
	port(
	--Definitions des variables d'entrees et sorties
		a: in std_logic_vector (31 downto 0);	
		b: in std_logic_vector (31 downto 0);
		op: in std_logic_vector (1 downto 0);
		y: out std_logic_vector (31 downto 0);
		--Bit de signe 
		n: out std_logic
		
	);
end entity;

architecture arc of ALU is
	signal calc_temp_int : integer;
	signal calc_temp : std_logic_vector(31 downto 0);
	signal a_int, b_int : integer;
begin
	a_int <= to_integer(signed(a));
	b_int <= to_integer(signed(b));

	with op select calc_temp_int  <=
		a_int+b_int 	when "00",
		b_int 		when "01",
		a_int-b_int	when "10",
		a_int		when "11",
		0 when others;
	
	calc_temp <= std_logic_vector (to_signed(calc_temp_int,32));
	
	n<= calc_temp(31);
	y<=calc_temp;

end arc;
