# Naming Standards

Naming exists to eliminate ambiguity and reduce cognitive load.

Clarity is more important than brevity.

## File Names

Verilog modules use PascalCase.

Examples:

```
HalfAdder.v
FullAdder.v
TwoBitAdder.v
FourBitRippleAdder.v
ALU.v
```

Testbenches use the same name with `_tb`.

```
HalfAdder_tb.v
FullAdder_tb.v
```

## Signal Naming

Signals must describe function, not implementation.

Good:

```
carryIn
carryOut
partialSum
carryStage1
```

Bad:

```
wire1
and2
xorTemp
```

## Module Naming

Modules should describe the logical component.

Examples:

```
HalfAdder
FullAdder
FourBitRippleAdder
ALU
```

Avoid ambiguous names such as:

```
AdderThing
LogicBlock
Module1
```

## Folder Names

Use PascalCase.

```
Verilog/
Logisim/
Excel/
VBA/
Docs/
```

Folders represent conceptual groupings, not physical locations.

## Final Rule

If a reader cannot understand the role of a file from its name, the name must be improved.
