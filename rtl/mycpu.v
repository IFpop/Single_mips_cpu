`timescale 1ns / 1ps
`include "defines.vh"

module mycpu(
    input   wire     rstn,
    input   wire     clk

//    output  wire[`PCSIZE]      inst_rom_addr,
//    input   wire[`INSTRSIZE]   inst_rom_rdata,

//    output  wire[`DATALENGTH]  data_ram_addr,
//    output  wire[`DATALENGTH]  data_ram_wdata,
//    output  wire               data_ram_wen,
//    input   wire               data_ram_wen,
    );
    wire[`PCSIZE]      inst_rom_addr;
    wire[`INSTRSIZE]   inst_rom_rdata;
    wire[`DATALENGTH]  data_ram_addr;
    wire[`DATALENGTH]  data_ram_wdata;
    wire               data_ram_wen;
    wire               data_ram_wen;
    
    wire rst;
    assign rst = rstn;
    
    wire [`DATALENGTH] SignImm;
    wire [`INSTR_INDEX] instrIndex;
    wire [`PCSIZE] PCPlus4;
    wire ZERO;
    wire Branch;
    wire Jump;


    wire[`R_SIZE] rs;
    wire[`R_SIZE] rt;
    wire[`R_SIZE] rd;
    wire[`IMI_SIZE] im;
    wire[`OP_SIZE] opcode;
    wire[`OP_SIZE] funccode;

    wire RegWrite;
    wire MemtoReg;

    wire [`ALUCONTROL_SIZE] ALUControl;
    wire ALUSrc;
    wire RegDst;
    wire [1:0] SigExtendSignal;

    wire [`R_SIZE] WriteReg;
    wire [`DATALENGTH] Result;
    wire[`DATALENGTH] RD1;


    wire [`DATALENGTH]SrcB;


    get_pc get_pc0(
        .clock(clk),
        .reset(rst),
        .SignImm(SignImm),
        .instrIndex(instrIndex),
        .PCPlus4(PCPlus4),
        .ZERO(ZERO),
        .Branch(Branch),
        .Jump(Jump),
        .PC(inst_rom_addr)
        );

    PC_ALU PC_ALU0(
        .PC(inst_rom_addr),
        .PCPlus4(PCPlus4)
        );
    get_instr get_instr0(
//        .clock(clk),
//        .reset(rst),
        .instr_addr(inst_rom_addr),
        .Instr(inst_rom_rdata)
     );
     decode decode0(
        .Instr(inst_rom_rdata),
        .instrIndex(instrIndex),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .im(im),
        .opcode(opcode),
        .funccode(funccode)
        );

     control_unit control_unit0(
        .opcode_in(opcode),
        .funccode_in(funccode),
        .RegWrite(RegWrite),
        .MemtoReg(MemtoReg),
        .MemWrite(data_ram_wen),
        .ALUControl(ALUControl),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .Branch(Branch),
        .Jump(Jump),
        .SigExtendSignal(SigExtendSignal)
        );

     regfile regfile0(
        .clock(clk),
        .reset(rst),
        .RegWrite(RegWrite),
        .A1(rs),
        .A2(rt),
        .A3(WriteReg),
        .WD3(Result),
        .RD1(RD1),
        .RD2(data_ram_wdata)
        );

     sig_extend sig_extend0(
        .im(im),
        .SignImm(SignImm),
        .SigExtendSignal(SigExtendSignal)
        );

     get_SrcB get_SrcB0(
        .ALUSrc(ALUSrc),
        .WriteData(data_ram_wdata), //noted
        .SignImm(SignImm),
        .SrcB(SrcB)
        );

     SrcA_SrcB_ALU SrcA_SrcB_ALU0(
        .ALUControl(ALUControl),
        .SrcA(RD1),
        .SrcB(SrcB),
        .ALUOut(data_ram_addr),
        .ZERO(ZERO)
        );
     
     Data_Memory Data_Memory0(
        .clock(clk),
        .reset(rst),
        .MemWrite(data_ram_wen),
        .addr(data_ram_addr),
        .WriteData(data_ram_wdata),
        .ReadData(data_ram_rdata)
     );
     
     get_WriteReg get_WriteReg0(
        .RegDst(RegDst),
        .Rt(rt),
        .Rd(rd),
        .WriteReg(WriteReg)
        );


     get_Result get_Result0(
        .MemtoReg(MemtoReg),
        .ReadData(data_ram_rdata),
        .ALUOut(data_ram_addr),
        .Result(Result)
        );
endmodule
