LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------
ENTITY matrix_controller IS
  PORT (  clk  		: IN  STD_LOGIC:='0';
          rst  		: IN  STD_LOGIC:='0';
			 syn_clr  	: IN  STD_LOGIC:='0';
			 ena  		: IN  STD_LOGIC:='1';
			 imput_img128 	: IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
			 output_col	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);	
			output_row	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
			 
END ENTITY;
-----------------------------------------------
ARCHITECTURE general OF matrix_controller IS
	SIGNAL ready_t_signal : STD_LOGIC;
	SIGNAL state_to_leds : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
BEGIN


	cont250us: ENTITY work.binary_counter
	PORT MAP(	rst 		=> rst,
					ena		=> ena,
					syn_clr	=> syn_clr,
					clk		=> clk,
					max_tick	=>	ready_t_signal
					);
					
	matrix_fsm: ENTITY work.matrix_fsm
	PORT MAP(	input_img 		=> imput_img128,
					reset 		=> rst,
					clock			=> clk,
					ready_timer	=>	ready_t_signal,
					output_col	=> output_col,
					output_row	=> output_row
					);


--"11111111000000000010010000100100010110100010010010000001001001000101101000000000001001000100001000011000001111000000000000000000",
--	"10000001100000010010010000100100011111100010010011111111001001000111111000000000001111000100001000011000001111001000000110000001",
											
END ARCHITECTURE;