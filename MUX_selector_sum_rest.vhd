LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY MUX_selector_sum_rest IS
PORT(
    btn_der,  btn_iz 	: IN  STD_LOGIC;
	-- Y							: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
   up               		:OUT STD_LOGIC
--	 clk               		:OUT STD_LOGIC
);
END ENTITY MUX_selector_sum_rest;

ARCHITECTURE functional OF MUX_selector_sum_rest IS
	SIGNAL aux: STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN

	aux  <= "10" WHEN btn_der = '0' AND btn_iz = '1'  ELSE
			"11" WHEN btn_der = '1' AND btn_iz = '0' ELSE
			"01" WHEN btn_der = '0' AND btn_iz = '0' ELSE
			"00" WHEN btn_der = '1' AND btn_iz = '1';
			
	up <= '0' WHEN aux = "11" ELSE
			'1' WHEN aux = "10" ;
--			
--			
--	 clk <= '1' WHEN btn_der = '1' OR btn_iz = '1' ELSE
--			'0' WHEN btn_iz = '0' AND btn_der = '0';
--			
			
--	PROCESS	( btn_der, btn_iz)
--	BEGIN
--		IF (btn_der = '1' AND btn_iz = '0') THEN	
--			up <= '1';
--			clk<= '1';
--			
--		ELSIF (btn_der = '0' AND btn_iz = '1') THEN 
--			up <= '0';
--			clk<= '1';
--			
--		ELSIF (btn_der = '1' AND btn_iz = '1') THEN 
--			up <= '0';
--			clk<= '0';
--		ELSIF (btn_der = '0' AND btn_iz = '0') THEN 
--			up <= '0';
--			clk<= '0';
--			
--		END IF;
--		
--		
--	END PROCESS;
	 
	 
	 
END ARCHITECTURE functional;