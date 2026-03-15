# HDL Style Guide

This repository uses a simple Verilog style focused on clarity.

## One Module Per File

Each hardware component should exist in its own file.

Example:


FullAdder.v


## Combinational Logic

Combinational logic should use `assign`.

Example:


assign sum = a ^ b;


## Intermediate Signals

Intermediate values should be named according to their role.

Example:


wire partialSum;


## Architectural Sections

Large modules should divide logic into sections.

Example:


Bit 0 Stage
Bit 1 Stage
Bit 2 Stage


This makes ripple structures visually obvious.

## Testbench Structure

Testbenches should:

1. instantiate the module
2. generate input combinations
3. observe output results

Prefer deterministic loops over manual test cases.

Example:


for (i=0; i<16; i=i+1)


## Verification

Every module must include a testbench that verifies correct behavior.