# FPGA Platform Selection

## Project Objective

The objective of this project is to design and implement a **Satellite-on-a-Chip (SAToC)** architecture capable of integrating the primary digital subsystems of a satellite into a single FPGA platform.

The architecture integrates:

- On-Board Data Handling (OBDH)
- Telemetry, Tracking and Command (TT&C)
- Electrical Power System (EPS)
- Memory Subsystem
- Communication Interfaces
- NEORV32 RISC-V Processor

The selected FPGA platform must provide sufficient programmable logic resources, memory, communication interfaces, and compatibility with modern FPGA development tools while supporting future expansion of the system.

---

# Candidate FPGA Platforms

## 1. Xilinx Artix-7

### Advantages

- Low power consumption
- Excellent Vivado IDE support
- Supports VHDL and Verilog
- Suitable for medium-scale FPGA designs
- Large developer community

### Disadvantages

- FPGA-only platform
- Limited onboard peripherals compared to SoC-based development boards

---

## 2. Xilinx Kintex-7

### Advantages

- High logic density
- More DSP slices
- Suitable for computationally intensive applications

### Disadvantages

- Higher cost
- Resources exceed the requirements of this project

---

## 3. PYNQ-Z2 (Selected)

### Advantages

- Based on the Xilinx Zynq-7020 SoC
- Combines Programmable Logic (PL) with a dual-core ARM Cortex-A9 Processing System (PS)
- Fully supported by Xilinx Vivado Design Suite
- Supports VHDL, Verilog, and Vivado IP Integrator
- Compatible with the NEORV32 RISC-V soft processor
- 512 MB DDR3 memory
- Gigabit Ethernet connectivity
- USB OTG interface
- HDMI Input/Output
- Arduino and PMOD expansion headers
- Large user community and extensive documentation
- Suitable for embedded systems and FPGA research projects

### Disadvantages

- More complex than FPGA-only development boards
- Requires additional configuration when using the Processing System

---

# Selected FPGA Platform

## PYNQ-Z2

The **PYNQ-Z2** development board is selected as the implementation platform for the proposed **Satellite-on-a-Chip (SAToC)** architecture.

The board offers an excellent balance of programmable logic resources, embedded processing capability, memory, and communication interfaces required for integrating multiple satellite subsystems into a single platform.

The Programmable Logic (PL) is used to implement the custom satellite hardware modules, including the **NEORV32 RISC-V processor**, OBDH, TT&C, EPS, memory controller, and communication peripherals. The Processing System (PS) provides opportunities for future software development, debugging, and hardware/software co-design.

The PYNQ-Z2 is fully compatible with the **Xilinx Vivado Design Suite**, making it an ideal platform for FPGA development, simulation, synthesis, implementation, and hardware validation.

---

# Development Environment

| Tool | Purpose |
|------|---------|
| Vivado Design Suite | Design, Synthesis, Implementation |
| Vivado Simulator | Functional Verification |
| GitHub | Version Control |
| VHDL | Hardware Description Language |
| NEORV32 | RISC-V Soft Processor |

---

# Target FPGA Architecture

The proposed implementation includes the following hardware modules:

- NEORV32 RISC-V Processor
- On-Board Data Handling (OBDH)
- Telemetry, Tracking and Command (TT&C)
- Electrical Power System (EPS)
- Memory Controller
- UART Controller
- SPI Controller
- I²C Controller
- GPIO Interface
- Bus Interconnect
- Clock and Reset Management

---

# PYNQ-Z2 Hardware Specifications

| Feature | Specification |
|---------|---------------|
| Development Board | PYNQ-Z2 |
| SoC Device | Xilinx Zynq-7020 XC7Z020-1CLG400C |
| Processing System | Dual-core ARM Cortex-A9 |
| Programmable Logic | Artix-7 FPGA Fabric |
| Logic Cells | ~85K |
| Block RAM | 560 KB |
| DSP Slices | 220 |
| DDR3 Memory | 512 MB |
| Ethernet | Gigabit Ethernet |
| USB | USB OTG |
| Expansion Interfaces | Arduino Header, PMOD Connectors |

---

# Conclusion

The **PYNQ-Z2** development board satisfies the functional and performance requirements of the proposed **Satellite-on-a-Chip (SAToC)** architecture. Its combination of FPGA programmable logic, embedded ARM processing system, memory resources, and communication interfaces provides a scalable platform for integrating the satellite subsystems.

The board's compatibility with the **Xilinx Vivado Design Suite** and support for the **NEORV32 RISC-V processor** make it an excellent choice for the design, implementation, simulation, and validation of the proposed FPGA-based satellite system.
