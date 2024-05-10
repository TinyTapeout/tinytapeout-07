<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This is a Tiny Tapeout project (designed to start for Tiny Tapeout 7 in May 2024) to use the 20 MHz of the ASIC chip to make a stopwatch that can count seconds in decimal format for ten second increments (from 0 to 9 and loops back to 0).

## How to test

This is a simple project and has limited testing infrastructure. To test in simulation and analyze changes to the logic with a waveform analyzer, you can use [the published MakerChip project](https://mest.makerchip.com/sandbox/0DkfBhkK5/0k5hO4j#) associated with this GitHub repo and check the `clock_speed` to have smaller clock speeds and increment the decimal stopwatch much quicker than the necessary hardware clock speed.

To test this with a Tiny Tapeout 3 Demo Board (v 2.2.5) and the ASIC Simulator (v1.2) using [this test harness repo](https://github.com/aj-stein-nist/tt_stopwatch_project_fpga.git) and use `dfu-util` to flash it on this device.

## External hardware

This project is a simple first experiment that does not require additional external inputs or outputs.
