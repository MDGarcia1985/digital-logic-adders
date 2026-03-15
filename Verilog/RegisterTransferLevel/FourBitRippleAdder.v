/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       FourBitRippleAdder
File:         FourBitRippleAdder.v

Description:
    Implements a four-bit ripple carry adder by instantiating four FullAdder
    modules in cascade. The module adds two four-bit binary values and
    produces a four-bit sum and a final carry output.

Architecture:
    Each bit position is handled by a dedicated FullAdder instance. The carry
    output of each stage feeds directly into the carry input of the next,
    creating the ripple effect that gives this architecture its name.

        bit0 → carryStage1 → bit1 → carryStage2 → bit2 → carryStage3 → bit3 → c4

    Bit 0 receives a carry input of zero because no lower stage exists.
    Using a FullAdder for all four stages keeps the hierarchy uniform and
    makes the ripple structure explicit at the module boundary level.

    This implementation replaces an earlier flat inline version. The
    instantiation-based approach is preferred because it directly reflects
    the architectural hierarchy described in ARCHITECTURE_OVERVIEW.md and
    reuses the verified FullAdder module rather than duplicating its logic.

Inputs:
    a0..a3 : operand A bits, least significant to most significant
    b0..b3 : operand B bits, least significant to most significant

Outputs:
    s0..s3 : sum bits, least significant to most significant
    c4     : carry output from the most significant addition stage

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


// Carry signals that propagate between addition stages.
// Each wire carries the overflow from one stage into the next.
wire carryStage1;
wire carryStage2;
wire carryStage3;


// -----------------------------------------------------------------------------
// Bit 0 Stage
// -----------------------------------------------------------------------------

// Carry input is tied to zero because there is no lower-order stage.
// A FullAdder is used here rather than a HalfAdder so that all four stages
// share the same module interface, making the ripple structure uniform.
FullAdder bit0
(
    .a       (a0),
    .b       (b0),
    .carryIn (1'b0),
    .sum     (s0),
    .carryOut(carryStage1)
);


// -----------------------------------------------------------------------------
// Bit 1 Stage
// -----------------------------------------------------------------------------

FullAdder bit1
(
    .a       (a1),
    .b       (b1),
    .carryIn (carryStage1),
    .sum     (s1),
    .carryOut(carryStage2)
);


// -----------------------------------------------------------------------------
// Bit 2 Stage
// -----------------------------------------------------------------------------

FullAdder bit2
(
    .a       (a2),
    .b       (b2),
    .carryIn (carryStage2),
    .sum     (s2),
    .carryOut(carryStage3)
);


// -----------------------------------------------------------------------------
// Bit 3 Stage
// -----------------------------------------------------------------------------

FullAdder bit3
(
    .a       (a3),
    .b       (b3),
    .carryIn (carryStage3),
    .sum     (s3),
    .carryOut(c4)
);


endmodule
