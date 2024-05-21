LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY data_to_array_16b_total IS
PORT(
    Aux_pelota,Aux_raqueta	: IN STD_LOGIC_VECTOR( 15 DOWNTO 0);
	 total_signal : OUT STD_LOGIC_VECTOR(15 DOWNTO 0):= (OTHERS =>'0')
);
END ENTITY data_to_array_16b_total;

ARCHITECTURE functional OF data_to_array_16b_total IS

BEGIN
	
	
	total_signal(0) <= '1' WHEN Aux_pelota(0)='1' OR Aux_raqueta(0)='1' ELSE '0';
	total_signal(1) <= '1' WHEN Aux_pelota(1)='1' OR Aux_raqueta(1)='1' ELSE '0';
	total_signal(2) <= '1' WHEN Aux_pelota(2)='1' OR Aux_raqueta(2)='1' ELSE '0';
	total_signal(3) <= '1' WHEN Aux_pelota(3)='1' OR Aux_raqueta(3)='1' ELSE '0';
	total_signal(4) <= '1' WHEN Aux_pelota(4)='1' OR Aux_raqueta(4)='1' ELSE '0';
	total_signal(5) <= '1' WHEN Aux_pelota(5)='1' OR Aux_raqueta(5)='1' ELSE '0';
	total_signal(6) <= '1' WHEN Aux_pelota(6)='1' OR Aux_raqueta(6)='1' ELSE '0';
	total_signal(7) <= '1' WHEN Aux_pelota(7)='1' OR Aux_raqueta(7)='1' ELSE '0';
	total_signal(8) <= '1' WHEN Aux_pelota(8)='1' OR Aux_raqueta(8)='1' ELSE '0';
	total_signal(9) <= '1' WHEN Aux_pelota(9)='1' OR Aux_raqueta(9)='1' ELSE '0';
	total_signal(10) <= '1' WHEN Aux_pelota(10)='1' OR Aux_raqueta(10)='1' ELSE '0';
	total_signal(11) <= '1' WHEN Aux_pelota(11)='1' OR Aux_raqueta(11)='1' ELSE '0';
	total_signal(12) <= '1' WHEN Aux_pelota(12)='1' OR Aux_raqueta(12)='1' ELSE '0';
	total_signal(13) <= '1' WHEN Aux_pelota(13)='1' OR Aux_raqueta(13)='1' ELSE '0';
	total_signal(14) <= '1' WHEN Aux_pelota(14)='1' OR Aux_raqueta(14)='1' ELSE '0';
	total_signal(15) <= '1' WHEN Aux_pelota(15)='1' OR Aux_raqueta(15)='1' ELSE '0';
	

END ARCHITECTURE functional;