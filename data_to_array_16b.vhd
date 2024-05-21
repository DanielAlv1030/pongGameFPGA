LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY data_to_array_16b IS
PORT(
    J1_X,J2_X,Pelota_X,contador	: IN STD_LOGIC_VECTOR( 2 DOWNTO 0);
	 --Pelota_Y: IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
	 Aux_Data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END ENTITY data_to_array_16b;

ARCHITECTURE functional OF data_to_array_16b IS

	CONSTANT zeros : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS =>'0');

BEGIN
	 
	
Aux_Data(15) <= '1' WHEN J1_X = contador OR (unsigned(J1_X) + 1 = unsigned(contador)) OR (unsigned(J1_X) - 1 = unsigned(contador)) ELSE '0';

Aux_Data(0)  <= '1' WHEN J2_X = contador OR (unsigned(J2_X) + 1 = unsigned(contador)) OR (unsigned(J2_X) - 1 = unsigned(contador)) ELSE '0';

--Aux_Data(to_integer(unsigned(Pelota_Y))) <= '1' WHEN Pelota_X = contador ELSE '0';

END ARCHITECTURE functional;