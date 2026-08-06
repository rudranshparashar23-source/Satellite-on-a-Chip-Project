library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity satoc_processor_subsystem is
    Port (

        ----------------------------------------------------------------
        -- Clock & Reset
        ----------------------------------------------------------------
        clk            : in  STD_LOGIC;
        reset          : in  STD_LOGIC;

        ----------------------------------------------------------------
        -- AXI Bridge Interface
        ----------------------------------------------------------------
        axi_address    : in  STD_LOGIC_VECTOR(31 downto 0);
        axi_wdata      : in  STD_LOGIC_VECTOR(31 downto 0);
        axi_write      : in  STD_LOGIC;
        axi_read       : in  STD_LOGIC;

        axi_rdata      : out STD_LOGIC_VECTOR(31 downto 0);
        axi_ready      : out STD_LOGIC;

        ----------------------------------------------------------------
        -- SAToC Connections
        ----------------------------------------------------------------
        battery_voltage : in STD_LOGIC_VECTOR(7 downto 0);
        battery_current : in STD_LOGIC_VECTOR(7 downto 0);

        telemetry_data  : in STD_LOGIC_VECTOR(7 downto 0);
        telemetry_valid : in STD_LOGIC;

        memory_data     : in STD_LOGIC_VECTOR(7 downto 0);

        sensor_data     : out STD_LOGIC_VECTOR(7 downto 0);
        sensor_valid    : out STD_LOGIC;

        command_data    : out STD_LOGIC_VECTOR(7 downto 0);
        command_valid   : out STD_LOGIC

    );
end satoc_processor_subsystem;

architecture Structural of satoc_processor_subsystem is

signal cpu_address_sig : STD_LOGIC_VECTOR(31 downto 0);
signal cpu_wdata_sig   : STD_LOGIC_VECTOR(31 downto 0);
signal cpu_write_sig   : STD_LOGIC;
signal cpu_read_sig    : STD_LOGIC;

signal cpu_rdata_sig   : STD_LOGIC_VECTOR(31 downto 0);
signal cpu_ready_sig   : STD_LOGIC;

begin

------------------------------------------------------------
-- AXI Bridge
------------------------------------------------------------

BRIDGE_INST : entity work.axi_satoc_bridge
port map(

    clk => clk,
    reset => reset,

    axi_address => axi_address,
    axi_wdata   => axi_wdata,
    axi_write   => axi_write,
    axi_read    => axi_read,

    axi_rdata   => axi_rdata,
    axi_ready   => axi_ready,

    cpu_address => cpu_address_sig,
    cpu_wdata   => cpu_wdata_sig,
    cpu_write   => cpu_write_sig,
    cpu_read    => cpu_read_sig,

    cpu_rdata   => cpu_rdata_sig,
    cpu_ready   => cpu_ready_sig
);

------------------------------------------------------------
-- SAToC Bus Interface
------------------------------------------------------------

BUS_INST : entity work.satoc_bus_interface
port map(

    clk => clk,
    reset => reset,

    cpu_address => cpu_address_sig,
    cpu_wdata   => cpu_wdata_sig,
    cpu_write   => cpu_write_sig,
    cpu_read    => cpu_read_sig,

    cpu_rdata   => cpu_rdata_sig,
    cpu_ready   => cpu_ready_sig,

    sensor_data => sensor_data,
    sensor_valid => sensor_valid,

    command_data => command_data,
    command_valid => command_valid,

    battery_voltage => battery_voltage,
    battery_current => battery_current,

    telemetry_data => telemetry_data,
    telemetry_valid => telemetry_valid,

    memory_data => memory_data

);

end Structural;
