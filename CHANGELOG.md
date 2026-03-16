# Changelog

## [Unreleased]

### Added
- `ALU.v` — Verilog RTL module extending the four-bit adder with logic operations
- `ALU_tb.v` — simulation testbench for the ALU module
- `Logisim/ALU.circ` — visual ALU circuit schematic
- `Logisim/FourBitRippleAdder.circ` — visual four-bit adder schematic
- `Logisim/HalfAdderNAND.circ` — NAND-only half adder variant
- `Logisim/FullAdderNAND.circ` — NAND-only full adder variant
- `icestick.pcf` — iCEstick pin constraint file for synthesis
- `Makefile` — simulation targets for all modules
- `.gitignore` — excludes simulation artifacts and build output
- `Docs/NAMING_STANDARDS.md` — standalone naming standards document
- `CHANGELOG.md`
- `LICENSE` — MIT license

### Changed
- `FourBitRippleAdder.v` — replaced flat inline logic with `FullAdder` instantiation; corrected filename from `FoutBitAdder.v`
- `FourBitRippleAdder.v` — reformatted module instantiation port connections to compact single-line style, matching the structure used in `ALU.v`; no behavioral changes
- `apio.ini` — updated `top-module` from `leds` to `FourBitRippleAdder`
- `README.md` — added Logisim circuit table, ALU to architecture chain, corrected module filename

### Fixed
- Broken `NAMING_STANDARDS.md` reference in `CONTRIBUTING.md` — file now exists
