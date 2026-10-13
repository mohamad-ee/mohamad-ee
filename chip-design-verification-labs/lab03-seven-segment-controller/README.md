# Lab 03 — Seven-Segment Display Controller

A Nexys A7-100T controller that stores a 16-bit switch value and displays it in decimal or hexadecimal.

## Behavior

| Control | Action |
| --- | --- |
| Hold the center button for one second | Store the switch value and select decimal display. |
| Hold the down button for one second | Store the switch value and select hexadecimal display. |
| Change switches without a qualifying press | Keep displaying the stored value. |
| Assert the active-low reset | Clear the stored value and return to decimal mode. |

The center button has priority when both buttons are pressed. Decimal mode scans five digits for values up to 65535; hexadecimal mode scans four digits. The anode and cathode outputs are active-low.

## Modules

| Source | Role |
| --- | --- |
| [chip_top.v](rtl/chip_top.v) | Connects the controller, conversion, and display modules. |
| [mode_select.v](rtl/mode_select.v) | Synchronizes the button inputs, measures press duration, stores the switch value, and selects the mode. |
| [clk_div.v](rtl/clk_div.v) | Produces a one-cycle scan enable every 50,000 cycles of the 100 MHz clock. |
| [bcd_converter.v](rtl/bcd_converter.v) | Converts the stored value into five decimal digits. |
| [anode_selector.v](rtl/anode_selector.v) | Selects the active digit and its value. |
| [cathode_decoder.v](rtl/cathode_decoder.v) | Maps digits 0–F to seven-segment patterns. |

## Simulation

[chip_top_tb.v](tb/chip_top_tb.v) generates a 100 MHz clock and overrides `PRESS_CYCLES` to 10 for simulation. The hardware default remains 100,000,000 cycles, corresponding to one second.

The directed stimulus covers a short rejected press, storage of `0x1234` in decimal mode, changing switches without storing, hexadecimal display of `0xABCD`, the maximum input value, and reset. Inspect `stored_value`, `mode`, `anode`, and `cathodes` in the waveform viewer. The testbench ends with `$stop`.

## Run in Vivado

1. Create a project for `xc7a100tcsg324-1` and add `rtl/*.v` as design sources.
2. Add `tb/chip_top_tb.v` as a simulation source.
3. Set design top `chip_top` and simulation top `chip_top_tb`.
4. Run behavioral simulation until the testbench stops (approximately 13 ms).
5. For board implementation, add [Nexys-A7-100T-Master.xdc](constraints/Nexys-A7-100T-Master.xdc), then run synthesis, implementation, and bitstream generation.

The constraints include the 100 MHz clock, switch inputs, display outputs, center/down buttons, and the active-low CPU reset button.

## Report

[Read the lab report](docs/Lab3_Report.pdf), including simulation screenshots, implementation results, and board demonstrations.

[All labs](../README.md)
