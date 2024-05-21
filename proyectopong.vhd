LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------
ENTITY proyectopong IS
  PORT (  btn_iz_J1	:	IN  STD_LOGIC:='1';
			btn_der_J1	:	IN  STD_LOGIC:='1';
			btn_iz_J2	:	IN  STD_LOGIC:='1';
			btn_der_J2	:	IN  STD_LOGIC:='1';
			
			btn_inicio	:	IN  STD_LOGIC:='1';
			
			clk  			: IN  STD_LOGIC:='0';
         rst  			: IN  STD_LOGIC:='0';
			syn_clr  	: IN  STD_LOGIC:='0';
			ena  			: IN  STD_LOGIC:='1';
			output_col	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);	
			output_row	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			sseg1,sseg2	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
			 
END ENTITY;
-----------------------------------------------
ARCHITECTURE general OF proyectopong IS
	SIGNAL ready_t_signal : STD_LOGIC;
	SIGNAL ready_t_signal_pelota : STD_LOGIC;
	
	SIGNAL state_to_leds : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL prueY : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	------- Señales de union
	SIGNAL imput_img128_su : STD_LOGIC_VECTOR(127 DOWNTO 0);
	SIGNAL Pelota_X_su 		: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL Pelota_Y_su 		: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL J1_X_su 		: STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL J2_X_su		: STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	SIGNAL btn_iz_J1_s : STD_LOGIC;
	SIGNAL btn_der_J1_s : STD_LOGIC;
	SIGNAL btn_iz_J2_S: STD_LOGIC;
	SIGNAL btn_der_J2_s: STD_LOGIC;
	SIGNAL clk_edg: STD_LOGIC;
	
	
	SIGNAL GOALJ1,GOALJ2: STD_LOGIC;		
	SIGNAL ngoalj1,ngoalj2 		: STD_LOGIC_VECTOR(2 DOWNTO 0);
	
BEGIN


	matrix_controller: ENTITY work.matrix_controller
	PORT MAP(	clk 	=> clk,
					rst	=> rst,
					imput_img128 => --"10000001100000010010010000100100011111100010011111111111001001000111111000000000001111000100001000011000001111001000000110000001",
					--"00000000000000010010010000100110010110100010010010000001001011000101101000010000001001000010001000011000010011000000000010000000",
					imput_img128_su,
					syn_clr	=> syn_clr,
					output_col => output_col,
					output_row => output_row);
					
	edge_clk: ENTITY work.binary_counter
	GENERIC MAP (	N 			=> 27,
						MAX		=> 150000)
	PORT MAP(	rst 		=> rst,
					ena		=> ena,
					syn_clr	=> syn_clr,
					clk		=> clk,
					max_tick	=>	clk_edg
					--count  => prueY
					);
					
	edge_detect1: ENTITY work.edge_detect
	PORT MAP(	clk 	=> clk_edg,
					async_sig	=> btn_iz_J1,
					fall	=> btn_iz_J1_s);
	
	edge_detect2: ENTITY work.edge_detect
	PORT MAP(	clk 	=> clk_edg,
					async_sig	=> btn_der_J1,
					fall	=> btn_der_J1_s);
				
	edge_detect3: ENTITY work.edge_detect
	PORT MAP(	clk 	=> clk_edg,
					async_sig	=> btn_iz_J2,
					fall	=> btn_iz_J2_s);
				
	edge_detect4: ENTITY work.edge_detect
	PORT MAP(	clk 	=> clk_edg,
					async_sig	=> btn_der_J2,
					fall	=> btn_der_J2_s);	

	--led <= NOT(btn_Inicio); --OR NOT(btn_der_J2) OR NOT(btn_iz_J1) OR NOT(btn_der_J1);
	
	
	Users_Data: ENTITY work.UPDATE_USERS_DATA
	PORT MAP(
					btn_iz_J1 => btn_iz_J1_S,
					btn_der_J1 => btn_der_J1_s,
					btn_iz_J2 => btn_iz_J2_s,
					btn_der_J2 => btn_der_J2_s,

					clk => clk,
					rst => rst,
					syn_clr => syn_clr,
					ena => ena,
					
					posicion_jugador_1 => J1_X_su,
					posicion_jugador_2 => J2_X_su
					
					);
	
	pelota_fsm: ENTITY work.pelota_fsm
	PORT MAP(
					reset => rst,
					clock => --ready_t_signal_pelota,
					clk,
					ena => ena,
					X_J1 => J1_X_su,
					X_J2 => J2_X_su,
					ready_timer => ready_t_signal_pelota,
					pelota_X => pelota_X_su,
					pelota_Y => pelota_Y_su,
					start_btn => not(btn_inicio),
					GOALJ1P => GOALJ1,
					GOALJ2P => GOALJ2
	);		

	univ_bin_counter_goalj1: ENTITY work.univ_bin_counter
	GENERIC MAP (	N 			=> 3)
	PORT MAP(	rst 		=> rst,
					ena		=> ena,
					--ENA_1,
					syn_clr	=> syn_clr,
					clk		=> GOALJ1,
					up			=> '1',
--					max_tick	=>	posicion_jugador,
--					min_tick => posicion_jugador_M,
					counter  => ngoalj1
					);
					
	univ_bin_counter_goalj2: ENTITY work.univ_bin_counter
	GENERIC MAP (	N 			=> 3)
	PORT MAP(	rst 		=> rst,
					ena		=> ena,
					--ENA_1,
					syn_clr	=> syn_clr,
					clk		=> GOALJ2,
					up			=> '1',
--					max_tick	=>	posicion_jugador,
--					min_tick => posicion_jugador_M,
					counter  => ngoalj2
					);
					
	binseg1: ENTITY work.bin_to_sseg
	PORT MAP(	bin => '0' & ngoalj1,
					sseg => sseg1
					);			
	
		binseg2: ENTITY work.bin_to_sseg
	PORT MAP(	bin => '0' & ngoalj2,
					sseg => sseg2
					);	
	
	velocidad_pelota: ENTITY work.binary_counter
	GENERIC MAP (	N 			=> 27,
						MAX		=> 15000000)
	PORT MAP(	rst 		=> rst,
					ena		=> ena,
					syn_clr	=> syn_clr,
					clk		=> clk,
					max_tick	=>	ready_t_signal_pelota
					);
					
						
	w_d_c: ENTITY work.write_data_controller
	PORT MAP(	rst 		=> rst,
					ena		=> ena,
					syn_clr	=> syn_clr,
					clk		=> clk,
					--ready_t_signal_pelota,
					
					Pelota_X => Pelota_X_su,
					--"100",
					Pelota_Y	=>
					--pruey,
					Pelota_Y_su,
					--"1000",
					J1_X		=>	J1_X_su,
					J2_X		=> J2_X_su,
					output_img128 => imput_img128_su
					);
					
	
	



END ARCHITECTURE;