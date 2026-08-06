# System Architecture

```text
                 +----------------------+
                 |    NEORV32 CPU       |
                 |   (RISC-V Processor) |
                 +----------+-----------+
                            |
                      AXI Interconnect
                            |
        +---------+---------+---------+---------+
        |         |         |         |         |
      OBDH      TT&C      Memory      EPS    GPIO
```

## Overview

The Satellite-on-a-Chip (SAToC) architecture integrates multiple satellite digital subsystems into a unified FPGA-based hardware platform. The design follows a modular architecture centered around the NEORV32 RISC-V soft processor and uses an AXI-based interconnect for communication between processing and peripheral modules.

---

## Hardware Architecture

The implemented hardware consists of the following major components:

- NEORV32 RISC-V Soft Processor
- AXI SmartConnect
- SAToC AXI Peripheral
- Clock Wizard
- Processor System Reset
- On-Board Data Handling (OBDH) Module
- Telemetry, Tracking and Command (TT&C) Module
- Electrical Power System (EPS) Module
- Memory Controller

---

## Data Flow

The NEORV32 processor communicates with the custom SAToC AXI Peripheral through the AXI SmartConnect interconnect. The SAToC AXI Peripheral provides access to the implemented satellite subsystems.

The Clock Wizard supplies the system clock, while the Processor System Reset IP ensures reliable initialization of the complete hardware system.

---

## Implemented Modules

### NEORV32 Processor
Provides the main processing capability and controls the satellite subsystems.

### SAToC AXI Peripheral
Acts as the interface between the processor and custom hardware modules.

### OBDH Module
Handles onboard data collection and routing.

### TT&C Module
Processes commands and generates telemetry information.

### EPS Module
Monitors power-related parameters such as battery voltage and current.

### Memory Controller
Manages read and write operations for internal data storage.

---

## Implementation Status

- RTL Design Completed
- Block Design Completed
- Synthesis Completed
- Implementation Completed
- Bitstream Successfully Generated
- Hardware Exported (.XSA)
