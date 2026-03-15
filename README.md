# Digital Logic Adders

A multi-representation implementation of binary ripple carry adder circuits, built for RBT131 Digital Logic at UAT.

The project demonstrates binary addition from the gate level up to a 4-bit ripple carry adder using three parallel representations: Verilog HDL, a Logisim circuit, and an Excel/VBA truth table simulator.

## Architecture

```
Half Adder  →  Full Adder  →  2-Bit Adder  →  4-Bit Ripple Carry Adder
```

Each stage builds on the previous. Carry propagates from bit 0 through bit 3, producing a 4-bit sum and a final carry-out. See [Docs/ARCHITECTURE_OVERVIEW.md](Docs/ARCHITECTURE_OVERVIEW.md) for details.

## Repository Structure

```
Verilog/
  RegisterTransferLevel/   # Synthesizable RTL modules
  TestBenches/             # Simulation testbenches
Logisim/                   # Visual circuit schematic (.circ)
Excel/                     # Truth table with VBA simulation
VBA/                       # VBA source modules
Docs/                      # Architecture, style, and contribution guides
apio.ini                   # APIO build config (target: iCEstick)
```

## Verilog Modules

| Module | File |
|---|---|
| HalfAdder | `Verilog/RegisterTransferLevel/HalfAdder.v` |
| FullAdder | `Verilog/RegisterTransferLevel/FullAdder.v` |
| TwoBitAdder | `Verilog/RegisterTransferLevel/TwoBitAdder.v` |
| FourBitRippleAdder | `Verilog/RegisterTransferLevel/FourBitRippleAdder.v` |

## Simulation

Each RTL module has a matching testbench under `Verilog/TestBenches/`. Simulate with any Verilog simulator (e.g., Icarus Verilog):

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
