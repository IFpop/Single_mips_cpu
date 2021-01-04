`timescale 1ns / 1ps
// update PC
`include "defines.vh"
module regfile(
    input wire clock,
    input wire reset,
    // input signal
    input wire RegWrite,

    // input
    input wire[`R_SIZE] A1,
    input wire[`R_SIZE] A2,
    input wire[`R_SIZE] A3,
    input wire[`DATALENGTH] WD3,

   // output
    output wire[`DATALENGTH] RD1,
    output wire[`DATALENGTH] RD2
    );

    // regs
    reg[`DATALENGTH] regs[0:`REGNUM-1];

    // write , cost clock
    always @(posedge clock) begin
               if((RegWrite == 1) &&(A3 != 5'b00000)) begin
                   regs[A3] <= WD3;
               end
           end

    // read
    assign RD1 = (reset == `RST_ENABLE || A1 == 5'b00000)?`ZEROWORD:regs[A1];
    assign RD2 = (reset == `RST_ENABLE || A2 == 5'b00000)?`ZEROWORD:regs[A2];


endmodule

