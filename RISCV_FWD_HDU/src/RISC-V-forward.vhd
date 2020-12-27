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
	ALU_SRC1, REG_WRITE, MEM_WRITE, MEM_READ, BRANCH_cond, BRANCH_uncond, SEL_MUX_ADD_SUM  : OUT STD_LOGIC;
	MEM_TO_REG : OUT STD_LOGIC; --"FINAL MUX",
	ALU_OP     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	SEL_MUX_MEM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
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

COMPONENT RF_32_32b IS
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


COMPONENT forwarding_unit IS
  PORT(
        RS_1, RS_2 : IN std_logic_vector(4 downto 0);
        RD_EX_MEM, RD_MEM_WB : IN std_logic_vector(4 downto 0);
        REG_WRITE_EX_MEM, REG_WRITE_MEM_WB : IN std_logic;
        FORW_A1, FORW_A2, FORW_B1, FORW_B2 : OUT std_logic
  );
END COMPONENT;


-- FROM id TO ex
SIGNAL PC_1, NEXT_PC_1 : std_logic_vector(31 downto 0);

-- FROM add+4 TO id
SIGNAL NEXT_PC : std_logic_vector(31 downto 0);


-- FROM MUX_1 TO PC
SIGNAL OUT_MUX_PC1, OUT_MUX_PC2 : std_logic_vector(31 downto 0);

SIGNAL FIRST_ADDRESS : std_logic_vector(31 downto 0);

-- FROM MEM TO MUX_1
--SIGNAL JUMP_ADD :std_logic_vector(31 downto 0);
-- FROM WB TO MUX_1
SIGNAL SEL_ADD: std_logic;

-- EXTRA SIGNALS TO FIX Cannot associate port "q" of mode OUT with port "pc" of mode BUFFER.
SIGNAL PC_s: std_logic_vector(31 downto 0);
SIGNAL DM_ADDR_s: std_logic_vector(31 downto 0);


-- FROM MUX_FIN TO REG_FILES
--SIGNAL WRITE_DATA : std_logic_vector(31 downto 0);

--FROM REG_FILES TO MUX_ALU E ALU E MEM
SIGNAL READ_DATA1, READ_DATA2 : std_logic_vector (31 downto 0);

--FROM IMMED_GEN TO EX
SIGNAL IMM : std_logic_vector (31 downto 0);

--FROM CONTROL TO EX
SIGNAL REG_WRITE, ALU_SRC, MEM_WRITE, MEM_READ, BRANCH_cond, BRANCH_uncond, SEL_MUX_ADD_SUM, MEM_TO_REG: std_logic;
SIGNAL ALU_OP,SEL_MUX_MEM :  STD_LOGIC_VECTOR(1 DOWNTO 0);
--SIGNAL ALU_CTRL: std_logic_vector(2 downto 0); ERRORE

-- FROM EX TO alu_control
--SIGNAL ALU_CTRL_1: std_logic_vector(2 downto 0); ERRORE

-- FROM EX TO MUX_ALU
SIGNAL ALU_SRC_1 : std_logic;
-- FROM EX TO MEM
SIGNAL SEL_MUX_MEM_1 : std_logic_vector(1 downto 0);
SIGNAL NEXT_PC_2 : std_logic_vector(31 downto 0);
-- FROM EX TO MEM
SIGNAL MEM_WRITE_1, MEM_READ_1, REG_WRITE_1, BRANCH_cond_1, BRANCH_uncond_1 : std_logic;
SIGNAL MEM_TO_REG_1: std_logic;


--FROM ex to MUX_ADD_SUM
SIGNAL SEL_MUX_ADD_SUM_1 : std_logic;
SIGNAL IMM_1 : std_logic_vector (31 downto 0); -- VA ANCHE AL MUX_ALU
SIGNAL IMM_1_SHIFT : std_logic_vector (31 downto 0);

--FROM EX TO ADD_SUM
SIGNAL PC_2 : std_logic_vector(31 downto 0);

-- FROM EX TO alu_control AND MEM
SIGNAL RD_1 : std_logic_vector (4 downto 0);
SIGNAL funct3: std_logic_vector(2 downto 0);
SIGNAL ALU_OP_1 :  STD_LOGIC_VECTOR(1 DOWNTO 0);

-- from EX to forwarding_unit
SIGNAL RS1 : std_logic_vector (4 downto 0);
SIGNAL RS2 : std_logic_vector (4 downto 0);

--FROM MUX_ADD_SUM TO ADD_SUM
SIGNAL OUT_MUX_ADD_SUM :std_logic_vector(31 downto 0);

