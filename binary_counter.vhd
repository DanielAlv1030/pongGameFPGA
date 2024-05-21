LIBRARY IEEE;
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
-----------------------------------------------
ENTITY binary_counter IS
GENERIC ( 	N		:INTEGER	:= 14;--14
				MAX	: INTEGER := 7999);--12499
			
PORT(	clk			: IN STD_LOGIC;
		rst			: IN STD_LOGIC;
		ena			: IN STD_LOGIC;
		syn_clr 		: IN STD_LOGIC;
		max_tick		: OUT STD_LOGIC;
		count			: OUT STD_LOGIC_VECTOR(N-1 downto 0));
END ENTITY;
-----------------------------------------------
ARCHITECTURE rtl OF binary_counter IS
	SIGNAL count_s : INTEGER RANGE 0 to ( 2**N - 1);
	
BEGIN


PROCESS (clk, rst, syn_clr)

	   VARIABLE temp : INTEGER RANGE 0 to ( 2**N - 1);
	 BEGIN
		IF (rst='1') THEN
		temp := 0;
	ELSIF (rising_edge(clk)) THEN 
		
		
		IF(ena='1') THEN 
			IF(temp = MAX) THEN	temp := 0;
			ElSE	temp := temp + 1;
			END IF;
		END IF;
		
		IF(syn_clr='1') THEN
			temp := 0;
		END IF;
		 
END IF;
--------------------------------------------
count <= STD_LOGIC_VECTOR(to_unsigned(temp,N));
count_s <= temp;

END PROCESS;
-- OUTPUT LOGIC
max_tick <= '1' when (count_s) = MAX  ELSE '0';

END ARCHITECTURE;
