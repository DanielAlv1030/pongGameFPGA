LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;



ENTITY pelota_fsm IS
	PORT(	reset			: IN STD_LOGIC;
			clock			: IN STD_LOGIC;
			ena			: IN STD_LOGIC;
			
			start_btn			: IN STD_LOGIC;
			X_J1			: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			X_J2 			: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			
			ready_timer 		: IN STD_LOGIC;
			
			Pelota_X	: OUT STD_LOGIC_VECTOR(2 DOWNTO 0):="111";
			Pelota_Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0):="1001";
			
			--stateon : out STD_LOGIC
			GOAlJ1P,GOALJ2P : out STD_LOGIC
			);
END ENTITY;


ARCHITECTURE states	OF pelota_fsm IS
	TYPE state IS (start, state1, state2, state3, state4, state5, state6, goal);
	SIGNAL pr_state, nx_state: state; 
	
	constant const_4 : unsigned(2 downto 0) := "101";
	constant const_8 : unsigned(3 downto 0) := "1000";
	
	
	
	SIGNAL Pelota_X_S : unsigned(2 DOWNTO 0) := const_4;
	SIGNAL Pelota_Y_S : unsigned(3 DOWNTO 0)	:= const_8;
	
	--señales auxiliares
	SIGNAL Pelota_Y_S_mas_uno : unsigned(3 DOWNTO 0);
	SIGNAL Pelota_Y_S_menos_uno : unsigned(3 DOWNTO 0);
	
	SIGNAL Pelota_X_S_mas_uno : unsigned(2 DOWNTO 0);
	SIGNAL Pelota_X_S_menos_uno : unsigned(2 DOWNTO 0);
	
	SIGNAL X_J1_S		: unsigned(2 DOWNTO 0);
	SIGNAL X_J2_S		: unsigned(2 DOWNTO 0);
	
	SIGNAL X_J1_iz		: unsigned(2 DOWNTO 0);
	SIGNAL X_J1_dec	: unsigned(2 DOWNTO 0);
			
	SIGNAL X_J2_iz 	: unsigned(2 DOWNTO 0);
	SIGNAL X_J2_dec 	: unsigned(2 DOWNTO 0);
	
	SIGNAL GOAlJ1,GOALJ2 : STD_LOGIC;
	
	
