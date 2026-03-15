/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       TwoBitAdder
File:         TwoBitAdder.v

Description:
    Implements a two-bit ripple carry adder using combinational logic.
    The module adds two 2-bit binary numbers and produces a 3-bit result.

Architecture:
    Two cascaded addition stages propagate carry from the least significant
    bit toward the most significant bit.

        bit0 → generates carry c1
        bit1 → consumes c1 and produces final carry

    This ripple carry structure is the same arithmetic mechanism used in
    early microprocessor arithmetic logic units.

Inputs:
    a0, a1 : operand A bits
    b0, b1 : operand B bits

Outputs:
    s0, s1 : sum bits
    s2     : carry output

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        23 Aug 2025
License:     MIT
------------------------------------------------------------------------------
*/

module TwoBitAdder
(
    input  a0, a1,
    input  b0, b1,
    output s0, s1,
    output s2
);


// Carry signal produced by the least significant bit addition.
// This value becomes the carry input for the second stage.
wire c1;


// Intermediate XOR result for the second addition stage.
// Separating this value improves readability and reflects the
// textbook full-adder structure.
wire partialXor;


// -----------------------------------------------------------------------------
// Bit 0 Addition Stage
// -----------------------------------------------------------------------------

assign s0 = a0 ^ b0;
assign c1 = a0 & b0;


// -----------------------------------------------------------------------------
// Bit 1 Addition Stage
// -----------------------------------------------------------------------------

assign partialXor = a1 ^ b1;

assign s1 = partialXor ^ c1;

assign s2 = (a1 & b1) | (c1 & partialXor);


endmodule