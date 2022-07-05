`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2022 00:13:55
// Design Name: 
// Module Name: Instruction_Fetch
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
module Instruction_Fetch(
    input clk,
    input reset,
    output [31:0] Instruction_code
    );
reg [31:0]PC;
Instruction_Memory imem(PC, reset, Instruction_code);

always@(posedge clk, negedge reset)
begin
	if(reset == 0)
		PC <= 0;
	else
		PC <= PC+4;
end

endmodule
