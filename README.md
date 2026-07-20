# 🛰️ Satellite-on-a-Chip (SAToC) Project

## Overview

This repository contains the design and implementation of a **Satellite-on-a-Chip (SAToC)** architecture developed as part of an FPGA-based embedded systems project.

The goal of the project is to integrate the major digital subsystems of a small satellite into a single FPGA platform using a **RISC-V processor** and modular hardware architecture.

---

## Project Objectives

- Design an FPGA-based Satellite-on-a-Chip architecture.
- Integrate a RISC-V processor.
- Implement On-Board Data Handling (OBDH).
- Implement Telemetry, Tracking and Command (TT&C).
- Implement Electrical Power System (EPS) monitoring.
- Develop communication controllers (UART, SPI, I²C, GPIO, CAN, RS-232, RS-485, SpaceWire).
- Verify functionality using VHDL simulation.
- Demonstrate complete system integration.

---

## System Architecture

The proposed architecture consists of the following major components:

- 🖥️ RISC-V Processor
- 📡 TT&C Module
- 💾 OBDH Module
- 🔋 EPS Module
- 🧠 Memory Subsystem
- 🔌 Communication Interfaces
- 🚌 System Bus Interconnect

A detailed architecture description is available in:

```
docs/Architecture.md
```

---

## Repository Structure

```
Satellite-on-a-Chip-Project
│
├── docs/
│   ├── FPGA_Selection.md
│   ├── Architecture.md
│   ├── Implementation_Plan.md
│   └── Test_Plan.md
│
├── rtl/
│   ├── riscv/
│   ├── obdh/
│   ├── ttc/
│   ├── eps/
│   ├── interfaces/
│   └── top/
│
├── tb/
│
├── simulation/
│
├── images/
│
└── constraints/
```

---

## Development Tools

- Xilinx Vivado
- VHDL
- Vivado Simulator
- GitHub
- NEORV32 RISC-V Processor

---

## Project Status

| Task | Status |
|------|--------|
| Repository Setup | ✅ Complete |
| Documentation | 🔄 In Progress |
| FPGA Selection | ✅ Complete |
| Architecture Design | 🔄 In Progress |
| RTL Development | ⏳ Pending |
| Testbench Development | ⏳ Pending |
| System Integration | ⏳ Pending |
| Simulation | ⏳ Pending |
| Final Validation | ⏳ Pending |

---

## References

- Satellite-on-a-Chip Project Assignment
- SpaceLab SAToC Research
- NEORV32 RISC-V Processor
- Xilinx Vivado Design Suite

---

## Author

**Rudransh Parashar**

B.Tech Electronics and Communication Engineering

---
