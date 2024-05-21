LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY data_to_array_16b_pelota IS
PORT(
    J1_X,J2_X,Pelota_X,contador	: IN STD_LOGIC_VECTOR( 2 DOWNTO 0);
	 Pelota_Y: IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
	 Aux_Data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0):= (OTHERS =>'0')
	 ---previo: IN STD_LOGIC_VECTOR(15 DOWNTO 0):= (OTHERS =>'0');
);
END ENTITY data_to_array_16b_pelota;

ARCHITECTURE functional OF data_to_array_16b_pelota IS

	CONSTANT zeros : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS =>'0');
	SIGNAL auxiliar : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
	

	PROCESS (Pelota_X, contador)
	 BEGIN
		IF (Pelota_X = contador) THEN
		
			IF ( auxiliar = "0000000000000000") THEN
				auxiliar(to_integer(15 - unsigned(Pelota_Y)))<='1';
			ELSE
				auxiliar <= "0000000000000000";
			END IF;	
		ElSE
			auxiliar <= "0000000000000000";
		END IF;
		
--------------------------------------------
Aux_Data <= auxiliar;


END PROCESS;
	
	--Aux_Data <= auxiliar;
--Aux_Data(15) <= '1' WHEN J1_X = contador OR (unsigned(J1_X) + 1 = unsigned(contador)) OR (unsigned(J1_X) - 1 = unsigned(contador)) ELSE '0';
--Aux_Data(0) <= '1' WHEN J2_X = contador OR (unsigned(J2_X) + 1 = unsigned(contador)) OR (unsigned(J2_X) - 1 = unsigned(contador)) ELSE '0';


END ARCHITECTURE functional;