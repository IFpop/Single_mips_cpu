`timescale 1ns / 1ps

`include "defines.vh"
module PC_ALU(
    //input reset,

    input [`PCSIZE]PC,
    output [`PCSIZE] PCPlus4
    );

    assign PCPlus4 = PC + 4;


endmodule
