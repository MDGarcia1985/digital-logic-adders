/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       HalfAdder
File:         HalfAdder.v

Description:
    Implements a half adder using combinational logic. A half adder adds two
    single-bit binary values and produces a one-bit sum and a carry output.

Architecture:
    The half adder is the smallest arithmetic building block used in binary
    addition. It does not support a carry input.

    Sum is produced using exclusive OR logic.
    Carry is produced using logical AND.

Inputs:
    a : first operand bit
    b : second operand bit

Outputs:
    sum   : least significant bit of the result
    carry : overflow bit generated when both inputs are 1

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        23 Aug 2025
License:     MIT
------------------------------------------------------------------------------
*/

module HalfAdder
(
    input  a,
    input  b,
    output sum,
    output carry
);

// The sum bit is high when exactly one input is high.
assign sum = a ^ b;

// The carry bit is high only when both inputs are high.
assign carry = a & b;

endmodule