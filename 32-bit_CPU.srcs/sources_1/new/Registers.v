`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2025 10:49:06 PM
// Design Name: 
// Module Name: Registers
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


module Registers(
    input [4:0] ReadReg1, ReadReg2, WriteReg,
    input [31:0] WriteData,
    input RegWrite,
    input clk,
    output reg [31:0] ReadData1, ReadData2
    );

    reg [31:0] regs[0:31];

    initial begin //manually set / init
        regs[0] = 32'd0;
        regs[1] = 32'd1;
        regs[2] = 32'd5;
        regs[3] = 32'd20;
        regs[4] = 32'd17;
        regs[5] = 32'd7;
        regs[6] = 32'd25;
        regs[7] = 32'd0;
        regs[8] = 32'd0;
        regs[9] = 32'd15;
        regs[10] = 32'd13;
        regs[11] = 32'd13;
        regs[12] = 32'd0;
        regs[13] = 32'd0;
        regs[14] = 32'd0;
        regs[15] = 32'd0;
        regs[16] = 32'd0;
        regs[17] = 32'd0;
        regs[18] = 32'd0;
        regs[19] = 32'd0;
        regs[20] = 32'd0;
        regs[21] = 32'd0;
        regs[22] = 32'd0;
        regs[23] = 32'd0;
        regs[24] = 32'd0;
        regs[25] = 32'd0;
        regs[26] = 32'd0;
        regs[27] = 32'd0;
        regs[28] = 32'd0;
        regs[29] = 32'd0;
        regs[30] = 32'd0;
        regs[31] = 32'd0;
    end

    always @(posedge clk)
    begin
        if (RegWrite == 1)
        regs[WriteReg]<= WriteData;
        //else
        //begin
        //    ReadData1 <= regs[ReadReg1];
        //    ReadData2 <= regs[ReadReg2];
        //end
    end
    assign ReadData1 = regs[ReadReg1];
    assign ReadData2 = regs[ReadReg2];

endmodule
