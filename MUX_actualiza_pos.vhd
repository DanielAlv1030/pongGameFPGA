LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY MUX_actualiza_pos IS
PORT(
    btn_der,  btn_iz 	: IN  STD_LOGIC;
    Y               			   : OUT STD_LOGIC
);
END ENTITY MUX_actualiza_pos;

ARCHITECTURE functional OF MUX_actualiza_pos IS
BEGIN
	 
	 Y <= '1' WHEN btn_der = '1' OR btn_iz = '1' ELSE
			'0' WHEN btn_iz = '0' AND btn_der = '0';

END ARCHITECTURE functional;