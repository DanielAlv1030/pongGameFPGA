LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------
ENTITY proyectopong_tb IS
END ENTITY proyectopong_tb;
-------------------------------------------------
ARCHITECTURE testbench OF proyectopong_tb IS
			SIGNAL btn_iz_J1_tb				:		   STD_LOGIC :='1';
			SIGNAL btn_der_J1_tb				:			STD_LOGIC :='1';
			SIGNAL btn_iz_J2_tb				:		   STD_LOGIC :='1';
			SIGNAL btn_der_J2_tb		   	:			STD_LOGIC :='1';
			SIGNAL btn_inicio_tb				:		   STD_LOGIC :='1';
			
			SIGNAL clk_tb						:		   STD_LOGIC :='0';
			SIGNAL syn_clr_tb					:			STD_LOGIC :='0';	
			SIGNAL rst_tb						:			STD_LOGIC :='0';
			SIGNAL ena_tb						:			STD_LOGIC :='1';
			SIGNAL output_col_tb 			: 	      STD_LOGIC_VECTOR(15 DOWNTO 0);
			SIGNAL output_row_tb				: 	 		STD_LOGIC_VECTOR(7 DOWNTO 0);
			--SIGNAL led_tb						: 			STD_LOGIC :='0';
BEGIN
	
	clk_tb <= NOT clk_tb AFTER 20ns;
	rst_tb <= '0' AFTER 50ns;
	
	btn_inicio_tb <= '0' AFTER 100ns;
	btn_inicio_tb <= '1' AFTER 150ns;
	
	btn_Iz_J1_tb <= '0' AFTER 200ns;
	btn_IZ_J1_tb <= '1' AFTER 250ns;
	
	
	counter: ENTITY work.proyectopong
	
	PORT MAP(	btn_iz_J1 		=>	btn_iz_J1_tb,
					btn_der_J1 		=>	btn_der_J1_tb,
					btn_iz_J2 		=>	btn_iz_J2_tb,
					btn_der_J2		=> btn_der_J2_tb,
					btn_inicio 		=> btn_inicio_tb,
					
					rst				=> rst_tb,
					clk				=> clk_tb,
					syn_clr 			=>	syn_clr_tb,
					ena 				=>	ena_tb,
					output_col		=> output_col_tb,
					output_row 		=> output_row_tb
					--led				=> led_tb
					);

	
	
END ARCHITECTURE;