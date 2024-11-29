LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY C IS
	PORT (
			S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			L : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END C;

ARCHITECTURE Behaviour OF C IS
BEGIN
	PROCESS (S)
	BEGIN
		L(3) <= '0';
		L(2) <= (NOT S(0) AND NOT S(1) AND NOT S(2) AND NOT S(3)) OR (S(0) AND NOT S(1) AND S(2) AND NOT S(3)) OR (NOT S(0) AND S(1) AND S(2) AND NOT S(3)) ;
		L(1) <= (S(1) AND NOT S(2) AND NOT S(3)) OR (S(0) AND NOT S(1) AND S(2) AND NOT S(3));
		L(0) <= (S(0) AND NOT S(2) AND NOT S(3)) OR (S(0) AND NOT S(1) AND NOT S(3));
		
	END PROCESS;
END Behaviour;