`timescale 1ns / 1ps
`include "defines.vh"

module get_WriteReg(
    input RegDst,

    // input
    input [`R_SIZE] Rt,
    input [`R_SIZE] Rd,

    // output
    output [`R_SIZE] WriteReg
    );

    assign WriteReg = (RegDst == 1'b0)?Rt:Rd;

endmodule
