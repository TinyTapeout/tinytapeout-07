<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

# How it works

Simplistic DDS (accumulator + sinewave lookup table) with resistive DAC to provide analogue output. Board switches control the output frequency.

## How to test

With a 40MHz clock selected, change the input switches to some binary value 1-255. Observe a rail to rail sinewave at the analogue pin ua[0].

## External hardware

DAC output resistance about 10kOhm. Could add an external capacitor to ground to smooth / filter the waveform.