--FROM ADD_SUM TO MEM
SIGNAL OUT_ADD_SUM: std_logic_vector(31 downto 0);

--FROM MUX_MEM TO WB
SIGNAL OUT_MUX_MEM: std_logic_vector(31 downto 0);

--FROM FORWARDING_UNIT TO MUX_FORW
SIGNAL SEL_FORW_A1, SEL_FORW_A2, SEL_FORW_B1, SEL_FORW_B2 :STD_LOGIC;

--FROM MUX_ALU TO MUX_FORW4
SIGNAL DATA_B: std_logic_vector(31 downto 0);

--FROM alu_control TO alu
SIGNAL ALU_CTRL : std_logic_vector (2 downto 0);

--FROM alu TO MEM
SIGNAL OUT_ALU:std_logic_vector(31 downto 0);
SIGNAL ZERO : std_logic;

--FROM MEM TO MUX_MEM
SIGNAL SEL_MUX_MEM_2 : std_logic_vector(1 downto 0);
SIGNAL NEXT_PC_3 : std_logic_vector(31 downto 0);
SIGNAL OUT_ADD_SUM_1: std_logic_vector (31 downto 0);

--FROM MEM TO WB
SIGNAL REG_WRITE_2 : std_logic;
SIGNAL IMM_2 : std_logic_vector (31 downto 0);
SIGNAL MEM_TO_REG_2 : std_logic;
SIGNAL RD_2 : std_logic_vector(4 downto 0);
--SIGNAL RS1_2 : std_logic_vector (4 downto 0);
--SIGNAL RS2_2 : std_logic_vector (4 downto 0);

--FROM MEM TO AND_BRANCH (+ OR_BRANCH)
SIGNAL ZERO_1, BRANCH_cond_2, BRANCH_uncond_2: std_logic;

-- FROM WB TO REG_FILES
--SIGNAL WRITE_REG : std_logic_vector (4 downto 0);
SIGNAL REG_WRITE_3 : std_logic;

--FROM WB TO MUX_FIN
SIGNAL OUT_MUX_MEM_1: std_logic_vector(31 downto 0);
SIGNAL MEM_TO_REG_3:std_logic;


--FROM MEM TO REG_FILES
SIGNAL RD_3 : std_logic_vector(4 downto 0);

--FROM MUX TO REG_FILES
SIGNAL OUT_MUX_FIN :std_logic_vector (31 downto 0);

--FROM MUX_FORWa TO MUX_FORWb
SIGNAL OUT_FORW_A1,OUT_FORW_A2,OUT_FORW_B1,OUT_FORW_B2 : std_logic_vector (31 downto 0);

