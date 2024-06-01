## How it works

A few resistors and switches are wired up in a matrix pattern.
Switches are implemented as pass gates controlled by latches that keep the configuration.
Can be used as a makeshift DAC by controlling the "bitstream".

## How to test

First configure the network.
Each cell of the 3×3 matrix is controlled by 6 bits:
`VD_SHORT`, `VD_NEXT`, `VD_LINE`, `HD_SHORT`, `HD_NEXT` and `HD_LINE`.
Set these bits, then briefly turn on `H_GATE_i` and `V_GATE_j` to
save this configuration in the latches.
Continue for the other cells of the matrix.

Once the network is configured, manipulate the digital inputs
`H_INPUT_i` and `V_INPUT_j` and read the voltage at the analog output.

## External hardware

Multimeter or microcontroller with ADC to measure voltages.
