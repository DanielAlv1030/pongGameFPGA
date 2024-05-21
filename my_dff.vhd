LIBRARY IEEE;
USE ieee.std_logic_1164.all;
----------------------------
ENTITY my_dff IS
	PORT(	clk	: IN STD_LOGIC	:= '0';
			rst	: IN STD_LOGIC	:= '0';
			ena	: IN STD_LOGIC := '1';
			prn	: IN STD_LOGIC := '0';
			d		: IN std_logic_vector(15 DOWNTO 0);
			q		: OUT std_logic_vector(15 DOWNTO 0));
			
END my_dff;
------------------------------
ARCHITECTURE rtl OF my_dff IS
BEGIN

	dff: PROCESS(clk,rst,d)
	BEGIN
		IF (rst = '1') THEN
			IF (prn = '0')THEN
				q <= "1111111111111111";
			ELSE
				q <= "0000000000000000";
			END IF;
		ELSIF (rising_edge(clk)) THEN
			IF (ena = '1') THEN
				q <= d;
			END IF;
		END IF;
	END PROCESS;
	
						
END ARCHITECTURE;