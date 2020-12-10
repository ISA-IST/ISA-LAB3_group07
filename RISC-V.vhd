LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RISC_V IS
PORT( 
  CLK, RST_n : IN std_logic;
  INSTR :   IN std_logic_vector(31 downto 0);
  DM_data :    IN std_logic_vector(31 downto 0);
  PC :      BUFFER std_logic_vector(31 downto 0);
  DM_addr: BUFFER std_logic_vector(31 downto 0);
  WRITE_DATA_OUT : OUT std_logic_vector(31 downto 0);
  MEM_WRITE_OUT, MEM_READ_OUT : OUT std_logic
);
END ENTITY;

ARCHITECTURE beh OF RISC_V IS
COMPONENT alu IS
PORT( DATA_A,DATA_B: IN std_logic_vector(31 downto 0);
      CTRL: IN std_logic_vector(2 downto 0);
      DATA_OUT: BUFFER std_logic_vector(31 downto 0);
      ZERO: OUT std_logic
      );
END COMPONENT;

COMPONENT control IS
PORT (
	OPCODE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	ALU_SRC1, SEL_MUX_JAL_AUIPC, REG_WRITE, MEM_WRITE, MEM_READ, BRANCH ,SEL_MUX_ADD_SUM  : OUT STD_LOGIC;
	MEM_TO_REG : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); --"FINAL MUX",
	ALU_OP     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
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
	imm: OUT STD_LOGIC_VECTOR(31 downto 0)
);
END COMPONENT;

