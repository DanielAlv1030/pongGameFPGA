LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY matrix_fsm IS
	PORT(	reset			: IN STD_LOGIC;
			clock			: IN STD_LOGIC;
			input_img	: IN STD_LOGIC_VECTOR(127 DOWNTO 0);
			ready_timer : IN STD_LOGIC;
			output_col	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);	
			output_row	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;

ARCHITECTURE states	OF matrix_fsm IS
	TYPE state IS (state0, state1, state2, state3, state4, state5, state6, state7, state8, state9, state10, state11, state12, state13, state14, state15, state16, state17, state18, state19, state20, state21, state22, state23, state24, state25, state26, state27, state28, state29, state30, state31, state32, state33, state34, state35, state36, state37, state38, state39, state40, state41, state42, state43, state44, state45, state46, state47, state48, state49, state50, state51, state52, state53, state54, state55, state56, state57, state58, state59, state60, state61, state62, state63, state64, state65, state66, state67, state68, state69, state70, state71, state72, state73, state74, state75, state76, state77, state78, state79, state80, state81, state82, state83, state84, state85, state86, state87, state88, state89, state90, state91, state92, state93, state94, state95, state96, state97, state98, state99, state100, state101, state102, state103, state104, state105, state106, state107, state108, state109, state110, state111, state112, state113, state114, state115, state116, state117, state118, state119, state120, state121, state122, state123, state124, state125, state126, state127);
	--TYPE state IS (state0, state1, state2);
	SIGNAL pr_state, nx_state: state; 
BEGIN

-------------sequential section --------------
	PROCESS	(reset,clock)
	BEGIN
		IF (reset='1') THEN
			pr_state <= state0;
		ELSIF (rising_edge(clock)) THEN 
			pr_state <= nx_state;
		END IF;
	END PROCESS;
	
