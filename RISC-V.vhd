LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY RISC_V IS
PORT( CLK,RST_n : IN std_logic;
      INSTR :   IN std_logic_vector(31 downto 0);
      READ_DATA :    IN std_logic_vector(31 downto 0);
      PC :      BUFFER std_logic_vector(63 downto 0);
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

COMPONENT mux_2to1_nbit IS
GENERIC ( N : POSITIVE :=1
);
PORT(
	I0, I1: IN STD_LOGIC_VECTOR(N-1 downto 0);
	SEL  : IN STD_LOGIC_VECTOR;
	O    : OUT STD_LOGIC_VECTOR(N-1 downto 0)
		 );
END COMPONENT;


--SIGNAL FROM id TO ex
SIGNAL PC_1 , NEXT_PC_1 : std_logic_vector(63 downto 0);

--SIGNAL FROM add+4 TO id
SIGNAL NEXT_PC : std_logic_vector(63 downto 0);


--SIGNAL FROM MUX_1 TO PC
SIGNAL ADD : std_logic_vector(63 downto 0);

--SIGNAL FROM MEM TO MUX_1
SIGNAL JUMP_ADD :std_logic_vector(63 downto 0);
--SIGNAL FROM WB TO MUX_1
SIGNAL SEL_ADD:std_logic;

--SIGNAL FROM WB TO REG_FILES
SIGNAL WRITE_REG : std_logic_vector (4 downto 0);
SIGNAL REG_WRITE_3 : std_logic;

--SIGNAL FROM MUX_FIN TO REG_FILES
SIGNAL WRITE_DATA : std_logic_vector(63 downto 0);

--FROM REG_FILES TO EX
SIGNAL READ_DATA1, READ_DATA2 :SIGNAL std_logic_vector (63 downto 0);

--FROM IMMED_GEN TO EX
SIGNAL IMM : std_logic_vector (63 downto 0);

--FROM CONTROL TO EX
SIGNAL REG_WRITE, ALU_SRC,SEL_MUX_JAL_AUIPC,BRANCH,SEL_MUX_ADD_SUM: std_logic;
SIGNAL ALU_CTRL: std_logic_vector(2 downto 0);
SIGNAL MEM_TO_REG : std_logic_vector(1 downto 0);

-- FROM EX TO alu_control
SIGNAL ALU_CTRL_1: std_logic_vector(2 downto 0);
-- FROM EX TO MUX_ALU
SIGNAL ALU_SRC_1 : std_logic;
-- FROM EX TO MUX_JAL_AUIPC
SIGNAL SEL_MUX_JAL_AUIPC_1 : std_logic;
SIGNAL NEXT_PC_2 : std_logic_vector(63 downto 0);
-- FROM EX TO MEM
SIGNAL REG_WRITE_1, BRANCH_1 : std_logic;
SIGNAL MEM_TO_REG_1: std_logic_vector(1 downto 0);

--from ex to MUX_ADD_SUM
SIGNAL SEL_MUX_ADD_SUM_1 : std_logic;
SIGNAL IMM_1 : std_logic_vector (63 downto 0); -- VA ANCHE AL MUX_ALU
SIGNAL IMM_1_SHIFT : std_logic_vector (63 downto 0);
--FROM EX TO ADD_SUM
SIGNAL PC_2 : std_logic_vector(63 downto 0);

-- FROM EX TO alu_control AND MEM
SIGNal INSTR_1 : std_logic_vector (7 downto 0);



BEGIN
  MUX_1 : mux_2to1_nbit GENERIC MAP(N => 64) PORT MAP(NEXT_ADD,JUMP_ADD,SEL_ADD,ADD)
  NEXT_ADD <= std_logic_vector(unsigned(PC) + 4);
  PC_REG : regnbit GENERIC MAP(N => 64) PORT MAP(  D=> ADD , CLK => CLK , RST_n => RST_n , Q => PC);

  ID_1 : regnbit GENERIC MAP(N => 64) PORT MAP(  D=> PC , CLK => CLK , RST_n => RST_n , Q => PC_1);
  ID_2 : regnbit GENERIC MAP(N => 64) PORT MAP(  D=> NEXT_PC , CLK => CLK , RST_n => RST_n , Q => NEXT_PC_1);

  REG_FILES : RF_32_64b PORT MAP (CLK => CLK, WR => REG_WRITE_3, ADDR_RD_1 => INSTR(19 downto 15), ADDR_RD_2 => INSTR(24 downto 20), DATA_OUT_1 => READ_DATA1, DATA_OUT_2 => READ_DATA2 )

  IMMED_GEN : imm_gen PORT MAP (INSTR,IMM);


  CONTR : control PORT MAP (INSTR(6 downto 0), ALU_CTRL, ALU_SRC,SEL_MUX_JAL_AUIPC,REG_WRITE, BRANCH, SEL_MUX_ADD_SUM,MEM_TO_REG);

  EX_1 : regnbit GENERIC MAP (N => 3) PORT MAP( ALU_CTRL , CLK , RST_n , ALU_CTRL_1 );
  EX_2 : regnbit GENERIC MAP (N => 1) PORT MAP( ALU_SRC , CLK , RST_n , ALU_SRC_1 );
  EX_3 : regnbit GENERIC MAP (N => 1) PORT MAP( SEL_MUX_JAL_AUIPC , CLK , RST_n , SEL_MUX_JAL_AUIPC_1 );
  EX_4 : regnbit GENERIC MAP (N => 1) PORT MAP( REG_WRITE , CLK , RST_n , REG_WRITE_1 );
  EX_5 : regnbit GENERIC MAP (N => 1) PORT MAP( BRANCH , CLK , RST_n , BRANCH_1 );
  EX_6 : regnbit GENERIC MAP (N => 1) PORT MAP( SEL_MUX_ADD_SUM , CLK , RST_n , SEL_MUX_ADD_SUM_1 );
  EX_7 : regnbit GENERIC MAP (N => 2) PORT MAP( MEM_TO_REG , CLK , RST_n , MEM_TO_REG_1 );

  EX_8 : regnbit GENERIC MAP (N => 64) PORT MAP( IMM , CLK , RST_n , IMM_1 );
  EX_9 : regnbit GENERIC MAP (N => 8) PORT MAP( INSTR(14 downto 7) , CLK , RST_n , INSTR_1 );

  EX_10 :regnbit GENERIC MAP (N => 63) PORT MAP( PC_1 , CLK , RST_n , PC_2);
  EX_11 :regnbit GENERIC MAP (N => 63) PORT MAP( NEXT_PC_1, CLK , RST_n , NEXT_PC_2 );
