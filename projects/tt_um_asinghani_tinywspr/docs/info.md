## How it works

Tiny WSPR Beacon for transmitting Weak Signal Propagation Reporter radio signals. Recommended for 20m and 40m bands.

## How to test

Use the "config in" pins to input one byte of config data at a time. Input the 6-letter callsign as ASCII characters, padded as is standard for WSPR. Input the 4-letter grid square with the second and third character swapped (i.e. FN01 -> F0N1). Input the power level as a single byte in dBm. It must end in a 0, 3, or 7 for proper decoding. Input the symbol time (the number of clock cycles in 0.6827 seconds) as a 4-byte, big-endian value. Input the divisor (`2^32 * (transmit_freq / clk_freq)`) as a 4-byte, big-endian value. Input the deviation (`2^32 * (1.4648 / clk_freq)`) as a 2-byte, big-endian value. Wait until exactly one second after an even-numbered UTC minute, then raise the RF start pin. It is recommended to do this using a GPS-based timekeeping source.

## External hardware

An external lowpass filter to remove harmonics is absolutely required, as this design uses a square-wave transmitter that generates harmonics well outside the legal limit. An appropriately tuned antenna for the band being used is also necessary in order to transmit effectively.
