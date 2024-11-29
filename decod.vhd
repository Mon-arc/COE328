LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decod IS PORT 
(
	w1, w0			: IN STD_LOGIC;
	En				 	: IN STD_LOGIC;
	y0, y1, y2, y3 : OUT STD_LOGIC);
END decod;

ARCHITECTURE Behavior OF decod IS
	SIGNAL Enw : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL y	  : STD_LOGIC_VECTOR(0 TO 3);
	
BEGIN
	Enw <= En & w1 & w0;
	WITH Enw SELECT
	
	

	
	y <= "1000" WHEN "100",
		  "0100" WHEN "101",
		  "0010" WHEN "110",
		  "0001" WHEN "111",
		  "0000" WHEN OTHERS;
		  
	y3 <= y(3);
	y2 <= y(2);
	y1 <= y(1);
	y0 <= y(0);
END Behavior;