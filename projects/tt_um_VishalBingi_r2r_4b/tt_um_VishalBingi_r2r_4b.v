/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_VishalBingi_r2r_4b (
    input  wire       VGND,
    input  wire       VPWR,
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // Analog pins, only ua[5:0] can be used
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

wire [3:0] r2r_out;

r2r_4b_dac_control r2r_4b_dac_control(
        .clk(clk),                  // expect a 10M clock
        .n_rst(rst_n),
        .ext_data(uio_in[0]),       // if this is high, then DAC data comes from ui_in[3:0]
        .load_divider(uio_in[1]),   // load value set on data to the clock divider
        .data[0](ui_in[0]),               // connect to ui_in[3:0]
	.data[1](ui_in[1]),
	.data[2](ui_in[2]),
	.data[3](ui_in[3]),
        .r2r_out(r2r_out),          // 4 bit out to the R2R DAC
        .VPWR(VPWR),
        .VGND(VGND)
        );

r2r_4b r2r_4b(
        .b0(r2r_out[0]),
        .b1(r2r_out[1]),
        .b2(r2r_out[2]),
        .b3(r2r_out[3]),
        .out(ua[0]),
        .VSUBS(VGND),
        .GND(VGND)
        );

// ties for the output enables
//
    assign ui_in[4] = VGND;
    assign ui_in[5] = VGND;
    assign ui_in[6] = VGND;
    assign ui_in[7] = VGND;   

    assign uo_out[0] = VGND;
    assign uo_out[1] = VGND;
    assign uo_out[2] = VGND;
    assign uo_out[3] = VGND;
    assign uo_out[4] = VGND;
    assign uo_out[5] = VGND;
    assign uo_out[6] = VGND;
    assign uo_out[7] = VGND;

    assign uio_out[0] = VGND;
    assign uio_out[1] = VGND;
    assign uio_out[2] = VGND;
    assign uio_out[3] = VGND;
    assign uio_out[4] = VGND;
    assign uio_out[5] = VGND;
    assign uio_out[6] = VGND;
    assign uio_out[7] = VGND;

    assign uio_in[2] = VGND;
    assign uio_in[3] = VGND;
    assign uio_in[4] = VGND;
    assign uio_in[5] = VGND;
    assign uio_in[6] = VGND;
    assign uio_in[7] = VGND;


    assign uio_oe[0] = VGND;
    assign uio_oe[1] = VGND;
    assign uio_oe[2] = VGND;
    assign uio_oe[3] = VGND;
    assign uio_oe[4] = VGND;
    assign uio_oe[5] = VGND;
    assign uio_oe[6] = VGND;
    assign uio_oe[7] = VGND;

endmodule
