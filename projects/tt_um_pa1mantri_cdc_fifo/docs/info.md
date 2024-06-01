<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The cdc_fifo module transfers data between two clock domains: a write clock domain and a read clock domain. The module includes a dual-ported RAM(dpram) for storing data, along with logic for handling read and write operations(cdc_fifo_read_state and cdc_fifo-write-state). synchronizers(synchronizer) and binary/gray converters(binary_to_gray and gray_to_binary) ensure proper synchronization between two clock domains.


## How to test

Hold write_reset and read_reset LOW while running the clock for a bit to reset, then raise to initialize the module.

writing to the fifo: Prepare your data on the 4-bit write_data bus, ensure the full state is low and then raise write_increment for 1 cycle of write_clock to write data into the FIFO memory.

Reading from the fifo: The FIFO will present the current output on the read_data bus. If empty is low, this output should be valid and you can acknowledge receive of this vallue by raising read_increment for 1 cycle of read_clock.

## External hardware

NO external hardware is used.


