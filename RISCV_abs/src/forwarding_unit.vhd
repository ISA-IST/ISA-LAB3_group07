library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity forwarding_unit is
  port(
        RS_1, RS_2 : IN std_logic_vector(4 downto 0);
        RD_EX_MEM, RD_MEM_WB : IN std_logic_vector(4 downto 0); -- destination reg
        REG_WRITE_EX_MEM, REG_WRITE_MEM_WB : IN std_logic;
        FORW_A1, FORW_A2, FORW_B1, FORW_B2 : OUT std_logic
  );
end forwarding_unit ;


architecture beh of forwarding_unit is


begin
  process(REG_WRITE_EX_MEM, REG_WRITE_MEM_WB, RS_2, RS_1, RD_EX_MEM, RD_MEM_WB)
    begin
      FORW_A2 <= '0'; 
      FORW_B2 <= '0';
      FORW_A1 <= '0';
      FORW_B1 <= '0';

  if (REG_WRITE_EX_MEM = '1' and RD_EX_MEM /= "00000") then
    if (RS_1 = RD_EX_MEM) then
      FORW_A1 <= '1';
      FORW_A2 <= '1';
    end if;
    if (RS_2 = RD_EX_MEM) then
      FORW_B1 <= '1';
      FORW_B2 <= '1';
    end if;
  end if ;

 if (REG_WRITE_MEM_WB = '1' and RD_MEM_WB /= "00000") then
    if (RS_1 = RD_MEM_WB) then
      FORW_A1 <= '0';
      FORW_A2 <= '1';
    end if;

    if (RS_2 = RD_MEM_WB) then
      FORW_B1 <= '0';
      FORW_B2 <= '1';
    end if;
  end if;

end process;


end beh;
