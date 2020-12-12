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
    CTRL : out std_logic_vector(2 downto 0);
    A,B  : out std_logic_vector(31 downto 0));
end data_maker;

architecture beh of data_maker is

begin  -- beh

  process (CLK)
  file f_op : text open read_mode is "operands.txt";
  file f_ctr : text open read_mode is "controls.txt";


  variable ptr : line;
  variable ptr_ctrl : line;

  variable val : std_logic_vector(31 downto 0);
  variable val_b : std_logic_vector(31 downto 0);
  variable ctrl_v  : std_logic;

 begin  -- process
  if CLK'event and CLK = '1' then  -- rising clock edge
    if (not(endfile(f_op))) then
      readline(f_op, ptr);
      hread(ptr, val);
    end if;

    if (not(endfile(f_op))) then
      readline(f_op, ptr);
      hread(ptr, val_b);
    end if;
    DATA_a <=std_logic_vector(unsigned(455,32));
    DATA_b <=std_logic_vector(unsigned(13,32));

    if (not(endfile(f_ctr))) THEN
      readline(f_ctrl, ptr_ctrl);
      hread(ptr_ctrl, ctrl_v);
    end if;

    ctrl <= ctrl_v;
  end if;
end process;





end beh;
