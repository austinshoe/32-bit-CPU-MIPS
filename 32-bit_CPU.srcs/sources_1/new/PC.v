`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 03:36:28 PM
// Design Name: 
// Module Name: PC
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

module PC(
    input clk,
    input reset,
    input [31:0] next_pc,
    output reg [31:0] curr_pc
    );

    always @(posedge clk or posedge reset) begin
        if (reset == 1) 
            curr_pc <= 32'b0;
        else
            curr_pc <= next_pc; 
    end

endmodule