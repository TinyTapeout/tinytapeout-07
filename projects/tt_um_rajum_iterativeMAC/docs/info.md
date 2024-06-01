<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The design contains iterative multiplication and addition unit. The multiplier is a 7x8 bit unit. At reset time, input through ui_in pins stores in a reg and used as operand 1 for multiplier. After reset, operand 2 for multiplier is supplied through ui_in at each clock cycle. The bidirectional pins provide operand 3 which will be added to the multiplier output. the output is read through uo_out pins.  

## How to test

It's a bit complex, as bias values are supplied in different sequences, and output needs to change or align with the read output. Full instructions will be added here once the design is submitted for fabrication.

## External hardware

It does not require any additional hardware supply the input data using CPU.
