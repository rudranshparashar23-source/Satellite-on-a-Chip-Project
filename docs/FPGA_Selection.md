# FPGA Platform Selection

## Project Objective

The objective of this project is to design and implement a **Satellite-on-a-Chip (SAToC)** architecture capable of integrating the primary digital subsystems of a satellite into a single FPGA device.

The architecture integrates:

- On-Board Data Handling (OBDH)
- Telemetry, Tracking and Command (TT&C)
- Electrical Power System (EPS)
- Memory subsystem
- Communication interfaces
- RISC-V Processor

The FPGA platform must provide sufficient logic resources, memory, and I/O interfaces while maintaining compatibility with modern FPGA development tools.

---

# Candidate FPGA Platforms

## 1. Xilinx Artix-7

### Advantages

- Excellent Vivado IDE support
- Low cost
- Large community support
- Supports VHDL and Verilog
- Compatible with open-source RISC-V processors
- Suitable for educational and research projects
- Low power consumption

### Disadvantages

- Fewer logic cells compared to Kintex and Virtex families
- Limited DSP resources

---

## 2. Xilinx Kintex-7

### Advantages

- Higher logic density
- Better DSP performance
- Suitable for larger SoC implementations

### Disadvantages

- Higher cost
- Not necessary for this project

---

## 3. Xilinx Zynq-7000

### Advantages

- ARM Cortex-A9 processor
- FPGA programmable logic
- High processing capability
- Linux support

### Disadvantages

- More complex software development
- Increased project complexity

---

# Selected FPGA

## Xilinx Artix-7

The Xilinx Artix-7 FPGA is selected because it offers the best balance between:

- Logic resources
- Cost
- Performance
- Power consumption
- Ease of development

The Artix-7 device is fully compatible with Xilinx Vivado Design Suite and supports implementation of soft-core processors such as NEORV32.

---

# Development Environment

| Tool | Purpose |
|-------|----------|
| Vivado | Design and Synthesis |
| GitHub | Version Control |
| VHDL | Hardware Description |
| Vivado Simulator | Functional Verification |

---

# Expected FPGA Resources

The proposed design is expected to contain:

- RISC-V Processor
- OBDH Module
- TT&C Module
- EPS Module
- UART Controller
- SPI Controller
- I2C Controller
- GPIO
- Memory Controller
- Bus Interconnect

---

# Conclusion

The Xilinx Artix-7 FPGA satisfies the functional and performance requirements of the proposed Satellite-on-a-Chip architecture and provides an ideal platform for development, simulation, and validation.
