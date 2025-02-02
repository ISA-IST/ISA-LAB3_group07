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
    FUNCT3 : out std_logic_vector(2 downto 0);
	OPCODE : out std_logic_vector(6 downto 0);
    A,B  : out std_logic_vector(31 downto 0));
end data_maker;

architecture beh of data_maker is

begin  -- beh

  process (CLK)
  file f_op : text open read_mode is "opcode.txt";
  file f_funct3 : text open read_mode is "funct3.txt";


  variable ptr : line;
  variable ptr_ctrl : line;
  variable ptr_funct3 : line;
  
  variable opc : std_logic_vector(6 downto 0);
  variable funct3_v : std_logic_vector(2 downto 0);
 
  variable val : std_logic_vector(31 downto 0);
  variable val_b : std_logic_vector(31 downto 0);
  variable ctrl_v  : std_logic_vector(2 downto 0);

 begin  -- process
  
   if CLK'event and CLK = '1' then  -- reading opcode
   	if (not(endfile(f_op))) then
     readline(f_op, ptr);
      read(ptr, opc);
    end if;

    if (not(endfile(f_funct3))) then -- reading funct3
      readline(f_funct3, ptr_funct3);
      read(ptr_funct3, funct3_v);
    end if;


    A <=std_logic_vector(to_signed(-455,32));
    B <=std_logic_vector(to_unsigned(5,32));
	
	OPCODE <= opc; 
	FUNCT3 <= funct3_v; 

 

 
  end if;
end process;





end beh;
