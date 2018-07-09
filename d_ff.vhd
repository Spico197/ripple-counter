-- D flip flop
library ieee;
use ieee.std_logic_1164.all;

entity D_FF IS
port(
	d, dclk: in std_logic;
	clr: in std_logic;
	ld: in std_logic;
	lden: in std_logic;
	q:	out std_logic;
	nq: out std_logic
);
end entity d_ff;
architecture arch_d_ff of d_ff is
begin
	process(dclk)
	begin
		if clr = '1' then
			q <= '0';
			nq <= '1';
		elsif dclk'event and dclk = '1' then
			if lden = '1' then 
				q <= ld;
				nq <= not ld;
			else
				q <= d;
				nq <= not d;
			end if;
		end if;
	end process;
end arch_d_ff;