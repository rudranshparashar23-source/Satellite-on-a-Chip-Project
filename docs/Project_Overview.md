# Project Overview

## Introduction

The Satellite-on-a-Chip (SAToC) project demonstrates the integration of multiple satellite digital subsystems into a single FPGA platform. The implementation is based on the NEORV32 RISC-V soft processor and targets the PYNQ-Z2 development board.

## Objectives

- Develop a modular FPGA-based satellite architecture.
- Integrate custom hardware modules using an AXI interconnect.
- Demonstrate FPGA implementation using AMD Vivado 2025.2.
- Validate the design through synthesis, implementation, and timing analysis.

## Target Hardware

- Development Board: PYNQ-Z2
- FPGA Device: Xilinx Zynq-7000 XC7Z020-1CLG400C

## Main Components

- NEORV32 RISC-V Processor
- SAToC AXI Peripheral
- AXI SmartConnect
- Clock Wizard
- Processor System Reset
- OBDH Module
- TT&C Module
- EPS Module
- Memory Controller

## Current Status

- ✅ RTL Design Completed
- ✅ Block Design Completed
- ✅ Synthesis Completed
- ✅ Implementation Completed
- ✅ Timing Constraints Met
- ✅ Bitstream Generated
