LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RF_32_32b IS
PORT(
		DATA_IN: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		CLK, WR, RST_N: IN STD_LOGIC;
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
	IF (RST_N = '0') THEN
		FOR I IN 0 TO 31 LOOP
			RF(I) <= (OTHERS => '0');
		END LOOP;
			
			ELSIF(CLK'EVENT AND CLK = '1') THEN

				DATA_OUT_1 <= RF(TO_INTEGER(UNSIGNED(ADDR_RD_1)));

				DATA_OUT_2 <= RF(TO_INTEGER(UNSIGNED(ADDR_RD_2)));

				IF(WR = '1') THEN
					RF(TO_INTEGER(UNSIGNED(ADDR_WR))) <= DATA_IN;
					IF(ADDR_WR = ADDR_RD_1) THEN
						DATA_OUT_1 <= DATA_IN;
					END IF;
					IF(ADDR_WR = ADDR_RD_2) THEN
						DATA_OUT_2 <= DATA_IN;
					END IF;
				END IF;
			END IF;

END PROCESS;

END structure;
