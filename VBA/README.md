# VBA Modules

This folder contains the Visual Basic for Applications source used by the Excel portion of the Digital Logic Adders project.

The modules generate a complete truth table for a 4-bit ripple carry adder by:

1. Writing every possible 8-bit input combination for operands `A` and `B`
2. Computing the corresponding sum bits `S0` through `S3`
3. Writing the final carry-out bit `C4`
4. Formatting the worksheet into labeled input and output sections

## Files

| File | Purpose |
|---|---|
| `Inputs.bas` | Generates all 256 input combinations for `A0-A3` and `B0-B3` |
| `Outputs.bas` | Computes `S0-S3` and `C4` for each row |
| `Main.bas` | Clears the sheet, runs the generators, formats the worksheet, and displays a completion message |

## Expected Worksheet Layout

After running the package macro:

- Row `1` contains merged section headers: `Inputs` and `Outputs`
- Row `2` contains column labels
- Rows `3` through `258` contain all `256` input/output combinations

The worksheet columns are:

| Column Range | Meaning |
|---|---|
| `A:H` | Input bits `A0-A3` and `B0-B3` |
| `I:M` | Output bits `S0-S3` and carry-out `C4` |

## Main Entry Point

Run this macro to generate the complete worksheet:

```vb
GenerateTruthTablePackage
```

That routine:

- clears the active worksheet
- generates the full input table
- computes all adder outputs
- formats the top headers
- auto-fits columns

## How To Use In Excel

1. Open the target workbook in Microsoft Excel.
2. Open the VBA editor with `Alt+F11`.
3. Import each module from this folder:
   `Inputs.bas`, `Outputs.bas`, and `Main.bas`.
4. Return to Excel and run `GenerateTruthTablePackage`.

You can run the macro from:

- `Developer > Macros`
- the VBA editor
- a worksheet button assigned to `GenerateTruthTablePackage`

## Logic Model

The output calculation follows standard ripple carry adder behavior from least significant bit to most significant bit:

- `S(j) = A(j) XOR B(j) XOR C`
- `C(next) = (A(j) AND B(j)) OR (C AND (A(j) XOR B(j)))`

This lets the spreadsheet act as a software verification surface for the same binary addition behavior implemented elsewhere in the repository.

## Notes

- The macros operate on the active worksheet.
- Existing worksheet contents are cleared before generation.
- The generated table is deterministic and always contains all possible 4-bit operand combinations.
