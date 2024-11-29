LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU2 is port
(
	clock, reset	: in std_logic;
	A, B				: in unsigned(7 downto 0);
	opcode			: in unsigned(15 downto 0);
	neg				: out std_logic;
	R1, R2			: out unsigned(3 downto 0));
end ALU2;

architecture calculation of ALU2 is
	Signal Result : unsigned(7 downto 0);
begin

	process (clock, reset) begin		   -- PROBLEM 2: MODIFIED ALU CORE 1, ALU OPERATIONS ASSIGNED: a)
		if reset = '0' then
			Result <= "00000000";
		elsif (rising_edge(clock)) then
			case opcode is
				when "0000000000000001" => -- function 1 ~ Increment A by 2
					neg <= '0';
					Result <= A + 2;
				when "0000000000000010" => -- function 2 ~ Shift B to the right by 2 bits, input bit = 0
					neg <= '0';
					Result <= "00" & B(7 downto 2);
				when "0000000000000100" => -- function 3 ~ Shift A to the right by four bits, input bit = 1
					neg <= '0';
					Result <= "1111" & A(7 downto 4);
				when "0000000000001000" => -- function 4 ~ Min(A, B)
					if (A < B) then
					Result <= A;
					else 
					Result <= B;
					end if;
					if (Result < 0) then
					neg <= '1';
					else
					neg <= '0';
					end if;
				when "0000000000010000" => -- function 5 ~ Rotate A to the right by two bits (ROR)
					neg <= '0';
					Result <= A(1 downto 0) & A(7 downto 2);
				when "0000000000100000" => -- function 6 ~ Invert the bit-significance order of B
					neg <= '0';
					Result(0) <= B(7);
					Result(1) <= B(6);
					Result(2) <= B(5);
					Result(3) <= B(4);
					Result(4) <= B(3);
					Result(5) <= B(2);
					Result(6) <= B(1);
					Result(7) <= B(0);
				when "0000000001000000" => -- function 7 ~ Produce the result of XORing A and B
					neg <= '0';
					Result <= A XOR B;
				when "0000000010000000" => -- function 8 ~ Sum of A and B, decreased by 4
					Result <= ((A + B) - 4);
					if (Result < 0) then
					neg <= '1';
					else
					neg <= '0';
					end if;
				when others =>					-- don't care
					
					
			end case;
		end if;
	end process;
	
	R1 <= Result(3 downto 0);
	R2 <= Result(7 downto 4);
end calculation;
					
					