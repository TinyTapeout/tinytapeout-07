<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

# How it works

## PRNG: Xorshift Overview

A Xorshift is a type of pseudorandom number generator (PRNG) that utilizes shift and XOR operations to generate a sequence of pseudorandom numbers. Introduced by George Marsaglia in 2003, the Xorshift is renowned for its speed and simplicity of implementation in both hardware and software platforms.

## Theoretical Basis for an 8-bit Xorshift

### State Register

The Xorshift algorithm employs a state register that, in the case of an 8-bit Xorshift, consists of an 8-bit integer. This register maintains the current state of the PRNG, which is updated with each iteration to produce the subsequent pseudorandom number.

### Fundamental Operations

- **XOR**: The XOR (⊕) operation is essential for bit scrambling in the state. It takes two bits and returns 1 if the bits are different and 0 if they are the same.
- **Shift**: Shift operations (either left or right) move bits by a specified number of positions, introducing zeros into the vacated positions.

### Sequence of Operations

At each step, the current state is altered using a series of XOR and shift operations. For instance, an 8-bit Xorshift might proceed as follows:

1. `x = x ⊕ (x << a)`
2. `x = x ⊕ (x >> b)`
3. `x = x ⊕ (x << c)`

Here, `x` denotes the current state, while `<<` and `>>` signify left and right shifts, respectively. The constants `a`, `b`, and `c` determine the magnitude of these shifts.

### Period

The period of a Xorshift depends on both the number of bits in the state register and the choice of shift parameters `a`, `b`, and `c`. For an 8-bit register, the maximum achievable period is `2^8 - 1 = 255`, assuming the parameters are selected wisely to prevent short cycling.


# How to test

To test this random number generator you must place an 8-bit seed as input (ui_in) and after 2 cycles of latency you will obtain a random number at each clock cycle at the output (uo_out).
![RTL Module](tt_um_jorga20j_prng.svg)


For more information about rtl: [tt_um_jorga20j_prng.md](tt_um_jorga20j_prng.md)




