`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2022 01:24:30
// Design Name: 
// Module Name: sign_extender
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
module sign_extender(
    input [11:0] writeData12,
    output [31:0] writeData32
    );

assign writeData32 = {
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12[11],
writeData12};

endmodule
