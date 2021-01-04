`timescale 1ns / 1ps
`include"defines.vh"

module SrcA_SrcB_ALU(
    input [`ALUCONTROL_SIZE]ALUControl,

    // input
    input [`DATALENGTH] SrcA,
    input [`DATALENGTH] SrcB,


    output ZERO,
    output [`DATALENGTH]ALUOut
    );



    assign ALUOut = (ALUControl == `ALU_OR)? (SrcA | SrcB) :
                     (ALUControl == `ALU_ADD)? (SrcA + SrcB) :
                     (ALUControl == `ALU_SUB)? (SrcA - SrcB) :
                     (ALUControl == `ALU_NONE) ? SrcB: `ZEROWORD;

    assign ZERO = ( ALUOut == 0) ? 1'b1:1'b0;


endmodule
