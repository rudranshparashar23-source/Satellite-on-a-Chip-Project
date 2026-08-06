# RTL Source Code

## Overview

This folder contains the Register Transfer Level (RTL) VHDL source files developed for the **Satellite-on-a-Chip (SAToC)** project.

The RTL implements the major digital subsystems of the satellite platform and integrates them into a complete FPGA-based system targeting the **PYNQ-Z2** development board.

---

## Directory Structure

### eps/
Contains the Electrical Power System (EPS) module responsible for:
- Battery monitoring
- Housekeeping data generation
- Power status monitoring

---

### obdh/
Contains the On-Board Data Handling (OBDH) module responsible for:
- Sensor data acquisition
- Data validation
- Memory interface

---

### ttc/
Contains the Telemetry, Tracking and Command (TT&C) module responsible for:
- Command reception
- Telemetry generation
- Command validation

---

### top/
Contains the top-level SAToC integration module that connects all hardware subsystems into a single FPGA design.

---

## Additional RTL Modules

### memory_controller.vhd
Implements the on-chip memory interface used for data storage and retrieval.

### satoc_processor_subsystem.vhd
Integrates the **NEORV32 RISC-V processor** with the SAToC hardware peripherals.

### axi_satoc_bridge.vhd
Implements the AXI bridge used for communication between the processor subsystem and custom hardware modules.

### satoc_bus_interface.vhd
Provides the internal communication interface between SAToC subsystems using the AXI-based architecture.

---

## Development Environment

- **Language:** VHDL
- **Development Tool:** AMD Vivado Design Suite 2025.2
- **Target Board:** PYNQ-Z2
- **FPGA Device:** Xilinx Zynq-7000 XC7Z020-1CLG400C

---

## Design Flow

The RTL modules were used for:

- RTL Design
- IP Integration
- Block Design
- Functional Integration
- Synthesis
- FPGA Implementation
- Timing Verification
- Bitstream Generation

---

## Architecture

The RTL implementation integrates the following SAToC subsystems:

- NEORV32 RISC-V Processor
- On-Board Data Handling (OBDH)
- Telemetry, Tracking and Command (TT&C)
- Electrical Power System (EPS)
- Memory Controller
- AXI Communication Infrastructure
- Top-Level System Integration
