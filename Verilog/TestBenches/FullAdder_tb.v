/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       FullAdder_tb
File:         FullAdder_tb.v

Description:
    Provides simulation stimulus for the FullAdder module. The testbench
    applies every possible input combination for the two operand bits and the
    incoming carry bit, then records the resulting sum and carry outputs.

Architecture:
    The testbench instantiates one FullAdder device under test and walks
    through the complete eight-row truth table. This confirms both the sum
    behavior and the carry propagation behavior expected from a full adder.

Inputs Driven:
    t_a       : test value for operand A
    t_b       : test value for operand B
    t_carryIn : test value for carry input

Outputs Observed:
    t_sum      : observed sum output from the device under test
    t_carryOut : observed carry output from the device under test

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        10 Aug 2025
License:     MIT
------------------------------------------------------------------------------
*/

module FullAdder_tb;

reg  t_a;
reg  t_b;
reg  t_carryIn;
wire t_sum;
wire t_carryOut;

// The run time exceeds the last stimulus change so the waveform file captures
// the full truth-table sweep before simulation ends.
localparam DURATION = 45;


FullAdder deviceUnderTest
(
    .a       (t_a),
    .b       (t_b),
    .carryIn (t_carryIn),
    .sum     (t_sum),
    .carryOut(t_carryOut)
);


initial
begin
    $display(" a b carryIn | sum carryOut");
    $monitor(" %b %b    %b    |  %b      %b", t_a, t_b, t_carryIn, t_sum, t_carryOut);

    // Each stimulus assignment represents one row of the full-adder truth
    // table. The order is kept explicit so the waveform can be compared
    // directly against the documented truth table.

    t_a       = 1'b0;
    t_b       = 1'b0;
    t_carryIn = 1'b0;
    #5;

    t_a       = 1'b1;
    t_b       = 1'b0;
    t_carryIn = 1'b0;
    #5;

    t_a       = 1'b0;
    t_b       = 1'b1;
    t_carryIn = 1'b0;
    #5;

    t_a       = 1'b0;
    t_b       = 1'b0;
    t_carryIn = 1'b1;
    #5;

    t_a       = 1'b1;
    t_b       = 1'b1;
    t_carryIn = 1'b0;
    #5;

    t_a       = 1'b1;
    t_b       = 1'b0;
    t_carryIn = 1'b1;
    #5;

    t_a       = 1'b0;
    t_b       = 1'b1;
    t_carryIn = 1'b1;
    #5;

    t_a       = 1'b1;
    t_b       = 1'b1;
    t_carryIn = 1'b1;
    #5;

    // Resetting the inputs at the end leaves the waveform in a known state.
    t_a       = 1'b0;
    t_b       = 1'b0;
    t_carryIn = 1'b0;
end


initial
begin
    $dumpfile("FullAdder_tb.vcd");
    $dumpvars(0, FullAdder_tb);

    #(DURATION);

    $display("Finished!");
    $finish;
end

endmodule
