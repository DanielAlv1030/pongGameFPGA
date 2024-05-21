LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------
ENTITY my_regDFF IS 
	GENERIC ( MAX_WIDTH 	: INTEGER :=128);
	PORT ( 	clk	:   IN  std_logic;
		rst	:   IN  std_logic;
		ena     :   IN  std_logic;
		d	:   IN  std_logic_vector(MAX_WIDTH-1 DOWNTO 0);
		q	:   OUT std_logic_vector(MAX_WIDTH-1 DOWNTO 0));
END ENTITY;
----------------------------------------------
ARCHITECTURE structural OF my_regDFF is 

BEGIN

--my_reg_gen: FOR i IN 0 TO 7 GENERATE 
--	DFFx: ENTITY work.my_dff
--	PORT MAP( clk	=> clk,
--		  rst	=> rst,
--		  ena   => ena,
--		  d()	=> d(i+15 DOWNTO i),
--		  q	=> q(i));
--END GENERATE;


DFFx0: ENTITY work.my_dff
	PORT MAP( clk	=> clk,
		  rst	=> rst,
		  ena   => ena,
		  prn	=> '0',
		  d	=> d(15 DOWNTO 0),
		  q	=> q(15 DOWNTO 0));

DFFx1: ENTITY work.my_dff
	PORT MAP( clk	=> clk,
		  rst	=> rst,
		  ena   => ena,
		  prn	=> '0',
		  d	=> d(31 DOWNTO 16),
		  q	=> q(31 DOWNTO 16));

DFFx2: ENTITY work.my_dff
	PORT MAP( clk	=> clk,
		  rst	=> rst,
		  ena   => ena,
		  prn	=> '0',
		  d	=> d(47 DOWNTO 32),
		  q	=> q(47 DOWNTO 32));
		  
DFFx3: ENTITY work.my_dff
	PORT MAP( clk	=> clk,
		  rst	=> rst,
		  ena   => ena,
		  prn	=> '0',
		  d	=> d(63 DOWNTO 48),
		  q	=> q(63 DOWNTO 48));
		  
DFFx4: ENTITY work.my_dff
	PORT MAP( clk	=> clk,
		  rst	=> rst,
		  ena   => ena,
		  prn	=> '0',
		  d	=> d(79 DOWNTO 64),
		  q	=> q(79 DOWNTO 64));
		  
DFFx5: ENTITY work.my_dff
	PORT MAP( clk	=> clk,
		  rst	=> rst,
		  ena   => ena,
		  prn	=> '0',
		  d	=> d(95 DOWNTO 80),
		  q	=> q(95 DOWNTO 80));
		  
DFFx6: ENTITY work.my_dff
	PORT MAP( clk	=> clk,
		  rst	=> rst,
		  ena   => ena,
		  prn	=> '0',
		  d	=> d(111 DOWNTO 96),
		  q	=> q(111 DOWNTO 96));
DFFx7: ENTITY work.my_dff
	PORT MAP( clk	=> clk,
		  rst	=> rst,
		  ena   => ena,
		  prn	=> '0',
		  d	=> d(127 DOWNTO 112),
		  q	=> q(127 DOWNTO 112));
END ARCHITECTURE;