LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity register1 is port
(
	A					:	in std_logic_vector(7 downto 0); -- 8-bit A Input
	reset, clock	:	in std_logic;
	Q					:	out std_logic_vector(7 downto 0)); -- 8-bit Output
end register1;

architecture behavior of register1 is
begin
	process (reset, clock)
	begin
		if reset = '0' then
 			Q <= "00000000";
		elsif (rising_edge(clock)) then
			Q <= A;
		end if;
		
	end process;
	
end behavior;