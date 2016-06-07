
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ensc350_package.all;

entity mem_control is
  port ( -- Communication to the processor: Operation to be performed, Data to be stored, data read
         mem_op                : in  mem_commands;
	 addr_base,addr_offset : in  std_logic_vector(data_size-1 downto 0);
         store_data    		   : in  std_logic_vector(data_size-1 downto 0);
         read_data     		   : out std_logic_vector(data_size-1 downto 0);
		 -- Bus control: Output address, Control Signals, Data Out and Data In (Note: Signals with capital letters 
		 -- connect out of the  processor. Note: On-Chip Bus CAN NEVER BE BIDIRECTIONAL, has to be either IN or OUT
         ADDR_OUT      : out std_logic_vector(daddr_size-1 downto 0);
         MR, MW        : out std_logic;
         DATA_IN       : in  std_logic_vector(data_size-1 downto 0);
         DATA_OUT      : out std_logic_vector(data_size-1 downto 0)  );   
end mem_control;

architecture behavioral of mem_control is

signal mem_address : std_logic_vector(daddr_size-1 downto 0);

begin   

	address_adder: mem_address <= std_logic_vector( resize(unsigned(addr_base)+unsigned(addr_offset) , daddr_size ) );
	
	-- The Load Word and Store Word operation are always BASE+offset
	-- lw r1,r2,immed | sw r1,r2,immed 
	-- r1 is the source register for data in the store, the destination in the load
	-- The address is ALWAYS r2+immed
	out_signals_mux : process(mem_op,mem_address,store_data)
	begin
		ADDR_OUT <= (others=>'0');
		MR <= '0'; MW <= '0';
		DATA_OUT <= (others=>'0');
		if mem_op=mem_lw then
			ADDR_OUT <= mem_address;
			MR <= '1';
		elsif mem_op = mem_sw then
			ADDR_OUT <= mem_address;
			MW <= '1';
			DATA_OUT <= store_data;
		end if;
	end process;
	
	in_signal_mux: read_data <= DATA_IN when mem_op = mem_lw else (others=>'0'); 
					
end behavioral;