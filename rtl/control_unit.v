`timescale 1ns / 1ps
`include"defines.vh"

module control_unit(

        // input
        input wire[`OP_SIZE] opcode_in,
        input wire[`OP_SIZE] funccode_in,

        // output . these are all control signal
        output  RegWrite,
        output  MemtoReg,
        output  MemWrite,
        output  [`ALUCONTROL_SIZE] ALUControl,
        output  ALUSrc,
        output  RegDst,
        output  Branch,
        output Jump,
        output [1:0] SigExtendSignal

    );

    assign RegWrite = (opcode_in == `OP_ALL_ZERO &&
                      funccode_in == `FUNC_ADD) ? 1'b1:
                      (opcode_in == `OP_LUI || opcode_in == `OP_ADDIU ||
                       opcode_in == `OP_LW || opcode_in == `OP_ORI) ? 1'b1:
                       1'b0;

    assign MemtoReg = opcode_in == `OP_LW ? 1'b1:1'b0;

    assign MemWrite = opcode_in == `OP_SW ? 1'b1:1'b0;

    assign ALUControl =(opcode_in == `OP_ALL_ZERO && funccode_in == `FUNC_ADD) ? `ALU_ADD:
                       (opcode_in == `OP_ORI)? `ALU_OR :
                       (opcode_in == `OP_LW||opcode_in == `OP_SW||
                        opcode_in == `OP_ADDIU) ? `ALU_ADD :
                       (opcode_in == `OP_BEQ)? `ALU_SUB:
                       `ALU_NONE;
    
    assign ALUSrc = (opcode_in == `OP_ADDIU || opcode_in == `OP_ORI ||
                     opcode_in == `OP_LW ||  opcode_in == `OP_SW ||
                     opcode_in == `OP_LUI ) ? 1'b1 :1'b0;

    assign RegDst = (opcode_in == `OP_ALL_ZERO &&
                    funccode_in == `FUNC_ADD)? 1'b1:1'b0;

    assign Branch =(opcode_in == `OP_BEQ)?1'b1:1'b0;

    assign Jump = opcode_in == `OP_J ? 1'b1:1'b0;


    assign SigExtendSignal  = (opcode_in == `OP_ADDIU || opcode_in == `OP_BEQ ||
                               opcode_in == `OP_LW  || opcode_in == `OP_SW) ? 2'b01 :
                              (opcode_in == `OP_LUI)?2'b10:
                              2'b00;





endmodule
