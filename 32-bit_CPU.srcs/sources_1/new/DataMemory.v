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
    output reg [31:0] ReadData
    );

    reg [31:0] mem [0:63];
    integer counter;

    //set datamem
    initial begin
        for (counter = 0; counter < 64; counter = counter + 1)
        begin
            mem[counter] = 0;
        end
    end

    /*always @(posedge clk) begin
        if (MemWrite == 1)
        mem[address] <= WriteData;
        else if (MemRead == 1)
        ReadData <= mem[address];
        else
        ReadData <= 32'b0;
    end*/
    always @(posedge clk) begin
        if (MemWrite == 1)
            mem[address] <= WriteData;
    end

    always @(*) begin
        if (MemRead == 1)
            ReadData <= mem[address];
        else
            ReadData <= 32'b0;
    end

endmodule
