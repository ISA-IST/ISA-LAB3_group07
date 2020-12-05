LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY RISK_V IS
PORT( CLK,RST : IN std_logic;
      INSTR :   IN std_logic_vector(31 downto 0);
      DATA :    IN std_logic_vector(31 downto 0);
      PC :      OUT std_logic_vector(63 downto 0);
      );
END ENTITY;

ARCHITECTURE beh OF RISK_F IS
COMPONENT 
