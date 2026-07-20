library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity obdh_tb is
end obdh_tb;

architecture Behavioral of obdh_tb is

component obdh_top

Port(

clk         : in STD_LOGIC;
reset       : in STD_LOGIC;
sensor_data : in STD_LOGIC_VECTOR(7 downto 0);
mem_data    : out STD_LOGIC_VECTOR(7 downto 0);
data_valid  : out STD_LOGIC

);

end component;

signal clk         : STD_LOGIC := '0';
signal reset       : STD_LOGIC := '1';
signal sensor_data : STD_LOGIC_VECTOR(7 downto 0);
signal mem_data    : STD_LOGIC_VECTOR(7 downto 0);
signal data_valid  : STD_LOGIC;

begin

UUT : obdh_top

port map(

clk,
reset,
sensor_data,
mem_data,
data_valid

);

clk <= not clk after 10 ns;

process

begin

wait for 20 ns;

reset <= '0';

sensor_data <= "10101010";

wait for 20 ns;

sensor_data <= "11110000";

wait for 20 ns;

sensor_data <= "00001111";

wait;

end process;

end Behavioral;
