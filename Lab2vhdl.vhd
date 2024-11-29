LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Lab2vhdl IS
PORT (
A, C, D : IN STD_LOGIC ;
F10 : OUT STD_LOGIC );
end Lab2vhdl;

ARCHITECTURE Behavior OF Lab2vhdl IS
BEGIN
F10 <= (NOT A AND C AND D) OR (A AND C AND NOT D) OR (C AND D);
END Behavior;