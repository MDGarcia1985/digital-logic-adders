# Commenting Standards

Comments are treated as architectural artifacts.

They exist to explain **intent, constraints, and design reasoning**.

## Plain Language

Comments must be written in clear plain language.

Do not rely on shorthand.

Do not rely on unexplained acronyms.

Assume the reader is intelligent but unfamiliar with the system.

Clarity is prioritized over brevity.

## Explain Intent, Not Syntax

Comments should explain:

- why a design exists
- what problem it solves
- what constraint influenced the implementation
- why a specific approach was chosen

Do not restate what the code already expresses.

Bad:

```verilog
// XOR gate
assign s0 = a ^ b;

Good:

// The least significant sum bit is produced by exclusive OR logic.
// Exactly one input being high produces a binary 1.
assign s0 = a ^ b;
Document Architecture

Complex modules must include a structured header explaining:

module purpose

architectural structure

input and output roles

design context

Example:

bit0 → generates carry
bit1 → consumes carry
Comment Non-Obvious Code

Examples of code that require explanation:

staged carry propagation

unusual ordering requirements

verification logic

simulation assumptions

Avoid Commenting Universal Conventions

Do not explain:

basic language syntax

standard operators

obvious logic constructs

Accuracy

Outdated comments must be corrected when code changes.

Incorrect comments are worse than no comments.

Block Comments

Architectural explanations should appear in block comments.

Avoid fragmenting explanations across many small comments.


---

# 3. `docs/NAMING_STANDARDS.md`

Adapted to hardware modules.

```markdown
# Naming Standards

Naming exists to eliminate ambiguity and reduce cognitive load.

Clarity is more important than brevity.

## File Names

Verilog modules use PascalCase.

Examples:


HalfAdder.v
FullAdder.v
TwoBitAdder.v
FourBitRippleAdder.v


Testbenches use the same name with `_tb`.


HalfAdder_tb.v
FullAdder_tb.v


## Signal Naming

Signals must describe **function**, not implementation.

Good:


carryIn
carryOut
partialSum
carryStage1


Bad:


wire1
and2
xorTemp


## Module Naming

Modules should describe the logical component.

Examples:


HalfAdder
FullAdder
FourBitRippleAdder


Avoid ambiguous names such as:


AdderThing
LogicBlock
Module1


## Folder Names

Use PascalCase.


rtl/
tb/
docs/
excel/
vba/


Folders represent **conceptual groupings**, not physical locations.

## Final Rule

If a reader cannot understand the role of a file from its name,
the name must be improved.