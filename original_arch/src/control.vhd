LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control IS
PORT (
	OPCODE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);

	ALU_SRC1, SEL_MUX_JAL_AUIPC, REG_WRITE, MEM_WRITE, MEM_READ, BRANCH_cond, BRANCH_uncond, SEL_MUX_ADD_SUM  : OUT STD_LOGIC;
	MEM_TO_REG : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); --"FINAL MUX",
	ALU_OP     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)


);
END control;


ARCHITECTURE BEH OF control IS

BEGIN

CTRL_GEN : PROCESS(OPCODE)

           BEGIN
						 --DEFAULT ASSIGNMENTS
					BRANCH_cond     	<= '0';
					BRANCH_uncond 		<= '0';
					MEM_WRITE   			<= '0';
					REG_WRITE   			<= '0';
					MEM_READ    			<= '0';
					ALU_SRC1    			<= '0'; --TAKE FROM READ2
          SEL_MUX_ADD_SUM 	<= '0'; --ALWAYS ON BEQ
					MEM_TO_REG      	<= "00";
					SEL_MUX_JAL_AUIPC <= '0'; --ALWAYS ON JAL
					ALU_OP 						<= "00"; --ALWAYS ON ADD OPERATION


					 CASE(OPCODE) is

					 	WHEN "0110111"  =>       --LUI
							MEM_TO_REG <= "10";
							REG_WRITE <= '1';

						WHEN "0010111"  =>       --ALUIPC
							SEL_MUX_ADD_SUM <= '1';
							MEM_TO_REG <= "11";
							SEL_MUX_JAL_AUIPC <= '1';
							REG_WRITE <= '1';

						WHEN "1101111"  =>       --JAL
							MEM_TO_REG <= "11";
							REG_WRITE <= '1';
							BRANCH_uncond <= '1';

						WHEN "1100011"  =>       --BEQ
							ALU_OP <= "01";
							BRANCH_cond <= '1';
							SEL_MUX_JAL_AUIPC <= '1';


						WHEN "0000011"  =>       --LW
							REG_WRITE <= '1';
							MEM_READ  <= '1';
							MEM_TO_REG <= "00";
							ALU_SRC1 <= '1';

						WHEN"0100011"  =>       --SW
							MEM_WRITE <= '1';
							ALU_SRC1 <= '1';

						WHEN "0010011"  =>       --ADDI, ANDI, SRAI
							MEM_TO_REG <= "01";
							ALU_SRC1 <= '1'; -- ATTENZIONE!!
							ALU_OP <= "11";
							REG_WRITE <= '1'; --(INSERTED LATER)

						WHEN "0110011"  =>         --ADD, XOR, SLT
							MEM_TO_REG <= "01";
							ALU_OP <= "10";
							REG_WRITE <= '1';

					 	WHEN OTHERS =>            --DEFAULT

					 END CASE;

END PROCESS;
END BEH;
