`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2025 11:02:48 AM
// Design Name: 
// Module Name: RegMux
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


module RegMux(
    input [4:0] in1, in2,
    input sel,
    output[4:0] out
    );

    assign out = (sel) ? in2 : in1;
endmodule
