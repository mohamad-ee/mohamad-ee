# Chip Design & Verification Labs

Practical coursework in digital design, RTL simulation, and FPGA implementation, maintained by **Mohamad Mashal**.

**Course:** Chip Design and Verification, Google & Reichman University AI & Tech School.

**Tools:** Vivado and XSim. **Board:** Digilent Nexys A7-100T.

## Labs

| Lab | Design | Verification and results |
| --- | --- | --- |
| [01 — Top-Down Hierarchical Design](lab01-top-down-design/README.md) | SystemVerilog top-level connections and UART interface stubs. | Interface documentation and elaborated hierarchy. |
| [02 — Eight-Bit Adder](lab02-eight-bit-adder/README.md) | Behavioral and structural ripple-carry implementations. | Five directed test cases, simulation, FPGA mapping, and implementation results. |
| [03 — Seven-Segment Controller](lab03-seven-segment-controller/README.md) | Decimal/hexadecimal display, stored switch value, long-press selection, and multiplexed scanning. | Directed simulation scenarios and board demonstrations documented in the report. |

## What is included

Each lab has an English README and its submitted source files. Labs 02 and 03 also include testbenches and board constraints. The reports include code screenshots, simulation results, and implementation evidence where applicable.

| Directory | Contents |
| --- | --- |
| `rtl/` | Design sources. |
| `tb/` | Simulation testbench, where applicable. |
| `constraints/` | The lab's XDC board constraints, where applicable. |
| `docs/` | PDF lab report. |

## Running the labs

Create a separate Vivado RTL project for each lab, using the Nexys A7-100T device (`xc7a100tcsg324-1`). Add its design sources, simulation sources, and constraints to the corresponding filesets. Follow the lab README for the design top and simulation top.

Keep the projects separate: each lab uses a different module named `chip_top`.

## Coursework and validation

Labs 02 and 03 were completed as group coursework. The reports are public copies of the submitted reports. Source and constraint files are preserved from the submitted archives.

The included evidence comes from the original lab work. The testbenches use directed stimulus with console/waveform inspection; this portfolio packaging did not include a new Vivado simulation, synthesis, or hardware run.

[Back to profile](../README.md)
