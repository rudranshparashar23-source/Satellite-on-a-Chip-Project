
# Satellite-on-a-Chip System Block Diagram

## Overview

The following block diagram illustrates the proposed FPGA-based Satellite-on-a-Chip architecture.

```
                                    +----------------------+
                                    |    Ground Station    |
                                    +----------+-----------+
                                               |
                                  Telemetry / Telecommand
                                               |
                                    +----------v-----------+
                                    |     TT&C Module      |
                                    +----------+-----------+
                                               |
                  +----------------------------+----------------------------+
                  |                                                         |
          +-------v--------+                                    +-----------v----------+
          |      OBDH      |<---------- System Bus ------------>|    RISC-V Processor  |
          +-------+--------+                                    +-----------+----------+
                  |                                                         |
                  |                                                         |
          +-------v--------+                                    +-----------v----------+
          | Memory System  |                                    |       EPS Module     |
          +-------+--------+                                    +-----------+----------+
                  |                                                         |
                  |                                                         |
          +-------v---------------------------------------------------------v-------+
          |                 Communication Interfaces                          |
          | UART | SPI | I²C | GPIO | CAN | RS-232 | RS-485 | SpaceWire     |
          +------------------------------------------------------------------+
```

## Description

The RISC-V processor acts as the central controller.

The OBDH manages onboard data.

The TT&C subsystem handles communication with the ground station.

The EPS monitors battery and power status.

The communication interfaces connect external payloads and sensors.

## Design Philosophy

- Modular
- Scalable
- Reusable
- FPGA optimized
- Low power
