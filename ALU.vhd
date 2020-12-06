LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ALU IS
PORT( DATA_A,DATA_B: IN std_logic_vector(63 downto 0);
      CTRL: IN std_logic_vector(2 downto 0);
      DATA_OUT: BUFFER std_logic_vector(63 downto 0);
      ZERO: OUT std_logic
      );
END ENTITY;

ARCHITECTURE beh OF ALU IS
BEGIN

--INT_OUT <= to_integer(to_signed(DATA_OUT));
  process(CTRL)
  variable OUT_signed : signed (63 downto 0);
  variable INT_B : integer range 0 to 2**5-1 := 0;
  variable error: integer range 0 to 1 := 0;

    begin
    INT_B := to_integer(unsigned(DATA_B(4 downto 0)));
   	error := 0;
    case CTRL is
      --AND
      when "001" =>  DATA_OUT <= DATA_A and DATA_B;

      --ADD
      when "000" =>  OUT_signed := signed(DATA_A) + signed(DATA_B);
                    DATA_OUT <= std_logic_vector(OUT_signed);

      -- SUB
      when "011" =>  OUT_signed := signed(DATA_A) - signed(DATA_B);
                    DATA_OUT <= std_logic_vector(OUT_signed);

      -- XOR
      when "100" =>  DATA_OUT <= DATA_A xor DATA_B;

      -- BARREL SHIFTER
      when "010" => DATA_OUT <= std_logic_vector(shift_right(unsigned(DATA_A), INT_B));

      when others => DATA_OUT <= (OTHERS => '0');
                      ZERO <= '0';
					  error := 1;
    end case;
	if DATA_OUT = "0000000000000000000000000000000000000000000000000000000000000000" AND error = 0 then
                      ZERO <= '1';
    end if;
  end process;
END ARCHITECTURE;
