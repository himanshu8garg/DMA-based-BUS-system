library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ensc350_package.all;
  
entity multiplier is
    generic (size : positive := 16);
    port(  in1,in2       : in  std_logic_vector(size-1 downto 0);
           result        : out Std_logic_vector(size-1 downto 0) );
end multiplier;

architecture behavioral of multiplier is

signal mult_out : std_logic_vector(2*size-1 downto 0);
begin
	-- Note: A multiplier is typically very onerous, and requires a lot of logic.
	-- It provides an output that has twice the size of the inputs. 
	-- To keep complexity low, and allow for writing the result on the registers, we simply neglect the higher part of the result.
	-- This makes our logic smaller, BUT if we use inputs too large we will simply lose information on the output
	-- In real-life processors, often the user is also offered the chance of saving the result on 2 different registers to avoid information loss.
	mult_out <= std_logic_vector(signed(in1)*signed(in2));

	result <= mult_out(size-1 downto 0);
	
end behavioral;