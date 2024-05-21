library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity univ_bin_counter is 
	generic(	N			:	integer	:= 3);
	port	 (	clk		:	in		std_logic;
				rst		:	in		std_logic;
				ena		:	in		std_logic;
				syn_clr	:	in		std_logic;
				load		:	in		std_logic := '0';
				up			:	in		std_logic := '1';
				d			:	in		std_logic_vector(N-1 downto 0) := (others => '0');
				MAX		:	in		std_logic_vector(N-1 downto 0) := "110";
				MIN		:	in		std_logic_vector(N-1 downto 0) := "001";
				max_tick	:	out	std_logic;
				min_tick	:	out	std_logic;
				counter	:	out	std_logic_vector(N-1 downto 0));
end entity;

architecture rtl of univ_bin_counter is 
	constant zeros				:	unsigned(N-1 downto 0) := (others =>'0');
	signal count_s				:	unsigned(N-1 downto 0);
	signal count_next			:	unsigned(N-1 downto 0);
	signal max_tick_limit	: 	std_logic;
begin	
	count_next <=	(others => '0') when (syn_clr = '1' or (max_tick_limit ='1' and up='1')) else
						unsigned(d)		 when load = '1' else
						count_s + 1		 when (ena = '1' and up = '1') else
						count_s - 1		 when (ena = '1' and up = '0') else
						count_s;
	process(clk,rst)
		variable temp	:	unsigned(N-1 downto 0);
	begin
		if(rst='1') then
			temp :=  (others =>'0');
		elsif (falling_edge(clk)) then 
			if(ena='1') then 
				temp := count_next;
			end if;
		end if;
		counter <= std_logic_vector(temp);
		count_s <= temp;
	end process;
	max_tick_limit <= '1' when count_s = unsigned(MAX)  else '0';
	max_tick <= max_tick_limit;
	min_tick <= '1' when count_s = unsigned(MIN) else '0';
end architecture;