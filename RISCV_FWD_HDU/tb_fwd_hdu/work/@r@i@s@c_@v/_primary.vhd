library verilog;
use verilog.vl_types.all;
entity RISC_V is
    port(
        CLK             : in     vl_logic;
        RST_n           : in     vl_logic;
        INSTR           : in     vl_logic_vector(31 downto 0);
        DM_data         : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        DM_addr         : out    vl_logic_vector(31 downto 0);
        IM_READ_OUT     : out    vl_logic;
        WRITE_DATA_OUT  : out    vl_logic_vector(31 downto 0);
        DM_WRITE_OUT    : out    vl_logic;
        DM_READ_OUT     : out    vl_logic
    );
end RISC_V;
