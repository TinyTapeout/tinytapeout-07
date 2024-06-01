`default_nettype none

// just a stub to keep the Tiny Tapeout tools happy

module tt_um_rejunity_ay8913 (
    input  wire       VGND,
    input  wire       VPWR,
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // analog pins
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    // the first 4 pins of the Bidirectional path are used for:
    // [1:0] bus control lines (BDIR and BC1) are set to input mode (=0),
    // [3:2] clock divider pins (SEL0, SEL1)  are set to input mode (=0),
    // assign uio_oe[7:0]  = 8'b0000_0000;
    // assign uio_out[7:0] = 8'b0000_0000;
    // assign uo_out[7:3]  =    5'b0_0000; // the upper 5 output pins are not used

    // Tie unused pins to the ground
    // Using VGND instead of 0 to be on the safe side with LVS check
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

    assign uio_oe[0] = VGND;
    assign uio_oe[1] = VGND;
    assign uio_oe[2] = VGND;
    assign uio_oe[3] = VGND;
    assign uio_oe[4] = VGND;
    assign uio_oe[5] = VGND;
    assign uio_oe[6] = VGND;
    assign uio_oe[7] = VGND;

    wire [14:0] channel_A_dac_ctrl;
    wire [14:0] channel_B_dac_ctrl;
    wire [14:0] channel_C_dac_ctrl;

    ay8913 ay8913(
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        
        .clock_select(uio_in[3:2]),

        .data(ui_in),
        .bdir(uio_in[0]),
        .bc1(uio_in[1]),

        .channel_A_dac_ctrl(channel_A_dac_ctrl),
        .channel_B_dac_ctrl(channel_B_dac_ctrl),
        .channel_C_dac_ctrl(channel_C_dac_ctrl),

        .channel_A_pwm_out(uo_out[0]),
        .channel_B_pwm_out(uo_out[1]),
        .channel_C_pwm_out(uo_out[2]),

        .VPWR(VPWR),
        .VGND(VGND)
        );

    // .subckt dac_16nfet VDD AT0 AT1 AT2 AT3 AT4 AT5 AT6 AT7 AT8 AT9 AT10 AT11 AT12 AT13 AT14 OUT VSS
    dac_16nfet dac_A(
        .AT0 (channel_A_dac_ctrl[14]),
        .AT1 (channel_A_dac_ctrl[13]),
        .AT2 (channel_A_dac_ctrl[12]),
        .AT3 (channel_A_dac_ctrl[11]),
        .AT4 (channel_A_dac_ctrl[10]),
        .AT5 (channel_A_dac_ctrl[9] ),
        .AT6 (channel_A_dac_ctrl[8] ),
        .AT7 (channel_A_dac_ctrl[7] ),
        .AT8 (channel_A_dac_ctrl[6] ),
        .AT9 (channel_A_dac_ctrl[5] ),
        .AT10(channel_A_dac_ctrl[4] ),
        .AT11(channel_A_dac_ctrl[3] ),
        .AT12(channel_A_dac_ctrl[2] ),
        .AT13(channel_A_dac_ctrl[1] ),
        .AT14(channel_A_dac_ctrl[0] ),
        .OUT(ua[2]),
        .VDD(VPWR),
        .VSS(VGND), 
        );

    dac_16nfet dac_B(
        .AT0 (channel_B_dac_ctrl[14]),
        .AT1 (channel_B_dac_ctrl[13]),
        .AT2 (channel_B_dac_ctrl[12]),
        .AT3 (channel_B_dac_ctrl[11]),
        .AT4 (channel_B_dac_ctrl[10]),
        .AT5 (channel_B_dac_ctrl[9] ),
        .AT6 (channel_B_dac_ctrl[8] ),
        .AT7 (channel_B_dac_ctrl[7] ),
        .AT8 (channel_B_dac_ctrl[6] ),
        .AT9 (channel_B_dac_ctrl[5] ),
        .AT10(channel_B_dac_ctrl[4] ),
        .AT11(channel_B_dac_ctrl[3] ),
        .AT12(channel_B_dac_ctrl[2] ),
        .AT13(channel_B_dac_ctrl[1] ),
        .AT14(channel_B_dac_ctrl[0] ),
        .OUT(ua[1]),
        .VDD(VPWR),
        .VSS(VGND), 
        );

    dac_16nfet dac_C(
        .AT0 (channel_C_dac_ctrl[14]),
        .AT1 (channel_C_dac_ctrl[13]),
        .AT2 (channel_C_dac_ctrl[12]),
        .AT3 (channel_C_dac_ctrl[11]),
        .AT4 (channel_C_dac_ctrl[10]),
        .AT5 (channel_C_dac_ctrl[9] ),
        .AT6 (channel_C_dac_ctrl[8] ),
        .AT7 (channel_C_dac_ctrl[7] ),
        .AT8 (channel_C_dac_ctrl[6] ),
        .AT9 (channel_C_dac_ctrl[5] ),
        .AT10(channel_C_dac_ctrl[4] ),
        .AT11(channel_C_dac_ctrl[3] ),
        .AT12(channel_C_dac_ctrl[2] ),
        .AT13(channel_C_dac_ctrl[1] ),
        .AT14(channel_C_dac_ctrl[0] ),
        .OUT(ua[0]),
        .VDD(VPWR),
        .VSS(VGND), 
        );

endmodule
