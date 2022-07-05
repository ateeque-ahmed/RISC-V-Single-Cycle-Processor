`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2022 00:02:19
// Design Name: 
// Module Name: register_file
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
module register_file(
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] sign_extend,
    input load_cond,
    output [31:0] Data1,
    output [31:0] Data2,
    input [31:0] wd,
    input RegWrite,
    input clk,
    input Reset
    );
    integer i;
    reg [31:0] RegMem [31:0];
    
    always@(posedge clk,negedge Reset)
    begin
        if(Reset==0)
        begin
            RegMem[0]=32'h0;
            RegMem[1]=32'h2;
            RegMem[2]=32'h3;
            //RegMem[3]=32'h0;
            RegMem[4]=32'h0;
            RegMem[5]=32'h0A;
            RegMem[6]=32'h6;
            //RegMem[7]=32'h7;
            RegMem[8]=32'h0;
            RegMem[9]=32'h7;
            RegMem[10]=32'h4;
            RegMem[11]=32'h0;
            //RegMem[12]=32'h5;
            RegMem[13]=32'h0;
            //RegMem[14]=32'h0;
            //RegMem[15]=32'h9;
            //RegMem[16]=32'h8;
            //RegMem[17]=32'h0;
    
        end
        else if(RegWrite)
        begin
            if(load_cond == 1)
            begin
                RegMem[rd]= sign_extend;
            end
            else
            begin
                RegMem[rd]=wd;
            end
        end
    end
    assign Data1=RegMem[rs1];
    assign Data2=RegMem[rs2];
endmodule