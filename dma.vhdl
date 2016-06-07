library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ensc350_package.all;


entity DMA is 
generic ( signal_active : std_logic := '0'; size : positive := 32; addr_size : positive := 16);
Port ( -- System Control Signals
	CLK,reset : in Std_logic;
	-- M1 port
	M2_BUSY,M2_MR,M2_MW : out Std_logic;
	M2_NREADY : in Std_logic;
	M2_ADDRBUS : out Std_logic_vector(addr_size-1 downto 0);
	M2_RDATABUS : in Std_logic_vector(size-1 downto 0);
	M2_WDATABUS : out Std_logic_vector(size-1 downto 0);
	-- Slave (Control) port
	S4_BUSY,S4_MR,S4_MW : in Std_logic; 
	S4_NREADY : out Std_logic;
	S4_ADDRBUS : in Std_logic_vector(3 downto 0);
	S4_RDATABUS : out Std_logic_vector(size-1 downto 0);
	S4_WDATABUS : in Std_logic_vector(size-1 downto 0)
); 
end DMA;

architecture beh of DMA is type DMA_State_type is (dma_idle, dma_raddr, dma_rdata, dma_waddr);

constant signal_not_active : std_logic := not signal_active;
constant dma_start : std_logic_vector(size-1 downto 0) := std_logic_vector(to_unsigned(1,size));
signal DMA_State,next_DMA_state : DMA_State_type;
signal command_reg : std_logic_vector(size-1 downto 0);
signal data_reg, count_reg, next_count : std_logic_vector(size-1 downto 0); 
signal rstart_reg, rstep_reg, raddr_reg, next_raddress : std_logic_vector(size-1 downto 0);
signal wstart_reg, wstep_reg, waddr_reg, next_waddress : std_logic_vector(size-1 downto 0);
signal ck_S4_ADDRBUS : std_logic_vector(3 downto 0);

begin
-- Slave Bus Response Logic: 
process(clk, reset) -- Sampling Read address for producing Output when the DMA state is being read
begin
	if reset='0' then 
		ck_S4_ADDRBUS <= (Others=>'1');
	elsif clk'event and clk='1' then
		if S4_MW=signal_active and S4_BUSY=signal_not_active then 
			ck_S4_ADDRBUS<= S4_ADDRBUS; 
		end if;
	end if;
end process;

--fsm
STATE: process(command_reg, DMA_State, data_reg, count_reg, next_count, rstart_reg, rstep_reg, raddr_reg, next_raddress, wstart_reg, wstep_reg, waddr_reg, next_waddress, M2_NREADY )
begin
        M2_WDATABUS <= (Others=>'0');
        --M2_ADDRBUS <= (Others=>'1');
        M2_MR <= signal_not_active;
        M2_MW <= signal_not_active;
        next_count <= count_reg;
        next_raddress <= raddr_reg;
        next_waddress <= waddr_reg;
		  --command_reg<=(Others=>'0');
