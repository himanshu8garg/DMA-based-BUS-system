
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ensc350_package.all;

entity DecodeOp is
	port( instr                        : in   Std_logic_vector(instr_size-1 downto 0);
          rs1,rs2,rd                   : out  Std_logic_vector(rf_addr_size-1 downto 0);
          pc_op                        : out  pc_commands;
          alu_op                       : out  Alu_commands;
          mul_op                       : out  Mul_commands;
		  mem_op                       : out  Mem_commands;
		  operand_sel                  : out  operand_select; 
          wb_sel                       : out  wb_select;
		  immediate                    : out  Std_logic_vector(data_size-1 downto 0);
          illegal_opcode               : out  Std_logic );
end DecodeOp;

architecture behavioral of DecodeOp is

constant r0       : Std_logic_vector(rf_addr_size-1 downto 0) := (others=>'0');
constant link_reg : Std_logic_vector(rf_addr_size-1 downto 0) := (others=>'1');

begin   

    process(instr)
    -- Operation codes
    variable op	              : Std_logic_vector(7 downto 0);
    variable r0,r1,r2,r3      : Std_logic_vector(rf_addr_size-1 downto 0);
	variable imm_signed, imm_unsigned : Std_logic_vector(data_size-1 downto 0);
	
    begin
	
    -- Operation codes
      op   := instr(31 downto 24); 
      
      -- Addressed Registers:
	  r0  := (others=>'0'); -- R0, default write-back register
      r1  := instr(23 downto 20);  r2  := instr(19 downto 16); r3  := instr(15 downto 12);
          
      -- Immediate operand: 
      imm_signed   := std_logic_vector( resize(signed(instr(15 downto 0)),data_size) );
	  imm_unsigned := std_logic_vector( resize(unsigned(instr(15 downto 0)),data_size) );
	  
	  -- DEFAULT VALUES: It is very useful to specify defaults here, so then we do not need to have 
	  -- closing else in all IF statements: since the process is sequential, this will cover up for all 
	  -- values not assigned in the following, avoiding dangling values on MUXES
	  rd <= r1; rs1 <= r2; rs2 <= r3;
	  alu_op       <= alu_add;
	  pc_op        <= pc_carryon;
	  mem_op       <= mem_nop;
	  mul_op       <= mul_nop;
	  operand_sel  <= operand_rs2; 
      wb_sel       <= wb_alu;
	  immediate    <= (others=>'0');
	  
	  -- Group 1: RRR Operations
    if op = op_add then 
		alu_op     <= alu_add;
	elsif op = op_sub then
		alu_op     <= alu_sub;
	elsif op = op_and then
		alu_op     <= alu_and;
	elsif op = op_or then
		alu_op     <= alu_or;
	elsif op = op_slt then
		alu_op     <= alu_slt;
	elsif op = op_sll then
		alu_op     <= alu_sll;
	elsif op = op_srl then
	    alu_op     <= alu_srl;
	elsif  op = op_sra then
	    alu_op <= alu_sra;
	elsif op = op_mul then
	    mul_op <= mul_mul;
	    wb_sel <= wb_mul;
	elsif op = op_addi then
		alu_op      <= alu_add;
		immediate   <= imm_signed;
		operand_sel <= operand_immed;
	elsif op = op_addiu then 
	    alu_op      <= alu_add;
		immediate   <= imm_unsigned;
		operand_sel <= operand_immed;
	elsif op = op_andi then
		alu_op      <= alu_and;
		immediate   <= imm_unsigned;
		operand_sel <= operand_immed;
	elsif op = op_ori then
		alu_op      <= alu_or;
		immediate   <= imm_unsigned;
		operand_sel <= operand_immed;	
	elsif op = op_slti then
		alu_op      <= alu_slt;
		immediate   <= imm_signed;
		operand_sel <= operand_immed;
	elsif op = op_lui then
	    alu_op      <= alu_lui;
		immediate   <= imm_unsigned;
		operand_sel <= operand_immed;
	-- the instructions sw, beq,bneq have no destination register, but two source registers and one immediate
	-- as a consequence it has a register definition different than the default 	
	elsif op = op_sw then
	    mem_op  <= mem_sw;
		rs1 <= r2; rs2 <= r1; rd <= r0;
		immediate   <= imm_signed;
	elsif op = op_lw then
	    mem_op      <= mem_lw;
		rs1 <= r2; rs2 <= r0;rd <= r1;
		immediate   <= imm_signed;
		wb_sel      <= wb_mem;
	elsif op = op_j then
		pc_op <= pc_jump;
		rs1 <= r1; rs2 <=r0; rd <= r0;
		rd  <= (others=>'0');
	elsif op = op_beq then
		pc_op <= pc_beq;
		rs1 <= r1; rs2 <=r2; rd  <= r0;
		immediate   <= imm_signed;
	elsif op = op_bneq then
		pc_op <= pc_bneq;
		rs1 <= r1; rs2 <=r2; rd  <= r0;
		immediate   <= imm_signed;
	end if;
	
	end process;
	
end behavioral;