/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       ALU_tb
File:         ALU_tb.v

Description:
    Provides simulation stimulus for the ALU module. The testbench sweeps all
    256 input combinations for both supported operations and records the
    four-bit result and carry output.

Architecture:
    Two outer loops iterate over all operand combinations. The inner loop
    steps through each opcode value. This produces 512 test cases in total,
    covering every reachable state of the ALU.

        op = 0 : verifies addition across all 256 operand pairs
        op = 1 : verifies bitwise AND across all 256 operand pairs

Inputs Driven:
    t_a0..t_a3 : test value for operand A
    t_b0..t_b3 : test value for operand B
    t_op       : operation select

Outputs Observed:
    t_f0..t_f3 : observed result bits from the device under test
    t_c4       : observed carry output from the device under test

Author:      Michael Garcia
Course:      RBT131 Digital Logic
Date:        23 Aug 2025
License:     MIT
------------------------------------------------------------------------------
*/

module ALU_tb;

reg t_a0, t_a1, t_a2, t_a3;
reg t_b0, t_b1, t_b2, t_b3;
reg t_op;

wire t_f0, t_f1, t_f2, t_f3;
wire t_c4;

integer aValue;
integer bValue;
integer opValue;

// Each of the 512 test cases is held for five time units.
// The duration is sized to exceed the full sweep before termination.
localparam DURATION = 2700;


ALU deviceUnderTest
(
    .a0(t_a0), .a1(t_a1), .a2(t_a2), .a3(t_a3),
    .b0(t_b0), .b1(t_b1), .b2(t_b2), .b3(t_b3),
    .op(t_op),
    .f0(t_f0), .f1(t_f1), .f2(t_f2), .f3(t_f3),
    .c4(t_c4)
);


initial
begin
    $display(" op  a3 a2 a1 a0  b3 b2 b1 b0 | c4 f3 f2 f1 f0");
    $monitor("  %b   %b  %b  %b  %b   %b  %b  %b  %b |  %b  %b  %b  %b  %b",
             t_op,
             t_a3, t_a2, t_a1, t_a0,
             t_b3, t_b2, t_b1, t_b0,
             t_c4, t_f3, t_f2, t_f1, t_f0);

    // The outer loops sweep all operand combinations. The opcode loop runs
    // inside so each operand pair is tested under both operations before
    // moving to the next pair.
    for (aValue = 0; aValue < 16; aValue = aValue + 1)
    begin
        for (bValue = 0; bValue < 16; bValue = bValue + 1)
        begin
            for (opValue = 0; opValue < 2; opValue = opValue + 1)
            begin
                t_a0 = aValue[0];
                t_a1 = aValue[1];
                t_a2 = aValue[2];
                t_a3 = aValue[3];

                t_b0 = bValue[0];
                t_b1 = bValue[1];
                t_b2 = bValue[2];
                t_b3 = bValue[3];

                t_op = opValue[0];

                #5;
            end
        end
    end

    // Inputs return to zero so the waveform ends in a known state.
    t_a0 = 1'b0; t_a1 = 1'b0; t_a2 = 1'b0; t_a3 = 1'b0;
    t_b0 = 1'b0; t_b1 = 1'b0; t_b2 = 1'b0; t_b3 = 1'b0;
    t_op = 1'b0;
end


initial
begin
    $dumpfile("ALU_tb.vcd");
    $dumpvars(0, ALU_tb);

    #(DURATION);

    $display("Finished!");
    $finish;
end

endmodule
