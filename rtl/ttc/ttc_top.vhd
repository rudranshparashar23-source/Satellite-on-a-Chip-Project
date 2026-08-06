library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ttc is
    Port (
        clk              : in  STD_LOGIC;
        reset            : in  STD_LOGIC;
        command_in       : in  STD_LOGIC_VECTOR(7 downto 0);
        command_valid    : in  STD_LOGIC;
        telemetry_out    : out STD_LOGIC_VECTOR(7 downto 0);
        telemetry_valid  : out STD_LOGIC
    );
end ttc;

architecture Behavioral of ttc is

begin

    process(clk, reset)
    begin

        if reset = '1' then

            telemetry_out   <= (others => '0');
            telemetry_valid <= '0';

        elsif rising_edge(clk) then

            if command_valid = '1' then
                telemetry_out   <= command_in;
                telemetry_valid <= '1';
            else
                telemetry_valid <= '0';
            end if;

        end if;

    end process;

end Behavioral;
