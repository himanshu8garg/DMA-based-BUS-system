library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ensc350_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

entity E is
end E;

architecture tb of E is component ensc350_system
port (
		CLOCK_50 : in std_logic;
		KEY : in std_logic_vector(0 downto 0);
		SW : in std_logic_vector(15 downto 0);
		LEDR : out std_logic_vector(15 downto 0);
		LEDG : out std_logic_vector(7 downto 0);
		HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7 : out std_logic_vector(6 downto 0) );
end component;

signal  CLOCK_50_sig : std_logic;
signal	KEY_sig :  Std_logic_vector(0 downto 0); 
signal	SW_sig :  Std_logic_vector(15 downto 0); 
signal	LEDR_sig :  Std_logic_vector(15 downto 0);
signal	LEDG_sig :  Std_logic_vector(7 downto 0); 
signal HEX0_sig,HEX1_sig,HEX2_sig,HEX3_sig,HEX4_sig,HEX5_sig,HEX6_sig,HEX7_sig :  std_logic_vector(6 downto 0);

 
begin 
    uut : ensc350_system port map(CLOCK_50_sig,KEY_sig,SW_sig,LEDR_sig,LEDG_sig,HEX0_sig,HEX1_sig, HEX2_sig, HEX3_sig, HEX4_sig, HEX5_sig, HEX6_sig, HEX7_sig );
process
	begin 
		wait for 10 ns; -- initialize
		KEY_sig<="0";
		wait for 10 ns; 
		KEY_sig<="1";	
		--STORE
		SW_sig<=x"1111";
		wait;
   end process;  

clk_process : process --10ns time period
	begin
	CLOCK_50_sig <= '0';
	wait for 15 ns;
	CLOCK_50_sig <= '1';
	wait for 15 ns;
end process;

end tb;
