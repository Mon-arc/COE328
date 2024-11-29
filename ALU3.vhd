library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU3 is
    port (
        clock       : in std_logic;
        reset       : in std_logic;
        A, B        : in unsigned(7 downto 0);
        opcode      : in unsigned(15 downto 0);
        student_id  : in unsigned(3 downto 0);
        neg         : out std_logic; -- Not used but left in for completeness
        Result      : out unsigned(3 downto 0)
    );
end ALU3;

architecture calculation of ALU3 is
	SIGNAL b1, b2	: UNSIGNED(3 downto 0);
begin
	b1 <= B(7 downto 4);
	b2 <= B(3 downto 0);
    process (clock, reset)
    begin
        if reset = '0' then
            Result <= "0000"; -- Initialize to 0000
        else
                    if (b1 < student_id) or (b2 < student_id) then
                        Result <= "1111"; -- Assign 1111 ~ y
                    else
                        Result <= "0000"; -- Assign 0000 ~ n
                    end if;

                
        end if;
    end process;

end calculation;
