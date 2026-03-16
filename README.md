# Digital Logic Adders

A multi-representation implementation of binary ripple carry adder circuits, built for RBT131 Digital Logic at UAT.

The project demonstrates binary addition from the gate level up to a 4-bit ripple carry adder using three parallel representations: Verilog HDL, a Logisim circuit, and an Excel/VBA truth table simulator.

## Architecture

```
Half Adder  →  Full Adder  →  2-Bit Adder  →  4-Bit Ripple Carry Adder  →  ALU
```

Each stage builds on the previous. Carry propagates from bit 0 through bit 3, producing a 4-bit sum and a final carry-out. The ALU circuit extends the adder with additional arithmetic and logic operations. See [Docs/ARCHITECTURE_OVERVIEW.md](Docs/ARCHITECTURE_OVERVIEW.md) for details.

## Repository Structure

```
Verilog/
  RegisterTransferLevel/   # Synthesizable RTL modules
  TestBenches/             # Simulation testbenches
Logisim/                   # Visual circuit schematics (.circ)
Excel/                     # Truth table with VBA simulation
VBA/                       # VBA source modules
Docs/                      # Architecture, style, and contribution guides
apio.ini                   # APIO build config (target: iCEstick)
icestick.pcf               # Pin constraints for iCEstick synthesis
Makefile                   # Simulation targets for all modules
```

## Verilog Modules

| Module | File |
|---|---|
| HalfAdder | `Verilog/RegisterTransferLevel/HalfAdder.v` |
| FullAdder | `Verilog/RegisterTransferLevel/FullAdder.v` |
| TwoBitAdder | `Verilog/RegisterTransferLevel/TwoBitAdder.v` |
| FourBitRippleAdder | `Verilog/RegisterTransferLevel/FourBitRippleAdder.v` |
| ALU | `Verilog/RegisterTransferLevel/ALU.v` |

## Logisim Circuits

| Circuit | File |
|---|---|
| HalfAdder | `Logisim/HalfAdder.circ` |
| HalfAdder (NAND-only) | `Logisim/HalfAdderNAND.circ` |
| FullAdder | `Logisim/FullAdder.circ` |
| FullAdder (NAND-only) | `Logisim/FullAdderNAND.circ` |
| FourBitRippleAdder | `Logisim/FourBitRippleAdder.circ` |
| ALU | `Logisim/ALU.circ` |

The NAND-only variants demonstrate that any combinational logic function can be constructed entirely from NAND gates.

## Simulation

Each RTL module has a matching testbench under `Verilog/TestBenches/`. Use the Makefile targets:

```bash
make sim-half
make sim-full
make sim-2bit
make sim-4bit
make sim-alu
```

Or invoke Icarus Verilog directly:

```bash
iverilog -o sim Verilog/RegisterTransferLevel/HalfAdder.v Verilog/TestBenches/HalfAdder_tb.v
vvp sim
```

## Tools

- [Icarus Verilog](http://iverilog.icarus.com/) — simulation
- [APIO](https://github.com/FPGAwars/apio) — synthesis and upload to iCEstick
- [Logisim](http://www.cburch.com/logisim/) — circuit visualization
- Microsoft Excel + VBA — truth table simulation

## Contributing

See [Docs/CONTRIBUTING.md](Docs/CONTRIBUTING.md).

## License

MIT — see [LICENSE](LICENSE).
