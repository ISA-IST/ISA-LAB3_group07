LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY RISC_V IS
PORT( CLOCK,RST_n : IN std_logic;
      INSTR :   IN std_logic_vector(31 downto 0);
      READ_DATA :    IN std_logic_vector(31 downto 0);
      PC :      OUT std_logic_vector(63 downto 0);
      ADDRESS, WRITE_DATA : OUT std_logic_vector(31 downto 0)
      );
END ENTITY;

ARCHITECTURE beh OF RISC_V IS
COMPONENT ALU IS
PORT( DATA_A,DATA_B: IN std_logic_vector(63 downto 0);
      CTRL: IN std_logic_vector(2 downto 0);
      DATA_OUT: BUFFER std_logic_vector(63 downto 0);
      ZERO: OUT std_logic
      );
END COMPONENT;

COMPONENT control IS
PORT (
	OPCODE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	ALU_CTRL : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	ALU_SRC1, SEL_MUX_JAL_AUIPC,REG_WRITE, BRANCH ,SEL_MUX_ADD_SUM  : OUT STD_LOGIC;
	MEM_TO_REG : OUT STD_LOGIC_VECTOR(1 DOWNTO 0) --"FINAL MUX",
);
END COMPONENT;

COMPONENT alu_control IS
PORT (
  FUNC3  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
  ALU_OP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ALU_CTRL : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END COMPONENT;

COMPONENT imm_gen IS
PORT(
		instr: IN STD_LOGIC_VECTOR(31 downto 0);
		imm: OUT STD_LOGIC_VECTOR(63 downto 0)
);
END COMPONENT;

COMPONENT RF_32_64b IS
PORT(
		DATA_IN: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		CLOCK, WR: IN STD_LOGIC;
		ADDR_RD_1, ADDR_RD_2, ADDR_WR: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		DATA_OUT_1, DATA_OUT_2: OUT STD_LOGIC_VECTOR(63 DOWNTO 0));

END COMPONENT;

COMPONENT regnbit IS
	GENERIC ( N : POSITIVE := 2
				);
	PORT( D    : IN STD_LOGIC_VECTOR(N-1 downto 0);
		  CLK, RST_n : IN STD_LOGIC;
		  Q    : OUT STD_LOGIC_VECTOR(N-1 downto 0)
		 );
END COMPONENT;
-- SIGNAL FORM id TO rf
SIGNAL READ_REG_1,READ_REG_2 :std_logic_vector (4 downto 0);
-- SIGNAL FROM id TO CONTROL
SIGNAL OPCODE_SGN : std_logic_vector (6 downto 0);
--SIGNAL FROM id TO imm_gen
SIGNAL INSTR_SGN :std_logic_vector(31 downto 0);
--SIGNAL FROM id TO ex
SIGNAL PC_SGN : std_logic_vector(63 downto 0);

BEGIN
  ID : regn_bit GENERIC MAP(N => 96) PORT MAP(  D(95 downto 32) => PC ,  D(31 downto 0) => INSTR , CLK => CLK , RST_n => RST_n , Q(95 downto 32) => PC_SGN,
      Q(31 downto 25) => OPCODE_SGN , Q(26 downto 22) => READ_REG_1, Q(22 downto 18) => READ_REG_2, Q(31 downto 0) => INSTR_SGN);
