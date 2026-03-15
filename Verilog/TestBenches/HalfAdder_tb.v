/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       HalfAdder_tb
File:         HalfAdder_tb.v

Description:
    Provides simulation stimulus for the HalfAdder module. The testbench
    applies every possible two-input combination and records the resulting
    sum and carry outputs.

Architecture:
    The testbench instantiates one HalfAdder device under test and steps
    through the full truth table in a deterministic order. This allows the
    waveform and console output to be checked against the expected half-adder
    behavior.

Inputs Driven:
    t_a : test value for operand A
    t_b : test value for operand B

Outputs Observed:
    t_sum   : observed sum output from the device under test
    t_carry : observed carry output from the device under test

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        10 Aug 2025
License:     MIT
------------------------------------------------------------------------------
*/

module HalfAdder_tb;

reg  t_a;
reg  t_b;
wire t_sum;
wire t_carry;

// The simulation duration is longer than the final stimulus change so the
// waveform file always captures the complete test sequence before termination.
localparam DURATION = 30;


// The device under test is instantiated once so every input combination is
// applied to the same design instance under identical conditions.
HalfAdder deviceUnderTest
(
    .a    (t_a),
    .b    (t_b),
    .sum  (t_sum),
    .carry(t_carry)
);


initial
begin
    $display(" a b | sum carry");
    $monitor(" %b %b |  %b    %b", t_a, t_b, t_sum, t_carry);

    // Each assignment block represents one row of the half-adder truth table.
    // A short delay is inserted between rows so the output transitions are
    // visible in both the console and the waveform capture.

    t_a = 1'b0;
    t_b = 1'b0;
    #5;

    t_a = 1'b0;
    t_b = 1'b1;
    #5;

    t_a = 1'b1;
    t_b = 1'b0;
    #5;

    t_a = 1'b1;
    t_b = 1'b1;
    #5;

    // Returning inputs to zero leaves the design in a known state at the end
    // of the simulation and makes the final waveform segment easier to read.
    t_a = 1'b0;
    t_b = 1'b0;
end


initial
begin
    // A waveform file is generated so the truth-table sequence can be reviewed
    // visually and not only through console output.
    $dumpfile("HalfAdder_tb.vcd");
    $dumpvars(0, HalfAdder_tb);

    #(DURATION);

    $display("Finished!");
    $finish;
end

endmodule
