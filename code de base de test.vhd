-- ecrire un testbench: 
-- renommer l'entité et la vider 
-- renommer architecture
-- creer component au nom de la source et couper coller la declaration (l'entité doit etre vidé).
-- declarer les signaux et les initialiser (:=)
-- constante clk_period
-- begin
-- instantié l'UnitUnder Test
-- clk_process
-- stimulus process
-- end archi;	


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE behavior OF tb IS
   --Inputs
   signal a : unsigned(2 downto 0) := (others => '0');
   signal b : unsigned(2 downto 0) := (others => '0');
    --Outputs
   signal a_eq_b : std_logic;

   -- Clock period definitions
constant clk_period : time := 1 ns;
   
BEGIN

// Instantiate the Unit Under Test (UUT)
   uut: entity work.comparator PORT MAP (
          a => a,
          b => b,
          a_eq_b => a_eq_b,
          a_le_b => a_le_b,
          a_gt_b => a_gt_b
        );

// Stimulus process
   stim_proc: process
   begin       
        for i in 0 to 8 loop
            for j in 0 to 8 loop
                a <= to_unsigned(i,3); --integer to unsigned type conversion
                b <= to_unsigned(j,3);
                wait for 10 ns;
            end loop;
        end loop;  
   end process;

// example 2
    stim_proc: process
	begin        
		J<='1';
		K<='0';
		wait for clk_period*2;

		J<='1';
		K<='1';
		wait for clk_period*2;
		
		reset <= '1', '0' after 200 ns;
		
		wait;	// suspend le process tant qu'un signal de la liste de sensibilité et que l'espression boolean n'est pas évalué à TRUE.
		wait for 2 ns;    
		wait on h until h = '0'; -- attendre un transition sur le signal "h" vers l’état ‘0’
		wait until h = '0';
	end process;
   
//example horloge
	horloge : process
	begin
		clk <= not clk after 100 ns;
		wait on clk;
	end process;
   
END;