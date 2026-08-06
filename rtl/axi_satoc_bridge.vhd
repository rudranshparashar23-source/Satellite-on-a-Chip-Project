library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity axi_satoc_bridge is
    Port (

        ----------------------------------------------------------------
        -- Clock & Reset
        ----------------------------------------------------------------
        clk           : in  STD_LOGIC;
        reset         : in  STD_LOGIC;

        ----------------------------------------------------------------
        -- Simplified AXI Interface
        ----------------------------------------------------------------
        axi_address   : in  STD_LOGIC_VECTOR(31 downto 0);
        axi_wdata     : in  STD_LOGIC_VECTOR(31 downto 0);
        axi_write     : in  STD_LOGIC;
        axi_read      : in  STD_LOGIC;

        axi_rdata     : out STD_LOGIC_VECTOR(31 downto 0);
        axi_ready     : out STD_LOGIC;

        ----------------------------------------------------------------
        -- CPU Bus
        ----------------------------------------------------------------
        cpu_address   : out STD_LOGIC_VECTOR(31 downto 0);
        cpu_wdata     : out STD_LOGIC_VECTOR(31 downto 0);
        cpu_write     : out STD_LOGIC;
        cpu_read      : out STD_LOGIC;

        cpu_rdata     : in  STD_LOGIC_VECTOR(31 downto 0);
        cpu_ready     : in  STD_LOGIC
    );

end axi_satoc_bridge;

architecture Behavioral of axi_satoc_bridge is

begin

    ----------------------------------------------------------------
    -- Temporary Pass-through Bridge
    ----------------------------------------------------------------

    cpu_address <= axi_address;
    cpu_wdata   <= axi_wdata;
    cpu_write   <= axi_write;
    cpu_read    <= axi_read;

    axi_rdata   <= cpu_rdata;
    axi_ready   <= cpu_ready;

end Behavioral;
