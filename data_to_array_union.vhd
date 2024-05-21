LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY data_to_array_union IS
PORT(
   J1_X,J2_X,Pelota_X,contador	: IN STD_LOGIC_VECTOR( 2 DOWNTO 0);
	Pelota_Y: IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
	Data_finall : OUT STD_LOGIC_VECTOR(15 DOWNTO 0):= (OTHERS =>'0')
);
END ENTITY data_to_array_union;

ARCHITECTURE functional OF data_to_array_union IS

	CONSTANT zeros : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS =>'0');
	SIGNAL auxiliar1,auxiliar2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
	
	pelota: ENTITY work.data_to_array_16b_pelota
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					contador => contador,
					pelota_Y => Pelota_Y,
					Aux_Data => auxiliar1
					);
					
					
	raqueta: ENTITY work.data_to_array_16b
	PORT MAP(	J1_X => J1_X,
					J2_X => J2_X,
					Pelota_X => Pelota_X,
					contador => contador,
					Aux_Data => auxiliar2
					);

	union: ENTITY work.data_to_array_16b_total
	PORT MAP(	Aux_pelota => auxiliar1,
					Aux_raqueta => auxiliar2,
					total_signal => Data_finall
					);
					
					
END ARCHITECTURE functional;