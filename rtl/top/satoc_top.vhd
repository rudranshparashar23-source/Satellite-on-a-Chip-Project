library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity satoc_top is
    Port (

        clk     : in STD_LOGIC;
        reset   : in STD_LOGIC;

        sensor_data     : in STD_LOGIC_VECTOR(7 downto 0);

        tc_data         : in STD_LOGIC_VECTOR(7 downto 0);

        battery_voltage : in STD_LOGIC_VECTOR(7 downto 0);
        battery_current : in STD_LOGIC_VECTOR(7 downto 0);

        telemetry       : out STD_LOGIC_VECTOR(7 downto 0);

        power_ok        : out STD_LOGIC

    );
end satoc_top;

architecture Structural of satoc_top is

---------------------------------------------------------
-- OBDH
---------------------------------------------------------

component obdh_top

Port(

clk         : in STD_LOGIC;
reset       : in STD_LOGIC;
sensor_data : in STD_LOGIC_VECTOR(7 downto 0);
mem_data    : out STD_LOGIC_VECTOR(7 downto 0);
data_valid  : out STD_LOGIC

);

end component;

---------------------------------------------------------
-- TT&C
---------------------------------------------------------

component ttc_top

Port(

clk        : in STD_LOGIC;
reset      : in STD_LOGIC;
tc_data    : in STD_LOGIC_VECTOR(7 downto 0);
telemetry  : out STD_LOGIC_VECTOR(7 downto 0);
tc_valid   : out STD_LOGIC

);

end component;

---------------------------------------------------------
-- EPS
---------------------------------------------------------

component eps_top

Port(

clk             : in STD_LOGIC;
reset           : in STD_LOGIC;
battery_voltage : in STD_LOGIC_VECTOR(7 downto 0);
battery_current : in STD_LOGIC_VECTOR(7 downto 0);
power_ok        : out STD_LOGIC;
hk_data         : out STD_LOGIC_VECTOR(15 downto 0)

);

end component;

---------------------------------------------------------
-- Internal Signals
---------------------------------------------------------

signal mem_data_sig : STD_LOGIC_VECTOR(7 downto 0);

signal data_valid_sig : STD_LOGIC;

signal tc_valid_sig : STD_LOGIC;

signal hk_sig : STD_LOGIC_VECTOR(15 downto 0);

begin

---------------------------------------------------------
-- Instantiate OBDH
---------------------------------------------------------

OBDH_UNIT : obdh_top

port map(

clk,
reset,
sensor_data,
mem_data_sig,
data_valid_sig

);

---------------------------------------------------------
-- Instantiate TT&C
---------------------------------------------------------

TTC_UNIT : ttc_top

port map(

clk,
reset,
tc_data,
telemetry,
tc_valid_sig

);

---------------------------------------------------------
-- Instantiate EPS
---------------------------------------------------------

EPS_UNIT : eps_top

port map(

clk,
reset,
battery_voltage,
battery_current,
power_ok,
hk_sig

);

end Structural;
