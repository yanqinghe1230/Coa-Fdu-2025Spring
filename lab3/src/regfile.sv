`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/17 17:36:00
// Design Name: 
// Module Name: regfile
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


module regfile(
input logic clk,
input logic we3,
input logic [4:0] A1,A2,A3,
input logic [31:0] WD3,
output logic [31:0] RD1,RD2 );

logic [31:0] rf[31:0];
always_ff @(posedge clk)
    if(we3) rf[A3]<=WD3;

assign RD1=(A1!=0)? rf[A1]:0;
assign RD2=(A2!=0)? rf[A2]:0;
endmodule
