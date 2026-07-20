library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity obdh_top is
    Port (
        clk         : in  STD_LOGIC;
        reset       : in  STD_LOGIC;

        sensor_data : in  STD_LOGIC_VECTOR(7 downto 0);

        mem_data    : out STD_LOGIC_VECTOR(7 downto 0);

        data_valid  : out STD_LOGIC
    );
end obdh_top;

architecture Behavioral of obdh_top is

signal data_reg : STD_LOGIC_VECTOR(7 downto 0);

begin

process(clk, reset)

begin

    if reset='1' then

        data_reg   <= (others => '0');
        data_valid <= '0';

    elsif rising_edge(clk) then

        data_reg   <= sensor_data;
        data_valid <= '1';

    end if;

end process;

mem_data <= data_reg;

end Behavioral;
