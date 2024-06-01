<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The chip generates a PRBS31 signal using a Fibonacci LFSR and analyzes it with the same structure. The output of the PRBS is taken off the chip and read back in to be analyzed.  

Two 7-bit vectors are converted into puedo random signal PSR by comparing the vector to the PRBS.  These signals are also output and can be used as an alternative to a PWM DAC.  These two PRS are multiplied with an and gate, and the out is sent off-chip.  Singal A is squared by delaying it by one clock cycle and anding the signal with the delayed version.

A 131-bit PRBS generator is included as well to fill up the tile as much as possible.

Everything will be documented here:https://docs.google.com/document/d/1nhcHBQsxXUUo1_4WGjxFoWHzpVBCy18a5GQimM9eUtQ/edit?usp=sharing


## How to test

Input Clock and reset

## External hardware

ADALM2000
