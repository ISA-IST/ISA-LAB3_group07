library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity forwarding_unit is
  port(
        RS_1, RS_2 : IN std_logic_vector(31 downto 0);
        EX_MEM_RD, MEM_WB_RD : IN std_logic_vector(31 downto 0);
        REG_WRITE_EX_MEM, REG_WRITE_MEM_WB ; IN std_logic;
        FORW_A1, FORW_A2, FORW_B1, FORW_B2 : OUT std_logic
  );
end forwarding_unit ;


architecture beh of forwarding_unit is


begin
  process
    begin
      FORW_A2 <= '0'; -- CONTROL IS KING
      FORW_B2 <= '0';

    if (RS1 = EX_MEM_RD) then 
      FORW_A1 <= '1';
      FORW_A2 <= '1';
    end if;

    if (RS2 = EX_MEM_RD) then
      FORW_B1 <= '1';
      FORW_B2 <= '1';
    end if;

    if (RS1 = MEM_WB_RD) then
      FORW_A1 <= '0';
      FORW_A2 <= '1';
    end if;

    if (RS2 = MEM_WB_RD) then
      FORW_B1 <= '0';
      FORW_B2 <= '1';
    end if;

end process


end beh;
