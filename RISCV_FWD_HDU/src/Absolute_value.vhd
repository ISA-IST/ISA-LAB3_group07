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

  process(DATA_IN)
  begin
    if (RST_n = '1') then
      if(ENABLE = '1') then
        DATA_OUT <= abs(DATA_IN);
      end if;
    else DATA_OUT <= (OTHERS => '0');
    end if;
  end process;
END ARCHITECTURE;
