`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2025 11:03:17 AM
// Design Name: 
// Module Name: Mux31
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


module Mux31(
    input [31:0] in1, in2,
    input sel,
    output[31:0] out
    );

    assign out = (sel == 0) ? in1 : in2;

endmodule
