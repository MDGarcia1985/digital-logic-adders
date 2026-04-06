# Digital Logic Adders

A multi-representation implementation of binary ripple carry adder circuits, built for RBT131 Digital Logic at UAT.

The project demonstrates binary addition from the gate level up to a 4-bit ripple carry adder using several parallel representations and support layers:

- Verilog HDL modules and testbenches
- Logisim circuit schematics
- Excel/VBA truth table generation
- FPGA pin constraints and APIO project configuration
- Raspberry Pi Pico / pico-ice support code and board headers for hardware integration

## Architecture

```
Half Adder -> Full Adder -> 2-Bit Adder -> 4-Bit Ripple Carry Adder -> ALU
```

Each stage builds on the previous. Carry propagates from bit 0 through bit 3, producing a 4-bit sum and a final carry-out. The ALU circuit extends the adder with additional arithmetic and logic operations. See [Docs/ARCHITECTURE_OVERVIEW.md](Docs/ARCHITECTURE_OVERVIEW.md) for details.

## Repository Structure

```text
Verilog/
  RegisterTransferLevel/   # Synthesizable RTL adder and ALU modules
  TestBenches/             # Icarus Verilog testbenches
Logisim/                   # Visual circuit schematics (.circ)
Excel/                     # Spreadsheet workbook and FPGA pinout workbook
VBA/                       # VBA modules for truth table generation
src/                       # Pico / pico-ice support sources for FPGA and USB handling
headers/                   # Board, FPGA, USB, and platform header files
cmake/                     # Pico SDK pre-init CMake config
csv/                       # CSV pinout reference data
Docs/                      # Architecture, style, and contribution guides
apio.ini                   # APIO build config (current board: pico-ice)
icestick.pcf               # Pin constraints for iCEstick
pico_ice.pcf               # Pin constraints for pico-ice
pico2_ice.pcf              # Pin constraints for pico2-ice
Makefile                   # Simulation targets for Verilog modules
```

For folder-specific details, see:

- [VBA/README.md](VBA/README.md)

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

## Excel/VBA Verification

The spreadsheet portion of the project generates a complete truth table for the 4-bit ripple carry adder using Excel and VBA.

- `VBA/Inputs.bas` writes all 256 input combinations for `A0-A3` and `B0-B3`
- `VBA/Outputs.bas` computes `S0-S3` and the final carry-out `C4`
- `VBA/Main.bas` clears the active sheet, runs the generation flow, and formats the result

Run `GenerateTruthTablePackage` in Excel to build the full worksheet. Additional usage details are documented in [VBA/README.md](VBA/README.md).

## FPGA And Pico Support

The repository also includes board-support and hardware-interface files related to the `pico-ice` and `pico2-ice` platforms.

- `apio.ini` targets the `pico-ice` board with `main` as the top module
- `pico_ice.pcf` and `pico2_ice.pcf` provide pin constraint mappings for those boards
- `icestick.pcf` is still included for the iCEstick flow
- `headers/pico2_ice.h` defines board-specific pins and defaults for the pico2-ice platform
- `src/ice_fpga.c` contains FPGA clocking, reset, and configuration-status helpers
- `src/ice_usb.c` contains USB, CDC, and DFU support code for interacting with the FPGA from the Pico side
- `src/ice_fpga_data.c` defines board bus mappings for `pico-ice` and `pico2-ice`

Supporting reference material is also included in:

- `Excel/iCE40UP 5k Pinout.xlsx`
- `csv/iCE40UP 5k Pinout.csv`
- `Docs/FPGA-DS-02008-2-4-iCE40-UltraPlus-Family-Data-Sheet.pdf`
- `Docs/FPGA-TN-02001-3-4-iCE40-Programming-Configuration.pdf`

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

## Build Notes

- The included `Makefile` is for Verilog simulation with Icarus Verilog
- `apio.ini` is configured separately for FPGA-oriented flows
- The repository currently contains support files for both pure logic verification and board-level hardware integration
- If you are targeting pico-ice or pico2-ice hardware, check the matching `.pcf` file and board header before synthesizing or wiring peripherals

## Tools

- [Icarus Verilog](http://iverilog.icarus.com/) - simulation
- [APIO](https://github.com/FPGAwars/apio) - synthesis and upload for supported iCE40 board flows
- [Logisim](http://www.cburch.com/logisim/) - circuit visualization
- Microsoft Excel + VBA - truth table simulation
- Raspberry Pi Pico SDK / pico-ice support stack - board-level integration and USB/FPGA control

## Contributing

See [Docs/CONTRIBUTING.md](Docs/CONTRIBUTING.md).

## Further Reading

- [Raspberry Pi Pico SDK repository (latest branch)](https://github.com/raspberrypi/pico-sdk/tree/master/)
- [Raspberry Pi Pico C SDK PDF](https://pip-assets.raspberrypi.com/categories/609-microcontroller-boards/documents/RP-009085-KB-1-raspberry-pi-pico-c-sdk.pdf?disposition=inline)
- [Getting Started with Pico PDF](https://pip-assets.raspberrypi.com/categories/610-raspberry-pi-pico/documents/RP-008276-DS-1-getting-started-with-pico.pdf?disposition=inline)
- [Raspberry Pi Pico SDK repository (pinned commit)](https://github.com/raspberrypi/pico-sdk/tree/9fdfe110dc2f44cb4c23f49370db45a6689a5a08)
- [TinyVision pico2-ice learn guide](https://pico2-ice.tinyvision.ai/md_learn.html)
- [TinyVision pico2-ice getting started guide](https://pico2-ice.tinyvision.ai/md_getting__started.html)
- [ASIC-World Verilog tutorial](https://www.asic-world.com/verilog/veritut.html)
- [TinyVision pico2-ice MCU programming guide](https://pico2-ice.tinyvision.ai/md_programming__the__mcu.html)

## License

MIT - see [LICENSE](LICENSE).
