'------------------------------------------------------------------------------
' Project:      Digital Logic Adders
' Module:       Inputs
' File:         Inputs.bas
'
' Description:
'     Generates the complete input section of a four-bit adder truth table.
'     This module writes every possible binary combination for two four-bit
'     operands so the worksheet can be used as a verification table.
'
' Architecture:
'     The worksheet is treated as a structured test surface.
'
'         Columns A-D  → operand A bits
'         Columns E-H  → operand B bits
'
'     The routine enumerates all 256 possible input combinations for the
'     eight total input bits and writes them row by row. This avoids manual
'     entry, reduces transcription errors, and ensures the output-generation
'     module always receives a complete and deterministic input set.
'
' Inputs:
'     None directly passed as arguments.
'
'     The routine writes generated values into the active worksheet.
'
' Outputs:
'     Row 2      : input column labels A0 through B3
'     Rows 3-258 : all binary input combinations for the four-bit adder
'
' Design Notes:
'     This module exists to eliminate repetitive manual spreadsheet work.
'     The logic inputs are generated algorithmically because the truth table
'     follows a fixed binary counting pattern.
'
' Author:      Michael Garcia
' Course:      RBT131 Digital Logic
' Date:        23 Aug 2025
' License:     MIT
'------------------------------------------------------------------------------
Attribute VB_Name = "Inputs"
Sub GenerateTruthTable()
    ' Declare variables
    Dim rowCount As Long
    Dim bitCount As Integer
    Dim i As Long
    Dim j As Integer
    
    ' Number of bits (4 for A, 4 for B = 8 total inputs)
    bitCount = 8
    
    ' Total number of combinations = 2^8 = 256
    rowCount = 2 ^ bitCount
    
    ' Write column headers in row 2, columns A-H
    ' (Leaving row 1 blank for a title or spacing)
    Cells(2, 1).Resize(1, bitCount).Value = _
        Array("A0", "A1", "A2", "A3", "B0", "B1", "B2", "B3")
    
    ' Generate all possible binary combinations for 8 bits
    ' Loop through every row from 0 to 255
    For i = 0 To rowCount - 1
        ' Loop through every bit (0 to 7)
        For j = 0 To bitCount - 1
            ' Fill the table starting on row 3 (to leave header rows)
            ' Each bit is calculated by shifting right (divide) and masking (Mod 2)
            Cells(i + 3, j + 1).Value = (i \ (2 ^ j)) Mod 2
        Next j
    Next i
End Sub


