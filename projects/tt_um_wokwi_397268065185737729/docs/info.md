## How it works

The underlying selector is controlled by a circular buffer composed of D Flip-Flops which acts as a circular bit shifter.
The clock signal performs the shift every clock rising edge.
The selection is done by toggling the state of the input switch and rising edges and falling edges are turned into pulses.
The memory component of what the player selects is also implemented with D Flip-Flops.
The rest of the output logic for the segment display is combinational logic.
The reset signal sets only one of the bits in the circular buffer and clears the memory component that is controlled by the player.

## How to test

First perform a reset.
As this is designed within Wokwi, the testing can be done by trying to light up the segments and form the '0' at a low clock frequency.
Once the '0' is formed, the next clock cycle should then display only the dot segment.

## Clock configuration

The generated clock frequency from the RP2040 may be lowered to a reasonable, visually observable frequency (3-20Hz).
