A Reimplementation of Belle's Move Generator
============================================

In honour of about 30 years since the creation of Deep Blue, I decided to recreate the move generation system that it uses, dating back to Belle from 1983.

## How it works

Internally, there is a 256-bit chessboard (4 bits per square), along with a 64-bit square-enable mask.

Each square "transmits" attacks to its neighbour squares, which either propagate attacks along empty squares, or generate their own.
These attacks are processed by "receivers", which produce a priority level based on opcode and the piece on that square.
The priority levels go through an arbitration network, which chooses the most promising square, which gets output from the chip.

Due to the space limitations present on Tiny Tapeout, though, there are some very notable design differences.
The original design calculates all 8x8 squares in a single cycle, handling both positive and negative directions.

### Opcodes

> To be finalised.

The chip has 16 input bits and 8 output bits.

| bit pattern           | command      | description |
|-----------------------|--------------|-------------|
| `1111 __ss ssss ____` | `FIND-SRC`   | output the least-valuable enabled attacker of square `s`. |
| `1110 ____ ____ ____` | `FIND-DST`   | output the most-valuable enabled piece on the board. |
| `1101 __ss ssss ___v` | `ENABLE-SET` | set the square-enable bit of square `s` to `v`. |
| `1100 ____ ____ ____` | `ENABLE-ALL` | set all square-enable bits. |
| `1011 __ss ssss vvvv` | `SQUARE-SET` | set the chessboard on square `s` to have value `v`. |
| `1010 ____ ____ ____` | `ROTATE`     | rotate the chessboard 180 degrees. |
| `1001 ____ ____ ____` | `FLIP-COLOR` | flip the colours of all pieces on the chessboard, so that friendly becomes enemy and vice versa. |
| `1000 ____ ____ ____` | `ENABLE-US`  | set the square-enable bits of all friendly pieces. |

## How to test

Use the test suite.

## External hardware

The RP2040 microprocessor in the dev board is intended to be used to drive the move generator, as there isn't enough room in the chip to do it itself.
