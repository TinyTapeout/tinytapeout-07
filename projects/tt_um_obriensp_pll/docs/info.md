<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

### VCO
The VCO is a current-starved ring oscillator with a variable number of stages. The digital inputs `s0` and `s1` determine the number of stages. The analog `vcont` input controls the frequency by adjusting the amount of current received by the inverters.

### PFD
The PFD takes two input signals and uses the difference in phase+frequency to drive a charge pump.

## How to test

### VCO
Apply a voltage between 1.0V and 1.8V to `vcont` (`ua0`) and observe the oscillator output on `uo0`.

### PFD
Apply two reference signals to the inputs `ui2` and `ui3` and observe the voltage change on `vout` (`ua1`).

## External hardware

An osilloscope, function generator, and a benchtop power supply would be handy but are not required.
