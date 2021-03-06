---------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ensc350_package is

	constant daddr_size : positive := 16;
	constant iaddr_size : positive := 12;
	constant instr_size : positive := 32;
	constant data_size  : positive := 32;
	constant rf_addr_size : positive := 4;
	
   type alu_commands    is (alu_add, alu_addu, alu_sub, alu_subu, alu_slt, alu_sltu,
	                        alu_and, alu_or, alu_xor,alu_nor,alu_sll,alu_srl,alu_sra,alu_lui);
   type mul_commands    is (mul_nop, mul_mul);
   type mem_commands    is (mem_nop, mem_lw, mem_sw);
   type pc_commands     is (pc_carryon,pc_beq,pc_bneq,pc_jump);
   type operand_select  is (operand_rs2,operand_immed);
   type wb_select       is (wb_alu,wb_shift,wb_mul,wb_mem,wb_jal);
   
	------------------------------------------------------					  
	-- Instruction set for the ensc350 Processor
	-- Instruction Format: RRI Instructions (32 bit)
	-- |op   | Rd  | Rs1 | Immediate | 
	-- |8 bit|4 bit|4 bit|    16 bit  |
	-- Instruction Format: RRR Instructions (32 bits)
	-- |op   | Rd  | Rs1 | Rs2 | x"000" | 
	-- |8 bit|4 bit|4 bit|4 bit| 12 bit |
    -- 	
	subtype up_instructions     is std_logic_vector(7 downto 0);

	    constant op_nop   : up_instructions := x"00";
		constant op_addi  : up_instructions := x"01";
		constant op_addiu : up_instructions := x"02";
		constant op_andi  : up_instructions := x"03";
		constant op_ori   : up_instructions := x"04";
		constant op_slti  : up_instructions := x"05";
		constant op_lui   : up_instructions := x"06";
		constant op_j     : up_instructions := x"10";
		constant op_beq   : up_instructions := x"11";
		constant op_bneq  : up_instructions := x"12";
		constant op_lw    : up_instructions := x"20";
		constant op_sw    : up_instructions := x"21";
		
		constant op_add : up_instructions := x"40";
		constant op_sub : up_instructions := x"41";
		constant op_and : up_instructions := x"42";
		constant op_or  : up_instructions := x"43";
		constant op_slt : up_instructions := x"44";
		constant op_sll : up_instructions := x"45";
		constant op_srl : up_instructions := x"46";
		constant op_sra : up_instructions := x"47";
		constant op_mul : up_instructions := x"50";
		
end package;
---------------------------------------------------------------------------------------------
