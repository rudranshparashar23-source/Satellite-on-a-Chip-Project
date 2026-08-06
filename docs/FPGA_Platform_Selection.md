# FPGA Platform Selection

## Overview

The selection of an FPGA platform is a critical design decision for the Satellite-on-a-Chip (SAToC) project. The chosen platform should provide sufficient programmable logic resources, support modern development tools, and allow integration of a soft-core processor with custom hardware peripherals.

---

## Selected Platform

**Development Board:** PYNQ-Z2

**FPGA Device:** Xilinx Zynq-7000 XC7Z020-1CLG400C

---

## Reasons for Selection

The PYNQ-Z2 development board was selected because it offers:

- Sufficient programmable logic resources for the SAToC architecture.
- Support for custom VHDL-based hardware development.
- Compatibility with AMD Vivado Design Suite 2025.2.
- Support for AXI-based hardware integration.
- Compatibility with the NEORV32 RISC-V soft processor.
- A low-cost and widely used academic FPGA platform.

---

## Development Environment

| Component | Description |
|-----------|-------------|
| FPGA Board | PYNQ-Z2 |
| FPGA Device | XC7Z020-1CLG400C |
| Design Tool | AMD Vivado Design Suite 2025.2 |
| Hardware Language | VHDL |
| Processor | NEORV32 RISC-V |

---

## Conclusion

The PYNQ-Z2 development board provides an appropriate balance of programmable logic resources, development tool support, and hardware flexibility for implementing the proposed Satellite-on-a-Chip architecture.
