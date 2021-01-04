`timescale 1ns / 1ps
`include "defines.vh"
module get_Result(

    // control signal
    input MemtoReg,

    // input
    input [`DATALENGTH] ReadData,
    input [`DATALENGTH] ALUOut,

    // output
    output [`DATALENGTH] Result

    );

    assign Result = MemtoReg ? ReadData : ALUOut;
endmodule
