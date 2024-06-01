<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works
it outputs VGA, using all of the dedicated output pins and three of the bidirectional pins, and takes player input on 5 of the dedicated input pins, it works by having a counter that counts clock cycles since boot, and outputs one pixel per clock cycle, on the first clock cycle of vsync, all game logic happens.

## How to test
you're gonna need to play the game, and hook it up to a monitor with a DAC

## External hardware
- a circuit that can convert the digital output to analog VGA
- a monitor that supports VGA
- a circuit for some buttons for the player input
there are no part numbers here because we built everything outselves except for the monitor, and monitors are ubiquotus