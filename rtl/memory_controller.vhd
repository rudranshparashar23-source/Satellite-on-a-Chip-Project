library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memory_controller is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        address    : in  STD_LOGIC_VECTOR(7 downto 0);
        write_data : in  STD_LOGIC_VECTOR(7 downto 0);
        write_en   : in  STD_LOGIC;
        data_valid : out STD_LOGIC;
        read_data  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end memory_controller;

architecture Behavioral of memory_controller is

    type ram_type is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
    signal ram : ram_type := (others => (others => '0'));
    type valid_array is array (0 to 255) of STD_LOGIC;
signal valid_ram : valid_array := (others => '0');

begin

process(clk, reset)
begin
    if reset = '1' then
        read_data <= (others => '0');

    elsif rising_edge(clk) then

        if write_en = '1' then
            ram(to_integer(unsigned(address))) <= write_data;
            valid_ram(to_integer(unsigned(address))) <= '1';
        end if;

        read_data  <= ram(to_integer(unsigned(address)));
        data_valid <= valid_ram(to_integer(unsigned(address)));

    end if;
end process;
end Behavioral;
