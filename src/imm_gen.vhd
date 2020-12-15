LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY imm_gen IS
PORT(
		instr: IN STD_LOGIC_VECTOR(31 downto 0);
		imm: OUT STD_LOGIC_VECTOR(31 downto 0)
);
END imm_gen;

ARCHITECTURE beh of imm_gen IS

SIGNAL opcode: STD_LOGIC_VECTOR(6 downto 0);
SIGNAL funct3: STD_LOGIC_VECTOR(2 downto 0);

BEGIN
	
	opcode <= instr(6 downto 0);
	funct3 <= instr(14 downto 12); --for OP-IMM
	
	PROCESS(opcode, funct3)
	BEGIN
	
	CASE opcode IS
		-- OP-IMM
		WHEN "0010011" =>	-- SRAI
							IF(funct3 = "101") THEN 
								imm <= "000000000000000000000000000" & instr(24 downto 20);
							-- ADDI, ANDI
							ELSE
								imm <= instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) &
									instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) &
									instr(31) & instr(31) & instr(31) & instr(31) & instr(31 downto 20);
							END if;
		-- LUI
		WHEN "0110111" => imm <= instr(31 downto 12) & "000000000000";
		-- AUIPC
		WHEN "0010111" => imm <= instr(31 downto 12) & "000000000000";
		-- BRANCH BEQ
		WHEN "1100011" => imm <= instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) &
								instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) &
								instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(7) & instr(30 downto 25) & instr(11 downto 8); 
		-- LOAD LW
		WHEN "0000011" => imm <= instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) &
								instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) &
								instr(31) & instr(31) & instr(31) & instr(31) & instr(31 downto 20);
		-- STORE SW
		WHEN "0100011" => imm <= instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) &
								instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) &
								instr(31) & instr(31) & instr(31) & instr(31) & instr(31 downto 25) & instr(11 downto 7);
		-- JAL
		WHEN "1101111" => imm <= instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(31) &
								instr(31) & instr(31) & instr(31) & instr(31) & instr(31) & instr(18 downto 11) & instr(19) & instr(30 downto 21);
								
		WHEN OTHERS => imm <= (OTHERS => '0');				
								
	END CASE;
	END PROCESS;
	
END beh;
								