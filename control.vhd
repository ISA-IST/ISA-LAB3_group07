library ieee;
use ieee.std_logic_1164.all;

ENTITY control IS
PORT (
	OPCODE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
  FUNC3  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
  FUNC7  : IN STD_LOGIC_VECTOR(6 DOWNTO 0);

	ALU_CTRL : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	ALU_SRC1 : OUT STD_LOGIC;
	REG_WRITE : OUT STD_LOGIC;
	BRANCH    : OUT STD_LOGIC;
	SEL_MUX_ADD_SUM : OUT STD_LOGIC;
	SEL_MUX_JAL_AUIPC : OUT STD_LOGIC;
	MEM_TO_REG : OUT STD_LOGIC_VECTOR(1 DOWNTO 0) --"FINAL MUX",


);
END control;


ARCHITECTURE BEH OF control IS

CTRL_GEN : PROCESS(OPCODE)

           begin
						 --DEFAULT ASSIGNMENTS
					BRANCH      <= '0';
					MEM_WRITE   <= '0';
					MEM_TO_REG  <= '0';
					REG_WRITE   <= '0';
					MEM_READ    <= '0';
					ALU_SRC1    <= '0'; --TAKE FROM READ2
					ALU_CTRL    <= "000"; -- DEFAULT IS ADD
					ALU_SRC1    <= '0'; --ALWAYS ON READ DATA2
					SEL_MUX_ADD_SUM <= '0'; --ALWAYS ON BEQ
					MEM_TO_REG      <= "00";
					SEL_MUX_JAL_AUIPC <= '0'; --ALWAYS ON JAL


					 case(OPCODE) is

					 	when "0110111"  =>       --LUI
							MEM_TO_REG <= "10";


						when "0010111"  =>       --ALUIPC
							SEL_MUX_ADD_SUM <= '1';
							MEM_TO_REG <= "11";
							SEL_MUX_JAL_AUIPC <= '1';


						when "1101111"  =>       --JAL
							MEM_TO_REG <= "11";

						when "1100011"  =>       --BEQ
							ALU_CTRL <= "011";
							BRANCH <= '1';



						when "0000011"  =>       --LW
							REG_WRITE <= '1';
							MEM_READ  <= '1';
							MEM_TO_REG <= "00";

						when"0100011"  =>       --SW
							MEM_WRITE <= '1';

						when "0010011"  =>       --ADDI, ANDI, SRAI

             MEM_TO_REG <= "01";

							if (FUNC3 = "000") then --ADDI
								ALU_CTRL <= "000";
								ALU_SRC1 <= '1';
							elsif (FUNC3 = "111")
								ALU_CTRL <= "001"; --ANDI
							end if;

							if (FUNC3 = "101") then --SRAI
								ALU_CTRL <= "010";
							end if;


						when "0110011"  =>         --ADD, XOR, SLT

							MEM_TO_REG <= "01";

							if (FUNC3 = "000") then --ADD
								ALU_CTRL <= "000";
							elsif FUNC3 = "100" then  --ADD
								ALU_CTRL <= "100";       -- XOR
							end if;

 							if (FUNC3 = "010") then     --SLT
								ALU_CTRL <= "011"       -- SUBTRACT COMMAND

 							end if;




					 	when others =>            --DEFAULT

					 end case;


END BEH;
