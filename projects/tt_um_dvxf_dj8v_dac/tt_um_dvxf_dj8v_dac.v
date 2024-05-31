`default_nettype none

// just a stub to keep the Tiny Tapeout tools happy

module tt_um_dvxf_dj8v_dac (
    input  wire       VGND,
    input  wire       VPWR,
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua, // analog pins
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    wire [7:0] dac_out;
    assign uio_oe[0] = VPWR;
    assign uio_oe[1] = VPWR;
    assign uio_oe[2] = VPWR;
    assign uio_oe[3] = VPWR;
    assign uio_oe[4] = VPWR;
    assign uio_oe[5] = VPWR;
    assign uio_oe[6] = VPWR;
    assign uio_oe[7] = VPWR;

    tt_um_dvxf_dj8v tt_um_dvxf_dj8v (
        .VGND(VGND),
        .VPWR(VPWR),
        .clk(clk),
        .ena(ena),
        .rst_n(rst_n),
        .ui_in(ui_in),
        .uio_in(uio_in),
        .uio_oe(dac_out),
        .uio_out(uio_out),
        .uo_out(uo_out)
        );

    r2r r2r(
        .b0(dac_out[0]),
        .b1(dac_out[1]),
        .b2(dac_out[2]),
        .b3(dac_out[3]),
        .b4(dac_out[4]),
        .b5(dac_out[5]),
        .b6(dac_out[6]),
        .b7(dac_out[7]),
        .out(ua[0]),
        .VSUBS(VGND),
        .GND(VGND)
        );

endmodule
