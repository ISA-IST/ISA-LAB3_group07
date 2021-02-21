LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control IS
PORT (
	OPCODE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	ALU_SRC1, REG_WRITE, DM_WRITE, DM_READ, BRANCH_cond, BRANCH_uncond, SEL_MUX_ADD_SUM, EN_ABS, SEL_ALU_ABS : OUT STD_LOGIC;
	MEM_TO_REG : OUT STD_LOGIC; --"FINAL MUX",
	ALU_OP     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	SEL_MUX_MEM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
END control;


ARCHITECTURE BEH OF control IS

BEGIN

CTRL_GEN : PROCESS(OPCODE)

           BEGIN
						 --DEFAULT ASSIGNMENTS
					BRANCH_cond     	<= '0';
					BRANCH_uncond 		<= '0';
					DM_WRITE   			<= '0';
					REG_WRITE   		<= '0';
					DM_READ    			<= '0';
					ALU_SRC1    		<= '0'; --TAKE FROM READ2
					SEL_MUX_ADD_SUM 	<= '0'; --ALWAYS ON BEQ
					MEM_TO_REG      	<= '1'; -- COVERS THE JAL, AUIPC, ALU, LUI

					ALU_OP 				<= "00"; --ALWAYS ON ADD OPERATION

					SEL_MUX_MEM 		<= "10"; -- ALWAYS ON SIGNAL COMING FROM ALU
					
					SEL_ALU_ABS			<= '0';
					EN_ABS 				<= '0';

					 CASE(OPCODE) is

					 	WHEN "0110111"  =>       --LUI
							REG_WRITE <= '1';
							SEL_MUX_MEM <= "11";

						WHEN "0010111"  =>       --AUIPC
							SEL_MUX_ADD_SUM <= '1';
							SEL_MUX_MEM <= "01";
							REG_WRITE <= '1';

						WHEN "1101111"  =>       --JAL
							SEL_MUX_MEM <= "00";
							REG_WRITE <= '1';
							BRANCH_uncond <= '1';

						WHEN "1100011"  =>       --BEQ
							ALU_OP <= "01";
							BRANCH_cond <= '1';

						WHEN "0000011"  =>       --LW
							REG_WRITE <= '1';
							DM_READ  <= '1';
							MEM_TO_REG <= '0';
							ALU_SRC1 <= '1';

						WHEN"0100011"  =>       --SW
							DM_WRITE <= '1';
							ALU_SRC1 <= '1';

						WHEN "0010011"  =>       --ADDI, ANDI, SRAI
							SEL_MUX_MEM <= "10";
							ALU_SRC1 <= '1'; 
							ALU_OP <= "11";
							REG_WRITE <= '1'; --(INSERTED LATER)

						WHEN "0110011"  =>         --ADD, XOR, SLT
							SEL_MUX_MEM <= "10";
							ALU_OP <= "10";
							REG_WRITE <= '1';

						WHEN "1111111" =>   -- abs
							SEL_MUX_MEM <= "10";
							REG_WRITE <= '1';
							SEL_ALU_ABS <= '1';
							EN_ABS <= '1';
							
					 	WHEN OTHERS =>            --DEFAULT

					 END CASE;

END PROCESS;
END BEH;