COMPONENT RF_32_64b IS
PORT(
	DATA_IN: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	CLK, WR: IN STD_LOGIC;
	ADDR_RD_1, ADDR_RD_2, ADDR_WR: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	DATA_OUT_1, DATA_OUT_2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT;

COMPONENT regnbit IS
GENERIC ( 
	N : POSITIVE := 2
);
PORT( 
	D    : IN STD_LOGIC_VECTOR(N-1 downto 0);
	CLK, RST_n : IN STD_LOGIC;
	Q    : OUT STD_LOGIC_VECTOR(N-1 downto 0)
);
END COMPONENT;

COMPONENT ff IS
PORT( 
	D, CLK, RST_n: IN STD_LOGIC;
	Q : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT mux_2to1_nbit IS
GENERIC ( 
	N : POSITIVE :=1 
);
PORT(
	I0, I1: IN STD_LOGIC_VECTOR(N-1 downto 0);
	SEL  : IN STD_LOGIC;
	O    : OUT STD_LOGIC_VECTOR(N-1 downto 0)
);
END COMPONENT;

COMPONENT mux_4to1_nbit IS
GENERIC ( 
	N : POSITIVE :=1
);
PORT( 
	I0, I1, I2, I3: IN STD_LOGIC_VECTOR(N-1 downto 0);
	SEL  : IN STD_LOGIC_VECTOR(1 downto 0);
	O    : OUT STD_LOGIC_VECTOR(N-1 downto 0)
);
END COMPONENT;


-- FROM id TO ex
SIGNAL PC_1, NEXT_PC_1 : std_logic_vector(31 downto 0);

-- FROM add+4 TO id
SIGNAL NEXT_PC : std_logic_vector(31 downto 0);


-- FROM MUX_1 TO PC
SIGNAL OUT_MUX_PC : std_logic_vector(31 downto 0);

-- FROM MEM TO MUX_1
SIGNAL JUMP_ADD :std_logic_vector(31 downto 0);
-- FROM WB TO MUX_1
SIGNAL SEL_ADD: std_logic;



-- FROM MUX_FIN TO REG_FILES
SIGNAL WRITE_DATA : std_logic_vector(31 downto 0);

--FROM REG_FILES TO MUX_ALU E ALU E MEM
SIGNAL READ_DATA1, READ_DATA2 : std_logic_vector (31 downto 0);

--FROM IMMED_GEN TO EX
SIGNAL IMM : std_logic_vector (31 downto 0);

--FROM CONTROL TO EX
SIGNAL REG_WRITE, ALU_SRC, SEL_MUX_JAL_AUIPC, MEM_WRITE, MEM_READ, BRANCH , SEL_MUX_ADD_SUM: std_logic;
SIGNAL MEM_TO_REG, ALU_OP :  STD_LOGIC_VECTOR(1 DOWNTO 0);
--SIGNAL ALU_CTRL: std_logic_vector(2 downto 0); ERRORE

-- FROM EX TO alu_control
--SIGNAL ALU_CTRL_1: std_logic_vector(2 downto 0); ERRORE

-- FROM EX TO MUX_ALU
SIGNAL ALU_SRC_1 : std_logic;
-- FROM EX TO MUX_JAL_AUIPC
SIGNAL SEL_MUX_JAL_AUIPC_1 : std_logic;
SIGNAL NEXT_PC_2 : std_logic_vector(31 downto 0);
-- FROM EX TO MEM
SIGNAL  MEM_WRITE_1, MEM_READ_1,REG_WRITE_1, BRANCH_1 : std_logic;
SIGNAL MEM_TO_REG_1: std_logic_vector(1 downto 0);
SIGNAL INSTR_2 : std_logic_vector(4 downto 0);

--FROM ex to MUX_ADD_SUM
SIGNAL SEL_MUX_ADD_SUM_1 : std_logic;
SIGNAL IMM_1 : std_logic_vector (31 downto 0); -- VA ANCHE AL MUX_ALU
SIGNAL IMM_1_SHIFT : std_logic_vector (31 downto 0);
--FROM EX TO ADD_SUM
SIGNAL PC_2 : std_logic_vector(31 downto 0);

-- FROM EX TO alu_control AND MEM
SIGNAL INSTR_1 : std_logic_vector (7 downto 0);
SIGNAL ALU_OP_1 :  STD_LOGIC_VECTOR(1 DOWNTO 0);

--FROM MUX_ADD_SUM TO ADD_SUM
SIGNAL OUT_MUX_ADD_SUM :std_logic_vector(31 downto 0);

--FROM ADD_SUM TO MUX_JAL_AUIPC
SIGNAL OUT_ADD_SUM: std_logic_vector(31 downto 0);

--FROM MUX_JAL_AUIPC TO MEM
SIGNAL OUT_MUX_JAL_AUIPC: std_logic_vector(31 downto 0);

--FROM MUX_ALU TO ALU
SIGNAL DATA_B: std_logic_vector(31 downto 0);

--FROM alu_control TO alu
SIGNAL ALU_CTRL : std_logic_vector (2 downto 0);

--FROM alu TO MEM
SIGNAL OUT_ALU:std_logic_vector(31 downto 0);
SIGNAL ZERO : std_logic;

--FROM MEM TO WB
SIGNAL REG_WRITE_2 : std_logic;
SIGNAL IMM_2, OUT_ADD_SUM_1 : std_logic_vector (31 downto 0);
SIGNAL MEM_TO_REG_2 : std_logic_vector (1 downto 0);

--FROM MEM TO AND_BRANCH
SIGNAL ZERO_1, BRANCH_2: std_logic;

-- FROM WB TO REG_FILES
SIGNAL WRITE_REG : std_logic_vector (4 downto 0);
SIGNAL REG_WRITE_3 : std_logic;

--FROM WB TO MUX_FIN
SIGNAL DM_addr_MUX, IMM_MUX, OUT_ADD_SUM_MUX: std_logic_vector(31 downto 0);
SIGNAL MEM_TO_REG_3:std_logic_vector(1 downto 0);


--FROM MEM TO REG_FILES
SIGNAL INSTR_3 : std_logic_vector(4 downto 0);

--FROM MUX TO REG_FILES
SIGNAL OUT_MUX_FIN :std_logic_vector (31 downto 0);


BEGIN

  MUX_PC : mux_2to1_nbit GENERIC MAP(N => 32) PORT MAP(NEXT_PC, JUMP_ADD, SEL_ADD, OUT_MUX_PC);
  
  NEXT_PC <= std_logic_vector(unsigned(PC) + 4);
  
  PC_REG : regnbit GENERIC MAP(N => 32) PORT MAP(D=> OUT_MUX_PC, CLK => CLK, RST_n => RST_n, Q => PC);

  ID_1 : regnbit GENERIC MAP(N => 32) PORT MAP(D=> PC, CLK => CLK, RST_n => RST_n, Q => PC_1);
  ID_2 : regnbit GENERIC MAP(N => 32) PORT MAP(D=> NEXT_PC, CLK => CLK, RST_n => RST_n, Q => NEXT_PC_1);

  REG_FILES : RF_32_64b PORT MAP (DATA_IN => OUT_MUX_FIN, CLK => CLK, WR => REG_WRITE_3, ADDR_RD_1 => INSTR(19 downto 15), ADDR_RD_2 => INSTR(24 downto 20), ADDR_WR => INSTR_3, DATA_OUT_1 => READ_DATA1, DATA_OUT_2 => READ_DATA2);

  IMMED_GEN : imm_gen PORT MAP (INSTR, IMM);

  CONTR : control PORT MAP (INSTR(6 downto 0), ALU_SRC, SEL_MUX_JAL_AUIPC, REG_WRITE, MEM_WRITE, MEM_READ, BRANCH, SEL_MUX_ADD_SUM, MEM_TO_REG);

  --EX_1 : regnbit GENERIC MAP (N => 3) PORT MAP( ALU_CTRL , CLK , RST_n , ALU_CTRL_1 );

  EX_2 : ff PORT MAP( ALU_SRC, CLK, RST_n, ALU_SRC_1 );
  EX_3 : ff PORT MAP( SEL_MUX_JAL_AUIPC, CLK, RST_n, SEL_MUX_JAL_AUIPC_1 );
  EX_4 : ff PORT MAP( REG_WRITE, CLK, RST_n, REG_WRITE_1 );
  EX_5 : ff PORT MAP( MEM_WRITE, CLK, RST_n, MEM_WRITE_1 );
  EX_6 : ff PORT MAP( MEM_READ, CLK, RST_n, MEM_READ_1 );
  EX_7 : ff PORT MAP( BRANCH, CLK, RST_n, BRANCH_1 );
  EX_8 : ff PORT MAP( SEL_MUX_ADD_SUM, CLK, RST_n, SEL_MUX_ADD_SUM_1 );

  EX_9 : regnbit GENERIC MAP (N => 2) PORT MAP( MEM_TO_REG, CLK, RST_n, MEM_TO_REG_1 );
  EX_1 : regnbit GENERIC MAP (N => 2) PORT MAP( ALU_OP, CLK, RST_n, ALU_OP_1 );

  EX_10 : regnbit GENERIC MAP (N => 32) PORT MAP( IMM, CLK, RST_n, IMM_1 );
  EX_11 : regnbit GENERIC MAP (N => 8) PORT MAP( INSTR(14 downto 7) , CLK , RST_n , INSTR_1 );

  EX_12 :regnbit GENERIC MAP (N => 32) PORT MAP( PC_1, CLK, RST_n, PC_2);
  EX_13 :regnbit GENERIC MAP (N => 32) PORT MAP( NEXT_PC_1, CLK, RST_n, NEXT_PC_2 );



  IMM_1_SHIFT <= IMM_1(30 downto 0) & '0';
  MUX_ADD_SUM : mux_2to1_nbit GENERIC MAP (N => 32) PORT MAP (IMM_1_SHIFT, IMM_1, SEL_MUX_ADD_SUM_1, OUT_MUX_ADD_SUM );

  --ADD_SUM
  OUT_ADD_SUM <= std_logic_vector(unsigned(OUT_MUX_ADD_SUM) + unsigned(PC_2));
  
  MUX_ALU : mux_2to1_nbit GENERIC MAP (N => 32) PORT MAP (READ_DATA2, IMM_1, ALU_SRC_1, DATA_B);

  MUX_JAL_AUIPC: mux_2to1_nbit GENERIC MAP(N => 32) PORT MAP(NEXT_PC_2, OUT_ADD_SUM, SEL_MUX_JAL_AUIPC_1, OUT_MUX_JAL_AUIPC);

  ctrl_alu: alu_control PORT MAP(INSTR_1(7 downto 5), ALU_OP_1, ALU_CTRL);

  ALU_unit: alu PORT MAP (READ_DATA1, DATA_B, ALU_CTRL, OUT_ALU, ZERO);

  MEM_1 : ff PORT MAP( REG_WRITE_1 , CLK , RST_n , REG_WRITE_2 );
  MEM_2 : ff PORT MAP( MEM_WRITE_1 , CLK , RST_n , MEM_WRITE_OUT );
  MEM_3 : ff PORT MAP( BRANCH_1, CLK , RST_n , BRANCH_2 );
  MEM_4 : ff PORT MAP( MEM_READ_1, CLK , RST_n , MEM_READ_OUT );

  MEM_5 : ff PORT MAP( ZERO, CLK , RST_n , ZERO_1 );
  MEM_6 : regnbit GENERIC MAP (N => 32) PORT MAP( OUT_ALU, CLK , RST_n , DM_addr );
  MEM_7 : regnbit GENERIC MAP (N => 32) PORT MAP ( READ_DATA2, CLK, RST_n, WRITE_DATA_OUT);
  MEM_8 : regnbit GENERIC MAP (N => 5) PORT MAP( INSTR_1(4 downto 0), CLK, RST_n, INSTR_2 );
  MEM_9 : regnbit GENERIC MAP (N => 32) PORT MAP ( IMM_1, CLK, RST_n, IMM_2);
  MEM_10 : regnbit GENERIC MAP (N => 32) PORT MAP ( OUT_ADD_SUM, CLK, RST_n, OUT_ADD_SUM_1);
  MEM_11 : regnbit GENERIC MAP (N => 2) PORT MAP( MEM_TO_REG_1 , CLK , RST_n , MEM_TO_REG_2 );
  
  --AND_BRANCH
  SEL_ADD <= ZERO_1 AND BRANCH_2;

  WB_1 : ff PORT MAP( REG_WRITE_2, CLK, RST_n, REG_WRITE_3 );
  WB_2 : regnbit GENERIC MAP (N => 32) PORT MAP( DM_addr, CLK, RST_n, DM_addr_MUX);-- USCITA ALU
  WB_3 : regnbit GENERIC MAP (N => 32) PORT MAP( IMM_2, CLK, RST_n, IMM_MUX);-- IMMEDIATE
  WB_4 : regnbit GENERIC MAP (N => 5) PORT MAP( INSTR_2, CLK, RST_n, INSTR_3);
  WB_5 : regnbit GENERIC MAP (N => 32) PORT MAP( OUT_ADD_SUM_1, CLK, RST_n, OUT_ADD_SUM_MUX);-- OUT_ADD_SUM
  WB_6: regnbit GENERIC MAP (N => 2) PORT MAP( MEM_TO_REG_2 , CLK , RST_n , MEM_TO_REG_3 );

  MUX_FIN: mux_4to1_nbit GENERIC MAP (N => 32) PORT MAP( DM_data, DM_addr_MUX, IMM_MUX, OUT_ADD_SUM_MUX, MEM_TO_REG_3, OUT_MUX_FIN);

END ARCHITECTURE;
