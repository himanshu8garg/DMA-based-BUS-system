library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_arith.all;

entity Rfile is
  generic( size      : positive := 32;
           addr_size : positive := 5 );  
  port(  clk,resetn   : in  Std_logic;
         ra,rb        : in  Std_logic_vector(addr_size-1 downto 0);
         a_out,b_out  : out Std_logic_vector(size-1 downto 0);
         rd1          : in  Std_logic_vector(addr_size-1 downto 0);
         d1_in        : in  Std_logic_vector(size-1 downto 0) ); 
end Rfile;


architecture behavioral of Rfile is 
  -- Used for the Register file data structure
  type rf_bus_array is array (2**addr_size-1 downto 0) of Std_logic_vector(size-1 downto 0);

  signal reg_in,reg_out : rf_bus_array;
  
begin

  -- Note: on most RISC architectures -NOT ARM!- Register 0 is grounded
  reg_out(0) <= (others => '0');

  REGS: for i in 1 to (2**addr_size-1) generate
	process(clk,resetn)
	begin
			if resetn='0' then
			   reg_out(i) <= (others=>'0');
			else 
				if clk'event and clk='1' then
					reg_out(i) <= reg_in(i);
				end if;
			end if;                  		
	end process;
  end generate REGS;
  
  -- Reg_file Reads
  READ_A_MUX: a_out <= reg_out(Conv_Integer(unsigned(ra)));
  READ_B_MUX: b_out <= reg_out(Conv_Integer(unsigned(rb)));
       		 
  -- Reg_file writes. 
  WRITE_D_MUX: for i in 1 to (2**addr_size-1) generate
	process(rd1,d1_in,reg_out)            
	begin      
        if i = Conv_Integer(unsigned(rd1)) then
            reg_in(i) <= d1_in;            
        else
            reg_in(i) <= reg_out(i);
        end if;
	end process;
  end generate WRITE_D_MUX;
	
end behavioral;