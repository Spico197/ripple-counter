library ieee;
use ieee.std_logic_1164.all;
-- main entity
entity ripple_counter16 is
port(
	clk: in std_logic;
	clr: in std_logic;
	load: in std_logic;
	loaddata: in std_logic_vector(3 downto 0);
	cy: out std_logic;
	out4: out std_logic_vector(3 downto 0);
	nout4: out std_logic_vector(3 downto 0)
);
end entity ripple_counter16;

architecture arch_counter of ripple_counter16 is
component d_ff is
port(
	d, dclk: in std_logic;
	clr: in std_logic;
	ld: in std_logic;
	lden: in std_logic;
	q:	out std_logic;
	nq: out std_logic
);
end component d_ff;
signal middleout: std_logic_vector(3 downto 0);
signal nmiddleout: std_logic_vector(4 downto 0);
begin
	
	nmiddleout(0) <= clk;
	
	g1: for i in 0 to 3 generate
		dffx: d_ff port map(dclk => nmiddleout(i), d => nmiddleout(i+1), 
									q => middleout(i), nq => nmiddleout(i+1), clr => clr,
									lden => load, ld => loaddata(i));
	end generate g1;
	
	out4(3 downto 0) <= middleout(3 downto 0);
	nout4(3 downto 0) <= nmiddleout(4 downto 1);
	
	cy <= middleout(3) and middleout(2) and middleout(1) and middleout(0);
	
	
end arch_counter;