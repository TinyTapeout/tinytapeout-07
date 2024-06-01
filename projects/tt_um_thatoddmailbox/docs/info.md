<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This is a small System-of-Chip (SoC) built around the DuckCPU, an 8-bit CPU that implements a custom architecture based on the Zilog Z80 and Sharp LR35902.

The following peripherals are provided:
* RSPI (reserved SPI, for flash/RAM acccess)
* UART0
* SPI0

More detailed documentation will be added to the [project page](https://github.com/thatoddmailbox/tt07-duckcpu) after the tapeout.

## How to test

Connect a SPI flash IC to the RSPI pins, with spi_flash_ce_n as its chip enable. Similarly, connect a SPI RAM IC, with spi_ram_ce_n as its chip enable.

Pull the BOOTSEL pin low and reset the chip. This puts it into its bootloader mode. You can then use [ducktool](https://github.com/thatoddmailbox/ducktool) to download code onto the flash/RAM and reset the CPU.

## External hardware

Minimum requirement:
* SPI flash IC (tested with ISSI IS25LP020E)
* SPI RAM IC (tested with ISSI IS66WVS1M8BLL)
* USB to UART circuit (included on demo board)

While we do follow the standard TinyTapeout pinout for UART, we do not for SPI. This is because we want to save the bidirectional pins for use by the GPIO peripheral.