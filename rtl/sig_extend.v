`timescale 1ns / 1ps

// update PC
`include "defines.vh"
module sig_extend(
    //input wire clock,
    //input wire reset,

    // control signal
    input [`EXTENDSIGNAL_SIZE] SigExtendSignal,
    // input
    input [`IMI_SIZE] im,

    // output
    output [`DATALENGTH] SignImm
    );
  // wire [`DATALENGTH]tmpSig;

   assign SignImm = (SigExtendSignal == 2'b01) ? {{16{im[15]}},im} :
                     (SigExtendSignal == 2'b00) ? {16'h0000,im} :
                     (SigExtendSignal == 2'b10) ? {im,16'h0000} :
                     `ZEROWORD;
 endmodule