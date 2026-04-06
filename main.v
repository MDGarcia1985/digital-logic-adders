/*
------------------------------------------------------------------------------
Project:      Digital Logic Adders
Module:       main
File:         main.v

Description:
    Top-level FPGA wrapper for the pico2-ice board. This module exposes the
    existing FourBitRippleAdder on PMOD-accessible pins so two 4-bit operands
    can be driven from external hardware and the 4-bit sum plus carry-out can
    be observed on outputs.

Pin Usage:
    Inputs:
        operand A -> ICE_PMOD_A_TOP_IO1..IO4
        operand B -> ICE_PMOD_A_BOT_IO1..IO4

    Outputs:
        sum[0:3]  -> ICE_PMOD_B_TOP_IO1..IO4
        carry-out -> ICE_PMOD_B_BOT_IO1

    Status LEDs (active-low):
        LED_R -> carry-out
        LED_G -> sum bit 0
        LED_B -> sum bit 1

Notes:
    The onboard RGB LED on pico2-ice is active-low, so each LED output is
    inverted relative to the associated logic signal.
------------------------------------------------------------------------------
*/

module main
(
    input  ICE_PMOD_A_TOP_IO1,
    input  ICE_PMOD_A_TOP_IO2,
    input  ICE_PMOD_A_TOP_IO3,
    input  ICE_PMOD_A_TOP_IO4,
    input  ICE_PMOD_A_BOT_IO1,
    input  ICE_PMOD_A_BOT_IO2,
    input  ICE_PMOD_A_BOT_IO3,
    input  ICE_PMOD_A_BOT_IO4,
    output ICE_PMOD_B_TOP_IO1,
    output ICE_PMOD_B_TOP_IO2,
    output ICE_PMOD_B_TOP_IO3,
    output ICE_PMOD_B_TOP_IO4,
    output ICE_PMOD_B_BOT_IO1,
    output LED_R,
    output LED_G,
    output LED_B
);

wire sum0;
wire sum1;
wire sum2;
wire sum3;
wire carryOut;


FourBitRippleAdder adder4
(
    .a0(ICE_PMOD_A_TOP_IO1),
    .a1(ICE_PMOD_A_TOP_IO2),
    .a2(ICE_PMOD_A_TOP_IO3),
    .a3(ICE_PMOD_A_TOP_IO4),
    .b0(ICE_PMOD_A_BOT_IO1),
    .b1(ICE_PMOD_A_BOT_IO2),
    .b2(ICE_PMOD_A_BOT_IO3),
    .b3(ICE_PMOD_A_BOT_IO4),
    .s0(sum0),
    .s1(sum1),
    .s2(sum2),
    .s3(sum3),
    .c4(carryOut)
);


assign ICE_PMOD_B_TOP_IO1 = sum0;
assign ICE_PMOD_B_TOP_IO2 = sum1;
assign ICE_PMOD_B_TOP_IO3 = sum2;
assign ICE_PMOD_B_TOP_IO4 = sum3;
assign ICE_PMOD_B_BOT_IO1 = carryOut;

assign LED_R = ~carryOut;
assign LED_G = ~sum0;
assign LED_B = ~sum1;

endmodule