BEGIN

  MUX_PC : mux_2to1_nbit GENERIC MAP(N => 32) PORT MAP(NEXT_PC, OUT_ADD_SUM_1, SEL_ADD, OUT_MUX_PC1);

  FIRST_ADDRESS <="00000000010000000000000000000000";-- 0x00400000;

  MUX_RESET: mux_2to1_nbit GENERIC MAP(N => 32) PORT MAP(FIRST_ADDRESS, OUT_MUX_PC1, RST_n, OUT_MUX_PC2); -- starting mux

  NEXT_PC <= std_logic_vector(unsigned(PC) + 4);

  PC_REG : regnbit GENERIC MAP(N => 32) PORT MAP(D=> OUT_MUX_PC2, CLK => CLK, RST_n => '1', Q => PC_s); -- the PC is never reset

  PC <= PC_s;

  ID_1 : regnbit GENERIC MAP(N => 32) PORT MAP(D=> PC, CLK => CLK, RST_n => RST_n, Q => PC_1);
  ID_2 : regnbit GENERIC MAP(N => 32) PORT MAP(D=> NEXT_PC, CLK => CLK, RST_n => RST_n, Q => NEXT_PC_1);

  REG_FILES : RF_32_32b PORT MAP (DATA_IN => OUT_MUX_FIN, CLK => CLK, WR => REG_WRITE_3, ADDR_RD_1 => INSTR(19 downto 15), ADDR_RD_2 => INSTR(24 downto 20), ADDR_WR => RD_3, DATA_OUT_1 => READ_DATA1, DATA_OUT_2 => READ_DATA2);

  IMMED_GEN : imm_gen PORT MAP (INSTR, IMM);

  CONTR : control PORT MAP (INSTR(6 downto 0), ALU_SRC, REG_WRITE, MEM_WRITE, MEM_READ, BRANCH_cond, BRANCH_uncond, SEL_MUX_ADD_SUM, MEM_TO_REG, ALU_OP, SEL_MUX_MEM);

  --EX_1 : regnbit GENERIC MAP (N => 3) PORT MAP( ALU_CTRL , CLK , RST_n , ALU_CTRL_1 );

  EX_2 : ff PORT MAP( ALU_SRC, CLK, RST_n, ALU_SRC_1 );
  EX_3 : regnbit GENERIC MAP (N => 2) PORT MAP( SEL_MUX_MEM, CLK, RST_n, SEL_MUX_MEM_1 );
  EX_4 : ff PORT MAP( REG_WRITE, CLK, RST_n, REG_WRITE_1 );
  EX_5 : ff PORT MAP( MEM_WRITE, CLK, RST_n, MEM_WRITE_1 );
  EX_6 : ff PORT MAP( MEM_READ, CLK, RST_n, MEM_READ_1 );
  EX_7 : ff PORT MAP( BRANCH_cond, CLK, RST_n, BRANCH_cond_1 );
  EX_8 : ff PORT MAP( BRANCH_uncond, CLK, RST_n, BRANCH_uncond_1 );
  EX_9 : ff PORT MAP( SEL_MUX_ADD_SUM, CLK, RST_n, SEL_MUX_ADD_SUM_1 );

  EX_10 : ff PORT MAP( MEM_TO_REG, CLK, RST_n, MEM_TO_REG_1 );
  EX_1 : regnbit GENERIC MAP (N => 2) PORT MAP( ALU_OP, CLK, RST_n, ALU_OP_1 );

  EX_11 : regnbit GENERIC MAP (N => 32) PORT MAP( IMM, CLK, RST_n, IMM_1 );
  EX_12 : regnbit GENERIC MAP (N => 5) PORT MAP( INSTR(11 downto 7) , CLK , RST_n , RD_1 );
  EX_13 : regnbit GENERIC MAP (N => 3) PORT MAP( INSTR(14 downto 12) , CLK , RST_n , funct3);
  EX_14 : regnbit GENERIC MAP (N => 5) PORT MAP( INSTR(19 downto 15) , CLK , RST_n , RS1 );
  EX_15 : regnbit GENERIC MAP (N => 5) PORT MAP( INSTR(24 downto 20) , CLK , RST_n , RS2 );

  EX_16 :regnbit GENERIC MAP (N => 32) PORT MAP( PC_1, CLK, RST_n, PC_2);
  EX_17 :regnbit GENERIC MAP (N => 32) PORT MAP( NEXT_PC_1, CLK, RST_n, NEXT_PC_2 );



  IMM_1_SHIFT <= IMM_1(30 downto 0) & '0';
  MUX_ADD_SUM : mux_2to1_nbit GENERIC MAP (N => 32) PORT MAP (IMM_1_SHIFT, IMM_1, SEL_MUX_ADD_SUM_1, OUT_MUX_ADD_SUM );

  --ADD_SUM
  OUT_ADD_SUM <= std_logic_vector(unsigned(OUT_MUX_ADD_SUM) + unsigned(PC_2));

  MUX_ALU : mux_2to1_nbit GENERIC MAP (N => 32) PORT MAP (READ_DATA2, IMM_1, ALU_SRC_1, DATA_B);

  -- adding mux for FORWARDING UNIT
  MUX_FORW_A1 : mux_2to1_nbit GENERIC MAP (N => 32) PORT MAP(OUT_MUX_FIN , OUT_MUX_MEM , SEL_FORW_A1 , OUT_FORW_A1 );
  MUX_FORW_B1 : mux_2to1_nbit GENERIC MAP (N => 32) PORT MAP(OUT_MUX_FIN , OUT_MUX_MEM , SEL_FORW_B1 , OUT_FORW_B1 );

  MUX_FORW_A2 : mux_2to1_nbit GENERIC MAP (N => 32) PORT MAP(READ_DATA1 , OUT_FORW_A1 , SEL_FORW_A2 , OUT_FORW_A2 );
  MUX_FORW_B2 : mux_2to1_nbit GENERIC MAP (N => 32) PORT MAP(DATA_B , OUT_FORW_B1 , SEL_FORW_B2 , OUT_FORW_B2 );


  ctrl_alu: alu_control PORT MAP(funct3, ALU_OP_1, ALU_CTRL);

  ALU_unit: alu PORT MAP (OUT_FORW_A2, OUT_FORW_B2, ALU_CTRL, OUT_ALU, ZERO);

  MEM_1 : ff PORT MAP( REG_WRITE_1 , CLK , RST_n , REG_WRITE_2 );
  MEM_2 : ff PORT MAP( MEM_WRITE_1 , CLK , RST_n , MEM_WRITE_OUT );
  MEM_3 : ff PORT MAP( BRANCH_cond_1, CLK , RST_n , BRANCH_cond_2 );
  MEM_4 : ff PORT MAP( BRANCH_uncond_1, CLK , RST_n , BRANCH_uncond_2 );
  MEM_5 : ff PORT MAP( MEM_READ_1, CLK , RST_n , MEM_READ_OUT );

  MEM_6 : ff PORT MAP( ZERO, CLK , RST_n , ZERO_1 );
  MEM_7 : regnbit GENERIC MAP (N => 32) PORT MAP( OUT_ALU, CLK , RST_n , DM_addr_s );

  DM_addr <= DM_addr_s;

  MEM_8 : regnbit GENERIC MAP (N => 32) PORT MAP ( READ_DATA2, CLK, RST_n, WRITE_DATA_OUT);
  MEM_9 : regnbit GENERIC MAP (N => 5) PORT MAP( RD_1, CLK, RST_n, RD_2 );
  MEM_10 : regnbit GENERIC MAP (N => 32) PORT MAP ( IMM_1, CLK, RST_n, IMM_2);
