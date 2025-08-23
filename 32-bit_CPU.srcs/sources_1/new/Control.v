`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2025 08:23:48 AM
// Design Name: 
// Module Name: Control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Control(
    input [5:0] opcode,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg MemRead,
    output reg MemToLog,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );


    // ref: https://en.wikibooks.org/wiki/MIPS_Assembly/Instruction_Formats 
    always @(*) begin
        casez (opcode) 
            // R-type
            6'b000000: {RegDst, Jump, Branch, MemRead, MemToLog, ALUOp, MemWrite, ALUSrc, RegWrite} = 10'b1000010001;
            //lw
            6'b100011: {RegDst, Jump, Branch, MemRead, MemToLog, ALUOp, MemWrite, ALUSrc, RegWrite} = 10'b0001000111;
            //sw
            6'b101011: {RegDst, Jump, Branch, MemRead, MemToLog, ALUOp, MemWrite, ALUSrc, RegWrite} = 10'bx000x00110;
            //beq
            6'b000100: {RegDst, Jump, Branch, MemRead, MemToLog, ALUOp, MemWrite, ALUSrc, RegWrite} = 10'b0010001000;

            //figure out jump if I have time

            default: {RegDst, Jump, Branch, MemRead, MemToLog, ALUOp, MemWrite, ALUSrc, RegWrite} = 10'b0;
        endcase
    end
endmodule
