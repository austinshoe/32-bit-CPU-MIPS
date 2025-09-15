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
    output _isZero;
    wire [31:0] instruction;
    wire [31:0] next_pc;
    wire [31:0] curr_pc;
    //wire [3:0] ALUControlOut;
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
    wire [31:0] signextended;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    //wire [31:0] WriteData;
    wire [31:0] ALUResult;
    wire [4:0] DestReg;
    wire [31:0] write_data_mux_out;
    wire [31:0] alusrc_mux_out;
    wire [31:0] ReadDataMem;
    wire [31:0] leftshiftout;
    wire [31:0] branchadderout;
    wire branchsel;
    

    
    PC programcounter (
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

    RegMux regdest (
        .in1(instruction[20:16]), //I
        .in2(instruction[15:11]),
        .sel(RegDst),
        .out(DestReg)
    );

    Mux31 RegData (
        .in1(ALUResult),
        .in2(ReadDataMem),
        .sel(MemToLog),
        .out(write_data_mux_out)
    );

    Registers regs (
        .ReadReg1(instruction[25:21]),
        .ReadReg2(instruction[20:16]),
        .WriteReg(DestReg),
        .WriteData(write_data_mux_out),
        .RegWrite(RegWrite),
        .clk(globalclock),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );

    ALU alu (
        .ALUControlOut(ALUCtrlOut),
        .ReadData1(ReadData1),
        .ReadData2(alusrc_mux_out),
        //.ReadData2(), This could be memory too --> alusrc mux and mem implementation first
        .ALUResult(ALUResult),
        ._isZero(_isZero)
    );

    SignExtend addrextend (
        .immediate_val(instruction[15:0]),
        .extended_val(signextended)
    );

    Mux31 AluSrcMux (
        .in1(ReadData2),
        .in2(signextended),
        .sel(ALUSrc),
        .out(alusrc_mux_out)
    );

    DataMemory datamem (
        .clk(globalclock),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(ALUResult),
        .ReadData(ReadDataMem),
        .WriteData(ReadData2)
    );

    ShiftLeft shiftleft (
        .in(signextended),
        .out(leftshiftout)
    );

    Add branchadder (
        .in1(pcadd4),
        .in2(leftshiftout),
        .out(branchadderout)
    );

    And branchyesno (
        .in1(Branch),
        .in2(_isZero),
        .out(branchsel)
    );

    Mux31 isBranch (
        .in1(pcadd4),
        .in2(branchadderout),
        .sel(branchsel),
        .out(next_pc)
    );



endmodule