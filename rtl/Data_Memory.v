`timescale 1ns / 1ps

`include "defines.vh"
module Data_Memory(
    input wire clock,
    input wire reset,
    
    // control signal
    input MemWrite,
    
    // input 
    input wire[`ADDRLENGTH] addr,
    input wire [`DATALENGTH]WriteData,
    
    // output
    output [`DATALENGTH] ReadData
    );
    
    reg[`DATALENGTH]  data_mem[0:`DATA_MEM_NUM-1];
   
   always @ (posedge clock) begin
        if(reset != `RST_ENABLE && MemWrite == 1'b1)begin
            data_mem[addr[16:0]] <= WriteData;
        end  
   end

   assign ReadData = (reset == 1'b1) ?`ZEROWORD : data_mem[addr[16:0]];
endmodule
