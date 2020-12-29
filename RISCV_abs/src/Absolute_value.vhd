LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Absolute_value IS
PORT (
  DATA_IN : IN STD_LOGIC_VECTOR (31 downto 0);
  DATA_OUT : OUT STD_LOGIC_VECTOR (31 downto 0);
  ENABLE : IN STD_LOGIC
);
END Absolute_value;

ARCHITECTURE beh OF Absolute_value IS

BEGIN

  process(DATA_IN, ENABLE)
  begin
    if(ENABLE = '1') then
        DATA_OUT <= std_logic_vector(abs(signed(DATA_IN)));
    else
        DATA_OUT <= (OTHERS => '0');
    end if;
 end process;

END ARCHITECTURE;
