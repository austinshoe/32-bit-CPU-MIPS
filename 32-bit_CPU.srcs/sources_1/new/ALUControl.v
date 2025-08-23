`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 01:37:39 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
    input [1:0] ALUOp,
    input [5:0] funct,
    output reg [3:0] ALUControlOut
    );

    parameter AND_OP = 4'b0;
    parameter OR_OP  = 4'b0001;
    parameter ADD_OP = 4'b0010; 
    parameter SUB_OP = 4'b0110;
    parameter SLT_OP = 4'b0111;

    always @(*) begin 
        casez ({ALUOp, funct})
            //lw, sw
            8'b00xxxxxx: ALUControlOut = ADD_OP;
            //beq
            8'b01xxxxxx: ALUControlOut = SUB_OP;
            //add (R-type)
            8'b10100000: ALUControlOut = ADD_OP;
            //sub (R-type)
            8'b10100010: ALUControlOut = SUB_OP;
            //and (R-type)
            8'b10100100: ALUControlOut = AND_OP;
            //or (R-type)
            8'b10100101: ALUControlOut = OR_OP;
            //slt (R-type)
            8'b10101010: ALUControlOut = SLT_OP;

            default: ALUControlOut = 4'b0;
        endcase
    end

endmodule
