/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       ALU
File:         ALU.v

Description:
    Implements a four-bit arithmetic logic unit supporting two operations
    selected by a single opcode input. The module extends the FourBitRippleAdder
    with a bitwise AND operation, matching the Logisim ALU circuit schematic.

Architecture:
    The ALU computes both operations in parallel and uses the opcode to select
    which result appears on the output.

        OP = 0 : addition    — output is the four-bit ripple carry sum
        OP = 1 : bitwise AND — output is A AND B for each bit position

    The adder result and carry output are always computed. The carry output
    is only meaningful when OP = 0.

    Four multiplexers, one per output bit, select between the adder sum and
    the AND result. This mirrors the mux structure visible in the Logisim
    schematic.

Inputs:
    a0..a3 : operand A bits, least significant to most significant
    b0..b3 : operand B bits, least significant to most significant
    op     : operation select (0 = add, 1 = AND)

Outputs:
    f0..f3 : result bits, least significant to most significant
    c4     : carry output from the adder stage, valid only when op = 0

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        23 Aug 2025
License:     MIT
------------------------------------------------------------------------------
*/

module ALU
(
    input  a0, a1, a2, a3,
    input  b0, b1, b2, b3,
    input  op,
    output f0, f1, f2, f3,
    output c4
);


// Adder sum results, computed regardless of the selected operation.
wire s0, s1, s2, s3;

// Bitwise AND results, computed regardless of the selected operation.
wire and0, and1, and2, and3;


// Instantiate the ripple carry adder to produce the addition result.
FourBitRippleAdder adder
(
    .a0(a0), .a1(a1), .a2(a2), .a3(a3),
    .b0(b0), .b1(b1), .b2(b2), .b3(b3),
    .s0(s0), .s1(s1), .s2(s2), .s3(s3),
    .c4(c4)
);


// Bitwise AND of each operand pair.
assign and0 = a0 & b0;
assign and1 = a1 & b1;
assign and2 = a2 & b2;
assign and3 = a3 & b3;


// Output multiplexers select between the adder result and the AND result
// based on the opcode. Each bit is selected independently.
assign f0 = op ? and0 : s0;
assign f1 = op ? and1 : s1;
assign f2 = op ? and2 : s2;
assign f3 = op ? and3 : s3;


endmodule
