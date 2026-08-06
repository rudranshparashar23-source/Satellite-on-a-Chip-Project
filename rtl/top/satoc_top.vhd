library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity satoc_top is
    Port (
        clk              : in  STD_LOGIC;
        reset            : in  STD_LOGIC;

        -- OBDH Inputs
        sensor_data      : in  STD_LOGIC_VECTOR(7 downto 0);
        data_valid       : in  STD_LOGIC;

        -- TT&C Inputs
        command_in       : in  STD_LOGIC_VECTOR(7 downto 0);
        command_valid    : in  STD_LOGIC;

        -- EPS Inputs
        battery_voltage  : in  STD_LOGIC_VECTOR(7 downto 0);
        battery_current  : in  STD_LOGIC_VECTOR(7 downto 0);

        -- Outputs
        read_data        : out STD_LOGIC_VECTOR(7 downto 0);
        telemetry_out    : out STD_LOGIC_VECTOR(7 downto 0);
        telemetry_valid  : out STD_LOGIC;
        power_status     : out STD_LOGIC;
        hk_data          : out STD_LOGIC_VECTOR(15 downto 0);
        memory_valid : out STD_LOGIC
    );
end satoc_top;

architecture Structural of satoc_top is

    ------------------------------------------------------------------
    -- Internal Signals
    ------------------------------------------------------------------

    signal memory_data_sig      : STD_LOGIC_VECTOR(7 downto 0);
    signal memory_write_sig     : STD_LOGIC;
    signal address_sig          : STD_LOGIC_VECTOR(7 downto 0);
    
    signal memory_valid_sig : STD_LOGIC;

    signal telemetry_out_sig    : STD_LOGIC_VECTOR(7 downto 0);
    signal telemetry_valid_sig  : STD_LOGIC;

    signal hk_data_sig          : STD_LOGIC_VECTOR(15 downto 0);
    signal power_status_sig     : STD_LOGIC;
    
    ------------------------------------------------------------------
-- Processor Subsystem Signals
------------------------------------------------------------------

signal cpu_axi_address  : STD_LOGIC_VECTOR(31 downto 0);
signal cpu_axi_wdata    : STD_LOGIC_VECTOR(31 downto 0);
signal cpu_axi_write    : STD_LOGIC;
signal cpu_axi_read     : STD_LOGIC;

signal cpu_axi_rdata    : STD_LOGIC_VECTOR(31 downto 0);
signal cpu_axi_ready    : STD_LOGIC;

signal sensor_data_cpu  : STD_LOGIC_VECTOR(7 downto 0);
signal sensor_valid_cpu : STD_LOGIC;

signal command_data_cpu : STD_LOGIC_VECTOR(7 downto 0);
signal command_valid_cpu: STD_LOGIC;

begin

    ------------------------------------------------------------------
    -- Fixed Memory Address
    ------------------------------------------------------------------

    --address_sig <= (others => '0');

    ------------------------------------------------------------------
    -- OBDH
    ------------------------------------------------------------------

OBDH_INST : entity work.obdh_top
    port map (
        clk              => clk,
        reset            => reset,

        sensor_data      => sensor_data,
        data_valid       => data_valid,

        telemetry_in     => telemetry_out_sig,
        telemetry_valid  => telemetry_valid_sig,

        hk_data          => hk_data_sig,

        memory_address   => address_sig,
        memory_data      => memory_data_sig,
        memory_write     => memory_write_sig
    );
    ------------------------------------------------------------------
    -- Memory Controller
    ------------------------------------------------------------------

 MEM_INST : entity work.memory_controller
    port map (
        clk         => clk,
        reset       => reset,
        address     => address_sig,
        write_data  => memory_data_sig,
        write_en    => memory_write_sig,
        read_data   => read_data,
        data_valid  => memory_valid_sig
    );
    ------------------------------------------------------------------
    -- TT&C
    ------------------------------------------------------------------

    TTC_INST : entity work.ttc
        port map (
            clk              => clk,
            reset            => reset,
            command_in       => command_in,
            command_valid    => command_valid,
            telemetry_out    => telemetry_out_sig,
            telemetry_valid  => telemetry_valid_sig
        );

    ------------------------------------------------------------------
    -- EPS
    ------------------------------------------------------------------

    EPS_INST : entity work.eps
        port map (
            clk              => clk,
            reset            => reset,
            battery_voltage  => battery_voltage,
            battery_current  => battery_current,
            power_status     => power_status_sig,
            hk_data          => hk_data_sig
        );

    ------------------------------------------------------------------
    -- Output Connections
    ------------------------------------------------------------------

    telemetry_out   <= telemetry_out_sig;
    telemetry_valid <= telemetry_valid_sig;

    power_status    <= power_status_sig;
    hk_data         <= hk_data_sig;
    memory_valid <= memory_valid_sig;

end Structural;
