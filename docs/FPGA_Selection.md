# FPGA Platform Selection

## Objective

The objective of this project is to implement a Satellite-on-a-Chip (SAToC) architecture on an FPGA platform capable of integrating the digital subsystems of a small satellite.

---

## Candidate FPGA Platforms

| FPGA | Vendor | Advantages | Disadvantages |
|-------|--------|------------|---------------|
| Artix-7 | Xilinx | Low cost, excellent Vivado support, suitable for RISC-V | Limited logic compared to larger devices |
| Kintex-7 | Xilinx | Higher performance | More expensive |
| Zynq-7000 | Xilinx | ARM processor + FPGA fabric | More complex architecture |

---

## Selected Platform

**Xilinx Artix-7 FPGA**

### Reasons

- Supported by Xilinx Vivado Design Suite.
- Sufficient logic resources for implementing the proposed Satellite-on-a-Chip architecture.
- Compatible with open-source RISC-V processor cores such as NEORV32.
- Suitable for implementing communication controllers including UART, SPI, I2C, GPIO, CAN, RS-232 and RS-485.
- Widely used in academic and research laboratories.

---

## Development Software

- Xilinx Vivado
- VHDL
- GitHub
- Vivado Simulator

---

## Conclusion

The Xilinx Artix-7 FPGA is selected because it provides an excellent balance between logic resources, development tools, cost, and ease of implementation for the proposed Satellite-on-a-Chip architecture.
