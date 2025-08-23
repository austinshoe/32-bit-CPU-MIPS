`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 02:01:10 PM
// Design Name: 
// Module Name: tb_control
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


module tb_control;
    reg [5:0] opcode;
    wire RegDst;
    wire Jump;
    wire Branch;
    wire MemRead;
    wire MemToLog;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;

    Control U_Control (
        .opcode (opcode),
        .RegDst (RegDst),
        .Jump (Jump),
        .Branch (Branch),
        .MemRead (MemRead),
        .MemToLog (MemToLog),
        .ALUOp (ALUOp),
        .MemWrite (MemWrite),
        .ALUSrc (ALUSrc),
        .RegWrite (RegWrite)
    );

    initial begin
        // Test R-Type
        opcode = 6'b0;
        #10;

        // Test lw
        opcode = 6'b100011;
        #10;

        //Test sw
        opcode = 6'b101011;
        #10;

        //Test beq
        opcode = 6'b000100;
        #10;

        $finish;
    end

endmodule
