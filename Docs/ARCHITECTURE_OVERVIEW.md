# Architecture Overview

This project demonstrates binary addition using ripple carry logic.

## Half Adder

A half adder performs binary addition of two single bits.

Outputs:

- Sum
- Carry

## Full Adder

A full adder extends the half adder by accepting a carry input.


Sum = A XOR B XOR CarryIn


## Ripple Carry Adders

Multiple full adders can be chained together.


bit0 → carry → bit1 → carry → bit2


Carry propagation creates the ripple effect.

## CPU Context

Ripple carry adders historically formed the arithmetic core of early
processor ALUs.

Although modern processors use faster carry-lookahead techniques,
the ripple adder remains the clearest educational model.