LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control IS
PORT (
	OPCODE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	
	ALU_SRC1, SEL_MUX_JAL_AUIPC,REG_WRITE, BRANCH ,SEL_MUX_ADD_SUM  : OUT STD_LOGIC;
	MEM_TO_REG : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); --"FINAL MUX",
	ALU_OP     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)


);
END control;


ARCHITECTURE BEH OF control IS

CTRL_GEN : PROCESS(OPCODE)

           BEGIN
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
					ALU_OP <= "00"; --ALWAYS ON ADD OPERATION


					 CASE(OPCODE) is

					 	WHEN "0110111"  =>       --LUI
							MEM_TO_REG <= "10";


						WHEN "0010111"  =>       --ALUIPC
							SEL_MUX_ADD_SUM <= '1';
							MEM_TO_REG <= "11";
							SEL_MUX_JAL_AUIPC <= '1';


						WHEN "1101111"  =>       --JAL
							MEM_TO_REG <= "11";

						WHEN "1100011"  =>       --BEQ
						  ALU_OP <= "01";
							BRANCH <= '1';



						WHEN "0000011"  =>       --LW
							REG_WRITE <= '1';
							MEM_READ  <= '1';
							MEM_TO_REG <= "00";


						WHEN"0100011"  =>       --SW
							MEM_WRITE <= '1';

						WHEN "0010011"  =>       --ADDI, ANDI, SRAI
             MEM_TO_REG <= "01";
						 ALU_SRC1 <= '1'; -- ATTENZIONE!!
             ALU_OP <= "11";



						WHEN "0110011"  =>         --ADD, XOR, SLT
            MEM_TO_REG <= "01";
            ALU_OP <= "10";




					 	WHEN OTHERS =>            --DEFAULT

					 END CASE;


END BEH;
