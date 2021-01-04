`timescale 1ns / 1ps
// get instrcment from instr memary
`include "defines.vh"

module get_instr(
    input wire clock,      
    input wire reset, 
    
  //  input 
    input wire[`PCSIZE] instr_addr,       
    
    output reg[`INSTRSIZE] Instr   // instrcment
    
    );
    
    reg[`INSTRLENGTH]  instr_mem[0:`INSTR_MEM_NUM-1];
    initial $readmemh ("C:/Users/IFpop/Desktop/Single_cycle_Cpu/inst_rom.data",instr_mem);
    
   always @(*) begin
        if (reset == 1'b1) begin
            Instr <= `ZEROWORD;
        end 
        else begin
            Instr <= instr_mem[instr_addr[17:2]];
        end
    end
   
    
endmodule
