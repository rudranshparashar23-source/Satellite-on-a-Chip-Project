# Vivado Implementation

## Overview

The SAToC hardware platform was developed and verified using **AMD Vivado Design Suite 2025.2**. The implementation followed the standard FPGA development flow from project creation to hardware export.

---

## Design Flow

The implementation process consisted of the following stages:

1. Project Creation
2. Block Design Development
3. IP Integration
4. RTL Integration
5. Design Validation
6. Synthesis
7. Implementation
8. Bitstream Generation
9. Hardware Export (.XSA)

---

## IP Cores Used

The following Vivado IP cores were integrated into the design:

- NEORV32 RISC-V Processor
- AXI SmartConnect
- Clock Wizard
- Processor System Reset
- SAToC AXI Peripheral

---

## Custom RTL Modules

The following custom VHDL modules were implemented:

- satoc_top.vhd
- obdh.vhd
- eps.vhd
- ttc.vhd
- memory_controller.vhd
- satoc_bus_interface.vhd

---

## Implementation Results

The implementation completed successfully.

Achievements:

- Successful RTL synthesis
- Successful placement and routing
- Timing constraints satisfied
- FPGA bitstream generated successfully
- Hardware exported as XSA

---

## Generated Reports

The following reports were generated during implementation:

- Synthesis Report
- Utilization Report
- Timing Summary
- Implemented Design
- Bitstream Generation Report

The corresponding screenshots are available in the **images** folder.
