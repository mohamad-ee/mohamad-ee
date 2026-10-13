# Lab 01 — Top-Down Hierarchical Design

Define a top-level design and UART interfaces before implementing their internal logic. This exercise focuses on hierarchy, module instantiation, and port connections.

## Modules

| Source | Role |
| --- | --- |
| [chip_top.sv](rtl/chip_top.sv) | Connects the top-level ports to the UART transmit and receive stubs. |
| [uart_tx.sv](rtl/uart_tx.sv) | Declares the transmit-side interface. |
| [uart_rx.sv](rtl/uart_rx.sv) | Declares the receive-side interface. |

The `switches` input feeds the transmitter's `data_in`; the receiver's `data_out` connects to `leds`. Both stubs share `clock` and `reset`.

## Scope

The UART modules are intentionally empty stubs. The data ports are one bit wide, and `push_buttons` is not connected internally. The lab establishes the architecture and interfaces; UART transmit/receive behavior is outside its scope.

## Inspect in Vivado

1. Create a new RTL project and add the three `.sv` files in `rtl/` as design sources.
2. Set the design top to `chip_top`.
3. Open the elaborated design and inspect the hierarchy and connections.

No testbench or board constraints are included for this interface exercise.

## Report

[Read the lab report](docs/Lab1_Report.pdf), including the interface tables and elaborated-design figure.

[All labs](../README.md)
