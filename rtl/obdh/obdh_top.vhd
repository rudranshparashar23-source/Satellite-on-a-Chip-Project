library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity obdh_top is
    Port (
        clk              : in  STD_LOGIC;
        reset            : in  STD_LOGIC;

        sensor_data      : in  STD_LOGIC_VECTOR(7 downto 0);
        data_valid       : in  STD_LOGIC;

        telemetry_in     : in  STD_LOGIC_VECTOR(7 downto 0);
        telemetry_valid  : in  STD_LOGIC;

        hk_data          : in  STD_LOGIC_VECTOR(15 downto 0);

        memory_address   : out STD_LOGIC_VECTOR(7 downto 0);
        memory_data      : out STD_LOGIC_VECTOR(7 downto 0);
        memory_write     : out STD_LOGIC
    );
end obdh_top;

architecture Behavioral of obdh_top is

    type state_type is (
        IDLE,
        WRITE_SENSOR,
        WRITE_TELEMETRY,
        WRITE_VOLTAGE,
        WRITE_CURRENT
    );

    signal state : state_type := IDLE;

begin

process(clk)

begin

    if rising_edge(clk) then

        if reset='1' then

            state <= IDLE;
            memory_write <= '0';
            memory_address <= (others=>'0');
            memory_data <= (others=>'0');

        else

            memory_write <= '0';

            case state is

                when IDLE =>

                    if data_valid='1' then
                        state <= WRITE_SENSOR;

                    elsif telemetry_valid='1' then
                        state <= WRITE_TELEMETRY;

                    else
                        state <= WRITE_VOLTAGE;
                    end if;

                when WRITE_SENSOR =>

                    memory_address <= x"00";
                    memory_data <= sensor_data;
                    memory_write <= '1';

                    state <= IDLE;

                when WRITE_TELEMETRY =>

                    memory_address <= x"01";
                    memory_data <= telemetry_in;
                    memory_write <= '1';

                    state <= IDLE;

                when WRITE_VOLTAGE =>

                    memory_address <= x"02";
                    memory_data <= hk_data(15 downto 8);
                    memory_write <= '1';

                    state <= WRITE_CURRENT;

                when WRITE_CURRENT =>

                    memory_address <= x"03";
                    memory_data <= hk_data(7 downto 0);
                    memory_write <= '1';

                    state <= IDLE;

            end case;

        end if;

    end if;

end process;

end Behavioral;