BEGIN



	-------------sequential section --------------
	PROCESS	(reset,clock,Pelota_X_S,Pelota_Y_S , ready_timer)
	BEGIN
		IF (reset='1') THEN
			pr_state <= start;
		ELSIF (rising_edge(clock)) THEN 
			
		
		IF ready_timer = '1' THEN	
		pr_state <= nx_state;
				if (pr_state = state1) then 
						--PELOTA
						Pelota_X_S <= Pelota_X_S - 1;
						pelota_X_S_menos_uno <= Pelota_X_S;
						
						Pelota_Y_S <= Pelota_Y_S + 1;
						Pelota_Y_S_mas_uno <= Pelota_Y_S;
						
						--JUGADOR
						 X_J2_S <= unsigned(X_J2)+1;
						 X_J2_iz <= X_J2_S + 1;
						 X_J2_dec <= X_J2_S - 1;
						
				elsif (pr_state = state2) then 
						Pelota_Y_S <= Pelota_Y_S + 1;
						Pelota_Y_S_mas_uno <= Pelota_Y_S;
						
						--JUGADOR
						 X_J2_S <= unsigned(X_J2);
						 X_J2_iz <= X_J2_S + 1;
						 X_J2_dec <= X_J2_S - 1;
						
				elsif (pr_state = state3) then 
						Pelota_X_S <= Pelota_X_S + 1;
						Pelota_X_S_mas_uno <= Pelota_X_S;
						
						Pelota_Y_S <= Pelota_Y_S + 1;
						Pelota_Y_S_mas_uno <= Pelota_Y_S;
						
						--JUGADOR
						 X_J2_S <= unsigned(X_J2)-1;
						 X_J2_iz <= X_J2_S + 1;
						 X_J2_dec <= X_J2_S - 1;
						
				elsif (pr_state = state4) then 
						Pelota_X_S <= Pelota_X_S + 1;
						Pelota_X_S_mas_uno <= Pelota_X_S;
						
						Pelota_Y_S <= Pelota_Y_S - 1;
						Pelota_y_S_menos_uno <= Pelota_Y_S;
						
						--JUGADOR
						 X_J1_S <= unsigned(X_J1)-1;
						 X_J1_iz <= X_J1_S - 1;
						 X_J1_dec <= X_J1_S + 1;
						
				elsif (pr_state = state5) then 
						Pelota_Y_S <= Pelota_Y_S - 1;
						Pelota_y_S_menos_uno <= Pelota_Y_S;
						
						--JUGADOR
						 X_J1_S <= unsigned(X_J1);
						 X_J1_iz <= X_J1_S - 1;
						 X_J1_dec <= X_J1_S + 1;
						
				elsif (pr_state = state6) then 
						Pelota_X_S <= Pelota_X_S - 1;
						pelota_X_S_menos_uno <= Pelota_X_S;
						
						Pelota_Y_S <= Pelota_Y_S - 1;
						pelota_y_S_menos_uno <= Pelota_Y_S;
						
						--JUGADOR
						 X_J1_S <= unsigned(X_J1)+1;
						 X_J1_iz <= X_J1_S - 1;
						 X_J1_dec <= X_J1_S + 1;
						
				elsif (pr_state = start) then 
						
						Pelota_X_S <= "100";
						Pelota_Y_S <= "1000";
				elsif (pr_state = goal) then 
						Pelota_X_S <= "100";
						Pelota_Y_S <= "1000";
				end if;
				
		END IF;	
			
		END IF;
		
		Pelota_X <= STD_LOGIC_VECTOR(Pelota_X_S);
		Pelota_Y <= STD_LOGIC_VECTOR(Pelota_Y_S);
		
	END PROCESS;
	
