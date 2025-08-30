`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2025 05:19:28 PM
// Design Name: 
// Module Name: top_level
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


module top_level(
        globalclock,
        globalreset,
        _isZero
    );
    input globalclock, globalreset;
    wire [31:0] instruction;
    wire [31:0] next_pc;
    wire [31:0] curr_pc;
    wire [3:0] ALUControlOut;
    wire RegDst;
    wire Jump;
    wire Branch;
    wire MemRead;
    wire MemToLog;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    wire [31:0] pcadd4;
    wire [3:0] ALUCtrlOut;

    
    PC ourpc (
        .clk(globalclock),
        .reset(globalreset),
        .next_pc(next_pc),
        .curr_pc(curr_pc)
    );

    PC_Adder pcadder (
        .pc_in(curr_pc),
        .pc_out(pcadd4)
    );
    
    Instruction_Memory instructions (
        .address(curr_pc),
        .instruction(instruction)
    );

    Control control (
        .opcode(instruction[31:26]),
        .RegDst(RegDst),
        .Jump(Jump),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemToLog(MemToLog),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite)
    );
    
    ALUControl aluctrl (
        .ALUOp(ALUOp),
        .funct(instruction[5:0]),
        .ALUControlOut(ALUCtrlOut)
    );

    /*Registers regs (
        .ReadReg1(instruction[25:21]);
        .ReadReg2(instruction[20:16]);
    );*/

endmodule