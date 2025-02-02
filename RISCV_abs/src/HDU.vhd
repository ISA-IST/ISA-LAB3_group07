library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HDU is
  port(
  RS1_ID, RS2_ID, RD_EX: IN std_logic_vector(4 downto 0);
  DM_READ_EX: IN std_logic;
  OPCODE: IN std_logic_vector(6 downto 0);
  ENABLE_PC_ID, SEL_MUX_HDU : OUT std_logic
  );
end HDU;

ARCHITECTURE BEH OF HDU IS
begin

  process(RS1_ID ,RS2_ID, RD_EX, DM_READ_EX, OPCODE)
    begin
      ENABLE_PC_ID <= '1';
      SEL_MUX_HDU <= '0';
	  
	  IF (OPCODE = "0110011" OR OPCODE = "1100011" OR OPCODE = "0100011") THEN
		  if(DM_READ_EX = '1' and (RS1_ID = RD_EX or RS2_ID = RD_EX)) then
			ENABLE_PC_ID <= '0';
			SEL_MUX_HDU <= '1';      
		  end if;
	  ELSIF (OPCODE = "0010011" OR OPCODE = "0000011" OR OPCODE = "1111111") then 
		  if(DM_READ_EX = '1' and RS1_ID = RD_EX) then
			ENABLE_PC_ID <= '0';
			SEL_MUX_HDU <= '1';      
		  end if;
	  END IF;
  end process;

end ARCHITECTURE;
