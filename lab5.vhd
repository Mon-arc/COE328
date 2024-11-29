LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity lab5 IS
	port(
	data_in, clk, reset	: in std_logic;
	student_id				: out std_logic_vector(3 downto 0);
	current_state			: out std_logic_vector(2 downto 0)
	);
end lab5;

architecture fsm of lab5 is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
	signal yfsm : state_type;
	
begin

	process (clk, reset) begin
	
	if reset = '1' then
		yfsm <= s0;
	
	elsif(clk'EVENT AND clk = '1') then
		case yfsm is  -- Based on FMS-9
			when s0 =>
				if data_in = '1' then
					yfsm <= s2;
					
				end if;
				
			when s1 =>
				if data_in = '1' then
					yfsm <= s5;
					
				end if;
			
			when s2 =>
				if data_in = '1' then
					yfsm <= s6;
					
				end if;
			
			when s3 =>
				if data_in = '1' then
					yfsm <= s7;
				
				end if;
				
			when s4 =>
				if data_in = '1' then
					yfsm <= s0;
					
				end if;
				
			when s5 =>
				if data_in = '1' then
					yfsm <= s4;
				
				end if;
				
			when s6 =>
				if data_in = '1' then
					yfsm <= s3;
				
				end if;
				
			when s7 =>
				if data_in = '1' then
					yfsm <= s1;
					
				end if;
				
			end case;
		end if;
	end process;

process (yfsm) begin

	case yfsm is 
		when s0 => current_state <= "000";
			student_id <= "0000";	-- d2 ~ 0
			
		when s1 => current_state <= "001";
			student_id <= "0001";	-- d3 ~ 1
			
		when s2 => current_state <= "010";
			student_id <= "0010";	-- d4 ~ 2
			
		when s3 => current_state <= "011";
			student_id <= "0110";	-- d5 ~ 6
			
		when s4 => current_state <= "100";
			student_id <= "0011";	-- d6 ~ 3
		
		when s5 => current_state <= "101";
			student_id <= "0000";	-- d7 ~ 0
		
		when s6 => current_state <= "110";
			student_id <= "0000";	-- d8 ~ 0
		
		when s7 => current_state <= "111";
			student_id <= "0100";	-- d9 ~ 4
	
	end case;
	
end process;

end fsm;
				
	