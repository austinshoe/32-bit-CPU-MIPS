`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 02:14:49 AM
// Design Name: 
// Module Name: tb_top_level
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


module tb_top_level;
    reg clk;
    reg reset;
    wire _isZero;

    top_level testtoplevel(
        .globalclock(clk),
        .globalreset(reset),
        ._isZero(_isZero)
    );

    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;

        #0.01 reset = 0;

        #2000;
        $finish;

    end

endmodule
