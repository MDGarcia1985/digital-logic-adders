'------------------------------------------------------------------------------
' Project:      Digital Logic Adders
' Module:       Main
' File:         Main.bas
'
' Description:
'     Orchestrates generation of the complete four-bit adder truth table.
'     This module clears the active worksheet, generates all input states,
'     computes all output states, and applies basic worksheet formatting.
'
' Architecture:
'     This module acts as the top-level execution entry point for the
'     spreadsheet automation workflow.
'
'         Step 1 → clear existing worksheet contents
'         Step 2 → generate all input combinations
'         Step 3 → compute all adder outputs
'         Step 4 → label and format input and output sections
'
'     The goal is to produce a complete and readable verification table from
'     a single command so the worksheet can be regenerated consistently.
'
' Inputs:
'     None directly passed as arguments.
'
'     This routine coordinates the execution of the Inputs and Outputs modules
'     against the active worksheet.
'
' Outputs:
'     A fully generated and formatted four-bit adder truth table worksheet.
'
' Design Notes:
'     This module centralizes execution so the truth table can be rebuilt in a
'     repeatable way without requiring the user to run multiple routines by
'     hand. That reduces workflow mistakes and keeps the spreadsheet aligned
'     with the intended verification process.
'
' Author:      Michael Garcia
' Course:      RBT131 Digital Logic
' Date:        23 Aug 2025
' License:     MIT
'------------------------------------------------------------------------------
Attribute VB_Name = "Main"
Sub GenerateTruthTablePackage()
    ' Clear sheet first
    Cells.Clear
    
    ' Call inputs first
    Call GenerateTruthTable
    
    ' Then compute outputs
    Call ComputeAdderOutputs
    
    ' Format the top row
    With Range(Cells(1, 1), Cells(1, 8))
        .Merge
        .HorizontalAlignment = xlCenter
        .Value = "Inputs"
        .Font.Bold = True
    End With
    
    With Range(Cells(1, 9), Cells(1, 13))
        .Merge
        .HorizontalAlignment = xlCenter
        .Value = "Outputs"
        .Font.Bold = True
    End With
    
    ' Optional: auto-fit columns for neatness
    Cells.Columns.AutoFit
    
    MsgBox "4-bit Adder Truth Table Generated Successfully!", vbInformation
End Sub

