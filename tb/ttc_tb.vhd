library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ttc_tb is
end ttc_tb;

architecture Behavioral of ttc_tb is

component ttc_top

Port(

clk       : in STD_LOGIC;
reset     : in STD_LOGIC;
tc_data   : in STD_LOGIC_VECTOR(7 downto 0);
telemetry : out STD_LOGIC_VECTOR(7 downto 0);
tc_valid  : out STD_LOGIC

);

end component;

signal clk       : STD_LOGIC := '0';
signal reset     : STD_LOGIC := '1';
signal tc_data   : STD_LOGIC_VECTOR(7 downto 0);
signal telemetry : STD_LOGIC_VECTOR(7 downto 0);
signal tc_valid  : STD_LOGIC;

begin

UUT : ttc_top
port map(
    clk,
    reset,
    tc_data,
    telemetry,
    tc_valid
);

clk <= not clk after 10 ns;

process

begin

wait for 20 ns;

reset <= '0';

tc_data <= "11001100";

wait for 20 ns;

tc_data <= "11110000";

wait;

end process;

end Behavioral;
