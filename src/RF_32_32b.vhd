LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RF_32_32b IS
PORT( 	
		DATA_IN: IN STD_LOGIC_VECTOR(31 DOWNTO 0);	
		CLK, WR: IN STD_LOGIC;
		ADDR_RD_1, ADDR_RD_2, ADDR_WR: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		DATA_OUT_1, DATA_OUT_2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);		
END RF_32_32b;

ARCHITECTURE structure OF RF_32_32b IS

type MEM_TYP IS ARRAY(0 to 31) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL RF: MEM_TYP;

BEGIN
PROCESS(CLK)
BEGIN

	IF(CLK'EVENT AND CLK = '1') THEN
		IF(WR = '1') THEN
			RF(TO_INTEGER(UNSIGNED(ADDR_WR))) <= DATA_IN;
		END IF;
		
		DATA_OUT_1 <= RF(TO_INTEGER(UNSIGNED(ADDR_RD_1)));
		
		DATA_OUT_2 <= RF(TO_INTEGER(UNSIGNED(ADDR_RD_2)));
				
	END IF;

END PROCESS;

END structure;