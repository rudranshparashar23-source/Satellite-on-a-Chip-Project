library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eps_tb is
end eps_tb;

architecture Behavioral of eps_tb is

component eps_top

Port(
    clk             : in STD_LOGIC;
    reset           : in STD_LOGIC;
    battery_voltage : in STD_LOGIC_VECTOR(7 downto 0);
    battery_current : in STD_LOGIC_VECTOR(7 downto 0);
    power_ok        : out STD_LOGIC;
    hk_data         : out STD_LOGIC_VECTOR(15 downto 0)
);

end component;

signal clk             : STD_LOGIC := '0';
signal reset           : STD_LOGIC := '1';
signal battery_voltage : STD_LOGIC_VECTOR(7 downto 0);
signal battery_current : STD_LOGIC_VECTOR(7 downto 0);
signal power_ok        : STD_LOGIC;
signal hk_data         : STD_LOGIC_VECTOR(15 downto 0);

begin

UUT : eps_top
port map(
    clk,
    reset,
    battery_voltage,
    battery_current,
    power_ok,
    hk_data
);

clk <= not clk after 10 ns;

process
begin

    wait for 20 ns;

    reset <= '0';

    battery_voltage <= "00110010"; -- 50
    battery_current <= "00010100"; -- 20

    wait for 40 ns;

    battery_voltage <= "00011110"; -- 30
    battery_current <= "00001010"; -- 10

    wait;

end process;

end Behavioral;
