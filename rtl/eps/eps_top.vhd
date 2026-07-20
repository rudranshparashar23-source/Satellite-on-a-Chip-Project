library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity eps_top is
    Port (
        clk             : in  STD_LOGIC;
        reset           : in  STD_LOGIC;

        battery_voltage : in  STD_LOGIC_VECTOR(7 downto 0);
        battery_current : in  STD_LOGIC_VECTOR(7 downto 0);

        power_ok        : out STD_LOGIC;
        hk_data         : out STD_LOGIC_VECTOR(15 downto 0)
    );
end eps_top;

architecture Behavioral of eps_top is

signal voltage_reg : STD_LOGIC_VECTOR(7 downto 0);
signal current_reg : STD_LOGIC_VECTOR(7 downto 0);

begin

process(clk, reset)

begin

    if reset='1' then

        voltage_reg <= (others=>'0');
        current_reg <= (others=>'0');
        power_ok    <= '0';

    elsif rising_edge(clk) then

        voltage_reg <= battery_voltage;
        current_reg <= battery_current;

        if unsigned(battery_voltage) > 40 then
            power_ok <= '1';
        else
            power_ok <= '0';
        end if;

    end if;

end process;

hk_data <= voltage_reg & current_reg;

end Behavioral;
