LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY alu_control IS
PORT (
  FUNC3  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
  ALU_OP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ALU_CTRL : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END alu_control;

ARCHITECTURE BEH OF alu_control IS

BEGIN


ALU_CTRL_GEN: PROCESS(FUNC3,ALU_OP)
  BEGIN
    CASE( ALU_OP ) IS

      WHEN "00" => -- SW,LW DEFAULT CASE
        ALU_CTRL <= "000";

      WHEN "01" => --BEQ
        ALU_CTRL <= "011"; --SUBTRACT

      WHEN "10" => --ADD,XOR,SLT
        IF (FUNC3 = "000") then --ADD
          ALU_CTRL <= "000";
        ELSIF FUNC3 = "100" then  -- XOR
          ALU_CTRL <= "100";
        END IF;
        IF (FUNC3 = "010") then     --SLT
          ALU_CTRL <= "011"       -- SUBTRACT COMMAND
        END IF;

      WHEN "11" => --ADDI, ANDI, SRAI
        IF (FUNC3 = "000") then --ADDI
          ALU_CTRL <= "000";
        ELSIF (FUNC3 = "111")
          ALU_CTRL <= "001"; --ANDI
        END IF;
        IF (FUNC3 = "101") then --SRAI
          ALU_CTRL <= "010";
        END IF;

      WHEN others =>

    END CASE;


END PROCESS;

END BEH; 
