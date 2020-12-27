library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

entity data_maker is
  port (
    CLK  : in  std_logic;
    instr: OUT STD_LOGIC_VECTOR(31 downto 0));
end data_maker;

architecture beh of data_maker is

begin  -- beh

  process (CLK)
  file instr_txt : text open read_mode is "instr.txt";
  variable ptr : line;
  variable instr_var : std_logic_vector(31 downto 0);


 begin  -- process

   if CLK'event and CLK = '1' then  -- reading instr
     	if (not(endfile(instr_txt))) then
         readline(instr_txt, ptr);
          read(ptr, instr_var);
      end if;
      instr <= instr_var;
   end if;
end process;

end beh;
