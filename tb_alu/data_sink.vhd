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
    RES   : in std_logic_vector(32 downto 0);
    ZERO  : in std_logic)

end data_sink;

architecture beh of data_sink is

begin  -- beh

  process (CLK)
    file res_pp : text open WRITE_MODE is "results.txt";

    variable line_out : line;
  begin  -- process
	if CLK'event and CLK = '1' then  -- rising clock edge

		write(line_out, RES);
		writeline(res_pp, line_out);

    write(line_out,ZERO);
    writeline(res_pp,line_out);


  end if;
  
  end process;

end beh;
