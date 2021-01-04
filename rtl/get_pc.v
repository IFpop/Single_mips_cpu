`timescale 1ns / 1ps
// update PC
`include "defines.vh"
module get_pc(
    input clock,
    input reset,

    input [`DATALENGTH]SignImm,
    input [`INSTR_INDEX] instrIndex,
    input [`PCSIZE] PCPlus4,


    // control signals,
    input ZERO,
    input Branch,
    input Jump,

    // output
    output reg[`PCSIZE] PC
    );

    wire [`PCSIZE] PC_;


    assign PC_ = (reset == `RST_ENABLE)?`ZEROWORD
                :( Jump ==1'b1) ? {PCPlus4[31:28],instrIndex,2'b00}
                :( (ZERO&Branch) == 1'b1)? (PCPlus4+ {SignImm[29:0],2'b00})
                :PCPlus4;


    always @ (posedge clock) begin
        if (reset == `RST_ENABLE ) begin
            PC <= `ZEROWORD;
        end
        else begin
            PC <= PC_;
        end
    end

endmodule
