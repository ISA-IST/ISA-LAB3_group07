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
	ALU_SRC1, SEL_MUX_JAL_AUIPC, REG_WRITE, MEM_WRITE, MEM_READ, BRANCH ,SEL_MUX_ADD_SUM  : IN STD_LOGIC;
	MEM_TO_REG : IN STD_LOGIC_VECTOR(1 DOWNTO 0); --"FINAL MUX",
    RES   : in std_logic_vector(31 downto 0);
    ZERO  : in std_logic);

end data_sink;

architecture beh of data_sink is

begin  -- beh

  process (CLK)
    file res_pp : text open WRITE_MODE is "results.txt";
	file res_ctrl : text open WRITE_MODE is "controls_results.txt";


    variable line_out : line;
	variable line_ctrl: line; 
  begin  -- process
	if CLK'event and CLK = '1' then  -- rising clock edge

		-- writing results
        write(line_out, RES, right, 6);
		write(line_out,ZERO,right,6);		
        writeline(res_pp, line_out);
       
        -- writing controls
		write(line_ctrl,ALU_SRC1,right,8);
      write(line_ctrl,SEL_MUX_JAL_AUIPC,right,8);
		write(line_ctrl,REG_WRITE,right,8);
		write(line_ctrl,MEM_WRITE,right,8);
		write(line_ctrl,MEM_READ,right,8);
		write(line_ctrl,BRANCH,right,8);
		write(line_ctrl,SEL_MUX_ADD_SUM,right,8);
		write(line_ctrl,MEM_TO_REG,right,8);
		writeline(res_ctrl,line_ctrl);


   
      

  end if;
  
  end process;

end beh;
