LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY johns IS
  PORT (
    Clrn : IN STD_LOGIC;
    Clk  : IN STD_LOGIC;
    W    : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    Q    : OUT STD_LOGIC_VECTOR (0 TO 2)
  );
END johns;

ARCHITECTURE Behavior OF johns IS
  SIGNAL Qreg : STD_LOGIC_VECTOR (0 TO 2);
BEGIN
  PROCESS (Clrn, Clk)
  BEGIN
    IF Clrn = '0' THEN
      Qreg <= "000";  -- Initial and Reset State
    ELSIF (Clk'EVENT AND Clk = '1') THEN
      Qreg(0) <= NOT Qreg(2);   -- Johnson / flip flop
      Qreg(1) <= Qreg(0);		  -- Shifts each respective value over to the right
      Qreg(2) <= Qreg(1);
    END IF;

    -- Display the last 6 digits of the student 
    CASE Qreg IS
      WHEN "000" => W <= "0010"; -- d4 ~ 2
      WHEN "100" => W <= "0110"; -- d5 ~ 3
      WHEN "110" => W <= "0011"; -- d6 ~ 6
      WHEN "111" => W <= "0000"; -- d7 ~ 0
      WHEN "011" => W <= "0000"; -- d8 ~ 0
      WHEN "001" => W <= "0100"; -- d9 ~ 4
      WHEN OTHERS => W <= "----"; -- Error
    END CASE;
  END PROCESS;

  Q <= Qreg;  -- Feed Qreg signal out to Q (Could be fed back to D)
END Behavior;
