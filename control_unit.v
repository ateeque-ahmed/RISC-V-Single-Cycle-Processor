`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2022 00:16:23
// Design Name: 
// Module Name: control_unit
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
module control_unit(
input opcode_31,
input [3:0] funct_IF,
output reg RegWrite,
output reg shift_cond,
output reg [3:0]ALUOperation_control_unit,
output reg load_int_cond
);
always@(*)
begin
    RegWrite = 1;
    ALUOperation_control_unit = funct_IF;
    shift_cond = 0;
    load_int_cond = 0;
    if(funct_IF ==0 || funct_IF == 2)
    begin
        shift_cond = 1;
    end
    if(opcode_31 == 1)
    begin
        load_int_cond = 1;
    end
end
endmodule
