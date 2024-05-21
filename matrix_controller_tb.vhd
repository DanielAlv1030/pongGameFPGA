LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------------------
ENTITY matrix_controller_tb IS
END ENTITY matrix_controller_tb;
-------------------------------------------------
ARCHITECTURE testbench OF matrix_controller_tb IS

	SIGNAL  	clk_tb 		:	STD_LOGIC := '0';
	SIGNAL 	syn_clr_tb	: STD_LOGIC := '0';
	SIGNAL  	ena_tb 		:	STD_LOGIC := '0';
	SIGNAL  	rst_tb 		:	STD_LOGIC := '1';
	SIGNAL  	output_col_tb : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL  	output_row_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	
BEGIN
	
	clk_tb <= NOT clk_tb AFTER 20ns;
	rst_tb <= '0' AFTER 10ns;
	ena_tb <= '1' AFTER 20ns,
	          '0' AFTER 80ns,
				 '1' AFTER 120ns;
				 
	counter: ENTITY work.matrix_controller
	PORT MAP(	clk	=>	clk_tb,
					rst	=> rst_tb,			
					ena	=> ena_tb,
					syn_clr => syn_clr_tb,
					imput_img128 => "10000001100000010010010000100100011111100010010011111111001001000111111000000000001111000100001000011000001111001000000110000001",
					output_col => output_col_tb,
					output_row => output_row_tb);

	
	
END ARCHITECTURE testbench;