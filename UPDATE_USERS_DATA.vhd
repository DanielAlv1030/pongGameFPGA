LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------
ENTITY UPDATE_USERS_DATA IS
  PORT (  	
				btn_iz_J1		: IN  STD_LOGIC:='0';
				btn_der_J1		: IN  STD_LOGIC:='0';
				btn_iz_J2		: IN  STD_LOGIC:='0';
				btn_der_J2		: IN  STD_LOGIC:='0';
				clk  				: IN  STD_LOGIC:='0';
            rst  				: IN  STD_LOGIC:='0';
				--up					: IN  std_logic;
				sel      		: IN  STD_LOGIC:='0';
			   syn_clr  		: IN  STD_LOGIC:='0';
			   ena  				: IN  STD_LOGIC:='1';
				--y			: out std_LOGIC;
			   posicion_jugador_1     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			   posicion_jugador_2     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
				);

				
END ENTITY;
-----------------------------------------------
ARCHITECTURE general OF UPDATE_USERS_DATA IS
	SIGNAL q0 ,state_to_Buttons,ready_t_signal: STD_LOGIC;
   SIGNAL MUXES_FOR_BUTTON_LEFT_1,MUXES_FOR_BUTTON_RIGHT_1: STD_LOGIC;
	SIGNAL MUXES_FOR_BUTTON_LEFT_2,MUXES_FOR_BUTTON_RIGHT_2: STD_LOGIC;
	SIGNAL posicion_jugador, posicion_jugador_M :STD_LOGIC;
	SIGNAL posicion_jugador_I_2, posicion_jugador_M_2 :STD_LOGIC;
	SIGNAL ENA_1, ENA_2 : STD_LOGIC;
BEGIN
	
	SELECTORSUMARESTA_1: ENTITY work.MUX_selector_sum_rest
	PORT MAP(	
					btn_iz		=>	btn_iz_J1,
					btn_der		=>	btn_der_J1,
					--sel				=> sel,
					UP					=>	MUXES_FOR_BUTTON_RIGHT_1
					--Y(0)				=> MUXES_FOR_BUTTON_LEFT_1
					);	
					
	SELECTORSUMARESTA_2: ENTITY work.MUX_selector_sum_rest
	PORT MAP(	
					btn_iz		=>	btn_iz_J2,
					btn_der		=>	btn_der_J2,
					--sel				=> sel,
					UP				=>	MUXES_FOR_BUTTON_RIGHT_2
					--Y(0)				=> MUXES_FOR_BUTTON_LEFT_2
					);
					
		
		MUXES_FOR_BUTTON_LEFT_1 <= btn_iz_J1 OR btn_der_J1;
		MUXES_FOR_BUTTON_LEFT_2 <= btn_iz_J2 OR btn_der_J2;
					
					
	univ_bin_counter_1: ENTITY work.univ_bin_counter
	GENERIC MAP (	N 			=> 3)
	PORT MAP(	rst 		=> rst,
					ena		=> ena,
					--ENA_1,
					syn_clr	=> syn_clr,
					clk		=> MUXES_FOR_BUTTON_LEFT_1,
					up			=> MUXES_FOR_BUTTON_RIGHT_1,
					MAX		=> "110",
					MIN		=> "001",
					max_tick	=>	posicion_jugador,
					min_tick => posicion_jugador_M,
					counter  => posicion_jugador_1
					);

	univ_bin_counter_2: ENTITY work.univ_bin_counter
	GENERIC MAP (	N 			=> 3)
	PORT MAP(	rst 		=> rst,
					ena		=> ena,
					--ENA_2,
					syn_clr	=> syn_clr,
					
					clk		=> MUXES_FOR_BUTTON_LEFT_2,
					up			=> MUXES_FOR_BUTTON_RIGHT_2,

					MAX		=> "110",
					MIN		=> "001",
					max_tick	=>	posicion_jugador_I_2,
					min_tick => posicion_jugador_M_2,
					counter  => posicion_jugador_2
					);			
	
END ARCHITECTURE;