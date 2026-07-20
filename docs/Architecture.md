
# Satellite-on-a-Chip Architecture

## Overview

The proposed Satellite-on-a-Chip integrates all digital satellite subsystems inside a single FPGA.

The architecture follows a modular design philosophy allowing each subsystem to communicate through a common system bus.

---

# Major Components

## RISC-V Processor

Responsible for

- System control
- Task scheduling
- Data processing
- Communication management

---

## OBDH

Responsibilities

- Data collection
- Memory management
- Payload management
- Housekeeping

---

## TT&C

Responsible for

- Telemetry packet generation
- Telecommand decoding
- Ground communication

---

## EPS

Responsible for

- Battery monitoring
- Voltage monitoring
- Current monitoring
- Power status

---

## Memory

Stores

- Telemetry
- Commands
- Configuration
- Processor instructions

---

## Communication Interfaces

- UART
- SPI
- I2C
- GPIO
- CAN
- RS232
- RS485
- SpaceWire

---

# Data Flow

Ground Station

↓

TT&C

↓

RISC-V

↓

OBDH

↓

EPS

↓

Memory

↓

Communication Interfaces

---

# Design Goals

- Modular
- Scalable
- Reusable
- FPGA optimized
- Low power
- Reliable
