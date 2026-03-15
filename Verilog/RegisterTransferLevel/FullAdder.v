/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       FullAdder
File:         FullAdder.v

Description:
    Implements a full adder using combinational logic. A full adder extends
    the half adder by supporting an incoming carry signal from a lower-order
    addition stage.

Architecture:
    The full adder is the fundamental arithmetic component used in ripple
    carry adders and arithmetic logic units.

    Sum = A XOR B XOR CarryIn

    CarryOut is produced when either:
        • both operand bits are high
        • one operand bit and the incoming carry are both high

Inputs:
    a       : operand A bit
    b       : operand B bit
    carryIn : carry input from the previous addition stage

Outputs:
    sum      : result bit for this stage
    carryOut : carry propagated to the next stage

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        23 Aug 2025
License:     MIT
------------------------------------------------------------------------------
*/

module FullAdder
(
    input  a,
    input  b,
    input  carryIn,
    output sum,
    output carryOut
);

// Intermediate signal representing A XOR B.
// This value participates in both the sum and carry calculations.
wire partialSum;


// Compute XOR of operand bits
assign partialSum = a ^ b;


// Sum is the XOR of the intermediate result and the incoming carry.
assign sum = partialSum ^ carryIn;


// Carry is generated when either operand bits are both high
// or when the intermediate XOR and carry input are both high.
assign carryOut = (a & b) | (carryIn & partialSum);

endmodule