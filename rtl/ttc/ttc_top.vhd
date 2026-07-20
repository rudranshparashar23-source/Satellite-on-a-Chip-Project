library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ttc_top is
    Port (
        clk          : in  STD_LOGIC;
        reset        : in  STD_LOGIC;

        tc_data      : in  STD_LOGIC_VECTOR(7 downto 0);

        telemetry    : out STD_LOGIC_VECTOR(7 downto 0);

        tc_valid     : out STD_LOGIC
    );
end ttc_top;

architecture Behavioral of ttc_top is

signal telemetry_reg : STD_LOGIC_VECTOR(7 downto 0);

begin

process(clk, reset)

begin

    if reset='1' then

        telemetry_reg <= (others => '0');
        tc_valid <= '0';

    elsif rising_edge(clk) then

        telemetry_reg <= tc_data;
        tc_valid <= '1';

    end if;

end process;

telemetry <= telemetry_reg;

end Behavioral;
