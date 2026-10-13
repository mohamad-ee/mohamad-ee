# Lab 02 — Behavioral and Structural Eight-Bit Adder

Implement the same unsigned eight-bit addition in two ways and compare their outputs in simulation.

## Design

| Source | Role |
| --- | --- |
| [adder8_behavioral.v](rtl/adder8_behavioral.v) | Uses a combinational arithmetic expression with a nine-bit result. |
| [adder8_structural.v](rtl/adder8_structural.v) | Implements a ripple-carry chain with bit-level sum and carry equations. |
| [chip_top.v](rtl/chip_top.v) | Maps the selected adder to board switches, the center button, and LEDs. |
| [tb_adder8.v](tb/tb_adder8.v) | Applies the same inputs to both adders and displays their outputs. |

Both implementations compute `{cout, sum} = a + b + cin`.

## Directed test cases

| Case | a | b | cin | Expected sum | Expected cout |
| --- | ---: | ---: | ---: | ---: | ---: |
| No carry-out | 3 | 4 | 0 | 7 | 0 |
| Carry-out | 200 | 100 | 0 | 44 | 1 |
| Maximum sum without carry-out | 255 | 0 | 0 | 255 | 0 |
| Maximum total result | 255 | 255 | 1 | 255 | 1 |
| Carry-in propagation | 255 | 0 | 1 | 0 | 1 |

The supplied testbench applies each case for 10 ns and uses `$monitor` for console inspection. Both DUT outputs are also available in the waveform viewer.

## Board mapping

| Board control or output | Function |
| --- | --- |
| `SW[7:0]` | Operand a. |
| `SW[15:8]` | Operand b. |
| Center button (`cin`) | Carry-in. |
| `LED[7:0]` | Eight-bit sum. |
| `LED[8]` | Carry-out. |

The submitted `chip_top.v` instantiates the structural implementation. A commented alternative shows how to select the behavioral implementation.

## Run in Vivado

1. Create a project for `xc7a100tcsg324-1` and add `rtl/*.v` as design sources.
2. Add `tb/tb_adder8.v` as a simulation source.
3. Set design top `chip_top` and simulation top `tb_adder8`.
4. Run behavioral simulation through the five test cases (50 ns).
5. For board implementation, add [Nexys-A7-100T-Master.xdc](constraints/Nexys-A7-100T-Master.xdc), then run synthesis, implementation, and bitstream generation.

## Report

[Read the lab report](docs/Lab2_Report.pdf) for the design explanation, simulation evidence, and implementation comparison.

[All labs](../README.md)
