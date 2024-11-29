LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU is port
(
	clock, reset	: in std_logic;
	A, B				: in unsigned(7 downto 0);
	opcode			: in unsigned(15 downto 0);
	neg				: out std_logic;
	R1, R2			: out unsigned(3 downto 0));
end ALU;

architecture calculation of ALU is
	Signal Result : unsigned(7 downto 0);
begin

	process (clock, reset) begin
		if reset = '0' then
			Result <= "00000000";
		elsif (rising_edge(clock)) then
			case opcode is
			
				when "0000000000000001" => -- function 1 ~ addition
					neg <= '0';
					Result <= A + B;
				when "0000000000000010" => -- function 2 ~ subtraction
					if(A < B) then
					neg <= '1';
					Result <= B - A;
					else
					neg <= '0';
					Result <= A - B;
					end if;
				when "0000000000000100" => -- function 3 ~ NOT
					neg <= '0';
					Result <= NOT(A);
				when "0000000000001000" => -- function 4 ~ NAND
					neg <= '0';
					Result <= NOT (A AND B);
				when "0000000000010000" => -- function 5 ~ NOR
					neg <= '0';
					Result <= A NOR B;
				when "0000000000100000" => -- function 6 ~ AND
					neg <= '0';
					Result <= A AND B;
				when "0000000001000000" => -- function 7 ~ XOR
					neg <= '0';
					Result <= A XOR B;
				when "0000000010000000" => -- function 8 ~ OR
					neg <= '0';
					Result <= A OR B;
				when others =>					-- don't care
			end case;
		end if;
	end process;
	
	R1 <= Result(3 downto 0);
	R2 <= Result(7 downto 4);
end calculation;
					
					