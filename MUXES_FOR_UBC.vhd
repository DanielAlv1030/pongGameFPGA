LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY MUXES_FOR_UBC IS
PORT(
    change_1,  change_2 	: IN  STD_LOGIC;
    z               			   : OUT STD_LOGIC
);
END ENTITY MUXES_FOR_UBC;

ARCHITECTURE functional OF MUXES_FOR_UBC IS
BEGIN

	  z <= 	'0' WHEN change_2 = '1' OR change_1 = '1' ELSE
				'1';

END ARCHITECTURE functional;