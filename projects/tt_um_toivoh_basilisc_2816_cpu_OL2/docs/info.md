<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## Overview

Basilisc-2816 v0.1 is a small 2-bit serial 2/8/16 bit processor that fits into one Tiny Tapeout tile.
The CPU has been designed around the constraints of

- small area,
- 4 pin serial memory interface to a RAM emulator implemented in a RP2040 microcontroller, which can be supported by the RP2040 microcontroller on the Tiny Tapeout 06 Demo Board.

and a later version is intended to be included in the next version of the AnemoneGrafx-8 retro console https://github.com/toivoh/tt06-retro-console (motivating the constraints).

Features:

- 2-bit serial execution:
	- ALU operations etc are calculated 2 bits/cycle
	- 2-bit-serial register file with two read/write ports realized as a bank of shift registers
	- Saves area compared to processing 8/16 bits per cycle
	- No point in calculating faster than the memory interface allows
- 8x 8-bit registers that can be paired into 4x 16-bit registers
- 16 bits/instruction (some instructions might take an additional 16 bit immediate)
- 64 kB address space
- Quite regular and orthogonal instruction encoding
- Many addressing modes
- Variable shift instructions
- 8x8 and 8x16 bit multiply instructions, producing 2 result bits per cycle like everything else
- 13 branch conditions + relative call
- Instruction prefetch queue

This is the v0.1b version, which is hardened using OpenLane 2, omits the `mul` instruction, but has a prefetch queue of 3 instruction words.
The v0.1a version `tt_um_toivoh_basilisc_2816` can be found at https://github.com/toivoh/tt07-basilisc-2816-cpu.

For more details, see https://github.com/toivoh/tt07-basilisc-2816-cpu/blob/main/docs/info.md or the documentation of `tt_um_toivoh_basilisc_2816`.
