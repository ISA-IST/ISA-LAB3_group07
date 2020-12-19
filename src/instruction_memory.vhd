LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY instruction_memory IS
PORT(
		CLK: IN STD_LOGIC;
		ADDR: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		DATA_OUT: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END instruction_memory;

ARCHITECTURE structure OF instruction_memory IS

type MEM_TYP IS ARRAY(4194300 TO 4194513) OF STD_LOGIC_VECTOR(7 DOWNTO 0); --LARGER MEMORY TO STORE THE NOP
SIGNAL IM: MEM_TYP;
SIGNAL DATA_OUT_s: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
IM(4194304) <= "00010011";
IM(4194305) <= "00001000";
IM(4194306) <= "01110000";
IM(4194307) <= "00000000";
IM(4194308) <= "00010111";
IM(4194309) <= "00000010";
IM(4194310) <= "11000001";
IM(4194311) <= "00001111";
IM(4194312) <= "00010011";
IM(4194313) <= "00000000";
IM(4194314) <= "00000000";
IM(4194315) <= "00000000";
IM(4194316) <= "00010011";
IM(4194317) <= "00000000";
IM(4194318) <= "00000000";
IM(4194319) <= "00000000";
IM(4194320) <= "00010011";
IM(4194321) <= "00000000";
IM(4194322) <= "00000000";
IM(4194323) <= "00000000";
IM(4194324) <= "00010011";
IM(4194325) <= "00000010";
IM(4194326) <= "11000010";
IM(4194327) <= "11111111";
IM(4194328) <= "10010111";
IM(4194329) <= "00100010";
IM(4194330) <= "11000010";
IM(4194331) <= "00001111";
IM(4194332) <= "00010011";
IM(4194333) <= "00000000";
IM(4194334) <= "00000000";
IM(4194335) <= "00000000";
IM(4194336) <= "00010011";
IM(4194337) <= "00000000";
IM(4194338) <= "00000000";
IM(4194339) <= "00000000";
IM(4194340) <= "00010011";
IM(4194341) <= "00000000";
IM(4194342) <= "00000000";
IM(4194343) <= "00000000";
IM(4194344) <= "10010011";
IM(4194345) <= "10000010";
IM(4194346) <= "00000010";
IM(4194347) <= "00000001";
IM(4194348) <= "10110111";
IM(4194349) <= "10000110";
IM(4194350) <= "00000000";
IM(4194351) <= "01000000";
IM(4194352) <= "00010011";
IM(4194353) <= "00000000";
IM(4194354) <= "00000000";
IM(4194355) <= "00000000";
IM(4194356) <= "00010011";
IM(4194357) <= "00000000";
IM(4194358) <= "00000000";
IM(4194359) <= "00000000";
IM(4194360) <= "00010011";
IM(4194361) <= "00000000";
IM(4194362) <= "00000000";
IM(4194363) <= "00000000";
IM(4194364) <= "10010011";
IM(4194365) <= "10000110";
IM(4194366) <= "11110110";
IM(4194367) <= "11111111";
IM(4194368) <= "01100011";
IM(4194369) <= "00001110";
IM(4194370) <= "00001000";
IM(4194371) <= "00000110";
IM(4194372) <= "00000011";
IM(4194373) <= "00100100";
IM(4194374) <= "00000010";
IM(4194375) <= "00000000";
IM(4194376) <= "00010011";
IM(4194377) <= "00000000";
IM(4194378) <= "00000000";
IM(4194379) <= "00000000";
IM(4194380) <= "00010011";
IM(4194381) <= "00000000";
IM(4194382) <= "00000000";
IM(4194383) <= "00000000";
IM(4194384) <= "00010011";
IM(4194385) <= "00000000";
IM(4194386) <= "00000000";
IM(4194387) <= "00000000";
IM(4194388) <= "10010011";
IM(4194389) <= "01010100";
IM(4194390) <= "11110100";
IM(4194391) <= "01000001";
IM(4194392) <= "00010011";
IM(4194393) <= "00000000";
IM(4194394) <= "00000000";
IM(4194395) <= "00000000";
IM(4194396) <= "00010011";
IM(4194397) <= "00000000";
IM(4194398) <= "00000000";
IM(4194399) <= "00000000";
IM(4194400) <= "00010011";
IM(4194401) <= "00000000";
IM(4194402) <= "00000000";
IM(4194403) <= "00000000";
IM(4194404) <= "00110011";
IM(4194405) <= "01000101";
IM(4194406) <= "10010100";
IM(4194407) <= "00000000";
IM(4194408) <= "10010011";
IM(4194409) <= "11110100";
IM(4194410) <= "00010100";
IM(4194411) <= "00000000";
IM(4194412) <= "00010011";
IM(4194413) <= "00000000";
IM(4194414) <= "00000000";
IM(4194415) <= "00000000";
IM(4194416) <= "00010011";
IM(4194417) <= "00000000";
IM(4194418) <= "00000000";
IM(4194419) <= "00000000";
IM(4194420) <= "00010011";
IM(4194421) <= "00000000";
IM(4194422) <= "00000000";
IM(4194423) <= "00000000";
IM(4194424) <= "00110011";
IM(4194425) <= "00000101";
IM(4194426) <= "10010101";
IM(4194427) <= "00000000";
IM(4194428) <= "00010011";
IM(4194429) <= "00000010";
IM(4194430) <= "01000010";
IM(4194431) <= "00000000";
IM(4194432) <= "00010011";
IM(4194433) <= "00001000";
IM(4194434) <= "11111000";
IM(4194435) <= "11111111";
IM(4194436) <= "00010011";
IM(4194437) <= "00000000";
IM(4194438) <= "00000000";
IM(4194439) <= "00000000";
IM(4194440) <= "10110011";
IM(4194441) <= "00100101";
IM(4194442) <= "11010101";
IM(4194443) <= "00000000";
IM(4194444) <= "00010011";
IM(4194445) <= "00000000";
IM(4194446) <= "00000000";
IM(4194447) <= "00000000";
IM(4194448) <= "00010011";
IM(4194449) <= "00000000";
IM(4194450) <= "00000000";
IM(4194451) <= "00000000";
IM(4194452) <= "00010011";
IM(4194453) <= "00000000";
IM(4194454) <= "00000000";
IM(4194455) <= "00000000";
IM(4194456) <= "11100011";
IM(4194457) <= "10000100";
IM(4194458) <= "00000101";
IM(4194459) <= "11111010";
IM(4194460) <= "00010011";
IM(4194461) <= "00000000";
IM(4194462) <= "00000000";
IM(4194463) <= "00000000";
IM(4194464) <= "00010011";
IM(4194465) <= "00000000";
IM(4194466) <= "00000000";
IM(4194467) <= "00000000";
IM(4194468) <= "00010011";
IM(4194469) <= "00000000";
IM(4194470) <= "00000000";
IM(4194471) <= "00000000";
IM(4194472) <= "10110011";
IM(4194473) <= "00000110";
IM(4194474) <= "00000101";
IM(4194475) <= "00000000";
IM(4194476) <= "11101111";
IM(4194477) <= "11110000";
IM(4194478) <= "01011111";
IM(4194479) <= "11111001";
IM(4194480) <= "00010011";
IM(4194481) <= "00000000";
IM(4194482) <= "00000000";
IM(4194483) <= "00000000";
IM(4194484) <= "00010011";
IM(4194485) <= "00000000";
IM(4194486) <= "00000000";
IM(4194487) <= "00000000";
IM(4194488) <= "00010011";
IM(4194489) <= "00000000";
IM(4194490) <= "00000000";
IM(4194491) <= "00000000";
IM(4194492) <= "00100011";
IM(4194493) <= "10100000";
IM(4194494) <= "11010010";
IM(4194495) <= "00000000";
IM(4194496) <= "11101111";
IM(4194497) <= "00000000";
IM(4194498) <= "00000000";
IM(4194499) <= "00000000";
IM(4194500) <= "00010011";
IM(4194501) <= "00000000";
IM(4194502) <= "00000000";
IM(4194503) <= "00000000";

PROCESS(CLK)
BEGIN

	IF(CLK'EVENT AND CLK = '1') THEN
		IF (TO_INTEGER(UNSIGNED(ADDR))>4194513 OR TO_INTEGER(UNSIGNED(ADDR))<4194300) THEN
			DATA_OUT_s <= (OTHERS =>'0');

		ELSE
			DATA_OUT_s <= IM(TO_INTEGER(UNSIGNED(ADDR)+3)) & IM(TO_INTEGER(UNSIGNED(ADDR)+2)) & IM(TO_INTEGER(UNSIGNED(ADDR)+1))
							& IM(TO_INTEGER(UNSIGNED(ADDR))); --LSBytefirst
		END IF;
	   
		DATA_OUT <= DATA_OUT_s;


	END IF;

END PROCESS;

END structure;
