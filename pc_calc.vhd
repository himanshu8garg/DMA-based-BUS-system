library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ensc350_package.all;

entity pc_calc is
  port ( clk,resetn           : in  std_logic;
         pc_op                : in  pc_commands;
		 rs1,rs2              : in  std_logic_vector(data_size-1 downto 0);
		 offset               : in  std_logic_vector(data_size-1 downto 0);
		 IADDR_OUT            : out std_logic_vector(iaddr_size-1 downto 0) );   
end pc_calc;

architecture behavioral of pc_calc is

signal curr_pc,next_pc : std_logic_vector(iaddr_size-1 downto 0);
signal carryon_pc, branch_pc : std_logic_vector(iaddr_size-1 downto 0);
begin 
		
	IADDR_OUT <= next_pc;	
	carryon_adder : carryon_pc <= std_logic_vector( signed(curr_pc) + to_signed(1,iaddr_size) );
	branch_adder  : branch_pc  <= std_logic_vector( signed(curr_pc) + resize(signed(offset),iaddr_size) );
	
	pc_mux : process(rs1,rs2,pc_op,carryon_pc,branch_pc)
	begin
		-- Default value: Go to next instruction in line
		next_pc <= carryon_pc;
		-- Jump operation: go to the value contained in the source register rs1
		if pc_op = pc_jump then
		    next_pc <= std_logic_vector( resize(unsigned(rs1),iaddr_size) );
		-- Branch operations: if condition is met, add immediate offset to pc
		elsif pc_op=pc_beq and rs1=rs2 then
			next_pc <= branch_pc;
		elsif pc_op=pc_bneq and rs1/=rs2 then
			next_pc <= branch_pc;
		end if;
	end process;
	
	-- Sequential process: we need this in order to memorize the old PC value to use it as a base for calculating the next
	pc_register : process(clk, resetn)
	begin
		if resetn='0' then
			curr_pc <= (others=>'1');
		elsif clk'event and clk='1' then
			curr_pc <= next_pc;
	    end if;
	end process;
	
end behavioral;