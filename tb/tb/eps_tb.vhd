library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eps_tb is
end eps_tb;

architecture Behavioral of eps_tb is

    -- Component Declaration
    component eps
        Port (
            clk             : in  STD_LOGIC;
            reset           : in  STD_LOGIC;
            battery_voltage : in  STD_LOGIC_VECTOR(7 downto 0);
            battery_current : in  STD_LOGIC_VECTOR(7 downto 0);
            power_status    : out STD_LOGIC;
            hk_data         : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- Signals
    signal clk             : STD_LOGIC := '0';
    signal reset           : STD_LOGIC := '1';
    signal battery_voltage : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal battery_current : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal power_status    : STD_LOGIC;
    signal hk_data         : STD_LOGIC_VECTOR(15 downto 0);

begin

    -- Instantiate EPS
    uut: eps
        port map (
            clk             => clk,
            reset           => reset,
            battery_voltage => battery_voltage,
            battery_current => battery_current,
            power_status    => power_status,
            hk_data         => hk_data
        );

    -- Clock Generation (100 MHz)
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Stimulus Process
    stim_proc : process
    begin
        -- Apply Reset
        wait for 20 ns;
        reset <= '0';

        -- Test Case 1
        battery_voltage <= x"96";
        battery_current <= x"14";
        wait for 20 ns;

        -- Test Case 2
        battery_voltage <= x"64";
        battery_current <= x"28";
        wait for 20 ns;

        -- Test Case 3
        battery_voltage <= x"50";
        battery_current <= x"10";
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