--------------Conbinational section: -----------

	PROCESS	( pr_state, ready_timer,Pelota_X_S,Pelota_Y_S )
	BEGIN
		
		CASE pr_state IS
			WHEN start =>
				
				
				IF ( start_btn = '1') THEN	
					nx_state <= state1;
				ELSE
					nx_state <= start;
				END IF;
				
			WHEN state1 =>
			
				--Goal
				IF( (Pelota_Y_S) = "1111") THEN	
					nx_state <= goal;
					GOALJ1 <='1';
					
				--pared arriba
				ELSIF ( Pelota_X_S = "001" ) THEN	
					nx_state <= state3;
				
				--borde izquierdo
				ELSIF( Pelota_X_S = X_J2_iz AND (Pelota_Y_S) = "1110" ) THEN	
					nx_state <= state4;
				
				--borde derecho
				ELSIF(	Pelota_X_S = X_J2_dec AND (Pelota_Y_S) = "1110"  ) THEN	
					nx_state <= state6;
					
				--centro
				ELSIF((Pelota_X_S = X_J2_S AND (Pelota_Y_S) = "1110") ) THEN	
					nx_state <= state5;
					
						
				ELSE
					nx_state <= state1;
				END IF;
				
				
				
	
			WHEN state2 =>
				
				--Goal
				IF( (Pelota_Y_S) = "1111") THEN	
					nx_state <= goal;	
					GOALJ1 <='1';
					
				--borde izquierdo
				ELSIF( (	Pelota_X_S = X_J2_iz AND (Pelota_Y_S) = "1110") ) THEN	
					nx_state <= state4;
				
				--borde derecho
				ELSIF( (	Pelota_X_S = X_J2_dec AND (Pelota_Y_S) = "1110")  ) THEN	
					nx_state <= state6;
					
				--centro
				ELSIF(( Pelota_X_S = X_J2_S AND (Pelota_Y_S) = "1110") ) THEN	
					nx_state <= state5;
					
				
				ELSE
					nx_state <= state2;
				END IF;
				
			WHEN state3 =>
			
			
			
			--pared abajo
				IF (Pelota_X_S = "110" ) THEN	
					nx_state <= state1;
				
				--borde izquierdo
				ELSIF( (	Pelota_X_S = X_J2_iz AND (Pelota_Y_S) = 14) ) THEN	
					nx_state <= state4;
				
				--borde derecho
				ELSIF( ( Pelota_X_S = X_J2_dec AND (Pelota_Y_S) = 14)  ) THEN	
					nx_state <= state6;
					
				--centro
				ELSIF( ( Pelota_X_S = X_J2_S AND (Pelota_Y_S) = 14) ) THEN	
					nx_state <= state5;
				
				--Goal
				ELSIF((Pelota_Y_S) = "1111") THEN	
					nx_state <= goal;
					GOALJ1 <='1';
					

				ELSE
					nx_state <= state3;
				END IF;
				
			WHEN state4 =>
									
				--Goal
				IF( (Pelota_Y_S) = "0000") THEN	
					nx_state <= goal;
					GOALJ2 <='1';
					
			--pared abajo
				ELSIF ( Pelota_X_S = "110" ) THEN	
					nx_state <= state6;
				
				--borde izquierdo
				ELSIF( (	Pelota_X_S = X_J1_iz AND (Pelota_Y_S) = "0001") ) THEN	
					nx_state <= state3;
				
				--borde derecho
				ELSIF( (	Pelota_X_S = X_J1_dec AND (Pelota_Y_S) = "0001")  ) THEN	
					nx_state <= state1;
					
				--centro
				ELSIF(( Pelota_X_S = X_J1_S AND (Pelota_Y_S) = "0001") ) THEN	
					nx_state <= state2;

				ELSE
					nx_state <= state4;
				END IF;
				
			WHEN state5 =>
				
				--Goal
				IF( (Pelota_Y_S) = "0000") THEN	
					nx_state <= goal;
					GOALJ2 <='1';
					
				--borde izquierdo
				ELSIF( (	Pelota_X_S = X_J1_iz AND (Pelota_Y_S) = 1) ) THEN	
					nx_state 	<= state1;
				
				--borde derecho
				ELSIF( (	Pelota_X_S = X_J1_dec AND (Pelota_Y_S) = 1)  ) THEN	
					nx_state <= state3;
					
				--centro
				ELSIF( (Pelota_X_S = X_J1_S AND (Pelota_Y_S) = 1) ) THEN	
					nx_state <= state2;	
					
				ELSE
					nx_state <= state5;
				END IF;
				
			WHEN state6 =>
			--Goal
				IF( (Pelota_Y_S) = "0000") THEN	
					nx_state <= goal;
					GOALJ2 <='1';
					
			--pared arriba
				ELSIF ( Pelota_X_S = "001" ) THEN	
					nx_state <= state4;
				
				--borde izquierdo
				ELSIF( (	Pelota_X_S = X_J1_iz AND (Pelota_Y_S) = "0001") ) THEN	
					nx_state <= state3;
				
				--borde derecho
				ELSIF( (	Pelota_X_S = X_J1_dec AND (Pelota_Y_S) = "0001")  ) THEN	
					nx_state <= state1;
					
				--centro
				ELSIF( ( Pelota_X_S = X_J1_S AND (Pelota_Y_S) = "0001") ) THEN	
					nx_state <= state2;
					
				
					
				ELSE
					nx_state <= state6;
				END IF;
				
			WHEN goal =>
				
				if (GOALJ1 = '1') THEN
					GOALJ1 <='0';
				END IF;
				
				if (GOALJ2 = '1') THEN
					GOALJ2 <='0';
				END IF;
				
				IF start_btn = '1' THEN
					nx_state <= start;
					
--			
				ELSE
					nx_state <= goal;
				END IF;
		END CASE;
		
		GOAlj1P <= GOALJ1;
		GOALJ2P <= GOALJ2;
	END PROCESS;
	
	

	
END ARCHITECTURE;