LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
ENTITY ASU IS

PORT (
CarryIn : IN STD_LOGIC ;
X ,Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ;
CarryOut,Overflow : OUT STD_LOGIC ) ;
END ASU ;

ARCHITECTURE Behavior OF ASU IS
SIGNAL Sum : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
PROCESS (CarryIn, X, Y)
BEGIN

if (CarryIn <= '0') then 

Sum <= ('0' & X) + ('0' & Y);
S <= Sum(3 DOWNTO 0);
CarryOut <= Sum(4);
Overflow <= (CarryIn XOR Sum(4));


elsif (CarryIn <= '1') then

Sum <= ('0' & X) - ('0' & Y);
S <= Sum(3 DOWNTO 0);
CarryOut <= Sum(4);
Overflow <= (CarryIn XOR Sum(4));

end if;

	
 END PROCESS;

 
END Behavior;