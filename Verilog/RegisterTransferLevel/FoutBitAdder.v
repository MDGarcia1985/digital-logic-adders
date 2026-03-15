/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       FourBitRippleAdder
File:         FourBitRippleAdder.v

Description:
    Implements a four-bit ripple carry adder using combinational logic.

    The module adds two four-bit binary values and produces a five-bit
    result representing the binary sum.

Architecture:
    Four cascaded addition stages propagate carry from the least significant
    bit toward the most significant bit.

        bit0 → generates carry c1
        bit1 → generates carry c2
        bit2 → generates carry c3
        bit3 → generates carry c4

    This ripple carry structure mirrors the arithmetic datapath used in
    many early processors and simple embedded arithmetic units.

Inputs:
    a0..a3 : operand A bits
    b0..b3 : operand B bits

Outputs:
    s0..s3 : sum bits
    c4     : final carry output

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        23 Aug 2025
License:     MIT
------------------------------------------------------------------------------
*/

module FourBitRippleAdder
(
    input  a0, a1, a2, a3,
    input  b0, b1, b2, b3,
    output s0, s1, s2, s3,
    output c4
);


// Carry propagation signals between addition stages.
wire c1;
wire c2;
wire c3;


// -----------------------------------------------------------------------------
// Bit 0
// -----------------------------------------------------------------------------

assign s0 = a0 ^ b0;
assign c1 = a0 & b0;


// -----------------------------------------------------------------------------
// Bit 1
// -----------------------------------------------------------------------------

assign s1 = a1 ^ b1 ^ c1;
assign c2 = (a1 & b1) | (c1 & (a1 ^ b1));


// -----------------------------------------------------------------------------
// Bit 2
// -----------------------------------------------------------------------------

assign s2 = a2 ^ b2 ^ c2;
assign c3 = (a2 & b2) | (c2 & (a2 ^ b2));


// -----------------------------------------------------------------------------
// Bit 3
// -----------------------------------------------------------------------------

assign s3 = a3 ^ b3 ^ c3;
assign c4 = (a3 & b3) | (c3 & (a3 ^ b3));


endmodule