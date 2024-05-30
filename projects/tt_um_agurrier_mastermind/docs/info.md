<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The goal of Mastermind is to guess the correct color combination with the minimal number of inputs.  Guesses are made using specific inputs which represent different colors.

## How to test

To randomly pick the hidden color answer, press any push button once.  

After the answer is chosen, the user can start to make guesses.  No color can be repeated in a guess (and it won't be repeated in the answer either).  A guess consists of 4 button pushes to select 4 colors.

Once a guess is selected, the LEDs will show the guide code. The four LEDs closest to the left will show how many colors are correct (but not necessarily in the correct place), and the four LEDs closes to the right will show how many colors are in the correct position.  Using this hint, the user can make an educated guess as to what their next guess will be.

If 10 rounds go by and the user doesn't get the correct combination, the LEDs will flash on and off to indicate a loss.
If the user guesses the correct color combination, the light is shifted to the left by a clock to indicate a win.

## External hardware

The external hardware that may be useful in playing the game are two Pmod BTNs (410-077) for a total of 8 push buttons (for color inputs), a Pmod8LD (410-163) for 8 output LEDs, and a 2x6 pin to dual 6-pin Pmod splitter cable (240-110) to use both push button Pmods..  All can be purchased on digilent.com
