library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ttc_tb is
end ttc_tb;

architecture Behavioral of ttc_tb is

    component ttc
        Port (
            clk             : in  STD_LOGIC;
            reset           : in  STD_LOGIC;
            command_in      : in  STD_LOGIC_VECTOR(7 downto 0);
            command_valid   : in  STD_LOGIC;
            telemetry_out   : out STD_LOGIC_VECTOR(7 downto 0);
            telemetry_valid : out STD_LOGIC
        );
    end component;

    signal clk             : STD_LOGIC := '0';
    signal reset           : STD_LOGIC := '1';
    signal command_in      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal command_valid   : STD_LOGIC := '0';
    signal telemetry_out   : STD_LOGIC_VECTOR(7 downto 0);
    signal telemetry_valid : STD_LOGIC;

begin

    uut: ttc
        port map(
            clk             => clk,
            reset           => reset,
            command_in      => command_in,
            command_valid   => command_valid,
            telemetry_out   => telemetry_out,
            telemetry_valid => telemetry_valid
        );

    -- Clock Generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Stimulus
    stim_proc : process
    begin
        wait for 20 ns;
        reset <= '0';

        command_valid <= '1';

        command_in <= x"55";
        wait for 20 ns;

        command_in <= x"AA";
        wait for 20 ns;

        command_in <= x"F0";
        wait for 20 ns;

        command_valid <= '0';

        wait;
    end process;

end Behavioral;
