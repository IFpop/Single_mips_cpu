`timescale 1ns / 1ps
// update PC
`include "defines.vh"
module decode(

    // input
    input [`INSTRSIZE] Instr,

    // output
    output [`R_SIZE] rs,
    output [`R_SIZE] rt,
    output [`R_SIZE] rd,

    output [`IMI_SIZE] im,

    output [`OP_SIZE] opcode,
    output [`OP_SIZE] funccode,
    output [`INSTR_INDEX]instrIndex

    );


    assign instrIndex = Instr[25:0];
    assign rs = Instr[25:21];
    assign rt = Instr[20:16];
    assign rd = Instr[15:11];
    assign im = Instr[15:0];
    assign opcode = Instr[31:26];
    assign funccode = Instr[5:0];





 endmodule