case dma_state is
	when dma_idle =>	
		if (count_reg /= std_logic_vector(to_unsigned(0,size)) ) then
			next_DMA_state <= dma_raddr;
			next_raddress <= rstart_reg;
			next_waddress <= wstart_reg;
			S4_NREADY <= signal_not_active;		
		else
			next_DMA_state <= dma_idle;
			S4_NREADY <= signal_not_active;
			next_count <= count_reg;
			M2_MW<= signal_not_active; 
			M2_MR <= signal_not_active;
	end if;

	when dma_raddr =>
		S4_NREADY <= signal_active;
		M2_ADDRBUS <= raddr_reg(15 downto 0); 
		M2_MR <=signal_active;
		M2_MW<=signal_not_active;
		if M2_NREADY=signal_active then
			-- The bus is not able to respond (may be taken froma
			-- higher priority master), we need to keep asking for it
			next_DMA_state <= dma_raddr; 
		else
			next_DMA_state <= dma_rdata;
		end if;

	when dma_rdata =>
		S4_NREADY <=signal_active;
		M2_MR <=signal_not_active;
		M2_MW<=signal_not_active;
		if M2_NREADY=signal_active then
		-- The bus is unable to respond,
		-- we need to keep reading data
			next_DMA_state <= dma_rdata; 
		else
			next_DMA_state <= dma_waddr;
		end if;

	when dma_waddr =>
		S4_NREADY <=signal_active;
		M2_ADDRBUS <= waddr_reg(15 downto 0); 
		M2_MW <= signal_active;
		M2_MR<=signal_not_active;
		M2_WDATABUS <= data_reg;
		if M2_NREADY='1' then
			-- The bus is not able to respond,we need to keep writing
			next_DMA_state <= dma_waddr; 
		else if count_reg /= std_logic_vector(to_unsigned(0,size)) then 
			-- DMA Transfer is not over yet
			next_DMA_state <= dma_raddr;
			next_raddress <= std_logic_vector( signed(raddr_reg)+ signed(rstep_reg) );
			next_waddress <= std_logic_vector( signed(waddr_reg)+ signed(wstep_reg) );
			next_count <= std_logic_vector( signed(count_reg) - to_signed(1,size) );
		else
			-- DMA Transfer is OVER!
			next_DMA_state <= dma_idle; 
		end if;
	end if;

	end case;
end process;


S4_RDATABUS <= command_reg when ck_S4_ADDRBUS = "0000" else
-- The following registers are read/write, can be read and written form the slave port
count_reg when ck_S4_ADDRBUS = "0001" else
rstart_reg when ck_S4_ADDRBUS = "0100" else 
rstep_reg when ck_S4_ADDRBUS = "0101" else
wstart_reg when ck_S4_ADDRBUS = "0110" else
wstep_reg when ck_S4_ADDRBUS = "0111" else
-- The following registers are READ-ONLY, can not bewritten by the slave port
raddr_reg when ck_S4_ADDRBUS = "1000" else
waddr_reg when ck_S4_ADDRBUS = "1000" else
(Others=>'0');


DMA_RFile: process(clk, reset)
begin
if reset='0' then
	DMA_State <= dma_idle;
	data_reg <= (others => '0'); command_reg <= (others => '0'); count_reg <= (others => '0'); 
	rstart_reg <= (others => '0'); rstep_reg <= (others => '0'); wstart_reg <= (others => '0');
	wstep_reg <= (others => '0'); raddr_reg <= (others => '0'); waddr_reg <= (others => '0'); 
	--next_count<= (others => '0');
	--next_raddress <= (others => '0');
	--next_waddress <= (others => '0');
elsif clk'event and clk='1' then
	DMA_State <= next_DMA_state; 
	raddr_reg <= next_raddress; waddr_reg <= next_waddress;
	-- Data Register: It can be neither read nor written from the bus, it
	-- is used to pass data from READ to Write. It may eventually become a FIFO
if DMA_State = dma_rdata and M2_NREADY=signal_not_active then
	--command_reg <= (others=>'0');
	data_reg <= M2_RDATABUS; 
elsif DMA_State=dma_waddr then
	count_reg <= next_count; 
elsif DMA_State=dma_idle and S4_MW=signal_active and S4_BUSY=signal_not_active then	
	if S4_ADDRBUS = "0001" then count_reg <= S4_WDATABUS; end if;
	if S4_ADDRBUS = "0100" then rstart_reg <= S4_WDATABUS; end if; 
	if S4_ADDRBUS = "0101" then rstep_reg <= S4_WDATABUS; end if;
	if S4_ADDRBUS = "0110" then wstart_reg <= S4_WDATABUS; end if;
	if S4_ADDRBUS = "0111" then wstep_reg <= S4_WDATABUS; end if;
-- Note: The Address Registers are Read-Only, can only bewritten by DMA increment logic 
	end if;
end if;
end process;

end architecture;