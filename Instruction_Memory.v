`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2022 00:12:37
// Design Name: 
// Module Name: Instruction_Memory
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
module Instruction_Memory(
    input [31:0] PC,
    input reset,
    output [31:0] Instruction_Code
    );
reg [7:0] Mem [35:0];
assign Instruction_Code = {Mem[PC+3],Mem[PC+2],Mem[PC+1],Mem[PC]};

always @(reset)
begin
if(reset==0)
begin
Mem[3] = 8'h00; Mem[2] = 8'h01; Mem[1] = 8'h10; Mem[0] = 8'h20;//add r0, r1, r2
Mem[7] = 8'h00; Mem[6]=8'h85; Mem[5]=8'h30; Mem[4]=8'h22;//sub r4,r5,r6
Mem[11] = 8'h01; Mem[10] = 8'h09; Mem[9] = 8'h50; Mem[8] = 8'h24;//and r8. r9, r10
Mem[15] = 8'h01; Mem[14] = 8'h28; Mem[13] = 8'h50; Mem[12] = 8'h25;//or r9, r8, r10
Mem[19] = 8'h01; Mem[18] = 8'h66; Mem[17] = 8'h01; Mem[16] = 8'h80;//sll r6, 6
Mem[23] = 8'h01; Mem[22] = 8'hA9; Mem[21] = 8'h02; Mem[20] = 8'h82;//srl r13, r9, 10
Mem[27] = 8'hFC; Mem[26] = 8'h20; Mem[25] = 8'h00; Mem[24] = 8'h08;//li r1, 8
end
end
endmodule
