LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY data_memory IS
PORT(
		CLK, RST_n: IN STD_LOGIC;
		MEM_READ, MEM_WRITE: IN STD_LOGIC;
		ADDR: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		WRITE_DATA: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		DATA_OUT: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END data_memory;

ARCHITECTURE structure OF data_memory IS

type MEM_TYP IS ARRAY(268500992-32 to 268501020+32) OF STD_LOGIC_VECTOR(7 DOWNTO 0); -- pay attention to the size 2**32-1 gives ovf
SIGNAL DM: MEM_TYP;


BEGIN

PROCESS(CLK, RST_n)
VARIABLE DATA_OUT_s: STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN

	IF (RST_n = '0') THEN
		--inizialization of the data_memory
		--DM(268500992) <= "00001010";
--		DM(268500993) <= "00000000";
--		DM(268500994) <= "00000000";
--		DM(268500995) <= "00000000";
--		DM(268500996) <= "11010001";
--		DM(268500997) <= "11111111";
--		DM(268500998) <= "11111111";
--		DM(268500999) <= "11111111";
--		DM(268501000) <= "00010110";
--		DM(268501001) <= "00000000";
--		DM(268501002) <= "00000000";
--		DM(268501003) <= "00000000";
--		DM(268501004) <= "11111101";
--		DM(268501005) <= "11111111";
--		DM(268501006) <= "11111111";
--		DM(268501007) <= "11111111";
--		DM(268501008) <= "00001111";
--		DM(268501009) <= "00000000";
--		DM(268501010) <= "00000000";
--		DM(268501011) <= "00000000";
--		DM(268501012) <= "00011011";
--		DM(268501013) <= "00000000";
--		DM(268501014) <= "00000000";
--		DM(268501015) <= "00000000";
--		DM(268501016) <= "11111100";
--		DM(268501017) <= "11111111";
--		DM(268501018) <= "11111111";
--		DM(268501019) <= "11111111";

		DM(268500992) <= "10011010";
		DM(268500993) <= "00000010";
		DM(268500994) <= "00000000";
		DM(268500995) <= "00000000";
		DM(268500996) <= "10010101";
		DM(268500997) <= "11111101";
		DM(268500998) <= "11111111";
		DM(268500999) <= "11111111";
		DM(268501000) <= "11101000";
		DM(268501001) <= "00000011";
		DM(268501002) <= "00000000";
		DM(268501003) <= "00000000";
		DM(268501004) <= "11101010";
		DM(268501005) <= "11111111";
		DM(268501006) <= "11111111";
		DM(268501007) <= "11111111";
		DM(268501008) <= "00001111";
		DM(268501009) <= "00000000";
		DM(268501010) <= "00000000";
		DM(268501011) <= "00000000";
		DM(268501012) <= "11100000";
		DM(268501013) <= "00000000";
		DM(268501014) <= "00000000";
		DM(268501015) <= "00000000";
		DM(268501016) <= "00000111";
		DM(268501017) <= "00000000";
		DM(268501018) <= "00000000";
		DM(268501019) <= "00000000";








		ELSIF(CLK'EVENT AND CLK = '1') THEN

			IF (TO_INTEGER(UNSIGNED(ADDR))>268500992-32 AND TO_INTEGER(UNSIGNED(ADDR))<268501023+32) THEN

				IF (MEM_READ = '1') THEN
					DATA_OUT_s := DM(TO_INTEGER(UNSIGNED(ADDR))+3) & DM(TO_INTEGER(UNSIGNED(ADDR))+2) & DM(TO_INTEGER(UNSIGNED(ADDR))+1)
										& DM(TO_INTEGER(UNSIGNED(ADDR))); --LSBytefirst, NEL SENSO CHE SCRIVO LA MEMORIA PARTENDO DAL LSB



				ELSIF (MEM_WRITE = '1') THEN
					DM(TO_INTEGER(UNSIGNED(ADDR))) <= WRITE_DATA(7 DOWNTO 0);
					DM(TO_INTEGER(UNSIGNED(ADDR)+1)) <= WRITE_DATA(15 DOWNTO 8);
					DM(TO_INTEGER(UNSIGNED(ADDR)+2)) <= WRITE_DATA(23 DOWNTO 16);
					DM(TO_INTEGER(UNSIGNED(ADDR)+3)) <= WRITE_DATA(31 DOWNTO 24);

		        END IF;
			END IF;

			DATA_OUT <= DATA_OUT_s;
		END IF;
END PROCESS;

END structure;
