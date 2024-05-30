<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

It is a linear feedback shift register random number generator connected to a wishbone bus to allow it to fit within the pin constraints of Tiny Tapeout. 

## How to test

Please see the cocotb testbench in the test.py in the test directory for the startup procedure for loading a seed and starting the linear feedback shift register output. 

## External hardware

Use the microcontroller on the development board to apply the correct startup signals to the board.
