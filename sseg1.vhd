LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY sseg1 IS
PORT ( 
bcd : IN STD_LOGIC_VECTOR(2 DOWNTO 0) ;
leds : OUT STD_LOGIC_VECTOR(0 TO 6) ) ;
END sseg1 ;

ARCHITECTURE Behavior OF sseg1 IS
BEGIN
PROCESS ( bcd )

BEGIN


CASE bcd IS --abcdefg
WHEN "000" =>leds <= NOT ("1111110");
WHEN "001" =>leds <= NOT ("0110000");
WHEN "010" =>leds <= NOT ("1101101") ;
WHEN "011" =>leds <= NOT ("1111001") ;
WHEN "100" =>leds <= NOT ("0110011") ;
WHEN "101" =>leds <= NOT ("1011011") ;
WHEN "110" =>leds <= NOT ("1011111") ;
WHEN "111" =>leds <= NOT ("1110000") ;
WHEN OTHERS =>leds <= ("-------") ;
END CASE ;
END PROCESS ;
END Behavior ;