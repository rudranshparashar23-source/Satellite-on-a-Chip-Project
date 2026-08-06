library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity obdh_tb is
end obdh_tb;

architecture Behavioral of obdh_tb is

    component obdh
        Port (
            clk         : in  STD_LOGIC;
            reset       : in  STD_LOGIC;
            sensor_data : in  STD_LOGIC_VECTOR(7 downto 0);
            data_valid  : in  STD_LOGIC;
            memory_data : out STD_LOGIC_VECTOR(7 downto 0);
            memory_valid: out STD_LOGIC
        );
    end component;

    signal clk          : STD_LOGIC := '0';
    signal reset        : STD_LOGIC := '1';
    signal sensor_data  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_valid   : STD_LOGIC := '0';
    signal memory_data  : STD_LOGIC_VECTOR(7 downto 0);
    signal memory_valid : STD_LOGIC;

begin

    uut: obdh
        port map(
            clk          => clk,
            reset        => reset,
            sensor_data  => sensor_data,
            data_valid   => data_valid,
            memory_data  => memory_data,
            memory_valid => memory_valid
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

        sensor_data <= x"12";
        data_valid <= '1';
        wait for 20 ns;

        sensor_data <= x"55";
        wait for 20 ns;

        sensor_data <= x"AA";
        wait for 20 ns;

        data_valid <= '0';

        wait;
    end process;

end Behavioral;
