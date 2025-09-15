`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 03:36:28 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input [31:0] address,
    output [31:0] instruction
    );

    reg [31:0] memory [0:31]; //32 words of memory

    initial begin
        memory[0] = 32'b00010001011010100000000000000010;
        memory[1] = 32'b0;
        memory[2] = 32'b0;
        memory[3] = 32'b0;
        //memory[4] = 32'b00000000011001000010100000100010;
        memory[4] = 32'b0;
        memory[5] = 32'b0;
        memory[6] = 32'b0;
        memory[7] = 32'b0;	
        //memory[8] = 32'b00000000101001100011100000100100;
        memory[8] = 32'b0;
        memory[9] = 32'b0;
        memory[10] = 32'b0;
        memory[11] = 32'b0;
        //memory[12] = 32'b00000000111010000100100000100101;
        memory[12] = 32'b0;
        memory[13] = 32'b0;
        memory[14] = 32'b0;
        memory[15] = 32'b0;
        //memory[16] = 32'b10001101001010100000000000000100;
        memory[16] = 32'b0;
        memory[17] = 32'b0;
        memory[18] = 32'b0;
        memory[19] = 32'b0;
        //memory[20] = 32'b10101101010010110000000000001000;
        memory[20] = 32'b0;
        memory[21] = 32'b0;
        memory[22] = 32'b0;
        memory[23] = 32'b0;
        //memory[24] = 32'b00010001011010100000000000000010;
        memory[24] = 32'b0;
        memory[25] = 32'b0;
        memory[26] = 32'b0;
        memory[27] = 32'b0;
        memory[28] = 32'b0;
        memory[29] = 32'b0;
        memory[30] = 32'b0;
        memory[31] = 32'b0;
    end

    assign instruction = memory[address];

endmodule