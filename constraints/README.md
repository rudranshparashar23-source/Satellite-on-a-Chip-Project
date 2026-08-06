# Constraints

This folder contains the FPGA constraint files used for the Satellite-on-a-Chip (SAToC) implementation.

## Included Files

- **satoc_system.xdc** (or replace with your actual XDC filename)

## Description

The XDC (Xilinx Design Constraints) file defines the hardware constraints required for FPGA implementation, including:

- Pin assignments
- Clock definitions
- I/O standards
- Timing constraints

The constraints were used during synthesis, implementation, and bitstream generation in AMD Vivado Design Suite 2025.2.

## Target Hardware

- **Board:** PYNQ-Z2
- **FPGA Device:** Xilinx Zynq-7000 XC7Z020-1CLG400C
