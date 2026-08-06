library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity eps is
    Port (
        clk              : in  STD_LOGIC;
        reset            : in  STD_LOGIC;
        battery_voltage  : in  STD_LOGIC_VECTOR(7 downto 0);
        battery_current  : in  STD_LOGIC_VECTOR(7 downto 0);
        power_status     : out STD_LOGIC;
        hk_data          : out STD_LOGIC_VECTOR(15 downto 0)
    );
end eps;

architecture Behavioral of eps is

begin

    process(clk, reset)
    begin

        if reset = '1' then
            power_status <= '0';
            hk_data <= (others => '0');

        elsif rising_edge(clk) then

            hk_data <= battery_voltage & battery_current;

            if unsigned(battery_voltage) > 40 then
                power_status <= '1';
            else
                power_status <= '0';
            end if;

        end if;

    end process;

end Behavioral;
