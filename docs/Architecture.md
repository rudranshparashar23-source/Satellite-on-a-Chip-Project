# Satellite-on-a-Chip Architecture

## Overview

The proposed Satellite-on-a-Chip (SAToC) architecture integrates the primary digital subsystems of a satellite into a single FPGA platform.

The design is based on a modular architecture centered around a RISC-V processor that communicates with all satellite subsystems through a common system bus. External analog and RF hardware such as antennas, RF amplifiers, filters, and power conversion circuits remain outside the FPGA.

---

# Design Objectives

The proposed architecture is designed to achieve the following objectives:

- Integrate multiple satellite subsystems into one FPGA.
- Reduce PCB complexity.
- Improve system reliability.
- Support modular hardware development.
- Enable future expansion.
- Simplify testing and validation.

---

# Overall Architecture

```
                       +-------------------------+
                       |     Ground Station      |
                       +-----------+-------------+
                                   |
                              Telecommand
                                   |
                        Telemetry Data
                                   |
                      +------------v------------+
                      |        TT&C Module      |
                      +------------+------------+
                                   |
                                   |
        +--------------------------+--------------------------+
        |                                                     |
+-------v--------+                              +-------------v-------------+
|      OBDH      |<-------- System Bus -------->|      RISC-V Processor     |
+-------+--------+                              +-------------+-------------+
        |                                                     |
        |                                                     |
+-------v--------+                              +-------------v-------------+
|      Memory    |                              |            EPS            |
+----------------+                              +-------------+-------------+
                                                              |
                                                   Power Status / Sensors
                                                              |
                                               External Battery & Solar Panels

```

---

# Major Components

## 1. RISC-V Processor

The RISC-V processor serves as the central controller of the Satellite-on-a-Chip.

Responsibilities include:

- Task scheduling
- Telecommand execution
- Telemetry management
- Memory access
- Communication control
- System monitoring

Recommended Core:

- NEORV32

---

## 2. OBDH (On-Board Data Handling)

The OBDH subsystem is responsible for:

- Housekeeping data
- Payload data management
- Memory management
- Sensor data collection
- Data routing

---

## 3. TT&C (Telemetry, Tracking and Command)

The TT&C subsystem performs:

- Telecommand reception
- Packet decoding
- Telemetry packet generation
- Communication with ground station

---

## 4. EPS (Electrical Power System)

The EPS subsystem monitors:

- Battery voltage
- Battery current
- Solar panel voltage
- System power status
- Fault detection

---

## 5. Memory

The memory subsystem stores:

- Program code
- Telemetry packets
- Telecommands
- Configuration data
- Housekeeping information

---

## 6. Communication Interfaces

The proposed architecture supports:

- UART
- SPI
- I²C
- GPIO
- CAN
- RS-232
- RS-485
- SpaceWire

These interfaces allow communication with external sensors, payloads, and satellite subsystems.

---

# Data Flow

Ground Station

↓

TT&C

↓

RISC-V Processor

↓

OBDH

↓

Memory

↓

EPS

↓

Telemetry

↓

Ground Station

---

# Design Advantages

- Modular architecture
- Scalable design
- FPGA optimized
- Low power operation
- Easy verification
- Future expandable
- Suitable for CubeSat platforms

---

# Future Work

Future development includes:

- HDL implementation
- FPGA synthesis
- Testbench development
- Functional simulation
- Hardware validation
