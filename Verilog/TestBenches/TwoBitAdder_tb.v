/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       TwoBitAdder_tb
File:         TwoBitAdder_tb.v

Description:
    Provides simulation stimulus for the TwoBitAdder module. The testbench
    applies all sixteen input combinations for two two-bit operands and records
    the resulting three-bit sum.

Architecture:
    The testbench uses one device under test and steps through the complete
    truth table in a fixed order. This makes the waveform output easy to review
    and ensures every possible input combination is exercised exactly once.

Inputs Driven:
    t_a0, t_a1 : test value for operand A
    t_b0, t_b1 : test value for operand B

Outputs Observed:
    t_s0, t_s1 : observed sum bits from the device under test
    t_s2       : observed final carry output from the device under test

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        23 Aug 2025
License:     MIT
------------------------------------------------------------------------------
*/

module TwoBitAdder_tb;

reg  t_a0;
reg  t_a1;
reg  t_b0;
reg  t_b1;

wire t_s0;
wire t_s1;
wire t_s2;

// The simulation duration is sized to outlast the final stimulus change so
// the waveform export contains the complete truth-table run.
localparam DURATION = 90;


TwoBitAdder deviceUnderTest
(
    .a0(t_a0),
    .a1(t_a1),
    .b0(t_b0),
    .b1(t_b1),
    .s0(t_s0),
    .s1(t_s1),
    .s2(t_s2)
);


initial
begin
    $display(" a1 a0 b1 b0 | s2 s1 s0");
    $monitor("  %b  %b  %b  %b |  %b  %b  %b", t_a1, t_a0, t_b1, t_b0, t_s2, t_s1, t_s0);

    // Each assignment block represents one row of the complete two-bit adder
    // truth table. The sequence is explicit rather than loop-generated so the
    // order remains easy to compare against classroom truth-table notation.

    t_a0 = 1'b0; t_a1 = 1'b0; t_b0 = 1'b0; t_b1 = 1'b0; #5;
    t_a0 = 1'b1; t_a1 = 1'b0; t_b0 = 1'b0; t_b1 = 1'b0; #5;
    t_a0 = 1'b0; t_a1 = 1'b0; t_b0 = 1'b0; t_b1 = 1'b1; #5;
    t_a0 = 1'b1; t_a1 = 1'b0; t_b0 = 1'b0; t_b1 = 1'b1; #5;

    t_a0 = 1'b0; t_a1 = 1'b1; t_b0 = 1'b0; t_b1 = 1'b0; #5;
    t_a0 = 1'b1; t_a1 = 1'b1; t_b0 = 1'b0; t_b1 = 1'b0; #5;
    t_a0 = 1'b0; t_a1 = 1'b1; t_b0 = 1'b0; t_b1 = 1'b1; #5;
    t_a0 = 1'b1; t_a1 = 1'b1; t_b0 = 1'b0; t_b1 = 1'b1; #5;

    t_a0 = 1'b0; t_a1 = 1'b0; t_b0 = 1'b1; t_b1 = 1'b0; #5;
    t_a0 = 1'b1; t_a1 = 1'b0; t_b0 = 1'b1; t_b1 = 1'b0; #5;
    t_a0 = 1'b0; t_a1 = 1'b0; t_b0 = 1'b1; t_b1 = 1'b1; #5;
    t_a0 = 1'b1; t_a1 = 1'b0; t_b0 = 1'b1; t_b1 = 1'b1; #5;

    t_a0 = 1'b0; t_a1 = 1'b1; t_b0 = 1'b1; t_b1 = 1'b0; #5;
    t_a0 = 1'b1; t_a1 = 1'b1; t_b0 = 1'b1; t_b1 = 1'b0; #5;
    t_a0 = 1'b0; t_a1 = 1'b1; t_b0 = 1'b1; t_b1 = 1'b1; #5;
    t_a0 = 1'b1; t_a1 = 1'b1; t_b0 = 1'b1; t_b1 = 1'b1; #5;

    // Inputs return to zero at the end so the final waveform segment settles
    // into a known state before the simulation terminates.
    t_a0 = 1'b0;
    t_a1 = 1'b0;
    t_b0 = 1'b0;
    t_b1 = 1'b0;
end


initial
begin
    $dumpfile("TwoBitAdder_tb.vcd");
    $dumpvars(0, TwoBitAdder_tb);

    #(DURATION);

    $display("Finished!");
    $finish;
end

endmodule
