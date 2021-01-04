`timescale 1ns / 1ps
`include "defines.vh"

module get_SrcB(
    //input clock,
    //input reset,

    // control signal
    input ALUSrc,        // for conflict

    // input
    input [`DATALENGTH] WriteData,
    input [`DATALENGTH] SignImm,

    // output
    output [`DATALENGTH]SrcB

    );
    assign SrcB = (ALUSrc == 1'b0) ? WriteData :
                                     SignImm;
endmodule
