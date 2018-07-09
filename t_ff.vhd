-- T flip flop
library ieee;
use ieee.std_logic_1164.all;

entity T_FF IS
port(
	t, tclk: in std_logic;
	q:	out std_logic;
	nq: out std_logic
);
end entity t_ff;
architecture arch_t_ff of t_ff is
signal q_temp: std_logic;
begin
	process(tclk)
	begin
		if tclk'event and tclk = '1' then
			if t = '1' then 
				q <= not q_temp;
			elsif t = '0' then
				q <= q_temp;
			end if;
		end if;
	end process;
end arch_t_ff;