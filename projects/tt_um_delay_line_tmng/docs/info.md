<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->


## How it works

This is a single NAND gate that is fed its inputs from, and writes its results
to a giant shift register. With this, we can achieve the ultimate time/space
tradeoff, a single nand gate able to emulate quite complex logic. 

## How to test

Undecided, we are working on a yosys backend to generate "programs" for this
which you can then run by driving the inputs

## External hardware

You need an FPGA or similar to drive the inputs at high enough precision to feed "instructions" to the device.
