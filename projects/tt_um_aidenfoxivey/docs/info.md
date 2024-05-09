<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

`ui` should have the two bytes you want added to the CRC8. If you want to restart the internal CRC value, then pull `rst_n` low. That will set it back to the default 0x00. `enable` should be high unless you want to ignore the new calculated value from the specific clock cycle. You can add any number of two byte combinations to it and it will calculate the CRC8 CCITT value for the given combination.

<https://crccalc.com> can help you calculate the CRC8 if you want.

The specific polynomial in this case is 1+x^1+x^2+x^8.

## How to test

Run `make` in the `/test` directory.

## External hardware

None required! The design is combinational, requiring only a small buffer to store the current CRC value. As a result, it's quite simple.