--  MEM_11 : regnbit GENERIC MAP (N => 32) PORT MAP ( OUT_MUX_JAL_AUIPC, CLK, RST_n, OUT_MUX_JAL_AUIPC_1);
  MEM_12 : ff PORT MAP( MEM_TO_REG_1 , CLK , RST_n , MEM_TO_REG_2 );

  MEM_13 : regnbit GENERIC MAP(N => 2) PORT MAP( SEL_MUX_MEM_1, CLK, RST_n, SEL_MUX_MEM_2 );
  MEM_14 : regnbit GENERIC MAP (N => 32) PORT MAP( NEXT_PC_2, CLK, RST_n, NEXT_PC_3 );
  MEM_15 : regnbit GENERIC MAP (N => 32) PORT MAP( OUT_ADD_SUM, CLK, RST_n, OUT_ADD_SUM_1 );

 -- MEM_16 : regnbit GENERIC MAP (N => 5) PORT MAP( RS1_1, CLK, RST_n, RS1_2 );
 -- MEM_17 : regnbit GENERIC MAP (N => 5) PORT MAP( RS2_1, CLK, RST_n, RS2_2 );

  --AND_BRANCH
  SEL_ADD <= (ZERO_1 AND BRANCH_cond_2) OR BRANCH_uncond_2;

  -- MUX MEM
  MUX_MEM: mux_4to1_nbit GENERIC MAP(N => 32) PORT MAP(NEXT_PC_3, OUT_ADD_SUM_1, DM_addr, IMM_2, SEL_MUX_MEM_2, OUT_MUX_MEM);

  WB_1 : ff PORT MAP( REG_WRITE_2, CLK, RST_n, REG_WRITE_3 );
  --WB_2 : regnbit GENERIC MAP (N => 32) PORT MAP( DM_addr, CLK, RST_n, DM_addr_MUX);-- USCITA ALU
  --WB_3 : regnbit GENERIC MAP (N => 32) PORT MAP( IMM_2, CLK, RST_n, IMM_MUX);-- IMMEDIATE
  WB_4 : regnbit GENERIC MAP (N => 5) PORT MAP( RD_2, CLK, RST_n, RD_3);
  WB_5 : regnbit GENERIC MAP (N => 32) PORT MAP( OUT_MUX_MEM, CLK, RST_n, OUT_MUX_MEM_1);-- OUT_MUX_MEM
  WB_6 : ff PORT MAP( MEM_TO_REG_2 , CLK , RST_n , MEM_TO_REG_3 );

  MUX_FIN: mux_2to1_nbit GENERIC MAP (N => 32) PORT MAP( DM_data, OUT_MUX_MEM_1, MEM_TO_REG_3, OUT_MUX_FIN);

  -- forwarding UNIT
  forw_unit: forwarding_unit PORT MAP (RS_1 => RS1, RS_2 => RS2, RD_EX_MEM => RD_2, RD_MEM_WB => RD_3, REG_WRITE_EX_MEM => REG_WRITE_2,
									REG_WRITE_MEM_WB => REG_WRITE_3, FORW_A1 => SEL_FORW_A1, FORW_A2 => SEL_FORW_A2, FORW_B1 => SEL_FORW_B1,
									FORW_B2 => SEL_FORW_B2);

END ARCHITECTURE;