--------------Conbinational section: -----------

	PROCESS	( pr_state, ready_timer, input_img)
	BEGIN
		CASE pr_state IS
			WHEN state0 =>
				--output_col	<= input_img(0)& "000000000000000";
				--output_row	<= "01111111";
				IF (input_img(0) = '1') THEN
					output_col	<= "1000000000000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state1;
				else
					nx_state <= state0;
				END IF;
				
			WHEN state1 =>
				--output_col	<= '0'&input_img(1)&"00000000000000";
				--output_row	<= "01111111";
				IF (input_img(1) = '1') THEN
					output_col	<= "0100000000000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state2;
				else
					nx_state <= state1;
				END IF;
			WHEN state2 =>
				--output_col	<= "00"&input_img(2)&"0000000000000";
				--output_row	<= "01111111";
			  IF (input_img(2) = '1') THEN
					output_col	<= "0010000000000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state3;
					--nx_state <= state0;
				else
					nx_state <= state2;
				END IF;
			----------------------------------------------
			WHEN state3 =>	
			  IF (input_img(3) = '1') THEN
					output_col	<= "0001000000000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state4;
				else
					nx_state <= state3;
				END IF;
			----------------------------------------------
			WHEN state4 =>	
			  IF (input_img(4) = '1') THEN
					output_col	<= "0000100000000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state5;
				else
					nx_state <= state4;
				END IF;
			WHEN state5 =>	
			  IF (input_img(5) = '1') THEN
					output_col	<= "0000010000000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state6;
				else
					nx_state <= state5;
				END IF;
			WHEN state6 =>	
			  IF (input_img(6) = '1') THEN
					output_col	<= "0000001000000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state7;
					else
					nx_state <= state6;
				END IF;
			WHEN state7 =>	
			  IF (input_img(7) = '1') THEN
					output_col	<= "0000000100000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state8;
					else
					nx_state <= state7;
				END IF;
			WHEN state8 =>	
			  IF (input_img(8) = '1') THEN
					output_col	<= "0000000010000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state9;
					else
					nx_state <= state8;
				END IF;
			WHEN state9 =>	
			  IF (input_img(9) = '1') THEN
					output_col	<= "0000000001000000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state10;
					else
					nx_state <= state9;
				END IF;
			WHEN state10 =>	
			  IF (input_img(10) = '1') THEN
					output_col	<= "0000000000100000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state11;
					else
					nx_state <= state10;
				END IF;
			WHEN state11 =>	
			  IF (input_img(11) = '1') THEN
					output_col	<= "0000000000010000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state12;
					else
					nx_state <= state11;
				END IF;
			WHEN state12 =>	
			  IF (input_img(12) = '1') THEN
					output_col	<= "0000000000001000";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state13;
					else
					nx_state <= state12;
				END IF;
			WHEN state13 =>	
			  IF (input_img(13) = '1') THEN
					output_col	<= "0000000000000100";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state14;
				else
					nx_state <= state13;
				END IF;
			WHEN state14 =>	
			  IF (input_img(14) = '1') THEN
					output_col	<= "0000000000000010";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state15;
				else
					nx_state <= state14;
				END IF;
			WHEN state15 =>	
			  IF (input_img(15) = '1') THEN
					output_col	<= "0000000000000001";
					output_row	<= "01111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state16;
				else
					nx_state <= state15;
				END IF;
				
				
			WHEN state16 =>	
			  IF (input_img(16) = '1') THEN
					output_col	<= "1000000000000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state17;
				else
					nx_state <= state16;
				END IF;
			WHEN state17 =>	
			  IF (input_img(17) = '1') THEN
					output_col	<= "0100000000000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state18;
				else
					nx_state <= state17;
				END IF;
			WHEN state18 =>	
			  IF (input_img(18) = '1') THEN
					output_col	<= "0010000000000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state19;
				else
					nx_state <= state18;
				END IF;
			WHEN state19 =>	
			  IF (input_img(19) = '1') THEN
					output_col	<= "0001000000000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state20;
				else
					nx_state <= state19;
				END IF;
			WHEN state20 =>	
			  IF (input_img(20) = '1') THEN
					output_col	<= "0000100000000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state21;
				else
					nx_state <= state20;
				END IF;
			WHEN state21 =>	
			  IF (input_img(21) = '1') THEN
					output_col	<= "0000010000000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state22;
				else
					nx_state <= state21;
				END IF;
			WHEN state22 =>	
			  IF (input_img(22) = '1') THEN
					output_col	<= "0000001000000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state23;
				else
					nx_state <= state22;
				END IF;
			WHEN state23 =>	
			  IF (input_img(23) = '1') THEN
					output_col	<= "0000000100000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state24;
				else
					nx_state <= state23;
				END IF;
			WHEN state24 =>	
			  IF (input_img(24) = '1') THEN
					output_col	<= "0000000010000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state25;
				else
					nx_state <= state24;
				END IF;
			WHEN state25 =>	
			  IF (input_img(25) = '1') THEN
					output_col	<= "0000000001000000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state26;
				else
					nx_state <= state25;
				END IF;
			WHEN state26 =>	
			  IF (input_img(26) = '1') THEN
					output_col	<= "0000000000100000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state27;
				else
					nx_state <= state26;
				END IF;
			WHEN state27 =>	
			  IF (input_img(27) = '1') THEN
					output_col	<= "0000000000010000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state28;
				else
					nx_state <= state27;
				END IF;
			WHEN state28 =>	
			  IF (input_img(28) = '1') THEN
					output_col	<= "0000000000001000";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state29;
				else
					nx_state <= state28;
				END IF;
			WHEN state29 =>	
			  IF (input_img(29) = '1') THEN
					output_col	<= "0000000000000100";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state30;
				else
					nx_state <= state29;
				END IF;
			WHEN state30 =>	
			  IF (input_img(30) = '1') THEN
					output_col	<= "0000000000000010";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state31;
				else
					nx_state <= state30;
				END IF;
			WHEN state31 =>	
			  IF (input_img(31) = '1') THEN
					output_col	<= "0000000000000001";
					output_row	<= "10111111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state32;
				else
					nx_state <= state31;
				END IF;
			
			
			WHEN state32 =>	
			  IF (input_img(32) = '1') THEN
					output_col	<= "1000000000000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state33;
				else
					nx_state <= state32;
				END IF;
			WHEN state33 =>	
			  IF (input_img(33) = '1') THEN
					output_col	<= "0100000000000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state34;
				else
					nx_state <= state33;
				END IF;
			WHEN state34 =>	
			  IF (input_img(34) = '1') THEN
					output_col	<= "0010000000000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state35;
				else
					nx_state <= state34;
				END IF;
			WHEN state35 =>	
			  IF (input_img(35) = '1') THEN
					output_col	<= "0001000000000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state36;
				else
					nx_state <= state35;
				END IF;
			WHEN state36 =>	
			  IF (input_img(36) = '1') THEN
					output_col	<= "0000100000000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state37;
				else
					nx_state <= state36;
				END IF;
			WHEN state37 =>	
			  IF (input_img(37) = '1') THEN
					output_col	<= "0000010000000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state38;
				else
					nx_state <= state37;
				END IF;
			WHEN state38 =>	
			  IF (input_img(38) = '1') THEN
					output_col	<= "0000001000000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state39;
				else
					nx_state <= state38;
				END IF;
			WHEN state39 =>	
			  IF (input_img(39) = '1') THEN
					output_col	<= "0000000100000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state40;
				else
					nx_state <= state39;
				END IF;
			WHEN state40 =>	
			  IF (input_img(40) = '1') THEN
					output_col	<= "0000000010000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state41;
				else
					nx_state <= state40;
				END IF;
			WHEN state41 =>	
			  IF (input_img(41) = '1') THEN
					output_col	<= "0000000001000000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state42;
				else
					nx_state <= state41;
				END IF;
			WHEN state42 =>	
			  IF (input_img(42) = '1') THEN
					output_col	<= "0000000000100000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state43;
				else
					nx_state <= state42;
				END IF;
			WHEN state43 =>	
			  IF (input_img(43) = '1') THEN
					output_col	<= "0000000000010000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state44;
				else
					nx_state <= state43;
				END IF;
			WHEN state44 =>	
			  IF (input_img(44) = '1') THEN
					output_col	<= "0000000000001000";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state45;
				else
					nx_state <= state44;
				END IF;
			WHEN state45 =>	
			  IF (input_img(45) = '1') THEN
					output_col	<= "0000000000000100";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state46;
				else
					nx_state <= state45;
				END IF;
			WHEN state46 =>	
			  IF (input_img(46) = '1') THEN
					output_col	<= "0000000000000010";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state47;
				else
					nx_state <= state46;
				END IF;
			WHEN state47 =>	
			  IF (input_img(47) = '1') THEN
					output_col	<= "0000000000000001";
					output_row	<= "11011111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state48;
				else
					nx_state <= state47;
				END IF;
				
				
			WHEN state48 =>	
			  IF (input_img(48) = '1') THEN
					output_col	<= "1000000000000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state49;
				else
					nx_state <= state48;
				END IF;
			WHEN state49 =>	
			  IF (input_img(49) = '1') THEN
					output_col	<= "0100000000000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state50;
				else
					nx_state <= state49;
				END IF;
			WHEN state50 =>	
			  IF (input_img(50) = '1') THEN
					output_col	<= "0010000000000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state51;
				else
					nx_state <= state50;
				END IF;
			WHEN state51 =>	
			  IF (input_img(51) = '1') THEN
					output_col	<= "0001000000000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state52;
				else
					nx_state <= state51;
				END IF;
			WHEN state52 =>	
			  IF (input_img(52) = '1') THEN
					output_col	<= "0000100000000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state53;
				else
					nx_state <= state52;
				END IF;
			WHEN state53 =>	
			  IF (input_img(53) = '1') THEN
					output_col	<= "0000010000000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state54;
				else
					nx_state <= state53;
				END IF;
			WHEN state54 =>	
			  IF (input_img(54) = '1') THEN
					output_col	<= "0000001000000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state55;
				else
					nx_state <= state54;
				END IF;
			WHEN state55 =>	
			  IF (input_img(55) = '1') THEN
					output_col	<= "0000000100000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state56;
				else
					nx_state <= state55;
				END IF;
			WHEN state56 =>	
			  IF (input_img(56) = '1') THEN
					output_col	<= "0000000010000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state57;
				else
					nx_state <= state56;
				END IF;
			WHEN state57 =>	
			  IF (input_img(57) = '1') THEN
					output_col	<= "0000000001000000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state58;
				else
					nx_state <= state57;
				END IF;
			WHEN state58 =>	
			  IF (input_img(58) = '1') THEN
					output_col	<= "0000000000100000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state59;
				else
					nx_state <= state58;
				END IF;
			WHEN state59 =>	
			  IF (input_img(59) = '1') THEN
					output_col	<= "0000000000010000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state60;
				else
					nx_state <= state59;
				END IF;
			WHEN state60 =>	
			  IF (input_img(60) = '1') THEN
					output_col	<= "0000000000001000";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state61;
				else
					nx_state <= state60;
				END IF;
			WHEN state61 =>	
			  IF (input_img(61) = '1') THEN
					output_col	<= "0000000000000100";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state62;
				else
					nx_state <= state61;
				END IF;
			WHEN state62 =>	
			  IF (input_img(62) = '1') THEN
					output_col	<= "0000000000000010";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state63;
				else
					nx_state <= state62;
				END IF;
			WHEN state63 =>	
			  IF (input_img(63) = '1') THEN
					output_col	<= "0000000000000001";
					output_row	<= "11101111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state64;
				else
					nx_state <= state63;
				END IF;
				
				
			WHEN state64 =>	
			  IF (input_img(64) = '1') THEN
					output_col	<= "1000000000000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state65;
				else
					nx_state <= state64;
				END IF;
			WHEN state65 =>	
			  IF (input_img(65) = '1') THEN
					output_col	<= "0100000000000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state66;
				else
					nx_state <= state65;
				END IF;
			WHEN state66 =>	
			  IF (input_img(66) = '1') THEN
					output_col	<= "0010000000000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state67;
				else
					nx_state <= state66;
				END IF;
			WHEN state67 =>	
			  IF (input_img(67) = '1') THEN
					output_col	<= "0001000000000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state68;
				else
					nx_state <= state67;
				END IF;
			WHEN state68 =>	
			  IF (input_img(68) = '1') THEN
					output_col	<= "0000100000000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state69;
				else
					nx_state <= state68;
				END IF;
			WHEN state69 =>	
			  IF (input_img(69) = '1') THEN
					output_col	<= "0000010000000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state70;
				else
					nx_state <= state69;
				END IF;
			WHEN state70 =>	
			  IF (input_img(70) = '1') THEN
					output_col	<= "0000001000000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state71;
				else
					nx_state <= state70; 
				END IF;
			WHEN state71 =>	
			  IF (input_img(71) = '1') THEN
					output_col	<= "0000000100000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state72;
				else
					nx_state <= state71;
				END IF;
			WHEN state72 =>	
			  IF (input_img(72) = '1') THEN
					output_col	<= "0000000010000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state73;
				else
					nx_state <= state72;
				END IF;
			WHEN state73 =>	
			  IF (input_img(73) = '1') THEN
					output_col	<= "0000000001000000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state74;
				else
					nx_state <= state73;
				END IF;
			WHEN state74 =>	
			  IF (input_img(74) = '1') THEN
					output_col	<= "0000000000100000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state75;
				else
					nx_state <= state74;
				END IF;
			WHEN state75 =>	
			  IF (input_img(75) = '1') THEN
					output_col	<= "0000000000010000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state76;
				else
					nx_state <= state75;
				END IF;
			WHEN state76 =>	
			  IF (input_img(76) = '1') THEN
					output_col	<= "0000000000001000";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state77;
				else
					nx_state <= state76;
				END IF;
			WHEN state77 =>	
			  IF (input_img(77) = '1') THEN
					output_col	<= "0000000000000100";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state78;
				else
					nx_state <= state77;
				END IF;
			WHEN state78 =>	
			  IF (input_img(78) = '1') THEN
					output_col	<= "0000000000000010";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state79;
				else
					nx_state <= state78;
				END IF;
			WHEN state79 =>	
			  IF (input_img(79) = '1') THEN
					output_col	<= "0000000000000001";
					output_row	<= "11110111";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state80;
				else
					nx_state <= state79;
				END IF;
				
				
			WHEN state80 =>	
			  IF (input_img(80) = '1') THEN
					output_col	<= "1000000000000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state81;
				else
					nx_state <= state80;
				END IF;
			WHEN state81 =>	
			  IF (input_img(81) = '1') THEN
					output_col	<= "0100000000000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state82;
				else
					nx_state <= state81;
				END IF;
			WHEN state82 =>	
			  IF (input_img(82) = '1') THEN
					output_col	<= "0010000000000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state83;
				else
					nx_state <= state82;
				END IF;
			WHEN state83 =>	
			  IF (input_img(83) = '1') THEN
					output_col	<= "0001000000000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state84;
				else
					nx_state <= state83;
				END IF;
			WHEN state84 =>	
			  IF (input_img(84) = '1') THEN
					output_col	<= "0000100000000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state85;
				else
					nx_state <= state84;
				END IF;
			WHEN state85 =>	
			  IF (input_img(85) = '1') THEN
					output_col	<= "0000010000000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state86;
				else
					nx_state <= state85;
				END IF;
			WHEN state86 =>	
			  IF (input_img(86) = '1') THEN
					output_col	<= "0000001000000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state87;
				else
					nx_state <= state86;
				END IF;
			WHEN state87 =>	
			  IF (input_img(87) = '1') THEN
					output_col	<= "0000000100000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state88;
				else
					nx_state <= state87;
				END IF;
			WHEN state88 =>	
			  IF (input_img(88) = '1') THEN
					output_col	<= "0000000010000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state89;
				else
					nx_state <= state88;
				END IF;
			WHEN state89 =>	
			  IF (input_img(89) = '1') THEN
					output_col	<= "0000000001000000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state90;
				else
					nx_state <= state89;
				END IF;
			WHEN state90 =>	
			  IF (input_img(90) = '1') THEN
					output_col	<= "0000000000100000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state91;
				else
					nx_state <= state90;
				END IF;
			WHEN state91 =>	
			  IF (input_img(91) = '1') THEN
					output_col	<= "0000000000010000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state92;
				else
					nx_state <= state91;
				END IF;
			WHEN state92 =>	
			  IF (input_img(92) = '1') THEN
					output_col	<= "0000000000001000";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state93;
				else
					nx_state <= state92;
				END IF;
			WHEN state93 =>	
			  IF (input_img(93) = '1') THEN
					output_col	<= "0000000000000100";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state94;
				else
					nx_state <= state93;
				END IF;
			WHEN state94 =>	
			  IF (input_img(94) = '1') THEN
					output_col	<= "0000000000000010";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state95;
				else
					nx_state <= state94;
				END IF;
			WHEN state95 =>	
			  IF (input_img(95) = '1') THEN
					output_col	<= "0000000000000001";
					output_row	<= "11111011";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state96;
				else
					nx_state <= state95;
				END IF;
				
				
			WHEN state96 =>	
			  IF (input_img(96) = '1') THEN
					output_col	<= "1000000000000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state97;
				else
					nx_state <= state96;
				END IF;
			WHEN state97 =>	
			  IF (input_img(97) = '1') THEN
					output_col	<= "0100000000000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state98;
				else
					nx_state <= state97;
				END IF;
			WHEN state98 =>	
			  IF (input_img(98) = '1') THEN
					output_col	<= "0010000000000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state99;
				else
					nx_state <= state98;
				END IF;
			WHEN state99 =>	
			  IF (input_img(99) = '1') THEN
					output_col	<= "0001000000000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state100;
				else
					nx_state <= state99;
				END IF;
			WHEN state100 =>	
			  IF (input_img(100) = '1') THEN
					output_col	<= "0000100000000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state101;
				else
					nx_state <= state100;
				END IF;
			WHEN state101 =>	
			  IF (input_img(101) = '1') THEN
					output_col	<= "0000010000000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state102;
				else
					nx_state <= state101;
				END IF;
			WHEN state102 =>	
			  IF (input_img(102) = '1') THEN
					output_col	<= "0000001000000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state103;
				else
					nx_state <= state102;
				END IF;
			WHEN state103 =>	
			  IF (input_img(103) = '1') THEN
					output_col	<= "0000000100000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state104;
				else
					nx_state <= state103;
				END IF;
			WHEN state104 =>	
			  IF (input_img(104) = '1') THEN
					output_col	<= "0000000010000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state105;
				else
					nx_state <= state104;
				END IF;
			WHEN state105 =>	
			  IF (input_img(105) = '1') THEN
					output_col	<= "0000000001000000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state106;
				else
					nx_state <= state105;
				END IF;
			WHEN state106 =>	
			  IF (input_img(106) = '1') THEN
					output_col	<= "0000000000100000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state107;
				else
					nx_state <= state106;
				END IF;
			WHEN state107 =>	
			  IF (input_img(107) = '1') THEN
					output_col	<= "0000000000010000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state108;
				else
					nx_state <= state107;
				END IF;
			WHEN state108 =>	
			  IF (input_img(108) = '1') THEN
					output_col	<= "0000000000001000";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state109;
				else
					nx_state <= state108;
				END IF;
			WHEN state109 =>	
			  IF (input_img(109) = '1') THEN
					output_col	<= "0000000000000100";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state110;
				else
					nx_state <= state109;
				END IF;
			WHEN state110 =>	
			  IF (input_img(110) = '1') THEN
					output_col	<= "0000000000000010";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state111;
				else
					nx_state <= state110;
				END IF;
			WHEN state111 =>	
			  IF (input_img(111) = '1') THEN
					output_col	<= "0000000000000001";
					output_row	<= "11111101";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state112;
				else
					nx_state <= state111;
				END IF;
				
				
			WHEN state112 =>	
			  IF (input_img(112) = '1') THEN
					output_col	<= "1000000000000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state113;
				else
					nx_state <= state112;
				END IF;
			WHEN state113 =>	
			  IF (input_img(113) = '1') THEN
					output_col	<= "0100000000000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state114;
				else
					nx_state <= state113;
				END IF;
			WHEN state114 =>	
			  IF (input_img(114) = '1') THEN
					output_col	<= "0010000000000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state115;
				else
					nx_state <= state114;
				END IF;
			WHEN state115 =>	
			  IF (input_img(115) = '1') THEN
					output_col	<= "0001000000000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state116;
				else
					nx_state <= state115;
				END IF;
			WHEN state116 =>	
			  IF (input_img(116) = '1') THEN
					output_col	<= "0000100000000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state117;
				else
					nx_state <= state116;
				END IF;
			WHEN state117 =>	
			  IF (input_img(117) = '1') THEN
					output_col	<= "0000010000000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state118;
				else
					nx_state <= state117;
				END IF;
			WHEN state118 =>	
			  IF (input_img(118) = '1') THEN
					output_col	<= "0000001000000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state119;
				else
					nx_state <= state118;
				END IF;
			WHEN state119 =>	
			  IF (input_img(119) = '1') THEN
					output_col	<= "0000000100000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state120;
				else
					nx_state <= state119;
				END IF;
			WHEN state120 =>	
			  IF (input_img(120) = '1') THEN
					output_col	<= "0000000010000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state121;
				else
					nx_state <= state120;
				END IF;
			WHEN state121 =>	
			  IF (input_img(121) = '1') THEN
					output_col	<= "0000000001000000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state122;
				else
					nx_state <= state121;
				END IF;
			WHEN state122 =>	
			  IF (input_img(122) = '1') THEN
					output_col	<= "0000000000100000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state123;
				else
					nx_state <= state122;
				END IF;
			WHEN state123 =>	
			  IF (input_img(123) = '1') THEN
					output_col	<= "0000000000010000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state124;
				else
					nx_state <= state123;
				END IF;
			WHEN state124 =>	
			  IF (input_img(124) = '1') THEN
					output_col	<= "0000000000001000";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
				nx_state <= state125;
				else
					nx_state <= state124;
				END IF;
			WHEN state125 =>	
			  IF (input_img(125) = '1') THEN
					output_col	<= "0000000000000100";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state126;
				else
					nx_state <= state125;
				END IF;
			WHEN state126 =>	
			  IF (input_img(126) = '1') THEN
					output_col	<= "0000000000000010";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state127;
				else
					nx_state <= state126;
				END IF;
			WHEN state127 =>	
			  IF (input_img(127) = '1') THEN
					output_col	<= "0000000000000001";
					output_row	<= "11111110";
				ELSE
					output_col	<= "0000000000000000";
					output_row	<= "11111111";
				END IF;
					
				IF (ready_timer = '1') THEN	
					nx_state <= state0;
				else
					nx_state <= state127;
				END IF;
			
		END CASE;
	END PROCESS;
	END ARCHITECTURE;