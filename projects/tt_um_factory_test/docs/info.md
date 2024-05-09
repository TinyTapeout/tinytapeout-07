<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

If `sel` is high, then a counter is output on the output pins and the bidirectional pins (`data_o = counter_o = counter`).
If `sel` is low, the input pins and the bidirectional pins are xored, and the result appears on the output pins (`data_o = in_a ^ in_b`).

## How to test

Set `sel` high and observe that the counter is output on the output pins (`data_o`) and the bidirectional pins (`counter_o`).

Set `sel` low and observe that the xor of the input pins (`in_a`) and the bidirectional pins (`in_b`) is output on `data_o`.
