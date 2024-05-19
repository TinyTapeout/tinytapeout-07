<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Generates an animated [perlin noise](https://en.wikipedia.org/wiki/Perlin_noise) pattern on the screen. The perlin noise code was created with the help of the [Tiny Tapeout AI Assist GPT](https://chatgpt.com/g/g-NDGYkKtDy-tiny-tapeout-ai-assist).

## How to test

Connect to a VGA monitor. Change pattern_sel (ui_in[0]) to choose between two different patterns.

## External hardware

[TinyVGA PMOD](https://github.com/mole99/tiny-vga)
