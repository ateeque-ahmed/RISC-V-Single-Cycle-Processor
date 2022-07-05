`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2022 00:56:58
// Design Name: 
// Module Name: Main_Processor
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


module Main_Processor(
    input clk,
    input rst
    );
wire RegWrite;
wire [31:0]ALUResult;
wire [3:0]ALUOperation; 
wire [31:0]Data1;
wire [31:0]Data2;
wire ZeroFlag;
wire [31:0]instruction_code;
wire [31:0]sign_extended_value;
wire shift_cond;
wire load_int_cond;
wire [31:0]wd_final;

//Instruction Fetch Unit
Instruction_Fetch fetch(clk, rst, instruction_code);

//Sign Extender
sign_extender sgn_extd(instruction_code[20:0], sign_extended_value);
wire funct_1=instruction_code[5];
wire [2:0]funct_2_0=instruction_code[2:0];
wire [3:0] cntrl_input_funct = {funct_1,funct_2_0};

//Control Unit
control_unit cntrl_unit(instruction_code[31],cntrl_input_funct , RegWrite,shift_cond, ALUOperation,load_int_cond);

//Load MUX
MUX load_mux(ALUResult,sign_extended_value,load_int_cond,wd_final);

//register file
register_file reg_file(
instruction_code[20:16],
instruction_code[15:11],
instruction_code[25:21],
sign_extended_value,
load_int_cond,
Data1,Data2,wd_final,RegWrite,clk,rst
);

//ALU
ALU alu(ALUOperation, Data1, Data2, instruction_code[10:6],ALUResult, ZeroFlag);
endmodule
