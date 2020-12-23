library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_sink is
  port (
    CLK   : in std_logic;
    imm: in STD_LOGIC_VECTOR(31 downto 0)
  );

end data_sink;

architecture beh of data_sink is

begin  -- beh

  process (CLK)
    file res_imm : text open WRITE_MODE is "results.txt";
    variable line_out : line;

  begin  -- process
	if CLK'event and CLK = '1' then  -- rising clock edge

		-- writing results
		write(line_out,imm);
    writeline(res_imm, line_out);
  end if;

  end process;

end beh;
