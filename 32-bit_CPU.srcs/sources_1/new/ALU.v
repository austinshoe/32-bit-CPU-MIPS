`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2025 10:22:28 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
        input [3:0] ALUControlOut,
        input [31:0] ReadData1,
        input [31:0] ReadData2,
        output reg [31:0] ALUResult,
        output _isZero
    );

    parameter AND_OP = 4'b0;
    parameter OR_OP  = 4'b0001;
    parameter ADD_OP = 4'b0010; 
    parameter SUB_OP = 4'b0110;
    parameter SLT_OP = 4'b0111;

    always @(*)begin
        casez (ALUControlOut)
            AND_OP: ALUResult = ReadData1 & ReadData2;
            OR_OP : ALUResult = ReadData1 | ReadData2;
            ADD_OP: ALUResult = ReadData1 + ReadData2; 
            SUB_OP: ALUResult = ReadData1 - ReadData2;
            SLT_OP: begin
                if (ReadData1 < ReadData2)
                    ALUResult = 32'd1;
                else 
                    AluResult = 32'b0;
            end
            default: ALUResult = 32'b0;
        endcase
    end

    assign _isZero = (ALUResult == 32'b0) ? 1:0;

endmodule
