LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;

----------------------------------------------
ENTITY write_data_controller IS
  PORT (  clk  		: IN  STD_LOGIC:='0';
          rst  		: IN  STD_LOGIC:='0';
			 syn_clr  	: IN  STD_LOGIC:='0';
			 ena  		: IN  STD_LOGIC:='1';
			 
			 Pelota_X  	: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			 Pelota_Y	: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			 
			 J1_X		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			 J2_X		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			 
			 output_img128 	: OUT  STD_LOGIC_VECTOR(127 DOWNTO 0)
			);
			 
END ENTITY;
-----------------------------------------------
ARCHITECTURE general OF write_data_controller IS

	CONSTANT zeros : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS =>'0');
	
	
	SIGNAL ready_t_signal : STD_LOGIC;
	SIGNAL contador : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL Aux_Data,r_data_s : STD_LOGIC_VECTOR(15 DOWNTO 0):= (OTHERS =>'0');
	SIGNAL Fila0,Fila1,Fila2,Fila3,Fila4,Fila5,Fila6,Fila7 : STD_LOGIC_VECTOR(15 DOWNTO 0):= (OTHERS =>'0');
	
	SIGNAL dat : STD_LOGIC_VECTOR(127 DOWNTO 0);
	
	
BEGIN
	
	
	
	--------------------------------------------------

--	counter_filas: ENTITY work.binary_counter
--		GENERIC MAP (	N 			=> 3,
--							MAX		=> 7)
--	PORT MAP(	rst 		=> rst,
--					ena		=> ena,
--					syn_clr	=> syn_clr,
--					clk		=> clk,
--					max_tick	=>	ready_t_signal,
--					count 	=> contador
--					);
					
	
	Fila0_s: ENTITY work.data_to_array_union
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					Pelota_Y => Pelota_Y,
					contador => "000",
					Data_finall => Fila0
					
					);
	Fila1_s: ENTITY work.data_to_array_union
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					Pelota_Y => Pelota_Y,
					contador => "001",
					Data_finall => Fila1
					
					);
	Fila2_s: ENTITY work.data_to_array_union
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					Pelota_Y => Pelota_Y,
					contador => "010",
					Data_finall => fila2
					
					);
	Fila3_s: ENTITY work.data_to_array_union
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					Pelota_Y => Pelota_Y,
					contador => "011",
					Data_finall => fila3
					
					);
					
	Fila4_s: ENTITY work.data_to_array_union
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					Pelota_Y => Pelota_Y,
					contador => "100",
					Data_finall => fila4
					
					);
					
	Fila5_s: ENTITY work.data_to_array_union
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					Pelota_Y => Pelota_Y,
					contador => "101",
					Data_finall => fila5
					
					);
					
	Fila6_s: ENTITY work.data_to_array_union
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					Pelota_Y => Pelota_Y,
					contador => "110",
					Data_finall => fila6
					
					);
					
				
	Fila7_s: ENTITY work.data_to_array_union
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					Pelota_Y => Pelota_Y,
					contador => "111",
					Data_finall => fila7
					
					);
					
					
	dat <= Fila0 & Fila1 & Fila2 & Fila3 & Fila4 & Fila5 & Fila6 & Fila7;

	
--
--	clear_sc: ENTITY work.MUX_clear_sc
--	PORT MAP(	rst 		=> rst,
--					ena		=> ena,
--					syn_clr	=> syn_clr,
--					clk		=> clk,
--					S1			=> dat,
--					Y			=> dat_clear
--					);

	
	FLIPFLPO: ENTITY work.my_regDFF
	PORT MAP(	clk => clk,
					rst => rst,
					ena => ena,
					d	=> dat,
					q	=> output_img128
					);		

										
END ARCHITECTURE;