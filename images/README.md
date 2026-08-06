# Images

## Overview

This folder contains screenshots, diagrams, and implementation results captured during the development of the **Satellite-on-a-Chip (SAToC)** project using **AMD Vivado Design Suite 2025.2**.

These images provide visual evidence of the FPGA design flow, implementation, and timing analysis performed on the **PYNQ-Z2** development board.

---

## Contents

### BlockDesign.png
Screenshot of the Vivado IP Integrator block design showing the integration of:
- NEORV32 RISC-V Processor
- SAToC Processor Subsystem
- AXI SmartConnect
- Clock Wizard
- Processor System Reset
- SAToC AXI Peripheral

---

### SynthesizedDesign.png
Screenshot of the synthesized FPGA design after successful RTL synthesis.

---

### ImplementedDesign.png
Device placement after FPGA implementation, showing the physical mapping of the design onto the **XC7Z020-1CLG400C** FPGA.

---

### Utilization.png
Resource utilization report summarizing FPGA resource consumption, including:
- Slice LUTs
- Slice Registers
- Slices
- Block RAM
- Clock Buffers
- I/O Resources

---

### Timing.png
Timing analysis report demonstrating successful timing closure with all user-defined timing constraints satisfied.

---

### satoc_architecture.drawio
Editable Draw.io system architecture diagram illustrating the high-level SAToC architecture and subsystem interactions.

---

## Development Environment

- **Development Board:** PYNQ-Z2
- **FPGA Device:** Xilinx Zynq-7000 XC7Z020-1CLG400C
- **Design Suite:** AMD Vivado Design Suite 2025.2
- **Hardware Description Language:** VHDL
