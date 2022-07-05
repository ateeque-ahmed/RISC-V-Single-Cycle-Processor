`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2022 00:40:22
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
input [3:0]ALUOperation,
input [31:0]Data1_RF,
input [31:0]Data2_shift_cond_mux,
input [4:0] shamt,

output reg [31:0]ALUResult_ALU,
output reg ZeroFlag
    );
always@(*)
begin
case(ALUOperation)
4'b1000: ALUResult_ALU = Data1_RF + Data2_shift_cond_mux;
4'b1010: ALUResult_ALU = Data1_RF - Data2_shift_cond_mux;
4'b1100: ALUResult_ALU = Data1_RF & Data2_shift_cond_mux;
4'b1101: ALUResult_ALU = Data1_RF | Data2_shift_cond_mux;
4'b0000: ALUResult_ALU = Data1_RF << shamt;
4'b0010: ALUResult_ALU = Data1_RF >> shamt;
endcase
end
always@(ALUResult_ALU)
begin
if(ALUResult_ALU == 0)
    assign ZeroFlag =1;
else
    ZeroFlag = 0;
end
endmodule
