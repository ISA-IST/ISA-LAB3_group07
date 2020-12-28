library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HDU is
  port(
  RS1, RS2 , RD_1: IN std_logic_vector(4 downto 0);
  MEM_READ_1: IN std_logic;
  ENABLE_PC_ID , SEL_MUX_HDU : OUT std_logic
  );
end HDU ;

ARCHITECTURE BEH OF HDU IS
begin

  process(RS_1,RS_2,RD,MEM_READ_1)
    begin
      ENABLE_PC_ID <= '0';
      SEL_MUX_HDU <= '0';
      if(MEM_READ_1 = '1' and RS1 = RD_1 or RS2 = RD_1) then
        ENABLE_PC_ID <= '1';
        SEL_MUX_HDU <= '1';      
      end if;
  end process;

end ARCHITECTURE;
