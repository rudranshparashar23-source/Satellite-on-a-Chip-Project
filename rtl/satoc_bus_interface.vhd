library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity satoc_bus_interface is
    Port (

        ----------------------------------------------------------------
        -- Clock & Reset
        ----------------------------------------------------------------
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;

        ----------------------------------------------------------------
        -- CPU Bus Interface
        ----------------------------------------------------------------
        cpu_address   : in  STD_LOGIC_VECTOR(31 downto 0);
        cpu_wdata     : in  STD_LOGIC_VECTOR(31 downto 0);
        cpu_write     : in  STD_LOGIC;
        cpu_read      : in  STD_LOGIC;

        cpu_rdata     : out STD_LOGIC_VECTOR(31 downto 0);
        cpu_ready     : out STD_LOGIC;

        ----------------------------------------------------------------
        -- SAToC Interface
        ----------------------------------------------------------------
        sensor_data       : out STD_LOGIC_VECTOR(7 downto 0);
        sensor_valid      : out STD_LOGIC;

        command_data      : out STD_LOGIC_VECTOR(7 downto 0);
        command_valid     : out STD_LOGIC;

        battery_voltage   : in  STD_LOGIC_VECTOR(7 downto 0);
        battery_current   : in  STD_LOGIC_VECTOR(7 downto 0);

        telemetry_data    : in  STD_LOGIC_VECTOR(7 downto 0);
        telemetry_valid   : in  STD_LOGIC;

        memory_data       : in  STD_LOGIC_VECTOR(7 downto 0)
    );
end satoc_bus_interface;

architecture Behavioral of satoc_bus_interface is

begin

process(clk)
begin
    if rising_edge(clk) then

        if reset = '1' then

            sensor_data    <= (others => '0');
            sensor_valid   <= '0';

            command_data   <= (others => '0');
            command_valid  <= '0';

            cpu_rdata      <= (others => '0');
            cpu_ready      <= '0';

        else

            sensor_valid  <= '0';
            command_valid <= '0';
            cpu_ready     <= '0';

            --------------------------------------------------------
            -- CPU WRITE
            --------------------------------------------------------

            if cpu_write = '1' then

                case cpu_address(7 downto 0) is

                    when x"00" =>
                        sensor_data  <= cpu_wdata(7 downto 0);
                        sensor_valid <= '1';

                    when x"04" =>
                        command_data <= cpu_wdata(7 downto 0);
                        command_valid <= '1';

                    when others =>
                        null;

                end case;

                cpu_ready <= '1';

            end if;

            --------------------------------------------------------
            -- CPU READ
            --------------------------------------------------------

            if cpu_read = '1' then

                case cpu_address(7 downto 0) is

                    when x"08" =>
                        cpu_rdata <= (31 downto 8 => '0') & battery_voltage;

                    when x"0C" =>
                        cpu_rdata <= (31 downto 8 => '0') & battery_current;

                    when x"10" =>
                        cpu_rdata <= (31 downto 8 => '0') & telemetry_data;

                    when x"14" =>
                        cpu_rdata <= (31 downto 8 => '0') & memory_data;

                    when others =>
                        cpu_rdata <= (others => '0');

                end case;

                cpu_ready <= '1';

            end if;

        end if;

    end if;
end process;

end Behavioral;
