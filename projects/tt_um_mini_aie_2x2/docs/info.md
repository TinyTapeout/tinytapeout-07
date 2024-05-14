<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works
This is a minimalistic coarse-grained reconfigurable array inspired by AMD AI engine architecture. The hardware design consists of

- A 2x2 array of compute tiles
- A simplified packet-switched network-on-chip (NoC) to connect the compute tiles
- Two interface tiles to connect the array to external memory and host

The packets loaded by interface tiles are routed through the NoC to the compute tiles. The compute tiles process the packets and send to next compute tile or interface tile. The packets are processed in a pipelined manner. 

## How to test

TBA

