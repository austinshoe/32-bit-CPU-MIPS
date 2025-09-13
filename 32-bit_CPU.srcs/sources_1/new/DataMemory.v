`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 11:15:30 AM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input clk,
    input MemRead,
    input MemWrite,
    input [31:0] address,
    input [31:0] WriteData,
    output [31:0] ReadData,
    );

    reg [31:0] mem [0:63];
    integer counter;

    //set datamem
    initial begin
        for (counter = 0; counter < 64; counter = counter + 1)
        begin
            mem[i] = 0;
        end
    end


endmodule
