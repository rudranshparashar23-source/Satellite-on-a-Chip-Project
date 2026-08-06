library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memory_controller_tb is
end memory_controller_tb;

architecture Behavioral of memory_controller_tb is

    component memory_controller
        Port (
            clk        : in  STD_LOGIC;
            reset      : in  STD_LOGIC;
            address    : in  STD_LOGIC_VECTOR(7 downto 0);
            write_data : in  STD_LOGIC_VECTOR(7 downto 0);
            write_en   : in  STD_LOGIC;
            read_data  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal clk        : STD_LOGIC := '0';
    signal reset      : STD_LOGIC := '1';
    signal address    : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal write_data : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal write_en   : STD_LOGIC := '0';
    signal read_data  : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: memory_controller
        port map (
            clk        => clk,
            reset      => reset,
            address    => address,
            write_data => write_data,
            write_en   => write_en,
            read_data  => read_data
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

        -- Write Operation
        address <= x"01";
        write_data <= x"AA";
        write_en <= '1';
        wait for 20 ns;

        -- Read Operation
        write_en <= '0';
        wait for 20 ns;

        -- Second Write
        address <= x"02";
        write_data <= x"55";
        write_en <= '1';
        wait for 20 ns;

        -- Read
        write_en <= '0';
        wait;

    end process;

end Behavioral;
