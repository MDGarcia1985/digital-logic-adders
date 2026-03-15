/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       FourBitRippleAdder_tb
File:         FourBitRippleAdder_tb.v

Description:
    Provides simulation stimulus for the FourBitRippleAdder module. The
    testbench applies every possible input combination for two four-bit
    operands and records the resulting five-bit sum.

Architecture:
    The testbench uses nested iteration to cover all 256 input combinations.
    A loop-based approach is used here because a complete four-bit truth table
    is large enough that manual enumeration would add clutter without improving
    understanding.

Inputs Driven:
    t_a0, t_a1, t_a2, t_a3 : test value for operand A
    t_b0, t_b1, t_b2, t_b3 : test value for operand B

Outputs Observed:
    t_s0, t_s1, t_s2, t_s3 : observed sum bits from the device under test
    t_c4                   : observed final carry output from the device under test

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        15 Mar 2026
License:     MIT
------------------------------------------------------------------------------
*/

module FourBitRippleAdder_tb;

reg  t_a0;
reg  t_a1;
reg  t_a2;
reg  t_a3;
reg  t_b0;
reg  t_b1;
reg  t_b2;
reg  t_b3;

wire t_s0;
wire t_s1;
wire t_s2;
wire t_s3;
wire t_c4;

integer aValue;
integer bValue;

// The simulation duration is chosen to exceed the full 256-case sweep. Each
// input pair is held for five time units, so 256 combinations require 1280.
localparam DURATION = 1300;


FourBitRippleAdder deviceUnderTest
(
    .a0(t_a0),
    .a1(t_a1),
    .a2(t_a2),
    .a3(t_a3),
    .b0(t_b0),
    .b1(t_b1),
    .b2(t_b2),
    .b3(t_b3),
    .s0(t_s0),
    .s1(t_s1),
    .s2(t_s2),
    .s3(t_s3),
    .c4(t_c4)
);


initial
begin
    $display(" a3 a2 a1 a0 b3 b2 b1 b0 | c4 s3 s2 s1 s0");
    $monitor("  %b  %b  %b  %b  %b  %b  %b  %b |  %b  %b  %b  %b  %b",
             t_a3, t_a2, t_a1, t_a0,
             t_b3, t_b2, t_b1, t_b0,
             t_c4, t_s3, t_s2, t_s1, t_s0);

    // A loop-based sweep is used because the four-bit truth table contains
    // 256 cases. Automating the stimulus keeps the testbench maintainable
    // while still guaranteeing exhaustive coverage.
    for (aValue = 0; aValue < 16; aValue = aValue + 1)
    begin
        for (bValue = 0; bValue < 16; bValue = bValue + 1)
        begin
            t_a0 = aValue[0];
            t_a1 = aValue[1];
            t_a2 = aValue[2];
            t_a3 = aValue[3];

            t_b0 = bValue[0];
            t_b1 = bValue[1];
            t_b2 = bValue[2];
            t_b3 = bValue[3];

            #5;
        end
    end

    // Inputs return to zero so the waveform ends in a known state.
    t_a0 = 1'b0;
    t_a1 = 1'b0;
    t_a2 = 1'b0;
    t_a3 = 1'b0;
    t_b0 = 1'b0;
    t_b1 = 1'b0;
    t_b2 = 1'b0;
    t_b3 = 1'b0;
end


initial
begin
    $dumpfile("FourBitRippleAdder_tb.vcd");
    $dumpvars(0, FourBitRippleAdder_tb);

    #(DURATION);

    $display("Finished!");
    $finish;
end

endmodule
