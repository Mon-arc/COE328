LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY sseg IS
PORT ( 
	neg 						  : IN STD_LOGIC;
	bcd 						  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	ResultLED, NegativeLED : OUT STD_LOGIC_VECTOR(0 TO 6));
END sseg ;

ARCHITECTURE Behavior OF sseg IS
BEGIN
PROCESS (bcd, neg) BEGIN
	
	NegativeLED <= not ("000000" & neg);

CASE bcd IS --abcdefg
WHEN "0000" => ResultLED <= NOT ("1111110");
WHEN "0001" => ResultLED <= NOT ("0110000");
WHEN "0010" => ResultLED <= NOT ("1101101");
WHEN "0011" => ResultLED <= NOT ("1111001");
WHEN "0100" => ResultLED <= NOT ("0110011");
WHEN "0101" => ResultLED <= NOT ("1011011");
WHEN "0110" => ResultLED <= NOT ("1011111");
WHEN "0111" => ResultLED <= NOT ("1110000");
WHEN "1000" => ResultLED <= NOT ("1111111");
WHEN "1001" => ResultLED <= NOT ("1110011");
WHEN "1010" => ResultLED <= ("0001000");
WHEN "1011" => ResultLED <= ("1100000");
WHEN "1100" => ResultLED <= ("0110001");
WHEN "1101" => ResultLED <= ("1000010");
WHEN "1110" => ResultLED <= ("0110000");
WHEN "1111" => ResultLED <= ("0111000");
WHEN OTHERS => ResultLED <= ("-------");
END CASE;
END PROCESS;
END Behavior;